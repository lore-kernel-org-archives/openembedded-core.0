Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 864586F718
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 03:47:17 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id y10so1317393pdj.22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 20:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=vmDLO2v9/YceS6FBBz3/Tg7PLSWqnAsZxynw9sy5nGE=;
	b=jYVAxwMCTIAJ2WDh4t6+PdXYAUB13SAX7tNJJ1D0fdevrqXn0uM9SwYyCwap9vZ5rQ
	MWdfnjl9l3a+iUn6Reg7goW1z+Z2HNsdx5KsTLFzH01ygw+etvnHYY51EbIOm2LBojNc
	o+TW8K7VqbxI5/dvgti1Vz3++Z72rwfHJFKDxOAZehRJGuPlYTKc6wirYLX4Y0v3cRKj
	D1WIhnoIYmiFkdmgS5mInwhB59hg+SQSMqvFPykJ+5veQb9itDEna+a1HJv8T4aqfkGy
	mwejZAf8+kQY9/GZsc57jAF/uE/y9kZ6SgWBr8JTdLlK2JkoH2+4tZAv+35A7bxmtDJg
	mYuQ==
X-Received: by 10.68.7.66 with SMTP id h2mr82724953pba.91.1395805637561;
	Tue, 25 Mar 2014 20:47:17 -0700 (PDT)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30]) by mx.google.com with ESMTPSA id
	vb7sm51849935pbc.13.2014.03.25.20.47.15 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 25 Mar 2014 20:47:16 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <53324AA1.6050207@windriver.com>
Date: Tue, 25 Mar 2014 20:47:13 -0700
Message-Id: <87B6FDC2-D8B6-42FF-973C-58350A818179@gmail.com>
References: <cover.1394948105.git.raj.khem@gmail.com>	<a856ac4a0c03a5374e8e2f3567a213f09f33c10b.1394948105.git.raj.khem@gmail.com>	<53322B15.3000807@windriver.com>
	<CAMKF1sqtuqieAvjD+OAePAeC5D-OP31sRvubvGxAnWj4QYx+jw@mail.gmail.com>
	<53324AA1.6050207@windriver.com>
To: Robert Yang <liezhi.yang@windriver.com>
X-Mailer: Apple Mail (2.1874)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/7] util-linux: scanf_cv_alloc_modifier changed from 'as' -> 'ms'
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
X-List-Received-Date: Wed, 26 Mar 2014 03:47:18 -0000
X-Groupsio-MsgNum: 51593
Content-Type: multipart/signed;
	boundary="Apple-Mail=_2009D1DC-1081-4C88-B233-8F19AD95EE67";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_2009D1DC-1081-4C88-B233-8F19AD95EE67
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252


On Mar 25, 2014, at 8:33 PM, Robert Yang <liezhi.yang@windriver.com> =
wrote:

> Thanks for the quick response, it is glibc-2.5-118.el5_10.2.

That says it then %ms was added in 2.7 onwards. One thing you could try =
is
convert the configvars to be target applicable only e.g.

CACHED_CONFIGUREVARS_append_class-target =3D " =
scanf_cv_alloc_modifier=3Dms=94

that should be an ok fix.=20
-Khem

--Apple-Mail=_2009D1DC-1081-4C88-B233-8F19AD95EE67
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlMyTcIACgkQuwUzVZGdMxTzmwCfdGTh5XV+GMOxT3xU3AFfHJNT
7dsAnRZFfgmi9rZPCg5fBj4u7loO3g8M
=Z93P
-----END PGP SIGNATURE-----

--Apple-Mail=_2009D1DC-1081-4C88-B233-8F19AD95EE67--
