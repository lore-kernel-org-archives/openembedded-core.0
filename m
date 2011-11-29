Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVVLe-00068I-Fu
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 22:36:18 +0100
Received: by faar15 with SMTP id r15so185083faa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 13:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Nhxijn60tI+f8hNT6zeUgnQz7GsFvgHc82jC0Uhw1Ts=;
	b=DmTXKlDQ2gelthtGtQtN6st7y00A/XZ/P+7Mq8E/6U8DByNWtsUMOFUadJYY8Q30xU
	aO0xHBvz2neGmM370v7EI1k5WJhZ0P6jwHIaRW+08Zt5umAaKmhpOmW5L+V54CmNg+u+
	llvryyTMZtLZFO2BPPfbBJQlwFkv4rN2QpgxU=
Received: by 10.204.131.88 with SMTP id w24mr52066324bks.113.1322602178867;
	Tue, 29 Nov 2011 13:29:38 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id h7sm39748343bkw.12.2011.11.29.13.29.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 13:29:37 -0800 (PST)
Date: Tue, 29 Nov 2011 22:29:25 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20111129212925.GJ7441@jama.jama.net>
References: <cover.1322549636.git.Martin.Jansa@gmail.com>
	<eb7aab8096dac4fc73520c17e0edd4ac689c1cda.1322549636.git.Martin.Jansa@gmail.com>
	<2752f234bc996b128d06ad63bf5ad36e00a3d3ea.1322549636.git.Martin.Jansa@gmail.com>
	<4ED53FCA.8000509@linux.intel.com>
	<20111129204308.GI7441@jama.jama.net>
	<4ED5453C.5090704@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4ED5453C.5090704@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core 10/10] gconf: add polkit to DEPENDS
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
X-List-Received-Date: Tue, 29 Nov 2011 21:36:18 -0000
X-Groupsio-MsgNum: 13172
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Xssso5lpTBgMxDfe"
Content-Disposition: inline

--Xssso5lpTBgMxDfe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2011 at 12:49:00PM -0800, Saul Wold wrote:
> On 11/29/2011 12:43 PM, Martin Jansa wrote:
> > On Tue, Nov 29, 2011 at 12:25:46PM -0800, Saul Wold wrote:
> >> On 11/29/2011 06:09 AM, Martin Jansa wrote:
> >>> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> >>> ---
> >>>    meta/recipes-gnome/gnome/gconf_3.2.3.bb |    2 +-
> >>>    1 files changed, 1 insertions(+), 1 deletions(-)
> >>>
> >>> diff --git a/meta/recipes-gnome/gnome/gconf_3.2.3.bb b/meta/recipes-g=
nome/gnome/gconf_3.2.3.bb
> >>> index aa9da78..907f0ba 100644
> >>> --- a/meta/recipes-gnome/gnome/gconf_3.2.3.bb
> >>> +++ b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
> >>> @@ -3,7 +3,7 @@ SECTION =3D "x11/gnome"
> >>>    LICENSE =3D "LGPLv2+"
> >>>    LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55ca817ccb7d5b5b6635569=
0e9abc605"
> >>>
> >>> -DEPENDS =3D "glib-2.0 dbus dbus-glib libxml2 intltool-native"
> >>> +DEPENDS =3D "glib-2.0 dbus dbus-glib libxml2 intltool-native polkit"
> >>>
> >>>    PR =3D "r1"
> >>>
> >>
> >> What is this solving? This also would require polkit to have a
> >> BBCLASSEXTEND with native.
> >
> > gconf-defaults.c:40:27: fatal error: polkit/polkit.h: No such file or d=
irectory
> >
> > most people have polkit build in sysroot and then if you upgrade gconf
> > and polkit at the same time you can get it autodetected in
> > gconf's do_configure and later removed from sysroot while polkit itself
> > is being upgraded.
> >
> > And we probably don't want to disable defaults_service for gconf to for=
ce polkit
> > dependency off.
> >
> > HAVE_POLKIT=3Dno
> > AC_ARG_ENABLE(defaults_service,
> >    AS_HELP_STRING([--enable-defaults-service],
> >      [build the defaults DBus service @<:@default=3Dauto@:>@]),
> >    , enable_defaults_service=3Dauto)
> >
> > if test "x$enable_defaults_service" !=3D "xno" ; then
> >    PKG_CHECK_MODULES(DEFAULTS, glib-2.0 gthread-2.0 gobject-2.0 dbus-1 =
dbus-glib-1 polkit-gobject-1, HAVE_POLKIT=3Dyes, HAVE_POLKIT=3Dno)
> >    if test "x$HAVE_POLKIT" =3D "xno"; then
> >      if test "x$enable_defaults_service" =3D "xyes" ; then
> >        AC_MSG_ERROR([[
> > *** Could not find PolicyKit.]])
> >      else
> >        enable_defaults_service=3Dno
> >      fi
> >    else
> >      enable_defaults_service=3Dyes
> >    fi
> > fi
> >
> > Weird it didn't fail for me without polkit-native (there isn't .bbappen=
d in any of
> > my layers and I've even tested it in distro less oe-core), but you're r=
ight, we should
> > provide polkit-native or disable defaults_service for native gconf.
> >
> I think it would be best to disable the default_services for native=20
> gconf, a patch for that would be great, thanks

Ah, now I know why I haven't seen that in normal builds
/OE/shr-core/meta-openembedded/meta-gnome/recipes-gnome/gconf/gconf-native_=
2.6.1.bb

and nothing in my oe-core-only builds was depending on gconf-native

I'll send updated patch after few more tests..

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Xssso5lpTBgMxDfe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7VTrUACgkQN1Ujt2V2gBwu1wCff79biYYEFDh0w/doe9QW4mTH
te4AoJu9o6KS6N8rjfdJi8BArpOqFPCD
=T/c3
-----END PGP SIGNATURE-----

--Xssso5lpTBgMxDfe--
