Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TMjg7-00011R-BX
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Oct 2012 20:09:44 +0200
Received: by mail-wg0-f43.google.com with SMTP id dq11so2235331wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2012 10:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=J9zy/5craFnxWvQUhEWvghdkRBsU1tyvbFWAPNyVLkk=;
	b=Ossl3NiH/E4hKWO3NFSUSmicffFozIv0e33YyIAJMMfKHn6zAdy92P+elnOJZfjbwd
	mOemS1q1OgXNQ4IuQY3+Ukor2HPTjopdH+UryF0h9WCXXU78hLvQn53jBQqOaMC8wDs2
	ySv30SKWugQDqHM/O8WE5GD7tG2zZoEDm3wiOQPOAUjielAXXBbUWDb4RgBV/COD3Y+I
	itSeHDSqAAw1f3D3ZjOTbF4oQEG9huVef7uN6O/qrn5JrU21lUss9IjFHAnhIiY7/Pcs
	+DRQHel2uHaPinhVQsw4Ay70K6c38kE8ZKUyB03dDNYQvthXdG8BDp0lAK51h0nTh4+2
	0VSg==
Received: by 10.180.79.100 with SMTP id i4mr7737253wix.12.1350064591555;
	Fri, 12 Oct 2012 10:56:31 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gg4sm4874792wib.6.2012.10.12.10.56.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 12 Oct 2012 10:56:30 -0700 (PDT)
Date: Fri, 12 Oct 2012 19:56:29 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20121012175629.GB3605@jama.jama.net>
References: <1350038799-22567-1-git-send-email-Martin.Jansa@gmail.com>
	<50785628.8060504@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <50785628.8060504@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] PACKAGES_DYNAMIC: use regexp not glob
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Oct 2012 18:09:44 -0000
X-Groupsio-MsgNum: 30562
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gatW/ieO32f1wygP"
Content-Disposition: inline

--gatW/ieO32f1wygP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 12, 2012 at 10:40:56AM -0700, Saul Wold wrote:
> On 10/12/2012 03:46 AM, Martin Jansa wrote:
> > * bitbake uses PACKAGES_DYNAMIC as regexp
> >    ^ could make matching faster (and it will be more clear that we're e=
xpecting regexp not glob)
> >    * made all those last '-' optional, use .* (or nothing)
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >   meta/classes/kernel.bbclass                              | 6 +++---
> >   meta/conf/bitbake.conf                                   | 2 +-
> >   meta/recipes-connectivity/connman/connman.inc            | 2 +-
> >   meta/recipes-core/eglibc/eglibc-locale.inc               | 6 +++---
> >   meta/recipes-core/packagegroups/packagegroup-core-sdk.bb | 2 +-
> >   meta/recipes-devtools/perl/perl_5.14.2.bb                | 4 ++--
> >   meta/recipes-extended/lighttpd/lighttpd_1.4.31.bb        | 2 +-
> >   meta/recipes-extended/pam/libpam_1.1.6.bb                | 2 +-
> >   meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb       | 2 +-
> >   meta/recipes-gnome/gtk+/gtk+_2.24.8.bb                   | 2 +-
> >   meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb     | 2 +-
> >   meta/recipes-graphics/directfb/directfb.inc              | 2 +-
> >   meta/recipes-graphics/mesa/mesa-dri.inc                  | 2 +-
> >   meta/recipes-graphics/pango/pango.inc                    | 2 +-
> >   meta/recipes-kernel/linux/linux-dummy.bb                 | 4 ++--
> >   meta/recipes-multimedia/gstreamer/gst-plugins.inc        | 2 +-
> >   meta/recipes-multimedia/pulseaudio/pulseaudio.inc        | 2 +-
> >   meta/recipes-qt/qt-apps/qmmp_0.6.1.bb                    | 2 +-
> >   meta/recipes-qt/qt4/qt4-embedded.inc                     | 2 +-
> >   meta/recipes-qt/qt4/qt4.inc                              | 2 +-
> >   20 files changed, 26 insertions(+), 26 deletions(-)
> >
> Martin,
>=20
> Did you do any verification with the buildhistory tools to ensure=20
> nothing changed in the packaging?

Yes, last 12 commits in
https://github.com/shr-distribution/buildhistory/commits/jama

e.g. for om-gta02
https://github.com/shr-distribution/buildhistory/commit/55d9cb4fa438e64c9fc=
c4ef0966164779c5dc974
https://github.com/shr-distribution/buildhistory/commit/c0b3897e04fd9669c55=
7620ca48fde05f01e7aca

but it's together with last change to perl, eglibc, pkgconfig.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gatW/ieO32f1wygP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlB4Wc0ACgkQN1Ujt2V2gBy7zgCfYuvYvhQJIV0lHGQtomxzTDyx
ujEAn3jfgBuYD3LL8Kpyv/FiB4NJSI7W
=YQ5W
-----END PGP SIGNATURE-----

--gatW/ieO32f1wygP--
