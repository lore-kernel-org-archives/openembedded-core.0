Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id BEE8C7391D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 05:48:11 +0000 (UTC)
Received: by pdrg1 with SMTP id g1so18593933pdr.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 22:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=xW1HQwIvd02khYM/eTl8gggfX/DuRBxIFyEUk+wCZEg=;
	b=gK4iJ1U1GPpjGzO9WetopoGubqC0O78PEqjSGEr8Ztrvg8FSpk02CnkiJ1GLaBI8ae
	UyKFxmwh+WU3NeyNTjMxJN95o6I4k3SO/pXkcRK+blo7AkrJUQ3dm0qBByBOAj93RuhG
	d0kLf4E4nHoizZCDzllwHJT0HQ/g9ud8JmqjSMjwu4tO6IwO4vYE/VdDuLcCtD2VKqHG
	JdGetALRyYBCVU7ajbkoBSXfpp7iGkuHk0TT+XqRAUkOwHDTg6/unZjOxC0rscA2byg6
	hNFjQk5COmKzgiO0dbA49DjdIST95yhNKdO3usyVWCy1mjwsjha05y8rjmS/qIOuZqzl
	wJew==
X-Received: by 10.68.136.3 with SMTP id pw3mr4691585pbb.10.1436939291757;
	Tue, 14 Jul 2015 22:48:11 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:6157:e6ef:b835:bd94?
	([2601:646:8601:4580:6157:e6ef:b835:bd94])
	by smtp.gmail.com with ESMTPSA id xv9sm3242094pbc.2.2015.07.14.22.48.10
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 14 Jul 2015 22:48:11 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2102\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <55A5E6D2.6050108@windriver.com>
Date: Tue, 14 Jul 2015 22:48:06 -0700
Message-Id: <A0733748-C753-4201-A2F7-FA771C65B63B@gmail.com>
References: <BN3PR03MB1367ABE95BBD2A48796FF31FE49A0@BN3PR03MB1367.namprd03.prod.outlook.com>
	<55A5E6D2.6050108@windriver.com>
To: Robert Yang <liezhi.yang@windriver.com>
X-Mailer: Apple Mail (2.2102)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Query about the toolchian version of Yocto 1.9
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
X-List-Received-Date: Wed, 15 Jul 2015 05:48:11 -0000
X-Groupsio-MsgNum: 67975
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DA70D599-48A3-48AC-8416-2B0A1FD3C564";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_DA70D599-48A3-48AC-8416-2B0A1FD3C564
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jul 14, 2015, at 9:51 PM, Robert Yang <liezhi.yang@windriver.com> =
wrote:
>=20
>=20
>=20
> On 07/15/2015 11:41 AM, Luo Zhenhua wrote:
>> Hi,
>>=20
>> I can see that there are recipes of 3 gcc version(4.8, 4.9, 5.1) in =
master
>> branch of Yocto, may I know which one will be officially supported by =
Yocto 1.9
>> release? Will the other versions be tested and supported?
>=20
> What I know is, gcc 4.8 is a backup, 4.9 is the default one atm, 5.1 =
is
> on going, and when switch to gcc 5.1, the 4.8 would be removed. Both
> 4.9 and 5.1 will be kept and supported if there isn't more upgrades.

We will shift gcc-4.8 to toolchain-layer under meta-openembedded in case =
we remove it
from OE-Core, it still will be available if absolutely needed.

--Apple-Mail=_DA70D599-48A3-48AC-8416-2B0A1FD3C564
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlWl9BkACgkQuwUzVZGdMxQq9wCgixF3/K16zZSG9YpSLF6ttU2N
yWEAnA3RujoyhBR2oM63O0Zn1ivHW27J
=e9CA
-----END PGP SIGNATURE-----

--Apple-Mail=_DA70D599-48A3-48AC-8416-2B0A1FD3C564--
