Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R9g8j-0006Ey-1k
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 18:40:45 +0200
Received: by yia27 with SMTP id 27so1649147yia.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 09:35:11 -0700 (PDT)
Received: by 10.236.129.130 with SMTP id h2mr73276143yhi.49.1317400510360;
	Fri, 30 Sep 2011 09:35:10 -0700 (PDT)
Received: from [10.0.1.28] (adsl-68-88-70-1.dsl.rcsntx.swbell.net.
	[68.88.70.1])
	by mx.google.com with ESMTPS id x12sm7003091yhi.10.2011.09.30.09.35.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 09:35:09 -0700 (PDT)
References: <cover.1317397204.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317397204.git.Martin.Jansa@gmail.com>
Mime-Version: 1.0 (iPhone Mail 8L1)
Message-Id: <DF9A8E02-D0DD-4697-BB13-C73E44C815F9@dominion.thruhere.net>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (8L1)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 30 Sep 2011 11:34:53 -0500
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [WIP][PATCH 0/9] Glib related upgrades
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Sep 2011 16:40:45 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 30 sep. 2011 om 10:43 heeft Martin Jansa <martin.jansa@gmail.com> het vol=
gende geschreven:

> We were using 2.29.3+git% from meta-oe and after upgrade to 2.30.0 I was h=
it=20
> by few G_CONST_RETURN and other issues due to newer glib. Here is what I h=
ave
> now to build shr images OK again, but probably there is more recipes which=
 need
> upgrade/fix to cope with glib-2.30.0.
>=20
> Someone who cares about gnome should continue from this, but IMHO this is g=
ood start :).

I was planning to do the glib 2.30/gtk3.2 thing next week when I get back fr=
om the US




>=20
> The following changes since commit c54c1280fc0d06a53e23339c3913ec88eead13d=
9:
>=20
>  base.bbclass: Drop unneeded dependency (2011-09-30 11:34:44 +0100)
>=20
> are available in the git repository at:
>  git://git.openembedded.org/openembedded-core-contrib jansa/glib
>  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=3D=
jansa/glib
>=20
> Martin Jansa (9):
>  atk: add patch to replace G_CONST_RETURN with const
>  json-glib: upgrade to 0.14.0
>  libproxy: upgrade to 0.4.7
>  libglade: add gdk-pixbuf dependency
>  gstreamer: upgrade to 0.10.35
>  zlib: fix inverted LFS logic
>  gdk-pixbuf: upgrade to 2.24.6
>  glib: upgrade to 2.30.0
>  gtk+: upgrade to 2.24.6
>=20
> ...003-gatomic-proper-pointer-get-cast.patch.patch |   28 -
> .../0005-glib-mkenums-interpreter.patch.patch      |   25 -
> .../60_wait-longer-for-threads-to-die.patch        |   24 +-
> meta/recipes-core/glib-2.0/glib-2.0/no-iconv.patch |    2 -
> .../glib-2.0/remove.test.for.qsort_r.patch         |   53 ++
> meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb      |   23 -
> meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb      |   41 ++
> .../zlib/zlib-1.2.5/fix.inverted.LFS.logic.patch   |   20 +
> meta/recipes-core/zlib/zlib_1.2.5.bb               |    5 +-
> .../configure_fix.patch                            |    0
> .../hardcoded_libtool.patch                        |    0
> .../{gdk-pixbuf_2.22.1.bb =3D> gdk-pixbuf_2.24.0.bb} |    7 +-
> ...Duplicate-the-exec-string-returned-by-gtk.patch |    0
> .../cellrenderer-cairo.patch                       |    0
> .../configurefix.patch                             |    0
> .../{gtk+-2.22.1 =3D> gtk+-2.24.6}/doc-fixes.patch   |    0
> .../{gtk+-2.22.1 =3D> gtk+-2.24.6}/entry-cairo.patch |    0
> .../hardcoded_libtool.patch                        |    0
> .../{gtk+-2.22.1 =3D> gtk+-2.24.6}/no-demos.patch    |    0
> .../run-iconcache.patch                            |    0
> .../{gtk+-2.22.1 =3D> gtk+-2.24.6}/toggle-font.diff  |    0
> .../{gtk+-2.22.1 =3D> gtk+-2.24.6}/xsettings.patch   |    0
> .../gtk+/{gtk+_2.22.1.bb =3D> gtk+_2.24.6.bb}        |    8 +-
> .../{json-glib_0.12.4.bb =3D> json-glib_0.14.0.bb}   |    8 +-
> meta/recipes-gnome/libglade/libglade_2.6.4.bb      |    2 +-
> .../check_fix.patch                                |    0
> .../gst-inspect-check-error.patch                  |    0
> .../gstregistrybinary.c                            |    0
> .../gstregistrybinary.h                            |    0
> .../{gstreamer_0.10.32.bb =3D> gstreamer_0.10.35.bb} |    6 +-
> .../atk/atk-1.32.0/remove.G_CONST_RETURN.patch     |  628 ++++++++++++++++=
++++
> meta/recipes-support/atk/atk_1.32.0.bb             |    5 +-
> .../{libproxy_0.4.6.bb =3D> libproxy_0.4.7.bb}       |    6 +-
> 33 files changed, 775 insertions(+), 116 deletions(-)
> delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0003-gatomic-proper=
-pointer-get-cast.patch.patch
> delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0005-glib-mkenums-i=
nterpreter.patch.patch
> create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/remove.test.for.qso=
rt_r.patch
> delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
> create mode 100644 meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb
> create mode 100644 meta/recipes-core/zlib/zlib-1.2.5/fix.inverted.LFS.logi=
c.patch
> rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.22.1 =3D> gdk-pixbuf-2.=
24.0}/configure_fix.patch (100%)
> rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.22.1 =3D> gdk-pixbuf-2.=
24.0}/hardcoded_libtool.patch (100%)
> rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.22.1.bb =3D> gdk-pixbuf=
_2.24.0.bb} (92%)
> rename meta/recipes-gnome/gtk+/{gtk+-2.22.1 =3D> gtk+-2.24.6}/0001-bgo-584=
832-Duplicate-the-exec-string-returned-by-gtk.patch (100%)
> rename meta/recipes-gnome/gtk+/{gtk+-2.22.1 =3D> gtk+-2.24.6}/cellrenderer=
-cairo.patch (100%)
> rename meta/recipes-gnome/gtk+/{gtk+-2.22.1 =3D> gtk+-2.24.6}/configurefix=
.patch (100%)
> rename meta/recipes-gnome/gtk+/{gtk+-2.22.1 =3D> gtk+-2.24.6}/doc-fixes.pa=
tch (100%)
> rename meta/recipes-gnome/gtk+/{gtk+-2.22.1 =3D> gtk+-2.24.6}/entry-cairo.=
patch (100%)
> rename meta/recipes-gnome/gtk+/{gtk+-2.22.1 =3D> gtk+-2.24.6}/hardcoded_li=
btool.patch (100%)
> rename meta/recipes-gnome/gtk+/{gtk+-2.22.1 =3D> gtk+-2.24.6}/no-demos.pat=
ch (100%)
> rename meta/recipes-gnome/gtk+/{gtk+-2.22.1 =3D> gtk+-2.24.6}/run-iconcach=
e.patch (100%)
> rename meta/recipes-gnome/gtk+/{gtk+-2.22.1 =3D> gtk+-2.24.6}/toggle-font.=
diff (100%)
> rename meta/recipes-gnome/gtk+/{gtk+-2.22.1 =3D> gtk+-2.24.6}/xsettings.pa=
tch (100%)
> rename meta/recipes-gnome/gtk+/{gtk+_2.22.1.bb =3D> gtk+_2.24.6.bb} (90%)
> rename meta/recipes-gnome/json-glib/{json-glib_0.12.4.bb =3D> json-glib_0.=
14.0.bb} (74%)
> rename meta/recipes-multimedia/gstreamer/{gstreamer-0.10.32 =3D> gstreamer=
-0.10.35}/check_fix.patch (100%)
> rename meta/recipes-multimedia/gstreamer/{gstreamer-0.10.32 =3D> gstreamer=
-0.10.35}/gst-inspect-check-error.patch (100%)
> rename meta/recipes-multimedia/gstreamer/{gstreamer-0.10.32 =3D> gstreamer=
-0.10.35}/gstregistrybinary.c (100%)
> rename meta/recipes-multimedia/gstreamer/{gstreamer-0.10.32 =3D> gstreamer=
-0.10.35}/gstregistrybinary.h (100%)
> rename meta/recipes-multimedia/gstreamer/{gstreamer_0.10.32.bb =3D> gstrea=
mer_0.10.35.bb} (90%)
> create mode 100644 meta/recipes-support/atk/atk-1.32.0/remove.G_CONST_RETU=
RN.patch
> rename meta/recipes-support/libproxy/{libproxy_0.4.6.bb =3D> libproxy_0.4.=
7.bb} (85%)
>=20
> --=20
> 1.7.6.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


