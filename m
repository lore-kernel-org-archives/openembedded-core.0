Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id ED95161019;
	Fri, 20 Sep 2013 11:46:35 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id f15so197083eak.36
	for <multiple recipients>; Fri, 20 Sep 2013 04:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=V5z0d36zR3YyUY8lIG2fmgo+XfoBIq2zIMST21keEpA=;
	b=H/wPbkI3tBfxK1diS80Nx3xaYoghDTDieFRiDh/N/yGOHK/gixZyzqnO2s7IXbQkuS
	i72tLteBR3We1LraKtSrQtzqR4C50yAyTxCeSjIwoCsQ6GIjOKjvYFHQE93ckSBHgxNu
	SmXz3hoZ4KuacVwWxkjZTvzy/OCZuKwhRaHzHVkDD4lKqPDKjoHTuf1DM0wQR/YVJIyO
	HrxL1cKyFPcYfaz7ZD+P4lf1StTi40xVY2BpnCAXFkXBuNkEvndxq7Iwgph6DQL54w4X
	p7M0soooNuhAd/Xu2Rt6fEBE2IF7hYJjmRvHWPMstlN86vBrG7KTeR28tcvmm5Zxjubk
	ztQg==
X-Received: by 10.14.99.196 with SMTP id x44mr2095286eef.83.1379677597317;
	Fri, 20 Sep 2013 04:46:37 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	h52sm18790372eez.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 20 Sep 2013 04:46:36 -0700 (PDT)
Date: Fri, 20 Sep 2013 13:48:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20130920114815.GI18414@jama>
References: <CAMKF1sonakYiB++QeeeXKVztx+7CKW3zn=ndn=kP+kSVmqu3Qw@mail.gmail.com>
	<20130919120202.GK7313@jama>
	<19D9595C-FE9E-4E24-B249-D32F62F25EA2@gmail.com>
MIME-Version: 1.0
In-Reply-To: <19D9595C-FE9E-4E24-B249-D32F62F25EA2@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: patchwork updated
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
X-List-Received-Date: Fri, 20 Sep 2013 11:46:36 -0000
X-Groupsio-MsgNum: 45287
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CD/aTaZybdUisKIc"
Content-Disposition: inline

--CD/aTaZybdUisKIc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 19, 2013 at 09:11:50PM -0700, Khem Raj wrote:
>=20
> On Sep 19, 2013, at 5:02 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > On Sun, Sep 15, 2013 at 12:32:44AM -0700, Khem Raj wrote:
> >> Hi All,
> >>=20
> >> The patchwork has been updated to latest. Please keep an eye if you
> >> see something non working let me know immediately.
> >=20
> > Hi,
> >=20
> > something is wrong,
> >=20
> > http://patchwork.openembedded.org/user/bundles/
> >=20
> > returns 502 Bad Gateway for me and I cannot access individual bundles,
> > which is very bad, because all oe-devel patches are separated into
> > bundles based on layer.
>=20
> OK. I have created a local fix for it and also started a discussion on pa=
tchwork ml
> bundles should be visible now. Let me know if there are further issues.

Thanks for quick fix, it works for me now, but maybe not for others

Bundles main page
http://patchwork.openembedded.org/user/bundles/
as well as user bundle (this is "in-test" bundle)
http://patchwork.openembedded.org/user/bundle/79/?archive=3Dboth
work now, but public link for the same bundle
http://patches.openembedded.org/bundle/jama/in-test/
shows 502 Bad Gateway

Can you check that your local fix can be applied in last link as well?

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--CD/aTaZybdUisKIc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlI8Nf4ACgkQN1Ujt2V2gBwseQCfR0rAxH0d3iH7PDqrjQCAc65p
oDQAn1ft+yvHre6cDqhV4TsUQhOoQlUT
=5iyR
-----END PGP SIGNATURE-----

--CD/aTaZybdUisKIc--
