Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id EE665719BD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2016 16:46:51 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id 12so32464207uas.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2016 08:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jfif6tNOywZvKaWsjWJZwA5xA701jF/omHqRXlKKqtw=;
	b=Fy47Wo/if0ANwjPyLMauu6V2UExn9tC8gI3JtcP5QetVDhFffApH3DVchmi/71+Kdp
	MRmnqtzP+bjgYS6nAiLTcUNAxVK1HJsF1iPun4IGyoQS+d3URLwDlWL4VoT3B9VEzs4G
	OHLV0lDBvOkeQXYIba91bylPHSgIjZVzZGBUGvCnW14tAB0rUyI29SGSOGd6EMwPK9fx
	4fMeK7i8B+rQb6Jxup/wap7LahUgYd3bQhJEKlpNPP9bT0YcORgFUi9buGyh3ebvAIlf
	6Dr/PWASzufZVRP2iGNo+Oyx2H17TQ7VqtK4oWH2g93A5XcIPqaGEIWkLzPDejMWWhgp
	B92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jfif6tNOywZvKaWsjWJZwA5xA701jF/omHqRXlKKqtw=;
	b=YtAz4KotXhSCP3FioJFmPe3YyhznGVGsRLa8C8R3Utoq9uaZCqGEANggm3/Iz8tbLk
	Cdf50Xv88H9/gLZBwKXpvYwBNgjkpbDCwLqc7IguCivZUFVdJUfdCaPhTnooPU/vlnNl
	zRYj4/7cVKt2sLAjQcJHKkIDK4tiZlgJv8afkNI7vjg37x3/rQd0BanPsTuLRjlyXAvq
	pkVSzlwmwvTzdahSqjcOji9QPo6QCPu4waPmJDzRKsty+zyu1A1wxblgeHb8Q7g2CLH1
	BHsI6vUx+WGxwzDZPgqY4whEQqflJmm832TzzpHE3aJMmQRG0O/VD0M5jiruGUDgc/Uo
	Qy0w==
X-Gm-Message-State: AKaTC02nRyBAU1fJWKgEGGY2W2pnM6fZbBVYsX9lnSJOR7dFHkWRXus1RzuZ7vVwjIEtpno8TdQlr39yjScPsQ==
X-Received: by 10.159.48.146 with SMTP id j18mr44489507uab.6.1480956412946;
	Mon, 05 Dec 2016 08:46:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Mon, 5 Dec 2016 08:46:22 -0800 (PST)
In-Reply-To: <CAHiDW_ERJNEoc4OfTQtV6Bi3UPzQkt9RMPJDUx-RAVJnrj2feA@mail.gmail.com>
References: <20161201083726.6160-1-raj.khem@gmail.com>
	<CAHiDW_ERJNEoc4OfTQtV6Bi3UPzQkt9RMPJDUx-RAVJnrj2feA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 5 Dec 2016 08:46:22 -0800
Message-ID: <CAMKF1spoOjDjJ=hQwLNGE7C=So=OJ35B+pnyGPBmmUuM9+4kdA@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-plugins-bad: Add PKG_CONFIG_SYSROOT_DIR to output of pkg-config
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Dec 2016 16:46:52 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 5, 2016 at 5:20 AM, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
>
>
> On 1 December 2016 at 10:37, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> When configure pokes for wayland-protocols isntallations it ended up
>> using the ones from host, which is because it did not account for sysroot
>> prefix
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../gstreamer/gstreamer1.0-plugins-bad.inc         |  2 +-
>>  ...G_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch | 37
>> ++++++++++++++++++++++
>>  .../gstreamer/gstreamer1.0-plugins-bad_1.10.1.bb   |  1 +
>>  3 files changed, 39 insertions(+), 1 deletion(-)
>>  create mode 100644
>> meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch
>>
>> diff --git
>> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
>> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
>> index d26a6a9..d3c5326 100644
>> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
>> @@ -64,7 +64,7 @@ PACKAGECONFIG[srtp]            =
>> "--enable-srtp,--disable-srtp,libsrtp"
>>  PACKAGECONFIG[uvch264]         =
>> "--enable-uvch264,--disable-uvch264,libusb1 libgudev"
>>  PACKAGECONFIG[voaacenc]        =
>> "--enable-voaacenc,--disable-voaacenc,vo-aacenc"
>>  PACKAGECONFIG[voamrwbenc]      =
>> "--enable-voamrwbenc,--disable-voamrwbenc,vo-amrwbenc"
>> -PACKAGECONFIG[wayland]         =
>> "--enable-wayland,--disable-wayland,wayland-native wayland"
>> +PACKAGECONFIG[wayland]         =
>> "--enable-wayland,--disable-wayland,wayland-native wayland
>> wayland-protocols"
>>  PACKAGECONFIG[webp]            = "--enable-webp,--disable-webp,libwebp"
>>
>>  # these plugins have not been ported to 1.0 (yet):
>> diff --git
>> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch
>> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch
>> new file mode 100644
>> index 0000000..eb789df
>> --- /dev/null
>> +++
>> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch
>> @@ -0,0 +1,37 @@
>> +From c271503d7e233428ac0323c51d6517113e26bef7 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Thu, 1 Dec 2016 00:27:13 -0800
>> +Subject: [PATCH] Prepend PKG_CONFIG_SYSROOT_DIR to pkg-config output
>> +
>> +In cross environment we have to prepend the sysroot to the path found by
>> +pkgconfig since the path returned from pkgconfig does not have sysroot
>> prefixed
>> +it ends up using the files from host system. If build host has wayland
>> installed
>> +the build will succeed but if you dont have wayland-protocols installed
>> on build host then
>> +it wont find the files on build host
>> +
>> +This should work ok with non sysrooted builds too since in those cases
>> PKG_CONFIG_SYSROOT_DIR
>> +will be empty
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + configure.ac | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/configure.ac b/configure.ac
>> +index f8ac96b..dc87b08 100644
>> +--- a/configure.ac
>> ++++ b/configure.ac
>> +@@ -2233,7 +2233,7 @@ AG_GST_CHECK_FEATURE(WAYLAND, [wayland sink],
>> wayland , [
>> +     PKG_CHECK_MODULES(WAYLAND_PROTOCOLS, wayland-protocols >= 1.4, [
>> +       if test "x$wayland_scanner" != "x"; then
>> +         HAVE_WAYLAND="yes"
>> +-        AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, `$PKG_CONFIG
>> --variable=pkgdatadir wayland-protocols`)
>> ++        AC_SUBST(WAYLAND_PROTOCOLS_DATADIR,
>> ${PKG_CONFIG_SYSROOT_DIR}`$PKG_CONFIG --variable=pkgdatadir
>> wayland-protocols`)
>
>
> I believe this breaks multilib because wayland-protocols is allarch so
> PKG_CONFIG_SYSROOT_DIR may then be incorrect.

how so ?

