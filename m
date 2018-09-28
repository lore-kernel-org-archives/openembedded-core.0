Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id C34F779164
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2018 08:07:43 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id j9-v6so5242944otl.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2018 01:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Np2FOqqAY5IF12v8fdGqrMPyYhntEhJ6SEtboY3j5L4=;
	b=rr6cS47JCtnYoVa1h1paAkOVSSE8AxCmfLUT2PyBgUd0KLxGWTjFgiXNrIXsmZwu8x
	V3fBoKtObtpyOav9Ho6gbxtzgoxTi0jwGqNQS33X+1R5vMHT/1i8FEA6Z+0G+aWDb1b3
	5KMXanUkIvgfkzwszE51VUhzxZzY+oha+zZeA3KnCihejjFj8JbLfvitGKtzwGQe3p+/
	gd8dhDPAfvuwFRK87r2HI0zFv8G3UEesMXdkW45h46b7p7uaSF2AXo504dOW2msbrbzg
	2IYzmLRs5rTav6WymFxuR2Qrx427K0vz/o7d30k7v14djA4miFZNtzY1zMbR4I6U+jOU
	N7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Np2FOqqAY5IF12v8fdGqrMPyYhntEhJ6SEtboY3j5L4=;
	b=Se5OQWl5ZDkLIEAQXCO8XQ0H+IZ+RlQLr+O9oZS99DzkLnfE7P6aVG+JRLWuHsnvWE
	bd68i1hZHtgUSaC6dr6DvgLa+fca0tDTmIqKYUHHENXghs/WDR1zTqTSbC9Cg5sGMkjN
	neOSU0kOf8YJpQjpWX/paKLswYHDk+D2XRxeGbZYqDdullE4YTydwg2imXjq06WJIgWY
	ax6GQrpR89uRMbmWFdRRz36C3px6pUAv9bGumAnihiTjVRsFaRfwdSavCVIkRx2uSFBB
	ZVvbCUUGKwa5wfairYndTNn2DR4DCLFpLRijL7PRWR2zo5Q8+Pfu/OSLRnxWmRgPoNkr
	T6HA==
X-Gm-Message-State: ABuFfoijjMVj7m6NA4jeOFqsvcuz5VfRGYOar7Qe9A7QjK9NBLCzRxCL
	AenvVvsWal4P8NR8YZWpCGqDzsgn8D5h60gJe8U=
X-Google-Smtp-Source: ACcGV63++phgE9i231lOrY7/f0QvpoMV4LNXLGZyGHzuRwpbOCU7XxB3aC2GeEXvyAt4F9niWQ9mKHFDzL8YZHFW4v8=
X-Received: by 2002:a9d:28c9:: with SMTP id
	s67-v6mr8681757ota.360.1538122064788; 
	Fri, 28 Sep 2018 01:07:44 -0700 (PDT)
MIME-Version: 1.0
References: <20180926004400.28526-1-hongl.fnst@cn.fujitsu.com>
	<CAJTo0LYK5iDRvBb-CCEbowD2LiE3hRRik0sP-Ba9o2OczQBZWA@mail.gmail.com>
In-Reply-To: <CAJTo0LYK5iDRvBb-CCEbowD2LiE3hRRik0sP-Ba9o2OczQBZWA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 28 Sep 2018 10:07:33 +0200
Message-ID: <CANNYZj_5MFkCTCqC8BvELvsD8heaViyE2aGTL6wofZZg47ZitA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [PATCH] adwaita-icon-theme:upgrade to 3.30.0
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
X-List-Received-Date: Fri, 28 Sep 2018 08:07:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Better yet, just revert the upgrade, and do it again with 'devtool
upgrade adwaita-icon-them'. It will automagically pick the latest
version (subject to version regex) and rebase/refresh the patches.

Alex
=D1=81=D1=80, 26 =D1=81=D0=B5=D0=BD=D1=82. 2018 =D0=B3. =D0=B2 15:26, Burto=
n, Ross <ross.burton@intel.com>:
>
> Please verify the patches apply cleanly:
>
> WARNING: adwaita-icon-theme-3.30.0-r0 do_patch:
> Some of the context lines in patches were ignored. This can lead to
> incorrectly applied patches.
> The context lines in the patches can be updated with devtool:
>
>     devtool modify <recipe>
>     devtool finish --force-patch-refresh <recipe> <layer_path>
>
> Then the updated patches and the source tree (in devtool's workspace)
> should be reviewed to make sure the patches apply in the correct place
> and don't introduce duplicate lines (which can, and does happen
> when some of the context is ignored). Further information:
> http://lists.openembedded.org/pipermail/openembedded-core/2018-March/1486=
75.html
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10450
> Details:
> Applying patch 0001-Don-t-use-AC_CANONICAL_HOST.patch
> patching file configure.ac
> Hunk #1 succeeded at 3 with fuzz 2.
>
> On Wed, 26 Sep 2018 at 01:50, Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
> >
> > Upgrade adwaita-icon-theme from 3.28.0 to 3.30.0
> >
> > Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> > ---
> >  .../{adwaita-icon-theme_3.28.0.bb =3D> adwaita-icon-theme_3.30.0.bb}  =
  | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta/recipes-gnome/gnome/{adwaita-icon-theme_3.28.0.bb =3D> adw=
aita-icon-theme_3.30.0.bb} (93%)
> >
> > diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.28.0.bb b/me=
ta/recipes-gnome/gnome/adwaita-icon-theme_3.30.0.bb
> > similarity index 93%
> > rename from meta/recipes-gnome/gnome/adwaita-icon-theme_3.28.0.bb
> > rename to meta/recipes-gnome/gnome/adwaita-icon-theme_3.30.0.bb
> > index 40dd35b..464182d 100644
> > --- a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.28.0.bb
> > +++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.30.0.bb
> > @@ -15,8 +15,8 @@ SRC_URI =3D "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}=
-${PV}.tar.xz \
> >             file://0001-Run-installation-commands-as-shell-jobs.patch \
> >             "
> >
> > -SRC_URI[md5sum] =3D "b25b2d82cbebf2cc9cd469457b604f2c"
> > -SRC_URI[sha256sum] =3D "7aae8c1dffd6772fd1a21a3d365a0ea28b7c3988bdbbea=
fbf8742cda68242150"
> > +SRC_URI[md5sum] =3D "5ad28b28fecde7f997f56e76a903567e"
> > +SRC_URI[sha256sum] =3D "9106729174a3e6cc183d14f74454987f5378b46f213e69=
8a6ab2702f70e4e64b"
> >
> >  do_install_append() {
> >         # Build uses gtk-encode-symbolic-svg to create png versions:
> > --
> > 2.7.4
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

