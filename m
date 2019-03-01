Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
	[209.85.167.182])
	by mail.openembedded.org (Postfix) with ESMTP id CAF5A7C69C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 11:28:16 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id q81so19205360oic.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Mar 2019 03:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=AokwMfysyS3Jof0b4l5L/lCe0t6Iy/bOd6gUVmJvcKY=;
	b=Lz1ETQhPXGyIr0NI9j1RegwpkBIZK2y/ga7Y/zQXqfs0AeiHW8eWhhlheQE4p7rxZD
	hfhRR6noGCvX+r9VrzP+eq72oNM2OvYKQgqnxO7ta8vFb7JduplqmeDXqMlXSADWkRjB
	1+2tSubLyqARh8Iu0Iq9SZxtAff7EWIkzpomt6ibYBRIlJKHPhJmmnYlj7gwXxjSK8s5
	XEsSDJ5+ZylLy+E5SMIdz6gHlRP27fZcaM4gll2rSAYuKR1jM9QDGl8jPVgBKALtiphk
	k4DLrmd+WBNBXx/UVsJLXpgmdNleP2lRtyGpzuxGA0J/2DG4XlTnS7kp+9yidrcChsNl
	owlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AokwMfysyS3Jof0b4l5L/lCe0t6Iy/bOd6gUVmJvcKY=;
	b=setuHmcNgSCplFkr3VvXns5sjUh/NrA8JFAv4tHxefzkcJ6+RcOWF5XxL8in8IGGF+
	Cb05TZw69koyIv7pB5rLG/zWqPE5ebuVs/aHa+kWEgwb/WziGnl9B7zliMLlcOgDtSt5
	iN6lCZ2yekkr94xD21cHjzw1qUNUv8n9jm8WtCXNIqRUfC8mt8nmVXg0IfKURc2iy0Z+
	2ogBGUxNkpefg9rNUZP75GvRc11UcRZuYQKWcE9Rt8lFu11v0e7hgccW+z1yCtcHF9hJ
	v7Tb8+Gb2BUYbQln/w/BCC63uL56lue5ujmp4huuKs+BVfWQjhY0VP9CYc+VwAXYOSmF
	GI4g==
X-Gm-Message-State: AHQUAubrvyjfSNYSRh87SV37ipJWL7qQDEfs69PfIt01OLnqyJwUhRzy
	NAoAUwnqWUNyqEfBU5q7voTmIvDpp9NsZZ1CsMg=
X-Google-Smtp-Source: AHgI3IZXy2S5E1RsmRV+hlYUZ2eqcqeKzbGXwz1tk3PfhNEk6ucX3bRQ25Z62P9zkPjJXUR9E0GbCchSG1uvW3D3o1Q=
X-Received: by 2002:aca:da43:: with SMTP id r64mr2833211oig.119.1551439697790; 
	Fri, 01 Mar 2019 03:28:17 -0800 (PST)
MIME-Version: 1.0
References: <20190301095410.2056-1-zangrc.fnst@cn.fujitsu.com>
	<CAJTo0LamGLpZa2o==ZjnkwEK7zjFrT8HWb88xGsR1UmjzpqHSQ@mail.gmail.com>
In-Reply-To: <CAJTo0LamGLpZa2o==ZjnkwEK7zjFrT8HWb88xGsR1UmjzpqHSQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 1 Mar 2019 12:28:06 +0100
Message-ID: <CANNYZj9gTYAqOcDnT412HB3XKEV60O01se=-JpN6NdGJgR-fZg@mail.gmail.com>
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
X-List-Received-Date: Fri, 01 Mar 2019 11:28:17 -0000
Content-Type: text/plain; charset="UTF-8"

You can check what the latest version is for any recipe with

devtool latest-version <recipe>

This will take into account any version limitations etc.

Alex


On Fri, 1 Mar 2019 at 11:19, Burton, Ross <ross.burton@intel.com> wrote:
>
> Again, this is a development release.
>
> Pretty much everything from GNOME follows the even-stable
> odd-development scheme for the minor version number.  These recipes
> can be identified by inheriting upstream-version-is-even, so the
> automatic upgrade tools won't try to upgrade to those development
> releases.
>
> Ross
>
> On Fri, 1 Mar 2019 at 09:54, Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
> >
> > upgrade from adwaita-icon-theme_3.30.1.bb to adwaita-icon-theme_3.31.91.bb
> >
> > Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> > ---
> >  ...ita-icon-theme_3.30.1.bb => adwaita-icon-theme_3.31.91.bb} | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta/recipes-gnome/gnome/{adwaita-icon-theme_3.30.1.bb => adwaita-icon-theme_3.31.91.bb} (93%)
> >
> > diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.30.1.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.31.91.bb
> > similarity index 93%
> > rename from meta/recipes-gnome/gnome/adwaita-icon-theme_3.30.1.bb
> > rename to meta/recipes-gnome/gnome/adwaita-icon-theme_3.31.91.bb
> > index 3e9420ed9a..6c78cea4a5 100644
> > --- a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.30.1.bb
> > +++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.31.91.bb
> > @@ -15,8 +15,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
> >             file://0001-Run-installation-commands-as-shell-jobs.patch \
> >             "
> >
> > -SRC_URI[md5sum] = "db3fd812821d72fdd9a3c7d622a95b35"
> > -SRC_URI[sha256sum] = "6d752a2b1bc668483956d4485c39cad1642d9358e133ff689526e43674a4e1ce"
> > +SRC_URI[md5sum] = "e5bc34fabe11fe6680afc0c4676d3bf9"
> > +SRC_URI[sha256sum] = "9541d2505e19f99e86e98f25ffd6786089f4505f7811b7c6c314b05dc26b7d6b"
> >
> >  do_install_append() {
> >         # Build uses gtk-encode-symbolic-svg to create png versions:
> > --
> > 2.20.1
> >
> >
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

