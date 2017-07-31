Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f47.google.com (mail-pg0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id D848C60721
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 19:21:05 +0000 (UTC)
Received: by mail-pg0-f47.google.com with SMTP id v189so12607472pgd.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 12:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=walT2Idl+8ncfW1Hy/Ema/e9OGpT83Da24/88oWZVao=;
	b=QUkHUZIQAInMoLZVTbRWs7awYaLSPTfJ/rQ/ZhIifLUS4aRoez/K5cN94X1U409wlm
	cUGi1UewHUBmaghRpTs0A/qrQUZZzU6BCGV2DnxvYJPTIyw5kEhBiA+wjnejfIgLAI+i
	fdJF44gOZHF2RvyOWhp0wI+nNRxvsEGl4HNpZMpRuFeMyJwL45S/CFdMfCNOlc42Z0JJ
	w+XJ6A0dwd0o/8tKyLoy/oLQXRhCFQM+aPaX1/RYdHi7y/vFiQoULSKudbsWVGP7glSN
	Qc/dOfBGo5pqfIAMRb88nJxIikwRovp0SHdqgC4GaJ9fVqcZbSs+ZaY1pMQYlOhamUNi
	KB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=walT2Idl+8ncfW1Hy/Ema/e9OGpT83Da24/88oWZVao=;
	b=GhQu38xMaKpWtgYhX8A2A8wYcCzor7S/yXuLxJABD4U4Awi7DbqHsZ7fRMFkpqzTuB
	ACu/4DhmzUc01uJ/gv1oF6z5xEDcdsz2Ko+AM50CHSD0XhwF4wfoi2KkJXSS8wTI4Ilj
	c7F4nyGq+kLxqKENPQWVrmLTjVXPld0OO17HXG5NpzVHIwhs6Mp78OJseC57tWfkTolK
	HOGsYUvvVdF8e1vwF+dmQF8lE5ualARAmqmDHxlx5agX7lxOFHamHrQcRHQfUJVh978t
	r3S7BLHhad3b4dFYahQiIMjVI+yuRCxypU/YXh4iXpkX+1cdSNnsaVpLRPb889WABduQ
	depA==
X-Gm-Message-State: AIVw111S1+mlDNyz3qbB4GWPeNjIrixjIEa5uux5kTryIctPYNC1VffQ
	jeXxHttvBU4oM5oDc8U=
X-Received: by 10.84.209.165 with SMTP id y34mr18011007plh.396.1501528866631; 
	Mon, 31 Jul 2017 12:21:06 -0700 (PDT)
Received: from Khems-MacBook-Pro.local
	([2601:646:8882:b8c:f50a:637a:2f41:6123])
	by smtp.gmail.com with ESMTPSA id
	85sm58895608pfr.90.2017.07.31.12.21.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Jul 2017 12:21:05 -0700 (PDT)
To: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	"Burton, Ross" <ross.burton@intel.com>
References: <20170728180734.1920-1-otavio@ossystems.com.br>
	<CAJTo0LbhyV1g4w4PG_hxMEioTTJdthaDvmgQhU-r2V-w3RHLeA@mail.gmail.com>
	<CAP9ODKqb2hLkkLpbnTSRnGHPRcczZqn_g=Uythiey8Tz+Y_Gcw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <adac39d9-b395-9f8d-5af0-8882e2136140@gmail.com>
Date: Mon, 31 Jul 2017 12:20:57 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:55.0)
	Gecko/20100101 Thunderbird/55.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqb2hLkkLpbnTSRnGHPRcczZqn_g=Uythiey8Tz+Y_Gcw@mail.gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] go-dep: Add 0.2.0 release
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
X-List-Received-Date: Mon, 31 Jul 2017 19:21:06 -0000
X-Groupsio-MsgNum: 100953
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="JkN5A6rMEE0mEXlNDj1F2a2FFxC7sWh6H"

--JkN5A6rMEE0mEXlNDj1F2a2FFxC7sWh6H
Content-Type: multipart/mixed; boundary="QDb1drlB5H8SGtRIRATJRHxo5HAagB8f9";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>,
 "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
 OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Message-ID: <adac39d9-b395-9f8d-5af0-8882e2136140@gmail.com>
Subject: Re: [OE-core] [PATCH] go-dep: Add 0.2.0 release
References: <20170728180734.1920-1-otavio@ossystems.com.br>
 <CAJTo0LbhyV1g4w4PG_hxMEioTTJdthaDvmgQhU-r2V-w3RHLeA@mail.gmail.com>
 <CAP9ODKqb2hLkkLpbnTSRnGHPRcczZqn_g=Uythiey8Tz+Y_Gcw@mail.gmail.com>
In-Reply-To: <CAP9ODKqb2hLkkLpbnTSRnGHPRcczZqn_g=Uythiey8Tz+Y_Gcw@mail.gmail.com>

--QDb1drlB5H8SGtRIRATJRHxo5HAagB8f9
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 7/31/17 12:12 PM, Otavio Salvador wrote:
> Hello Ross,
> Hello Khem,
>=20
> On Sat, Jul 29, 2017 at 3:28 PM, Burton, Ross <ross.burton@intel.com> w=
rote:
>> Failed in the no-x11 builder at least so far:
>>
>> ERROR: go-dep-0.2.0-r0 do_package: QA Issue: go-dep: Files/directories=
 were
>> installed but not shipped in any package:
>>   /usr/lib/x86_64-poky-linux/go/bin/dep
>> Please set FILES such that these items are packaged. Alternatively if =
they
>> are unneeded, avoid installing them or delete them within do_install.
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-no-x11/buil=
ds/537
>=20
> I did reproduce this; I could only reproduce it if I built it with a
> machine which matches the architecture of host, in my case x86-64.
> When building for other arch (e.g: ARM) it works as expected.
>=20
> The problem seems to be a generic problem and I am not experienced
> enough on the Golang toolchain to look at this. Khem could you take a
> look and see if you find the root cause?

Delete this file, its building it on x86_64 because it can. We only need
cross version.

>=20


--QDb1drlB5H8SGtRIRATJRHxo5HAagB8f9--

--JkN5A6rMEE0mEXlNDj1F2a2FFxC7sWh6H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAll/gx8ACgkQuwUzVZGdMxTzRQCfa8uck2Dv1S3/brUz1yiNMzVW
wf0AniTETt4cUCvQL5eDmfKYs9gBZoEU
=5DsU
-----END PGP SIGNATURE-----

--JkN5A6rMEE0mEXlNDj1F2a2FFxC7sWh6H--
