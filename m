Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id A7F15601F7;
	Mon, 27 Jul 2015 15:35:39 +0000 (UTC)
Received: by wibxm9 with SMTP id xm9so122451042wib.1;
	Mon, 27 Jul 2015 08:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TYM7G1BMOxxkrBb3vDwkDnkQgRpy7pgFRgAJzo9SQmQ=;
	b=RLBdnVxDGStzR5yvFDJX3gPX1Oz1iHLN+shH8HqhWIILtn2BL11rJ96MCI3/TkDXnW
	Oz87zZJQKTWUuM1Wd3KcttuDrVmjkkWPzCUT/I7kMl9fPS4kGD/wsyYOz635qGeDgbrL
	+75mTNK7jTojsROsrt9rteE5YbkOr25ign9LkyGqRYgV32G9lo4seqODVay5tZg4GBXt
	WA779sfuceZ95qrDMVsIEh4AKZd7Duh8fZ+Q5Kc2IKup6HBPPwIBJtTKPy+9s8dUFzEW
	UzFL6bFXaQE7elDUV3nWQ/w3A76FhBMq3E5BbHbPhsd5096o6/97bj/f8Xgii4E3ne3I
	7wuw==
X-Received: by 10.180.87.230 with SMTP id bb6mr23683702wib.36.1438011339289;
	Mon, 27 Jul 2015 08:35:39 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ev8sm28496901wjb.8.2015.07.27.08.35.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Jul 2015 08:35:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 27 Jul 2015 17:35:43 +0200
To: Life Life <sadlife1990@gmail.com>
Message-ID: <20150727153543.GB307@jama>
References: <CAAHuHfxtDAi4xF8tJqiiswWGMEC-=jsryjbvuKu1Fg311J+Jyw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAHuHfxtDAi4xF8tJqiiswWGMEC-=jsryjbvuKu1Fg311J+Jyw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: yocto@yoctoproject.org, openembedded-devel@lists.openembedded.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: qt5 webkit Nothing RPROVIDES 'liborc-0.4'
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
X-List-Received-Date: Mon, 27 Jul 2015 15:35:43 -0000
X-Groupsio-MsgNum: 68438
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NMuMz9nt05w80d4+"
Content-Disposition: inline

--NMuMz9nt05w80d4+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2015 at 02:01:40PM +0300, Life Life wrote:
> Hello,
>=20
> I'm trying to build qt5 webkit. I seen this error message
>=20
> Build Configuration:
> BB_VERSION        =3D "1.24.0"
> BUILD_SYS         =3D "x86_64-linux"
> NATIVELSBSTRING   =3D "Ubuntu-14.04"
> TARGET_SYS        =3D "arm-poky-linux-gnueabi"
> MACHINE           =3D "phyboard-wega-am335x-2"
> DISTRO            =3D "poky"
> DISTRO_VERSION    =3D "1.7"
> TUNE_FEATURES     =3D "arm armv7a vfp thumb neon callconvention-hard cort=
exa8"
> TARGET_FPU        =3D "vfp-neon"
> meta
> meta-yocto        =3D "(nobranch):9aff3a4ec058a1a1149d026ebedcc6251089fff=
b"
> meta-phytec       =3D "(nobranch):ccf1c78f312f84933b90926e9bf4f72de59e8e9=
4"
> meta-phyam335x    =3D "(nobranch):a6c488b268d0c2e506f293221703dafcc05b961=
0"
> meta-oe
> meta-networking
> meta-python
> meta-multimedia   =3D "(nobranch):9efaed99125b1c4324663d9a1b2d3319c74e727=
8"
> meta-qt5          =3D "master:6d9e2a6dfc21f7d9a3a11b4bcb426b5dfe6feaeb"
> meta-ruby         =3D "(nobranch):9efaed99125b1c4324663d9a1b2d3319c74e727=
8"
>=20
> NOTE: Preparing runqueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> NOTE: Tasks Summary: Attempted 3367 tasks of which 3367 didn't need to be
> rerun and all succeeded.
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing RPROVIDES 'liborc-0.4' (but
> /home/xy/yocto/build/recipes/images/
> core-image-base-edited-20150723-135844.bb RDEPENDS on or otherwise requir=
es
> it)

My guess is that qtwebkit is autodetecting orc (as provided in
meta/recipes-devtools/orc/orc_0.4.23.bb) so if you build qtwebkit in
sysroot with orc already staged and then reuse the same qtwebkit build
in build directory without orc you'll get this kind of error message.

Proper fix is to explicitly disable orc support in qtwebkit (or even
better add PACKAGECONFIG[orc] which will explicitly enable/disable it).

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NMuMz9nt05w80d4+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEUEARECAAYFAlW2T84ACgkQN1Ujt2V2gBwckACfWbJ2RJYGQBpSSY8VO26psI7D
zHcAmKgYkuMMp2aIav3QaMbD1rrKNe4=
=6u+X
-----END PGP SIGNATURE-----

--NMuMz9nt05w80d4+--
