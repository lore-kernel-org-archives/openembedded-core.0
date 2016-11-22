Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3E468719DA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 03:46:25 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id p66so689436pga.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 19:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=/tMKrCrv9ddDwmGlPV8CDy8IfmgLs2vzayJfLUknkAk=;
	b=uVQNuhW9I7WoRVf3oatB0L7SZKR3nbhdazYQ9CKPRVz0txzaZg9TYuFkRaMQzjfObf
	xwyv+Ron2UVlk18dMMc+herl6fKSKboBR5lEzWcGpvGCfOiPU8nfU1hXCxSrakZkv1CJ
	A5FooodVeT6yCuoEzHQ0EJLMtXXAL3CdWlZzkDNVMNUQOmacNV0olKBVHsjY+lPzC9zU
	k3YREvpTBRqM1p7ognMhgHxH5HVkx+BhS8xS8IkplhIh+3hz5GV/RSb37c0A+8YNcEiJ
	uASmM0uPDAKhiDe30b344JFKSkdFnUxJbWoQbioCmAC1BgyipiJToyBluCvsR2xBi886
	k5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=/tMKrCrv9ddDwmGlPV8CDy8IfmgLs2vzayJfLUknkAk=;
	b=UBK5I2WMDEMVIGb8D9lAOC9kUfLeqScsTTsCd6T3AVMh98XQWC/W9kf4ljPEfqfi54
	KCG6Iqx5LkxmleT7KKJ3dgH55sdb62kg+TxK7+BqYzu3Ao/67WF1k6YeufWDlycLdSRd
	PtnMhD2274rF3zPbQJbkiUh6p70DauULBVJ+tDzn6dYF+BOE6jhf0zonP2MRFYUgBSgy
	6gtO0WzQmqxsUoqk9lHdyX5jR47vQOWx7nSOMkKeIF227m7qgj3RN7yAvpYT+TsD1riq
	yBFMTRcRfL7RfJUfQ7WGstSm3ph0EeF5B0z3xvPfeHLMzeUk0oKOzngz6yRhG+q7EsoS
	0Jyg==
X-Gm-Message-State: AKaTC00jRbdRYo0n0Sfsgbt87q2kfvki+S6kGdESDjXkwFUPPPrNyxWQtvXNlh0X6jHAww==
X-Received: by 10.99.39.132 with SMTP id n126mr39464996pgn.85.1479786387579;
	Mon, 21 Nov 2016 19:46:27 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:79bd:3a31:4354:fac0])
	by smtp.gmail.com with ESMTPSA id
	65sm40671142pfn.12.2016.11.21.19.46.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Nov 2016 19:46:27 -0800 (PST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <20161116174748.26994-1-raj.khem@gmail.com>
	<20161116174748.26994-2-raj.khem@gmail.com>
	<CAJTo0Laq+KdjYoNvTM3DV+X8aGGdfWyJM=1z830=8T1orbqaJQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <eb6aeb51-c0c5-fe39-f3e1-ac1dfede129b@gmail.com>
Date: Mon, 21 Nov 2016 19:46:21 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:50.0)
	Gecko/20100101 Thunderbird/50.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Laq+KdjYoNvTM3DV+X8aGGdfWyJM=1z830=8T1orbqaJQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] taglib: Update to 1.11.1
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
X-List-Received-Date: Tue, 22 Nov 2016 03:46:28 -0000
X-Groupsio-MsgNum: 89638
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="fkuqb20ue7uFG08Mqa0JB8t5Wlkg6BLrA"

--fkuqb20ue7uFG08Mqa0JB8t5Wlkg6BLrA
Content-Type: multipart/mixed; boundary="WM9XW7BGknT5ntNuuFCf943aI2JWocIGu";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Message-ID: <eb6aeb51-c0c5-fe39-f3e1-ac1dfede129b@gmail.com>
Subject: Re: [OE-core] [PATCH 2/5] taglib: Update to 1.11.1
References: <20161116174748.26994-1-raj.khem@gmail.com>
 <20161116174748.26994-2-raj.khem@gmail.com>
 <CAJTo0Laq+KdjYoNvTM3DV+X8aGGdfWyJM=1z830=8T1orbqaJQ@mail.gmail.com>
In-Reply-To: <CAJTo0Laq+KdjYoNvTM3DV+X8aGGdfWyJM=1z830=8T1orbqaJQ@mail.gmail.com>

--WM9XW7BGknT5ntNuuFCf943aI2JWocIGu
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 11/21/16 9:57 AM, Burton, Ross wrote:
> On 16 November 2016 at 17:47, Khem Raj <raj.khem@gmail.com
> <mailto:raj.khem@gmail.com>> wrote:
>=20
>     -DEPENDS =3D "zlib"
>     +DEPENDS =3D "zlib boost"
>=20
>=20
> This appears to be an optional dependency and pulls in all of boost for=
 a byte
> swapping macro, which whilst I appreciate is in the spirit of C++ isn't=
 great
> considering GCC has its own macros that it also checks for.
>=20
> Can we just fix the tests so they don't error if boost isn't present an=
d force
> it to off?

its a build time dependency. Do we have a usecase/images where taglib is =
used
and boost is just pulled into build because of taglib ?

>=20
> Ross


--WM9XW7BGknT5ntNuuFCf943aI2JWocIGu--

--fkuqb20ue7uFG08Mqa0JB8t5Wlkg6BLrA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgzv5EACgkQuwUzVZGdMxQ8sQCgjd0BtXcqjmzr2jV8mcYrzv1h
F8AAn0c+U/UoqQjfJ+AK+fTPdW3DjZiw
=HHtP
-----END PGP SIGNATURE-----

--fkuqb20ue7uFG08Mqa0JB8t5Wlkg6BLrA--
