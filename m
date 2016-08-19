Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id E08137318F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 16:52:23 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id y134so11096895pfg.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 09:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=0CE1ZJDr0h8gZzU/D4ID7v4En2y9vfavgxfVwOHAq0M=;
	b=UZbKMJwb4TDO5UkWIp0T+XpzM6EhOpfunO8Ia0HZpU7tsPciWJrLT4gr53kcAe/i2T
	7bnHPGv8H104Fu+K7sWKCd5HqWHfvKla834tHGvk5oxsf7/fLlT23WjxDl29GaGWW4hR
	0C2o3jkGGqRorwt9C5RNlmKIemlA6pUtvLQtpCbmmAwN0SFhx23Lmqz2iEmDijxXBPSS
	DZ5Slqi08or1X5N0gveJkt+tsWoKgCO7/iQQxSKoxVSTdHAxuuzczkdyMp5Y5FyoC1S9
	490B6+Q1aXhaEAyBuVB4kYslf6LuCxAa9L0SvhX5vH/0ydwd/lJA3arBIi1U1qukXOMu
	/lAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=0CE1ZJDr0h8gZzU/D4ID7v4En2y9vfavgxfVwOHAq0M=;
	b=DzOc3jk5f4OkSD66B6+sZzN+nsRrMWoBQyCmfn3amKVBedqOc03cSW3XnkGJNqqjzl
	xRuQlnnHSh9WpnmzWWDi3W/M+xEP2BLMLVZqC96DNOU+n+gy8p6ws21UQyFKuiRZjSvu
	QycQT/ZpF0X3zXH3jDlzeL9hq5jVE32xD9qXFo/LbK1R5g/bulXoeMivFGs8h4Jmbskg
	QQsGQrXyE05xkOttX40pZUp5w8uOLZNwMvcvHjS8EUMdjDhX9wzeuqVBvYGDxASRYNgk
	rd8AjgLwT3Pgw8d2voihjYrX+ARk/AmFjq2J++zPLfqdkCFJFB8PSPc2EeicO5wqoRE6
	wTYw==
X-Gm-Message-State: AEkoousRG8L5D6MAcWVkDjaU8/LN69pqJdQ4pFOtm2tLs6/alqZfOGGgtUglGplLXDY1gA==
X-Received: by 10.98.51.131 with SMTP id z125mr15901733pfz.109.1471625544578; 
	Fri, 19 Aug 2016 09:52:24 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:3edf:8c96:6cf1:33a0:ccf4?
	([2601:647:4c00:3edf:8c96:6cf1:33a0:ccf4])
	by smtp.gmail.com with ESMTPSA id
	n10sm12855113pap.16.2016.08.19.09.52.23
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 Aug 2016 09:52:23 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <8b30fc2d-26ea-03bd-58ea-cdbf00e74b36@linux.intel.com>
Date: Fri, 19 Aug 2016 09:52:26 -0700
Message-Id: <020C25BC-315C-4ED3-8268-DB7CC4C0A52A@gmail.com>
References: <1471499308-1666-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
	<CAJTo0LZy-mx4K=eSJdNRq12JVDzGwW+Oe0uf40YRZAmyWVJsZQ@mail.gmail.com>
	<56847BB1-DCA8-446D-9418-2D42098A7073@gmail.com>
	<CAJTo0LZJRJFC71=xEa_EQUiOTZNWR8QPGtnJvSWqqGLqM_QjcQ@mail.gmail.com>
	<8b30fc2d-26ea-03bd-58ea-cdbf00e74b36@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gdk-pixbuf: 2.34.0 -> 2.35.3
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
X-List-Received-Date: Fri, 19 Aug 2016 16:52:25 -0000
X-Groupsio-MsgNum: 85989
Content-Type: multipart/signed;
	boundary="Apple-Mail=_FCE2C19F-2B5B-44AC-9C09-E523133CB4DF";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_FCE2C19F-2B5B-44AC-9C09-E523133CB4DF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 19, 2016, at 5:41 AM, Alexander Kanavin =
<alexander.kanavin@linux.intel.com> wrote:
>=20
> On 08/18/2016 09:11 PM, Burton, Ross wrote:
>>=20
>> On 18 August 2016 at 18:58, Khem Raj <raj.khem@gmail.com
>> <mailto:raj.khem@gmail.com>> wrote:
>>=20
>>    perhaps recipe updater script should account for such presets ?
>>=20
>>=20
>> It does:  http://recipes.yoctoproject.org/rrs/recipedetail/451/ says
>> up-to-date as we have 2.34.0 despite there being 2.35.3.
>>=20
>> These upgrades have been done without reference to the tooling we've =
got.
>=20
> Also the recipe itself inherits upstream-version-is-even class - that =
means odd versions are development snapshots and should be ignored.

good point, will this class give me some sort of parsing error, if I try =
to update to odd version ?

>=20
> Alex
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_FCE2C19F-2B5B-44AC-9C09-E523133CB4DF
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAle3OUsACgkQuwUzVZGdMxRneQCfciXyTDZIzb5KnihzeVCCaY/a
yvsAnjGERvTpOht7OWpc0NyrGdBuHGqd
=+xrx
-----END PGP SIGNATURE-----

--Apple-Mail=_FCE2C19F-2B5B-44AC-9C09-E523133CB4DF--
