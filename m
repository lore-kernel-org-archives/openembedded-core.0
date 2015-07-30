Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 09ADF7638A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 14:19:20 +0000 (UTC)
Received: by wibud3 with SMTP id ud3so70574077wib.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 07:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LNKc2a7TWNKkwRhW0txi5omL3A5+Q9hn+nniSDm2Odc=;
	b=Xg+IhrRDeKzQEIYmSngqFCKZP/z+Z/uAcZBhOGJac+w/O1slclareIXuhjzG5qJ9LS
	mg6zAFqMefswtJM85TU0C4HuZ6lT/3aH4mHIgagqZe7u9/BwB11FUsK3VjsSNTZHJ0D8
	bhjHnvz7iY5/7AfWK6V2G2sMugwwn3yC6IAC+zQME1E32gK+0xXOZfl8WVDvmGP8QBK8
	vLB7rqAtB5vJktOKyVF5xLIlPyri6KEchyKQ6k21brC3fuZOeW+1mMG+/GedPZhEXBKv
	+xnej70ImEsryzbZOAyXDHHkscgvQxuSwXYuYoyPEVckNYMcRQhBLPM8O7U+wzXJgj7h
	OeUg==
X-Received: by 10.180.21.175 with SMTP id w15mr7099143wie.58.1438265960581;
	Thu, 30 Jul 2015 07:19:20 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ef10sm2074460wjd.49.2015.07.30.07.19.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Jul 2015 07:19:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 30 Jul 2015 16:19:34 +0200
To: "Zhou, Li" <li.zhou@windriver.com>
Message-ID: <20150730141934.GA2457@jama>
References: <1438134558-7785-1-git-send-email-li.zhou@windriver.com>
	<CAJTo0LYkVtGiWfH-yf0T7PWREdk=ZyoMU3LyV1OEQpqWCiy2pg@mail.gmail.com>
	<55B9866A.8080300@windriver.com>
MIME-Version: 1.0
In-Reply-To: <55B9866A.8080300@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tzdata: Add marking for config files in recipe
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
X-List-Received-Date: Thu, 30 Jul 2015 14:19:22 -0000
X-Groupsio-MsgNum: 68708
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline

--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2015 at 10:05:30AM +0800, Zhou, Li wrote:
> I have setup up poky as below doc described:
> http://www.yoctoproject.org/docs/1.8/yocto-project-qs/yocto-project-qs.ht=
ml
>=20
>       $ git clone http://git.yoctoproject.org/git/poky
>       $ cd poky
>       $ git checkout -b fido origin/fido
>       $ source oe-init-build-env
>=20
> Do you mean that I should use branch master instead of fido? Has fido=20
> been abandoned?

You're sending patch for master, so you should prepare and test in in
master not in fido branch.

If you want to get it applied in fido, then first get it merged in
master branch and then ask for backport/resend for fido or other release
branches.

> Thanks.
>=20
> On 07/29/2015 08:26 PM, Burton, Ross wrote:
> >
> > On 29 July 2015 at 02:49, Li Zhou <li.zhou@windriver.com=20
> > <mailto:li.zhou@windriver.com>> wrote:
> >
> >      meta/recipes-extended/tzdata/tzdata.inc |    2 ++
> >
> >
> > This inc file was removed last month, please rebase to master.
> >
> > Ross
>=20
> --=20
> Best Regards!
> Zhou Li
> Phone number: 86-10-84778511
>=20

> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlW6MnUACgkQN1Ujt2V2gBwz5wCgujmCcaFX7Jlv16KTXAVCBsfS
LaUAoIx3mC7ChwFJfPJBeZWEvr0/39J1
=nLU7
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--
