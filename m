Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9B41F731AC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 22:57:22 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id g62so484181wme.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 14:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=DnbT5PafpggRmk6OwR8oqBhgIcqBR87508uonXmyzsw=;
	b=akefp+877A50wb/MQtkbPfp/653DhnY5F/GwhVq8V4lWksqAyRQmZ6ZZ4qvT6iM+Zf
	FOJFAeoFo6UBjVr1JQzRqusVFgKaG9mRETFBMYmi5OwkN74VMo02tlP99ue4MAtko/LA
	kDvh3VwuCrXQNOWTluDbZZqyt9owfeLk3xYBbsMwwCIUYcq0ycZXvnHo5pl/AoKp5jLO
	pRCfBL2QPn8FfXZM34gkKKeRTb7fPQTETw2hhOTALvrIah3T9OzswlNg5NdcCRK6CX1n
	NP+r0iWGcONZh9b3BMtDc9R9oR7M2IWPyTwXfjnIJ2cgY9g2M+fhSN2QyWwtFLlGqzyc
	L4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=DnbT5PafpggRmk6OwR8oqBhgIcqBR87508uonXmyzsw=;
	b=Y8gdPAgpmqmp7gf3mS7zHrPvb29jtRBt+XC8S9a/2gR9DzLaakjN7sykBsy/SXY7D+
	aYfmnH2t9jTX7aC7Pp5WpxuLF5Tor1QOejZCvwppTQqoSD/+pL0Ta51oLyeTDDlHsH2o
	BSc8w6dTcCJKEh9vN8E+IV+MnW9bgsqkPEe5YQ57UdvTyw99PJVjzaUctNCenqYWnZq3
	luZLqUSFLiLvJzCMx0eRK34k5v6CxwMtHf0FjZc1T+ZgDXUngMR85QheNcqp3HiYh3o3
	Hb//6j6COF+B55yuoGy7mDuSmsdOz7e+OeknyYyGy5PMlDHA0hl0LuCKocnmOl51omg7
	Htiw==
X-Gm-Message-State: AG10YOQDzmzYMU2I50dcvUeBMU+d30HhkE+fri51AGiI56HN80hRLzFdweED0kStwEXW4Gcyag84blw4dGFzwA==
MIME-Version: 1.0
X-Received: by 10.194.7.195 with SMTP id l3mr40632299wja.43.1456354642410;
	Wed, 24 Feb 2016 14:57:22 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Wed, 24 Feb 2016 14:57:22 -0800 (PST)
In-Reply-To: <4df77b79cf9ded923721b47de270b2c43c21cc18.1456325292.git.joshua.g.lock@intel.com>
References: <cover.1456325292.git.joshua.g.lock@intel.com>
	<4df77b79cf9ded923721b47de270b2c43c21cc18.1456325292.git.joshua.g.lock@intel.com>
Date: Wed, 24 Feb 2016 14:57:22 -0800
Message-ID: <CAJ86T=WjZLqr4QH+ahJ-xMpnaePw+YpD4zt8CB76g9BYy+JzDg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Joshua Lock <joshua.g.lock@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 03/10] hardlink: add new recipe
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
X-List-Received-Date: Wed, 24 Feb 2016 22:57:22 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 24, 2016 at 6:52 AM, Joshua Lock <joshua.g.lock@intel.com> wrote:
> ---
>  meta/recipes-extended/hardlink/hardlink_0.3.0.bb | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta/recipes-extended/hardlink/hardlink_0.3.0.bb
>
> diff --git a/meta/recipes-extended/hardlink/hardlink_0.3.0.bb b/meta/recipes-extended/hardlink/hardlink_0.3.0.bb
> new file mode 100644
> index 0000000..2e06ac2
> --- /dev/null
> +++ b/meta/recipes-extended/hardlink/hardlink_0.3.0.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "hardlink is a tool which replaces multiple copies of a file with hardlinks."
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://hardlink.c;endline=22;md5=168464a4fc92fa7389c53b0755b39fbb"
> +
> +SRC_URI = "http://jak-linux.org/projects/hardlink/${BPN}_${PV}.tar.xz"
> +SRC_URI[md5sum] = "72f1a460adb6874c151deab766e434ad"
> +SRC_URI[sha256sum] = "e8c93dfcb24aeb44a75281ed73757cb862cc63b225d565db1c270af9dbb7300f"
> +
> +DEPENDS = "libpcre attr"

According to the style guide, DEPENDS should come between
LIC_FILES_CHKSUM and SRC_URI.

> +do_compile () {
> +       oe_runmake 'DESTDIR=${D}' 'PREFIX=${prefix}' BINDIR='${bindir}'
> +}
> +
> +do_install () {
> +       oe_runmake install 'DESTDIR=${D}' 'PREFIX=${prefix}' BINDIR='${bindir}'
> +}
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

