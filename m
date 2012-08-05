Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SxyJC-00024S-UN
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 12:43:42 +0200
Received: by wgbdr1 with SMTP id dr1so1635202wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 03:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=BD6WtKP+AJBrncQnB7MHka2Mdigqw/NVFFqC5iGzToc=;
	b=tA3ofPqLhnwEqHG6XB5usS+Wa0O2FkjATdgFqqB4MInzzUZc6fitiIXxNSTpMu5GBC
	8BuwzYLAKWAqqXPO+dT7hWlc7xweODWBaVe758DN+SCeG4W/hmmQW+kv8+JnZkMCksG5
	h9TjnDyb+8pAWhZj4O1pTWEuwZMppjzZYvIHNAUlQUXSNExOtNOcn0ICdwRi8lQCgu/v
	eNuBpPGuudcwvG8UEY60v1ScaXnpN3dqGD12Qi7oLaJPwdvl8d0BldUN4/4AzEEj9dhU
	AyV3yRCW3nU+g5T0SuOaegiqb6d5k0FybZjEL39LM9I66/74pnoFqk48ZHvjFdZp3W8y
	2kDQ==
Received: by 10.180.95.230 with SMTP id dn6mr10217975wib.0.1344162719805;
	Sun, 05 Aug 2012 03:31:59 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j6sm12991931wiy.4.2012.08.05.03.31.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 03:31:58 -0700 (PDT)
Date: Sun, 5 Aug 2012 12:31:54 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120805103154.GB3267@jama.jama.net>
References: <1343053509-5931-1-git-send-email-Martin.Jansa@gmail.com>
	<1343058327.21788.98.camel@ted>
	<CABcZAN=CieCpsFCQ7Gsv=kF6MMy_W6T=itU6FtewXf-kPCz61w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZAN=CieCpsFCQ7Gsv=kF6MMy_W6T=itU6FtewXf-kPCz61w@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [RFC] bitbake.conf: exclude whole MACHINEOVERRIDES from OVERRIDES vardeps
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
X-List-Received-Date: Sun, 05 Aug 2012 10:43:43 -0000
X-Groupsio-MsgNum: 26916
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z6Eq5LdranGa6ru8"
Content-Disposition: inline

--z6Eq5LdranGa6ru8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 23, 2012 at 08:48:52AM -0700, Chris Larson wrote:
> On Mon, Jul 23, 2012 at 8:45 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Mon, 2012-07-23 at 16:25 +0200, Martin Jansa wrote:
> >> * whole MACHINEOVERRIDES can change e.g. between MACHINES with differe=
nt arm architecture, causing allarch packages to reexecute do_package
> >>   bitbake-diffsigs ../shr-core/tmp-eglibc/stamps/all-oe-linux/xserver-=
nodm-init-2.0-r16.do_package.sigdata.90e760a8f6cecbd87cb2e95f1237e3cc ../sh=
r-core/tmp-eglibc/stamps/all-oe-linux/xserver-nodm-init-2.0-r16.do_package.=
sigdata.9eeccfd15f25032b3b6b132534660fff
> >>   basehash changed from 7618e17d3fda05d1f15246e6800ca0f0 to 97bc4dc8c1=
521c535bd96b2aa62d8a03
> >>   Variable MACHINEOVERRIDES value changed from ${MACHINE}${@bb.utils.c=
ontains("TUNE_FEATURES", "armv5", ":armv5", "" ,d)}${@bb.utils.contains("TU=
NE_FEATURES", "armv4", ":armv4", "" ,d)}:${MACHINE_CLASS} to ${MACHINE}${@b=
b.utils.contains("TUNE_FEATURES", "armv7a", ":armv7a", "" ,d)}${@bb.utils.c=
ontains("TUNE_FEATURES", "armv6", ":armv6", "" ,d)}${@bb.utils.contains("TU=
NE_FEATURES", "armv5", ":armv5", "" ,d)}${@bb.utils.contains("TUNE_FEATURES=
", "armv4", ":armv4", "" ,d)}:${MACHINE_CLASS}
> >>
> >> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >> ---
> >>  meta/conf/bitbake.conf |    1 +
> >>  1 files changed, 1 insertions(+), 0 deletions(-)
> >
> > Won't this hide genuine changes where things should get rebuilt too?
>=20
> If something uses a machine override, won't the overridden value for
> that variable be the one which is stored in the checksum? So any
> effects of this will result in checksum modification anyway, no?

I think it was possible to find different local file in SRC_URI (in
different override subdirectory), but now with local file checksums
included in sstate checksum it should be safe too.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--z6Eq5LdranGa6ru8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAeS5oACgkQN1Ujt2V2gByGEwCfWfJTb0LzOqFhU9rD5qOIBd/a
QM0AnAoWPpbBUhemyrJi9J5f87ZdcndN
=DTtF
-----END PGP SIGNATURE-----

--z6Eq5LdranGa6ru8--
