Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2A7216AD40
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 19:35:41 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id z15so3169005ead.35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jul 2013 12:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0qThUHfe8DpNzVAgt/MNSuSP+sIRxPrbRaw2wxuWaQ8=;
	b=UR4rxOr6RiAGr/g6/EmawcpnGPpGwU6iO1oSMZMF7SSYZ2wbXSxiJuAe+KTZSbsGQJ
	us0h1voxDnqm7kC4EFUvCyh3h27QYcJdnPK28r1/iO815gYSwMkbqfAaFjlHXK7Yl79W
	eqjDI1h3XY5739XfwTzcYpSg5leKBHC/Ih7Luxpml1T3u1qYfrO6MgFI/MKHS1zCnx3V
	DdCieg91SDDwrQAO5/CRrzXymCXb12h0tQ9HlzXYNWrEfNFo2CmnZ8B5dK0aMHR1olnZ
	v+RuOMF84P4rSZtTXvD1YfNdHeZqYUwBPUWC51BM19NFoVmfrA856QfNp1oTcjEJH7Zm
	hzbw==
X-Received: by 10.14.173.130 with SMTP id v2mr26908702eel.29.1373312141807;
	Mon, 08 Jul 2013 12:35:41 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b3sm44690719eev.10.2013.07.08.12.35.40 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 08 Jul 2013 12:35:41 -0700 (PDT)
Date: Mon, 8 Jul 2013 21:35:50 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <20130708193550.GQ3288@jama>
References: <20130706122934.GC3288@jama>
	<1373145886-26565-1-git-send-email-Martin.Jansa@gmail.com>
	<20130706213931.GD3288@jama> <51DAFE34.3080505@windriver.com>
MIME-Version: 1.0
In-Reply-To: <51DAFE34.3080505@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] test-dependencies: add simple script to detect missing or autoenabled dependencies
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
X-List-Received-Date: Mon, 08 Jul 2013 19:35:41 -0000
X-Groupsio-MsgNum: 41625
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mzmkN2k+aDjaU9Rr"
Content-Disposition: inline

--mzmkN2k+aDjaU9Rr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 08, 2013 at 02:00:20PM -0400, Randy MacLeod wrote:
> On 13-07-06 05:39 PM, Martin Jansa wrote:
> > On Sat, Jul 06, 2013 at 11:24:46PM +0200, Martin Jansa wrote:
> >> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >> ---
> >>   scripts/test-dependencies.sh | 250 +++++++++++++++++++++++++++++++++=
++++++++++
> >>   1 file changed, 250 insertions(+)
> >>   create mode 100755 scripts/test-dependencies.sh
> >>
> >> +build_all() {
> >> +  echo "=3D=3D=3D=3D=3D 1st build to populate sstate-cache directory =
and sysroot =3D=3D=3D=3D=3D"
> >> +  OUTPUT1=3D${OUTPUT_BASE}/${TYPE}_all
> >> +  mkdir -p ${OUTPUT1}
> >> +  echo "Logs will be stored in ${OUTPUT1} directory"
> >> +  bitbake $targets | tee -a ${OUTPUT1}/complete.log
> >> +}
> >
> > I've just added "-k" here to bitbake call, more improvements are expect=
ed,
> > that's why it's only RFC, but I wanted to share it soon in case someone
> > else also have access to some builder which is idle during weekends..
> >
> > It would be nice to test and fix oe-core recipes first, but because my
> > target is to run this in dylan I'm running this with more layers
> > included already.
>=20
> Martin,
>=20
> Such a per-recipe dependency test has been on our to do list!
> Once your script is in master, we can run it at least once a week.
>=20

Great, my tests revealed about 100 packages with autodetected extra
dependencies, I'll send improved version of this script soon (together
with results from my world builds (23 layers included).

Regards,

> > I'm sending patches for master + blacklisting broken recipes in dylan,
> > maybe we should backport them later as missing deps and autodetected
> > deps are relatively safe fixes.
> >
> > Regards,
> >
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
>=20
>=20
> --=20
> # Randy MacLeod. SMTS, Linux, Wind River
> Direct: 613.963.1350

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mzmkN2k+aDjaU9Rr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHbFJYACgkQN1Ujt2V2gBxhWwCgh8wToRrGWTFeFd2UTUkXJCPx
zHoAnRAVGoA88wgwPnyvTndFMkMXwFCH
=UGZ+
-----END PGP SIGNATURE-----

--mzmkN2k+aDjaU9Rr--
