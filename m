Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id A792279560
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Sep 2018 14:42:23 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id h138-v6so3237677qke.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Sep 2018 07:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CZ+xCjFuTKlVcJpjNUIwuX0RrjRSPfZ+KPpE+BzOGkk=;
	b=qVvLko03vQnUflR4cQfmVG7rBXphMa/lrvoXN8mjRf/qoVVnfr6WKouGimHnr+YvM0
	KGy6Qj9TiWJiJzDMKjZrFEp5J18qCh3UnqudCgzKXkMHG6JsPsR/8wCDCwy9AwsEIDPW
	chmmZhsjQ0xtkAmYa/FxwnXGFnEGMF77jlPGj8B6awfDNVBaFcalsenZavS8+mr3Gto8
	1sRWNHJsK/QCDJ1j4nAJMqofedmyDPy06ATkdEkeKBw2NPlfGgW/zbmnoZtde0e2bJtp
	5MrIPo0yieMJ/8RHlD4QsWs5HoxH5cSlfMaA8KLClU9wsIb2vTb4aSVu+TUlRj92+fBT
	CZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CZ+xCjFuTKlVcJpjNUIwuX0RrjRSPfZ+KPpE+BzOGkk=;
	b=jzYDi9e7BbAlAcccC4maYVxwUHfyvHi5OCWbaga7GjLuodMNtdfPeP5EVZxXpYkP6B
	UAYCyv1wjvhK++czCY4xIrPaAYEzVq5Ckkdwrj5IA4gkE6oN+9bmfnr4KjmSdij8FE/T
	fSiPoX0GshV/u7R/MQy4B1iklHnUVpFe6euRinGLqy1JEtw/yJ7ck3wETUu+m+ea5l50
	OMRg/yD/Ik9pClanPb5omdNjvMdD9CU91dajvo8gYg0CTTW3bZE8/Ll9x5d8Y9U1JpMj
	h5BVWd/Fd+IFYh/rD+DWWFAuYmsQUaICer0sITAG/a+Gb1KBVQlR+Enm4b/FySQG0/B9
	gdIw==
X-Gm-Message-State: APzg51Au7St7c92CBZDytfVYDIO9KVBKFqsGxYdUAO1QdRmeNkhXDCoK
	9i0RtfSQHJp+p7KlBJuKlbDr53H9HvPkq4EsNXY=
X-Google-Smtp-Source: ANB0Vda5xi+yKsDU35OTWl/LspvTGgiuzocWouLH/U/sqrTOYLAJ5qxOLtQLiavmgVW1fRGLMzLX/D2uBbYkR9/ljdg=
X-Received: by 2002:a37:ac02:: with SMTP id e2-v6mr10139245qkm.2.1535812944321;
	Sat, 01 Sep 2018 07:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <20180831130634.9602-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20180831130634.9602-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 1 Sep 2018 07:41:58 -0700
Message-ID: <CAMKF1soD8v7MgcZxUgP=GS0Z-ZgkcSjn4t5ovaVmxM5kLJBf9Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipes: Update git.gnome.org addresses after upstream changes
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
X-List-Received-Date: Sat, 01 Sep 2018 14:42:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 31, 2018 at 6:06 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/clutter.bbclass                                  | 2 +-
>  meta/classes/mirrors.bbclass                                  | 2 +-
>  meta/conf/bitbake.conf                                        | 2 +-
>  .../mobile-broadband-provider-info_git.bb                     | 2 +-
>  meta/recipes-core/glib-networking/glib-networking_2.54.1.bb   | 2 +-
>  meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb  | 4 ++--
>  .../gnome-desktop-testing/update-output-syntax.patch          | 2 +-
>  meta/recipes-support/libxslt/libxslt/fix-rvts-handling.patch  | 2 +-
>  8 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/meta/classes/clutter.bbclass b/meta/classes/clutter.bbclass
> index 167407dfdcf..f5cd04f97f7 100644
> --- a/meta/classes/clutter.bbclass
> +++ b/meta/classes/clutter.bbclass
> @@ -14,7 +14,7 @@ REALNAME = "${@get_real_name("${BPN}")}"
>
>  CLUTTER_SRC_FTP = "${GNOME_MIRROR}/${REALNAME}/${VERMINOR}/${REALNAME}-${PV}.tar.xz;name=archive"
>
> -CLUTTER_SRC_GIT = "git://git.gnome.org/${REALNAME}"
> +CLUTTER_SRC_GIT = "git://gitlab.gnome.org/GNOME/${REALNAME};protocol=https"
>
>  SRC_URI = "${CLUTTER_SRC_FTP}"
>  S = "${WORKDIR}/${REALNAME}-${PV}"
> diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
> index ed53dfbca62..87bba41472e 100644
> --- a/meta/classes/mirrors.bbclass
> +++ b/meta/classes/mirrors.bbclass
> @@ -69,7 +69,7 @@ ${CPAN_MIRROR}  http://search.cpan.org/CPAN/ \n \
>
>  MIRRORS += "\
>  git://salsa.debian.org/.*     git://salsa.debian.org/PATH;protocol=https \n \
> -git://git.gnome.org/.*        git://git.gnome.org/browse/PATH;protocol=https \n \
> +git://git.gnome.org/.*        git://gitlab.gnome.org/GNOME/PATH;protocol=https \n \
>  git://git.savannah.gnu.org/.* git://git.savannah.gnu.org/git/PATH;protocol=https \n \
>  git://git.yoctoproject.org/.* git://git.yoctoproject.org/git/PATH;protocol=https \n \
>  git://.*/.*                   git://HOST/PATH;protocol=https \n \
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 1941633a54b..faef77142ab 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -627,7 +627,7 @@ BBLAYERS_FETCH_DIR ??= "${COREBASE}"
>  APACHE_MIRROR = "http://archive.apache.org/dist"
>  DEBIAN_MIRROR = "http://ftp.debian.org/debian/pool"
>  GENTOO_MIRROR = "http://distfiles.gentoo.org/distfiles"
> -GNOME_GIT = "git://git.gnome.org"
> +GNOME_GIT = "git://gitlab.gnome.org/GNOME"
>  GNOME_MIRROR = "http://ftp.gnome.org/pub/GNOME/sources"
>  GNU_MIRROR = "http://ftp.gnu.org/gnu"
>  GNUPG_MIRROR = "https://www.gnupg.org/ftp/gcrypt"
> diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
> index 7b64b25e89a..863b15a78da 100644
> --- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
> +++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
> @@ -7,7 +7,7 @@ SRCREV = "befcbbc9867e742ac16415660b0b7521218a530c"
>  PV = "20170310"
>  PE = "1"
>
> -SRC_URI = "git://git.gnome.org/mobile-broadband-provider-info \
> +SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info;protocol=https \
>             file://multilibfix.patch \
>  "
>  S = "${WORKDIR}/git"
> diff --git a/meta/recipes-core/glib-networking/glib-networking_2.54.1.bb b/meta/recipes-core/glib-networking/glib-networking_2.54.1.bb
> index 2a6f8af2b46..5d17a824f08 100644
> --- a/meta/recipes-core/glib-networking/glib-networking_2.54.1.bb
> +++ b/meta/recipes-core/glib-networking/glib-networking_2.54.1.bb
> @@ -1,6 +1,6 @@
>  SUMMARY = "GLib networking extensions"
>  DESCRIPTION = "glib-networking contains the implementations of certain GLib networking features that cannot be implemented directly in GLib itself because of their dependencies."
> -HOMEPAGE = "http://git.gnome.org/browse/glib-networking/"
> +HOMEPAGE = "https://gitlab.gnome.org/GNOME/glib-networking/"
>  BUGTRACKER = "http://bugzilla.gnome.org"
>
>  LICENSE = "LGPLv2"
> diff --git a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
> index c71ab1165d5..9d8fb28281c 100644
> --- a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
> +++ b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
> @@ -5,7 +5,7 @@ DESCRIPTION = "The Cantarell font typeface is designed as a \
>                 on-screen reading; in particular, reading web pages on an \
>                 HTC Dream mobile phone."
>
> -HOMEPAGE = "https://git.gnome.org/browse/cantarell-fonts/"
> +HOMEPAGE = "https://gitlab.gnome.org/GNOME/cantarell-fonts/"
>  SECTION = "fonts"
>  LICENSE = "OFL-1.1"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=df91e3ffcab8cfb972a66bf11255188d"
> @@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=df91e3ffcab8cfb972a66bf11255188d"
>  PV = "0.0.24"
>
>  SRCREV = "07b6ea2cbbebfc360aa4668612a376be5e214eaa"
> -SRC_URI = "git://git.gnome.org/cantarell-fonts;protocol=git;branch=master"
> +SRC_URI = "git://gitlab.gnome.org/GNOME/cantarell-fonts;protocol=https;branch=master"

centos 7 comes with git 1.8.x and that seems to fail to fetch from gitlab/https

Cloning into bare repository
'TOPDIR/downloads/git2/gitlab.gnome.org.GNOME.cantarell-fonts'...
error: RPC failed; result=22, HTTP code = 404
fatal: The remote end hung up unexpectedly

using newer version of git solves this

using the wandisco repo e.g.

yum install http://opensource.wandisco.com/centos/7/git/x86_64/wandisco-git-release-7-2.noarch.rpm
yum update git

helps.

do we already state minimum git version somewhere ?

