Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 430B971B23
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 19:46:35 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id x186so20409421vkd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Dec 2016 11:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dzdu0VtpJgwpqOARVlG60xl+KldNG7f8bI/H0rEpms8=;
	b=wvnI7coX0V8iobPYQHc80D3wcmtEDOPJT2ekpTfj5O6a4XwgYuxAXHBgudYtZlsYDJ
	1OTzbWLImz0d7uaXWiDwvWbRZET21/y3kg1ffpGCI8aU5npdME6iZfxCG/xRVNTWKSDp
	LSk/6k6MZ3Wd0VJ24ewEw2e4Wx8ge+Xy/9OpN+Q/RnPEGb2NJhFOlBcktr8ciMigXi1p
	PrJUHFmzUiVaTHfJ8HcXcJjyuEh21AIlYnwklpsvurbfXyP/Hj3MWgqnoAcCu25gELJl
	ULeLCGt8UfS+5bB9DGav4krgk1J30HwRLCr8O8zAegV7W11X/qYi0ngMv4tSPJnIMkhH
	gq1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dzdu0VtpJgwpqOARVlG60xl+KldNG7f8bI/H0rEpms8=;
	b=idCNvmFIK47lZEqjb1qNY72IvTDjC5Os9eBOanmEqZUF57YFHfseRH1wXHkR2xs/F9
	JQBHhkURh9r/tHFpGNqHWxA7t58sdcmIIsJR5LaQ4M2KO6fBDYkJ/HLE7DwLU5W9Mvw/
	0skuLZkTUbElhzLkOUWRqCHwOmEzcWd7GN/dMJuvSwLLUAyaFkP4gmvYR25P3Z8q0nXX
	yzNCH1CJxrKKmYJ/41fDCMYD+amWIG100TlBjSYaeBRa9mVccqXEG1lHyffK2mLuKL98
	7xYt3H9ZmO5eyDQnClmEyl/aaa2wfvHcoseu7i+wcLGqLtg60g2gLx78WNftlJlr3ASj
	yWwA==
X-Gm-Message-State: AKaTC012CzJdMX5wdWC8QR9wLtHBKh71oPLdvGK+VOaII+p3z1nNApyKHXP0VbxHOPys2GwfZEhZIyzX+tx+WQ==
X-Received: by 10.31.115.205 with SMTP id o196mr17857509vkc.139.1481139997204; 
	Wed, 07 Dec 2016 11:46:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Wed, 7 Dec 2016 11:46:06 -0800 (PST)
In-Reply-To: <CAHiDW_G52CHLn9A9Hk8Z-m=LvmA5yzUbHjC-Rx9B9oQeZZW4qQ@mail.gmail.com>
References: <20161201083726.6160-1-raj.khem@gmail.com>
	<CAHiDW_ERJNEoc4OfTQtV6Bi3UPzQkt9RMPJDUx-RAVJnrj2feA@mail.gmail.com>
	<6D6B8004-668B-4C5B-96BE-7A231F365788@gmail.com>
	<CAHiDW_G52CHLn9A9Hk8Z-m=LvmA5yzUbHjC-Rx9B9oQeZZW4qQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 7 Dec 2016 11:46:06 -0800
Message-ID: <CAMKF1sqk9bycNqvBaQduEGBWTY4N9QMmKN=HRpY-4j=vYa1S+Q@mail.gmail.com>
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
X-List-Received-Date: Wed, 07 Dec 2016 19:46:37 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 7, 2016 at 4:25 AM, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
>
>
> On 5 December 2016 at 21:08, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>> On Dec 5, 2016, at 5:20 AM, Jussi Kukkonen <jussi.kukkonen@intel.com>
>> wrote:
>>
>>
>>
>> On 1 December 2016 at 10:37, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> When configure pokes for wayland-protocols isntallations it ended up
>>> using the ones from host, which is because it did not account for sysroot
>>> prefix
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>>  .../gstreamer/gstreamer1.0-plugins-bad.inc         |  2 +-
>>>  ...G_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch | 37
>>> ++++++++++++++++++++++
>>>  .../gstreamer/gstreamer1.0-plugins-bad_1.10.1.bb   |  1 +
>>>  3 files changed, 39 insertions(+), 1 deletion(-)
>>>  create mode 100644
>>> meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch
>>>
>>> diff --git
>>> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
>>> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
>>> index d26a6a9..d3c5326 100644
>>> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
>>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
>>> @@ -64,7 +64,7 @@ PACKAGECONFIG[srtp]            =
>>> "--enable-srtp,--disable-srtp,libsrtp"
>>>  PACKAGECONFIG[uvch264]         =
>>> "--enable-uvch264,--disable-uvch264,libusb1 libgudev"
>>>  PACKAGECONFIG[voaacenc]        =
>>> "--enable-voaacenc,--disable-voaacenc,vo-aacenc"
>>>  PACKAGECONFIG[voamrwbenc]      =
>>> "--enable-voamrwbenc,--disable-voamrwbenc,vo-amrwbenc"
>>> -PACKAGECONFIG[wayland]         =
>>> "--enable-wayland,--disable-wayland,wayland-native wayland"
>>> +PACKAGECONFIG[wayland]         =
>>> "--enable-wayland,--disable-wayland,wayland-native wayland
>>> wayland-protocols"
>>>  PACKAGECONFIG[webp]            = "--enable-webp,--disable-webp,libwebp"
>>>
>>>  # these plugins have not been ported to 1.0 (yet):
>>> diff --git
>>> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch
>>> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch
>>> new file mode 100644
>>> index 0000000..eb789df
>>> --- /dev/null
>>> +++
>>> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch
>>> @@ -0,0 +1,37 @@
>>> +From c271503d7e233428ac0323c51d6517113e26bef7 Mon Sep 17 00:00:00 2001
>>> +From: Khem Raj <raj.khem@gmail.com>
>>> +Date: Thu, 1 Dec 2016 00:27:13 -0800
>>> +Subject: [PATCH] Prepend PKG_CONFIG_SYSROOT_DIR to pkg-config output
>>> +
>>> +In cross environment we have to prepend the sysroot to the path found by
>>> +pkgconfig since the path returned from pkgconfig does not have sysroot
>>> prefixed
>>> +it ends up using the files from host system. If build host has wayland
>>> installed
>>> +the build will succeed but if you dont have wayland-protocols installed
>>> on build host then
>>> +it wont find the files on build host
>>> +
>>> +This should work ok with non sysrooted builds too since in those cases
>>> PKG_CONFIG_SYSROOT_DIR
>>> +will be empty
>>> +
>>> +Upstream-Status: Pending
>>> +
>>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> +---
>>> + configure.ac | 2 +-
>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>> +
>>> +diff --git a/configure.ac b/configure.ac
>>> +index f8ac96b..dc87b08 100644
>>> +--- a/configure.ac
>>> ++++ b/configure.ac
>>> +@@ -2233,7 +2233,7 @@ AG_GST_CHECK_FEATURE(WAYLAND, [wayland sink],
>>> wayland , [
>>> +     PKG_CHECK_MODULES(WAYLAND_PROTOCOLS, wayland-protocols >= 1.4, [
>>> +       if test "x$wayland_scanner" != "x"; then
>>> +         HAVE_WAYLAND="yes"
>>> +-        AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, `$PKG_CONFIG
>>> --variable=pkgdatadir wayland-protocols`)
>>> ++        AC_SUBST(WAYLAND_PROTOCOLS_DATADIR,
>>> ${PKG_CONFIG_SYSROOT_DIR}`$PKG_CONFIG --variable=pkgdatadir
>>> wayland-protocols`)
>>
>>
>> I believe this breaks multilib because wayland-protocols is allarch so
>> PKG_CONFIG_SYSROOT_DIR may then be incorrect.
>>
>>
>> Realized my last reply is too terse. expanding on it a bit more.
>> this is not really the case. Since PKG_CONFIG_SYSROOT_DIR is set to
>> STAGING_DIR_HOST which is then set to ${STAGING_DIR}/${MACHINE} so
>> effectively its just
>> reusing an existing var compared to your case where a new redundant
>> variable is introduced.
>>
>> having said that, there could be a multilib issue if pkgdatadir thats in
>> .pc file from wayland-protocols package is using variables like ${libdir}
>> which then are
>> multilib dependent, if this is the case then we need to fix .pc file.
>> however when I look at the
>> <target-sysroot>/usr/share/pkgconfig/wayland-protocols.pc it has
>>
>> prefix=/usr
>> datarootdir=${prefix}/share
>> pkgdatadir=/usr/share/wayland-protocols
>>
>> seems to be free of multilib deps.
>>
>
> It's not about the .pc file, the issue is that if you build
> lib32-gstreamer1.0-plugins-bad WAYLAND_PROTOCOLS_DATADIR will end up as (as
> an example)
>     $TMPDIR/sysroots/lib32-qemux86-64/usr/share/wayland-protocols/
> but that's not where wayland protocols are. The actual path is
>     $TMPDIR/sysroots/qemux86-64/usr/share/wayland-protocols/
>
> Maybe there should be a generic multilib fix for this but I can't figure out
> what it would be...

hmmm is seems to me that 'all' packages should be common between
all syroots, may be symlinks into multilib sysroots for all files could be
a solution, of just staging function for 'all' packages should install it in
both sysroots.

>
> Jussi
>
>

