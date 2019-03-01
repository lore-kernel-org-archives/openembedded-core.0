Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
	[209.85.166.42])
	by mail.openembedded.org (Postfix) with ESMTP id DB1B77CD68
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 10:19:05 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id x9so19101526iog.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Mar 2019 02:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LumFDGl3xdp0Vrj+6qPBpXp7L42hX1xHcPf0XHyPsvc=;
	b=JnSkKDJPHjvQnQFWCZDqFRAZTomv/lK8S5XYOwCWX9bojgKl2Afdp5AK/BDJ16KyKF
	PApR4SUqQ0WO2Hw9vUJaLydVroVUa/NjrJmCQ03Lm1bzcbsdVqYT6PBBDaaLAPeDsCnM
	IcyAFdE48faPNDBcyY68UOlnCA12xBhY27cIDFcokdA8AKX9GHJ9DKXtW00A02naBc2a
	crTIaSW+Sp2Ha69Zsb09oxHGNctzh4frhQVpvrpE6uC4wDqIS64r5ugjRUyNtS7sxI0A
	tdTqHluGcSyEspYUEs5J+e7327iKAGsg+70V3FE28OvaJQdDASqLWfeFLJ0cWqEcl9Za
	KV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LumFDGl3xdp0Vrj+6qPBpXp7L42hX1xHcPf0XHyPsvc=;
	b=iE1YoUojzoxy1jrR2xyl0b1REc20PgscBmzabqkIucDc4Cub96IALrH4FcBq5kLlkS
	ijidDKCN/6S/nq+uzStSkkdX6+Ws0VKyfakvJTb3H3X8SpnhnWJ28QU2rrsraSNmxjzF
	EG0xAQdquz5GNAkgGApTraRq1Gmw24WSM3X1MxA7mocSjnF1Y9xpcIHBipL5WjXD4hET
	gfuFvsY3XSQudV3B0FP2FPIjDBnq4E9T1zc9rX0WnbT1ohisaaB5nuPVKdb2PKR3XaUu
	S2wJ9U3wLOfA4EGko2J9lXRrQH+0NXZtZAmFbVFH4s7b+1v3N2qFDlNx/5MNlIw4rrqM
	rThA==
X-Gm-Message-State: APjAAAWB0JXrnOr0pC/JPWCveGKG0UlspgQAdz2tawym4UI4oGuJ2XkS
	7EInuEUGLmdgg/U6XCFzz/QR/GyUGta8jtaUgfNkng==
X-Google-Smtp-Source: APXvYqzPXsu3eSgfzKcKqb2Fz4ZnuAKOPqHaLkf+XDNh9NhOOUuLOATPl/WRM6FIrkm7zo1+uHDQNvFwyd8hz7I/dew=
X-Received: by 2002:a5d:818d:: with SMTP id u13mr2169537ion.20.1551435546691; 
	Fri, 01 Mar 2019 02:19:06 -0800 (PST)
MIME-Version: 1.0
References: <20190301095410.2056-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190301095410.2056-1-zangrc.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 1 Mar 2019 10:18:54 +0000
Message-ID: <CAJTo0LamGLpZa2o==ZjnkwEK7zjFrT8HWb88xGsR1UmjzpqHSQ@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] adwaita-icon-theme: upgrade 3.30.1 -> 3.31.91
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
X-List-Received-Date: Fri, 01 Mar 2019 10:19:06 -0000
Content-Type: text/plain; charset="UTF-8"

Again, this is a development release.

Pretty much everything from GNOME follows the even-stable
odd-development scheme for the minor version number.  These recipes
can be identified by inheriting upstream-version-is-even, so the
automatic upgrade tools won't try to upgrade to those development
releases.

Ross

On Fri, 1 Mar 2019 at 09:54, Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> upgrade from adwaita-icon-theme_3.30.1.bb to adwaita-icon-theme_3.31.91.bb
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  ...ita-icon-theme_3.30.1.bb => adwaita-icon-theme_3.31.91.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-gnome/gnome/{adwaita-icon-theme_3.30.1.bb => adwaita-icon-theme_3.31.91.bb} (93%)
>
> diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.30.1.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.31.91.bb
> similarity index 93%
> rename from meta/recipes-gnome/gnome/adwaita-icon-theme_3.30.1.bb
> rename to meta/recipes-gnome/gnome/adwaita-icon-theme_3.31.91.bb
> index 3e9420ed9a..6c78cea4a5 100644
> --- a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.30.1.bb
> +++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.31.91.bb
> @@ -15,8 +15,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
>             file://0001-Run-installation-commands-as-shell-jobs.patch \
>             "
>
> -SRC_URI[md5sum] = "db3fd812821d72fdd9a3c7d622a95b35"
> -SRC_URI[sha256sum] = "6d752a2b1bc668483956d4485c39cad1642d9358e133ff689526e43674a4e1ce"
> +SRC_URI[md5sum] = "e5bc34fabe11fe6680afc0c4676d3bf9"
> +SRC_URI[sha256sum] = "9541d2505e19f99e86e98f25ffd6786089f4505f7811b7c6c314b05dc26b7d6b"
>
>  do_install_append() {
>         # Build uses gtk-encode-symbolic-svg to create png versions:
> --
> 2.20.1
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

