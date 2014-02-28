Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 048CD6F281
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 17:24:48 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id lf10so1029946pab.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 09:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=MMNAB0cbDw6KkGv3yWHEZ4hItTmyL16TJgbqJTuRpfM=;
	b=NCcKgRUFHGOgiRXBFQ4C468Fbfnq+DdvriPEExY0FkgeV+wRaOOWyMtaB3q6DY2RiQ
	83mPNU+aN/TSq9gQzKp9XVdGcm1zfZLBQ7pYsys18rDYCuzlIl2B3BVmcDL5PpZVqkKY
	FEjeV6JeFj+DqRfKYEzZOQYiiFUisUU37iJRYvR7+LvY9lT67cXeFY/+2aqSXmVEnpwv
	oxekh0S1jzRrc+52KkVNdQgeupUbr2EfUnIZ2Kd6P7D/wdjS7UJVl7xjZpNEx6qqiq/A
	eKeTL+MuaUMGo88EP6/C7xeK3vVpN61bBuw8syggy+ECEVq3hv4b1v2nQBaB6ZcBS//h
	mWig==
X-Received: by 10.68.201.67 with SMTP id jy3mr4868329pbc.20.1393608289496;
	Fri, 28 Feb 2014 09:24:49 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30])
	by mx.google.com with ESMTPSA id q7sm8082896pbc.20.2014.02.28.09.24.47
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Feb 2014 09:24:48 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1393587200-16322-1-git-send-email-david.nystrom@enea.com>
Date: Fri, 28 Feb 2014 09:24:45 -0800
Message-Id: <66416D1B-68E3-487C-B0BA-EE211FF59DA0@gmail.com>
References: <1393587200-16322-1-git-send-email-david.nystrom@enea.com>
To: =?iso-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
X-Mailer: Apple Mail (2.1827)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] e2fsprogs: Add util-linux-libuuid to DEPENDS
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
X-List-Received-Date: Fri, 28 Feb 2014 17:24:49 -0000
X-Groupsio-MsgNum: 50728
Content-Type: multipart/signed;
	boundary="Apple-Mail=_27EAB41E-58AE-44D2-A6BB-07A23EB28947";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_27EAB41E-58AE-44D2-A6BB-07A23EB28947
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


On Feb 28, 2014, at 3:33 AM, David Nystr=F6m <david.c.nystrom@gmail.com> =
wrote:

> -DEPENDS =3D "util-linux"
> +DEPENDS =3D "util-linux util-linux-libuuid"

it should be RDEPENDS if at all.

--Apple-Mail=_27EAB41E-58AE-44D2-A6BB-07A23EB28947
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlMQxl0ACgkQuwUzVZGdMxQGIACfSF+U+pC6YLXwGb6+AuusKXnY
ZU4AmgKS8KTXK+PljIkx7ECxT6u5DGDA
=Obz1
-----END PGP SIGNATURE-----

--Apple-Mail=_27EAB41E-58AE-44D2-A6BB-07A23EB28947--
