Return-Path: <joe@deserted.net>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 584B460DF7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 14:09:44 +0000 (UTC)
Received: by mail-ie0-f174.google.com with SMTP id rp18so806922iec.19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 07:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=Oc6FWDk1WEkmSiaxQVgt8cWTVkv6ao/FUlbV0+x2bk4=;
	b=Y/nb+EM/By+vPSxlk74Oyb1h4WLmJ/VTTvrmcK647GC1qr4QggfwkNxgpLW3qD9lB1
	XNcc5+DIPRZeKCQnpdJ8LsoSGI6jY8//UGen2RdZcncl64x3YqVnsxypuU4KUt1dLtvQ
	3PqouuLctoQBmB2rqhm1knEIF4uESELBNeALzHnuRcgrDkyaJCBilRWM6+DVoPEMmeqd
	vOdptIlxf54CbnG3lBylkPmx4YcxbsWqnw70UnUaJQLgvx9VL9AjpuPp2iDT4O3rfWQ3
	MTvWujhb6QJRE1N18Q5qEZ/Eg/u9C0fp30FxJJwyQ2L9MFCuUBHTlClJxhlfBgslVTEq
	u3UA==
X-Gm-Message-State: ALoCoQmweJ27TP3pqsHrxSSWfuevRFff6awus/jxtPSOYTD1eRu4bocoBOKBsJoQsatJFchlE2B2
X-Received: by 10.50.128.84 with SMTP id nm20mr16744635igb.14.1405519785481;
	Wed, 16 Jul 2014 07:09:45 -0700 (PDT)
Received: from skynet (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id la7sm44472582igb.9.2014.07.16.07.09.43
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jul 2014 07:09:44 -0700 (PDT)
Received: by skynet (Postfix, from userid 1000)
	id 1BFC11685E4; Wed, 16 Jul 2014 10:09:40 -0400 (EDT)
Date: Wed, 16 Jul 2014 10:09:40 -0400
From: Joe MacDonald <joe@deserted.net>
To: Himanshu Pandey <pandey_himanshu80@rediffmail.com>
Message-ID: <20140716140937.GC13248@deserted.net>
References: <53b21c10.2677420a.3f91.4ec8SMTPIN_ADDED_BROKEN@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <53b21c10.2677420a.3f91.4ec8SMTPIN_ADDED_BROKEN@mx.google.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Reagrding meta-networking
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
X-List-Received-Date: Wed, 16 Jul 2014 14:09:45 -0000
X-Groupsio-MsgNum: 55060
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SO98HVl1bnMOfKZd"
Content-Disposition: inline

--SO98HVl1bnMOfKZd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [OE-core] Reagrding meta-networking] On 14.07.01 (Tue 02:24) Himanshu =
 Pandey wrote:

> So, do I have to set IMAGE_INSTALL variable in local.conf and packagename=
_XXXXX
> is what to be followed for the addition of each package.

That is certainly an option, though I tend to prefer
IMAGE_INSTALL_append for local.conf tweaks.

If you expect this to be a longer-term thing, you may want to consider
defining an image type for your project that includes specifically what
you want in it.

-J.

>=20
> Regards,
> Himanshu
>=20
> From: Henning Heinold <henning@itconsulting-heinold.de>
> Sent: Tue, 01 Jul 2014 01:01:52
> To: "openembedded-core@lists.openembedded.org"
> <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] Reagrding meta-networking
> On Mon, Jun 30, 2014 at 01:29:26PM -0000, Himanshu  Pandey wrote:
> > Hi,
> >
> > Since I want dhcp and pppoe, so I downloaded the same from git and incl=
uded
> meta-networking layer in bblayers.conf. This layer is getting compiled but
> somehow dhcp and pppoe are not getting included in the final image. So wh=
at I
> have to do inorder to add dhcp and pppoe in the final image.
> >
> > Please help.
> >
> > Regards,
> > Himanshu
>=20
> IMAGE_INSTALL +=3D "packagename_dhcp packagname_pppoe"
>=20
> Be aware that recipe(bb)-name is mostly not the resulting packagename.
>=20
> Bye Henning
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
> [signaturel]
> Get your own FREE website, FREE domain & FREE mobile app with        Know=
 More
> Company email.                                                       >

--=20
-Joe MacDonald.
:wq

--SO98HVl1bnMOfKZd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlPGh6EACgkQwFvcllog0XznPQCbBorTDc2hlEAT3Ksm8jKOnVqG
LsgAn32Wz4FqZmfeSagxdJsiEIPGxkT6
=ZpxL
-----END PGP SIGNATURE-----

--SO98HVl1bnMOfKZd--
