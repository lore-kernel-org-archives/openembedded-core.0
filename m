Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id C8F3A77195
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 19:28:53 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id x1so7850686qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 11:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=ifRhhHEtXB9c7keV0GBVQMISEBXAW1fHhsvMg3f41HE=;
	b=eDyUq7xRP3fioQ2aPnqmhB9N6x+w6pdJ1yMIPjUbaTzKRiR3y3mVz6iTCZZyLkQ6kZ
	4uzlKMrxjew/i4Ih3huGDEW8ICS28ORfW6faJrpewBHhKUZeH7OvCzyFWGJnaWoFhEIg
	Nv98hTUReZxYxKejR66jZoow3YczzRv1mjQbu+rhYI09BpM2V1ZZTT/JLLyVh95q3ouJ
	KRvvUBRxdOAP/n6QwR6LAO8oUAd9v3Cf13TcrLtI8RSeUFZxDOAQ3S0bdiiq4nKI1Fca
	AuvmM3wLjpVVWqkPrJodeNZNmHeQnV4Kj+PIsV/eJ+CCuluZxrZGQkSUVzboI326Ajbf
	UdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=ifRhhHEtXB9c7keV0GBVQMISEBXAW1fHhsvMg3f41HE=;
	b=ebv6pIIT+Crn8EwhRaGif7upCgqdHJIevxjhbt5svjhrkYo+16zBHZyRowUe9EaFBO
	Ixh9ImXRJ6KdXEkGOaZHGReMTJgmUFYP56dJvnjn8i+Eip42jK2nD54I0hWsGM4jtCex
	aPbS9C0BWFZWqkEwVKkggbKYqK/WhHQG4jb4NTgZZuo1sRBsrqqujLdUWDoR5ojh51a3
	pxSZzWMNfopgbTMHVIaGo/k/90Oo/S7Zu1QpLKO+H1lnJtCPvhFa+HblOJ3pEom4d9F5
	5WbxrW6clfuQHbHlqoIlYeLzaMYd98yWu8LkiBaj3TnlElKmYCRsR89VFLTMSgqhKA+E
	AcNg==
X-Gm-Message-State: AG10YOSMu6Jktcb+LwPrgWtaHkLGJbaruS9yIdSXd57KS0VPSOs0DIpiPDQXwCbzUtxktA==
X-Received: by 10.55.197.140 with SMTP id k12mr7282841qkl.5.1453922933965;
	Wed, 27 Jan 2016 11:28:53 -0800 (PST)
Received: from [172.20.20.20] ([50.153.94.2])
	by smtp.gmail.com with ESMTPSA id 31sm3232275qgz.8.2016.01.27.11.28.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Jan 2016 11:28:53 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20160127191614.GH1652@denix.org>
Date: Wed, 27 Jan 2016 14:28:47 -0500
Message-Id: <C4EFBCA2-18D0-4FB2-BA45-FB21E83A3189@gmail.com>
References: <1453779264-8652-1-git-send-email-denis@denix.org>
	<CAJTo0LbSM2W2ZW_T69tSBWVR3Kg_TQXu7W6TqoG6=DivrU4C4A@mail.gmail.com>
	<20160126142023.GE1652@denix.org> <20160127191614.GH1652@denix.org>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: Apple Mail (2.3112)
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] stress-ng: add 0.05.09
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
X-List-Received-Date: Wed, 27 Jan 2016 19:28:54 -0000
X-Groupsio-MsgNum: 76995
Content-Type: multipart/signed;
	boundary="Apple-Mail=_8FD1F21F-A916-4F58-A146-FD25D7CC624D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_8FD1F21F-A916-4F58-A146-FD25D7CC624D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jan 27, 2016, at 2:16 PM, Denys Dmytriyenko <denis@denix.org> =
wrote:
>=20
> On Tue, Jan 26, 2016 at 09:20:23AM -0500, Denys Dmytriyenko wrote:
>> On Tue, Jan 26, 2016 at 11:24:43AM +0000, Burton, Ross wrote:
>>> On 26 January 2016 at 03:34, Denys Dmytriyenko <denis@denix.org> =
wrote:
>>>=20
>>>> A clean room re-implementation and extension of the original stress =
tool.
>>>>=20
>>>=20
>>> What's the rationale for adding this to oe-core over another layer?
>>=20
>> None, besides the original stress is in oe-core. What other layer =
would you
>> suggest?
>=20
> Ross,
>=20
> Care do make your own suggestion? Do you think meta-oe would be a =
better fit?
> Are there any other considerations, since stress-ng is a replacement =
of the
> original stress and it was added to oe-core? Thanks.
>=20

IIRC we had meta-benchmarking. They all should go there.

> --
> Denys
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_8FD1F21F-A916-4F58-A146-FD25D7CC624D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlapGnMACgkQuwUzVZGdMxTnPgCfbFxSG8tHCNg7yMUCA9YU1A7y
PmAAoJHx2+yBZY8UwnnQaqW6B/xDdZGP
=G+H5
-----END PGP SIGNATURE-----

--Apple-Mail=_8FD1F21F-A916-4F58-A146-FD25D7CC624D--
