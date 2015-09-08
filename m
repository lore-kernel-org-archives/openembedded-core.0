Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 087F765C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 21:05:55 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so129614559wic.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Sep 2015 14:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Cor20/MxvLVK/XaZP3cTjYYOyZIrg2cOQrVdnqcpf4o=;
	b=zIreMN/3fMXCL7VvxPLfMIG8QCXU2CcaK8DH3acBXq7If0bCXTWbUxivrqbiunGy+y
	sICA5xKPE4UMDvPit9KJPPAyLnX73hc2Pv7LgLEqsd0qgElkVX/1rDXK3kVHAtYlUw58
	xUMNDIa2/Yc9oajqmogzCGRWA8Mnje+p52cBKfh6XkaJfSJqTqLNEFbrcMRvDjZUBiyr
	vVwBl3ISJiUWqsIgO97i2OsLEeOgs72RbwZP9N0p7iJfvvLs467zr9ZR8dzDD25Gudex
	SqV3lLsSBPZ5bNsKAj5uzD5FW/5GMwByoxEQKc2YkyMYHeknz6vlIlMO+dMT4bIQgIYb
	QU8w==
X-Received: by 10.194.10.165 with SMTP id j5mr53192671wjb.147.1441746355741;
	Tue, 08 Sep 2015 14:05:55 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bu19sm6709064wjb.45.2015.09.08.14.05.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Sep 2015 14:05:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 8 Sep 2015 23:06:42 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20150908210642.GG2381@jama>
References: <8B394616-9009-4FF4-828C-561A859D34B3@gmail.com>
	<20150901215512.GE2458@jama>
	<CAP9ODKq=HsV79hXhHeCwdhpF6uhHdCxYrhC53Kt5+Pe6Qdpf1w@mail.gmail.com>
	<255516EC-098E-457B-A2E6-2F7C953CAA8D@gmail.com>
	<CAP9ODKp9Vkw-vHNp1PMqE1eTfmW8-s5o6+0JYTv=sFEHm9nc1g@mail.gmail.com>
	<1441177787.24871.33.camel@linuxfoundation.org>
	<55EF2670.6040101@gmail.com>
	<CAMKF1sogs9sRR_07nOxZrvvOxXj_=ioqNr=_vN+hr+VFf2BO6A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sogs9sRR_07nOxZrvvOxXj_=ioqNr=_vN+hr+VFf2BO6A@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Patch merge process
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
X-List-Received-Date: Tue, 08 Sep 2015 21:06:00 -0000
X-Groupsio-MsgNum: 70845
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yQbNiKLmgenwUfTN"
Content-Disposition: inline

--yQbNiKLmgenwUfTN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 08, 2015 at 11:39:17AM -0700, Khem Raj wrote:
> On Tue, Sep 8, 2015 at 11:18 AM, Trevor Woerner <twoerner@gmail.com> wrot=
e:
> > If Richard doesn't want to use gerrit for OE-core, that doesn't exclude
> > others from using it for the layers they manage, does it?
>=20
> yes, however, we should prefer this to run on oe domain, its better
> for project and then if most of layers use it its fine too, it could
> end up
> with same situation as patchwork where oe-core and bitbake do not use
> it actively. other layers do. its not ideal situation but its ok as
> long as
> its makes people productive, we could be open for options its matter
> of volunteers then maintaining the infra for these services.

I agree, there are not technical reasons for not using it for other
layers, but once we ask contributors to create account on gerrit and
submit all patches through gerrit for *some* layers, then these people
will ask why oe-core and bitbake submissions are different.

I should also say that I really like gerrit work-flow and review, but if
people continue to send patches to e-mail and someone else will need to
add Change-Ids to them and consolidate them into review-chains, than
it's not as great as it could be if all related people "buy-it" and use
it exclusively.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yQbNiKLmgenwUfTN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXvTeAACgkQN1Ujt2V2gByYBACeIWriGkTBwzSXfb1xEIu66HVt
VhgAoIw+bHtH6n3r/bvGzqGfvr8GVtc+
=3ccc
-----END PGP SIGNATURE-----

--yQbNiKLmgenwUfTN--
