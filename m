Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1A0F375269
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 05:22:01 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id d4-v6so2838079ual.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 22:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MP8zYhOhjAnAu4uWO6d42xCLOjg+J2B/Pkr5olawH/A=;
	b=P1vRZh5fUDoE9FRd981kdSMmpf5zSc2B70Gr6WjNvQXrrmTkYBUhca+qBb/qCiPV+I
	RsC3G2+xD5fzu2kU/m/9HdIWpyOIP2weksOfY66YB7f64azqar/YsB8XzF/cBjmGj7U6
	67mCECCCiJj4dpb+jautqFcXNif5XoPiL9454KqS2DQjo5zajaJPzQko1aOVByBtb9UJ
	uM+DzwEqtYrKbdxgbP7eq2Ji7T98dT+7a5vsTmvhaMpIP2NYoMoCH60N6I2u/gOGDtED
	NrakLaQHm1Y/TnH2334Qzubc1xP8+7ahqfG/Ne/xn9M7TxDn8u6dBZGUVVskpu29ucXk
	dzbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MP8zYhOhjAnAu4uWO6d42xCLOjg+J2B/Pkr5olawH/A=;
	b=dDeSrbmaFbO1irUmxfazXQsoU7YHz7JaQpsJN4HRCxjqrI4UaLjiCytzSL0o5srCZd
	950CkhMdLKYu2lS/7eGko+BS7OLI81w7/8r46h+bZdJ/j//CWXSTh3Ulnmt5lxYLxk4T
	4l/ap6tC8ANM3Q1604txhUJj5EmRukKjm8CFOLIBXZFSbvyGDXcY0dyrKNaGmn6DxIzr
	VNDMvCl4/T0YAPM4+65kWNdoTeW+kOMRwxRFDRKRX/UmpcTwyqd3M95Aj07P/bbp9u0N
	wcYCcKVlzcUxD4Pns6RsAw2RRT8kZKmnI3fEOLg+0Y7bSOIB6zTJsmCAFhjvWsW887lf
	ju6w==
X-Gm-Message-State: ALKqPwcE/oyEFqXl4ENb2jrRmgf4YN77OQlwRqasrxSN/RS9vmM/6qNF
	IlxJJA2E96UDcodxyi526LIC9Mu+AuqEsBD1glA=
X-Google-Smtp-Source: AB8JxZrToXPF8jPJWQOi1T/xwtKKctAYgWwjpN5dPg7A4dPGR3CTIvWGUl25N7jLC5XZfWNLvAoEuVHNsrd/X/yBMjA=
X-Received: by 2002:ab0:5216:: with SMTP id i22-v6mr304383uaa.52.1526016122870;
	Thu, 10 May 2018 22:22:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.48.148 with HTTP; Thu, 10 May 2018 22:22:02 -0700 (PDT)
In-Reply-To: <8a41a4e796d7a733d1cc17190e693bf865dcf6a7.1526004301.git.Qi.Chen@windriver.com>
References: <cover.1526004301.git.Qi.Chen@windriver.com>
	<8a41a4e796d7a733d1cc17190e693bf865dcf6a7.1526004301.git.Qi.Chen@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 10 May 2018 22:22:02 -0700
Message-ID: <CAJ86T=X1XhZyu5troKiVRN+xitCTq2jN8N+HFS9=hPOLn8VDaQ@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] sudo: upgrade to 1.8.23
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
X-List-Received-Date: Fri, 11 May 2018 05:22:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 10, 2018 at 7:20 PM, Chen Qi <Qi.Chen@windriver.com> wrote:
> Upgrade sudo to 1.8.23.
>
> The license checksum changes but the actual license does not.
>
> The /var/run/sudo directory has changed to /run/sudo, change
> do_install_append according to avoid error.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-extended/sudo/sudo.inc                           | 5 +++--
>  meta/recipes-extended/sudo/{sudo_1.8.22.bb => sudo_1.8.23.bb} | 6 +++---
>  2 files changed, 6 insertions(+), 5 deletions(-)
>  rename meta/recipes-extended/sudo/{sudo_1.8.22.bb => sudo_1.8.23.bb} (86%)
>
> diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
> index 362bd3a..6e57669 100644
> --- a/meta/recipes-extended/sudo/sudo.inc
> +++ b/meta/recipes-extended/sudo/sudo.inc
> @@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sudo.ws"
>  BUGTRACKER = "http://www.sudo.ws/bugs/"
>  SECTION = "admin"
>  LICENSE = "ISC & BSD & Zlib"
> -LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=7765a3d787cb4fed3ccc3c9cee030af9 \
> +LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=cc4bf2366b059c9598e3947f885931ec \
>                      file://plugins/sudoers/redblack.c;beginline=1;endline=41;md5=805782a8466975716f8376b2be9aedde \
>                      file://lib/util/reallocarray.c;beginline=3;endline=16;md5=85b0905b795d4d58bf2e00635649eec6 \
>                      file://lib/util/fnmatch.c;beginline=3;endline=27;md5=67f83ee9bd456557397082f8f1be0efd \
> @@ -12,7 +12,8 @@ LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=7765a3d787cb4fed3ccc3c9cee030af9 \
>                      file://lib/util/glob.c;beginline=6;endline=31;md5=5872733146b9eb0deb79e1f664815b85 \
>                      file://lib/util/snprintf.c;beginline=6;endline=34;md5=c82c1b3a5c32e08545c9ec5d71e41e50 \
>                      file://include/sudo_queue.h;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681 \
> -                    file://lib/util/inet_pton.c;beginline=3;endline=17;md5=3970ab0518ab79cbd0bafb697f10b33a"
> +                    file://lib/util/inet_pton.c;beginline=3;endline=17;md5=3970ab0518ab79cbd0bafb697f10b33a \
> +                    "
>
>  inherit autotools
>
> diff --git a/meta/recipes-extended/sudo/sudo_1.8.22.bb b/meta/recipes-extended/sudo/sudo_1.8.23.bb
> similarity index 86%
> rename from meta/recipes-extended/sudo/sudo_1.8.22.bb
> rename to meta/recipes-extended/sudo/sudo_1.8.23.bb
> index 9150178..75bc094 100644
> --- a/meta/recipes-extended/sudo/sudo_1.8.22.bb
> +++ b/meta/recipes-extended/sudo/sudo_1.8.23.bb
> @@ -7,8 +7,8 @@ SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
>
>  PAM_SRC_URI = "file://sudo.pam"
>
> -SRC_URI[md5sum] = "24abdea48db4c5abcd410167c801cc8c"
> -SRC_URI[sha256sum] = "7256cb27c20883b14360eddbd17f98922073d104b214cf65aeacf1d9c9b9fd02"
> +SRC_URI[md5sum] = "ea444d747feb1decfebdffd0b38b0739"
> +SRC_URI[sha256sum] = "d863d29b6fc87bc784a3223350e2b28a2ff2c4738f0fb8f1c92bb38c3017e679"
>
>  DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>  RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
> @@ -28,7 +28,7 @@ do_install_append () {
>         chmod 0440 ${D}${sysconfdir}/sudoers
>
>         # Explicitly remove the ${localstatedir}/run directory to avoid QA error

Comment needs updating to match the code change below.

> -       rmdir -p --ignore-fail-on-non-empty ${D}${localstatedir}/run/sudo
> +       rmdir -p --ignore-fail-on-non-empty ${D}/run/sudo
>  }
>
>  FILES_${PN} += "${libdir}/tmpfiles.d"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

