Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RM67R-0003XJ-Cc
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2011 23:50:45 +0100
Received: by faas16 with SMTP id s16so2290929faa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2011 15:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9iufmPrh3kTdufjLw0r6CSfa+8p8iF7T8lyaIoPXLaY=;
	b=h5bg7MbDaHdS2ffSGousEQ4KcfC9q0CaVJAZdnACleef3SclCrRts1sFyvTylY8yyB
	fBRgjV2BfQG/pdeh/svUzXXiLL8lKfMjLUF6cAZ/b+zOK8BxSdOuad4u9aJ9la/IvEfu
	aSGF2Yf1tmyAlp5jecc+Fg1skhVRkw+WFRafA=
Received: by 10.223.6.15 with SMTP id 15mr19530560fax.4.1320360276711;
	Thu, 03 Nov 2011 15:44:36 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id p14sm14276440faf.20.2011.11.03.15.44.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Nov 2011 15:44:35 -0700 (PDT)
Date: Thu, 3 Nov 2011 23:44:32 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20111103224431.GQ9949@jama.jama.net>
References: <CA+chaQfT08+Vd7JyB4wZO8eF13HbY1Z_TiY8MVBV76vPsxd5fw@mail.gmail.com>
	<1320339165-25029-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1320339165-25029-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/4] libnl-2.0: move fix-pktloc_syntax_h-race.patch to libnl-2.0 subdirectory and merge with fix-makefile.patch
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
X-List-Received-Date: Thu, 03 Nov 2011 22:50:45 -0000
X-Groupsio-MsgNum: 11884
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tk6xM/wkRlnXD2NA"
Content-Disposition: inline

--tk6xM/wkRlnXD2NA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 03, 2011 at 05:52:42PM +0100, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../libnl/libnl-2.0/fix-makefile.patch             |   32 --------------=
------
>  .../{ =3D> libnl-2.0}/fix-pktloc_syntax_h-race.patch |    5 ++-
>  meta/recipes-support/libnl/libnl_2.0.bb            |    8 ++--
>  3 files changed, 8 insertions(+), 37 deletions(-)
>  delete mode 100644 meta/recipes-support/libnl/libnl-2.0/fix-makefile.pat=
ch
>  rename meta/recipes-support/libnl/{ =3D> libnl-2.0}/fix-pktloc_syntax_h-=
race.patch (86%)

git repo is up.. so pushed
To git+ssh://git@git.openembedded.org/openembedded-core-contrib
 + 3f41fdf...f9cc3b7 jansa/libnl -> jansa/libnl (forced update)

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tk6xM/wkRlnXD2NA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6zGU8ACgkQN1Ujt2V2gBy+8ACeP+hRlzZydD0D7eS4sJjFk6Vo
UVsAniKZxBE4qEDZ3DXqpp9JTMXQxFf+
=GTKG
-----END PGP SIGNATURE-----

--tk6xM/wkRlnXD2NA--
