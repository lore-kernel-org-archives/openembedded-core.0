Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9B7607716F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 16:02:12 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id hh10so24276719pac.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 09:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=u7A12DiKvuqI2BVCax+wwjde78DdIf55mpePH0waQes=;
	b=f25qLy+DTRIcGevFC8JQGuUDWt1QQREahx/XmkyIhcoWDhrFyyaEKnSRLYyRHyZHam
	GW0QKHMrWvnTFkmzN+M+/FCAilFhCl+RFJUcj62K5JbDL1aw5Wgqc/OaiqXC2pO03Ihz
	QKqrl31Gc3zzZlvVwR4qmBsu74bI2quoSlDtxzd3bnVzeoHnfpRG17CDJ8FuaZbxBmtH
	TmwSM7tDjWdcMGERr3T8WwaYOkS+jCoSvNGDoWAKmyRet3hB197oJvJmE0d4UPbpWdHI
	dHjtYqCUSmbb0BhAxmw/wJy1ogckgBsDo+zfpQ/0tRZLql3IuSEG1OjSiws8DIC9KZ0S
	c5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=u7A12DiKvuqI2BVCax+wwjde78DdIf55mpePH0waQes=;
	b=XP7krGbLjKWRDF0/kkWjMLClv+G1/5g+bzOwbczV/sTH/XXajIb022nc2N+JXGBK+B
	XqZOBEKBuF4YtP+CpmV2aRiU5vZp9Orm/2BqIFpH15Op3BlBhXp/Y/3RTE8+vIQOotae
	cOnYdtRn0LyzlYR425RHkK4bvTIE2oYRShnMj6Ljxu6Se0tvX7H7ylIhwi+CwR+K8XrG
	cChoc4opqNrtyXJ1pHL4CIAMTh2PokrM+4yDwY4COSGR8BBJ/kiHLjfv0ZbJnUyvivwX
	NRTi9de0B9S/xp874nAuXnpZKWaoB39BcNUHK3E/gVizoRAjASNo2uNGISDMVzBkcvY2
	ssIg==
X-Gm-Message-State: AEkoouvsTIhA1XXft2mkQDoMlw+OurSgbSi5mG/SR2HzpcKJzKhNOLSq0Z0h2whelG390A==
X-Received: by 10.66.189.104 with SMTP id gh8mr162274261pac.125.1470672133411; 
	Mon, 08 Aug 2016 09:02:13 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:ddaa:6f66:32b4:378?
	([2601:646:8882:b8c:ddaa:6f66:32b4:378])
	by smtp.gmail.com with ESMTPSA id
	d5sm49182949pfa.44.2016.08.08.09.02.11
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Aug 2016 09:02:12 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1470643460.8166.35.camel@linuxfoundation.org>
Date: Mon, 8 Aug 2016 09:02:47 -0700
Message-Id: <C43B640D-3E8C-45B6-99AA-172F7C995E0A@gmail.com>
References: <cover.1470627445.git.brian.avery@intel.com>
	<238d43d3704f084f3173624c1e4956246a1044e0.1470627445.git.brian.avery@intel.com>
	<db8cc8ef-f243-a2b2-93ed-cd85c8917bce@gmail.com>
	<1470643460.8166.35.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] packagegroup-core-eclipse-debug: add openssh server to support openssh-sftp-server
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
X-List-Received-Date: Mon, 08 Aug 2016 16:02:12 -0000
X-Groupsio-MsgNum: 85471
Content-Type: multipart/signed;
	boundary="Apple-Mail=_153521C5-998E-4BD8-9DAF-E41238F6C3F2";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_153521C5-998E-4BD8-9DAF-E41238F6C3F2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 8, 2016, at 1:04 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Mon, 2016-08-08 at 08:27 +0200, Jacob Kroon wrote:
>> On 08/08/2016 05:43 AM, bavery wrote:
>>> The openssh-sftp-server was already part of the pakagegroup. Adding
>>> the openssh-server
>>> lets the sftp server start up correctly.
>>=20
>> If openssh-sftp-server cannot run without openssh, shouldn't it
>> RDEPEND
>> on it instead ?
>=20
> I suspect you are right and that it needs an RDEPENDS if it doesn't
> work without it. It also needs a comment explaining the dependency so
> someone doesn't remove it.

I have been using

>=20
> Cheers,
>=20
> Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_153521C5-998E-4BD8-9DAF-E41238F6C3F2
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAleorScACgkQuwUzVZGdMxQKlgCgixE9yKc1Mt1uo9RjmiuAEX7y
LlMAn3yHIYxYnUGlcPGEnaYrrc21e9PV
=9Nk5
-----END PGP SIGNATURE-----

--Apple-Mail=_153521C5-998E-4BD8-9DAF-E41238F6C3F2--
