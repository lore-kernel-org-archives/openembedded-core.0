Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3475872F2D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 18:32:48 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u65so3432743wmu.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 11:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=I28Aij8/TxJA8ICEXLNXFxOvduOrh4NfllGAHo3DLTE=;
	b=l0ODnEUodfM/cSF54H6HJSFm4FQYpnlzik2xTmZvNUB2dZ4cVTdCpHzEcn0j8Qxxzz
	I7stEROEvhvFXiwaZT0Y10mQOCrmJPfTePozGwqG5eW083ftgy04WGCk142e+m+nHGTp
	jkj+iqhlWKe/03lwQhbthVtzPzqhocuTc07SymZ/OXC9uDD1uVRvB40Jhuq+89THbdyo
	dokclHuqn5gia+bWE6NyXdSFrtE2X2jSj2fPer7CHivlXTySrhxP1vCfOU8YIkEMeLDx
	pP5+a5FF7XQTQ6yq++d2sQQBQkWWacYTOHWU0ZnwQIfMd2MFtoXzv23w3LJ4nq25+VbV
	tBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=I28Aij8/TxJA8ICEXLNXFxOvduOrh4NfllGAHo3DLTE=;
	b=kOqVn/5sGoEuISbwuLO+Xpod740wPfiQgdXhgbCcn8m4SMW37OAbtEyrCLV/OyRWHT
	jBca9HCcZAGMUjsBsc9bfg/7DRlgL+9ImuVDzZGzsr/tkglVmXn/mpETJoUSEROSvEhk
	4AJGlidA+/fyLM56q1jOMaDM3Q1My839FWgM9gHY6Vp0HnFL/w1vZiZRSFULwXBgf7as
	keVOzKhASewqFWZGwVcJbP1/rV0Dpw5vmJEpkjL7/RBABF77VvuhhNDuYwq1S0hmoKy8
	VWnVOlbmGFMcjSePfnVQH523QMXWTOuXOI9hDXN5jnyhMQAlowVoxYYJNmAkpprbumWa
	FfIw==
X-Gm-Message-State: AN3rC/62uyikJsQ2zYQs+ldZq3OmP+eKerULU6xwXuYAfV9i6sRsKskw
	TNyoJHwAWfZeXA==
X-Received: by 10.28.94.194 with SMTP id s185mr1863818wmb.103.1493231569727;
	Wed, 26 Apr 2017 11:32:49 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id u88sm41756wrc.20.2017.04.26.11.32.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 26 Apr 2017 11:32:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 26 Apr 2017 20:33:06 +0200
To: "Bystricky, Juro" <juro.bystricky@intel.com>
Message-ID: <20170426183306.GF3258@jama>
References: <1493144048-12455-1-git-send-email-juro.bystricky@intel.com>
	<CA+chaQfX1iYsYwqx4CMKuADmW75_VZStzZpdE-hw=ahtsDvdwg@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B61194BE74@ORSMSX112.amr.corp.intel.com>
	<20170426074212.GB3258@jama>
	<6E51916E4A1F32428260031F4C7CD2B61194DCC6@ORSMSX112.amr.corp.intel.com>
	<CA+chaQe4o+LKRV5voXOhoPoWEGjx2cmXedsagmQEgouAP6jMvQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQe4o+LKRV5voXOhoPoWEGjx2cmXedsagmQEgouAP6jMvQ@mail.gmail.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
Cc: "jurobystricky@hotmail.com" <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Reproducible binaries
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
X-List-Received-Date: Wed, 26 Apr 2017 18:32:49 -0000
X-Groupsio-MsgNum: 96724
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rWhLK7VZz0iBluhq"
Content-Disposition: inline

--rWhLK7VZz0iBluhq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 26, 2017 at 07:52:02PM +0200, Martin Jansa wrote:
> What about passing the seed value (currently created based on last commit
> in repo you're building from - which doesn't need to be oe-core repository
> right?) to make it easier for people to pass whatever value works for the=
m?
> even some constant value in DISTRO config.

It looks like some words disappeared when I clicked the send button.
Well I don't have any buttons in mutt so that might be the reason.

I wasnted to say "passing the seed value" through some separate variable
which is easy to override from somewhere else.

e.g.
export PRELINK_TIMESTAMP=3D`git log -1 --pretty=3D%ct `

in image-prelink.bbclass:prelink_image() is a bit difficult to override.

>=20
> On Wed, Apr 26, 2017 at 6:43 PM, Bystricky, Juro <juro.bystricky@intel.co=
m>
> wrote:
>=20
> >
> > > But not for 2 different builds with slightly modified metadata (e.g.
> > > just because top commit is different in whatever build repository you=
're
> > > running from even when it doesn't have any effect in your image), rig=
ht?
> > >
> >
> > This may be addressed in the future. Presently, the goal is to ensure t=
hat
> > if we
> > use identical repositories we get identical results. This should not de=
pend
> > on the time/date, build folder or even Linux distro. By identical resul=
ts
> > I mean binary identical comparison of the resulting "deploy" folders.
> > (images, packages, licenses). So for example, there should be no binary
> > differences
> > between the two images of core-image-minimal.rootfs.ext4.
> > In your case (slightly different repos), the difference would be presen=
ted
> > as different time stamps for /etc/version and /etc/timestamp only.
> >
> >
> > > So it doesn't fix the files-in-image.txt differences as described in:
> > > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D5866
> > >
> >
> > Eventually it will. There is still ways to go and this patch set is just
> > the first
> > kick at the can.
> >
> >
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rWhLK7VZz0iBluhq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWQDn4gAKCRA3VSO3ZXaA
HHO/AJ4836VQgLtSNCsBH5+APWJXkxwJrwCePkna97idR5Hz5zMQtlLIQt1jqsY=
=xWby
-----END PGP SIGNATURE-----

--rWhLK7VZz0iBluhq--
