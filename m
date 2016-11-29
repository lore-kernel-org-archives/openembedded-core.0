Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3A4E9719E4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 17:20:26 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id e9so16920243pgc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 09:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=rQrL73OJciLGzLNJ8NuF5qRGWdXZHrQCQoggFQrHitY=;
	b=HwaQEnzSqLPB3CplgiDT0KM5SgdcyDIfkocKVN/gP9aoONILGCk7TAanBKUCsYOy9M
	tb9W1LxviQ11yIPNBhTuvBg88Ik4SgSVnP/TsZ/KRJT8bT05eEvQidn8voiXgFVQhYob
	Egv5DHUKnT7GfqkLL0bph7pTnU8rI7jl8wf9gq/sWqNc/aHOa6U7ZOj3LqTueOymW3pm
	41rsbHZbWmlZkhuO/+CmUkNM/+FpSslFH9uO3Zgolm1waQzEtZQjWvxmT8PGAzZVLQmr
	DHpEwX/alAbDBf0FUUhXktHHgM47QqvLa9u2sLpo0bkpSu6on+Dan/6EpBvetsyBtY2y
	IZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=rQrL73OJciLGzLNJ8NuF5qRGWdXZHrQCQoggFQrHitY=;
	b=k2HUbOBSllvonloQqixuoEYp/KdZP6CivIVpb8g2QiLYo5r5Vflm5utFHtK/6BMtV+
	02jzvsRfoMNqAEveCqE0kRj41nJ4GtjJC5nJ8mE6pJhM2p3M3FCHFtVjcSj1Hl8KnEuL
	fEfyPCswYFTLFsWc8czEENkOS4Dt42GoXhcdcpNDtuAzmyGPN76KU4fBxUfeqYI+ciEX
	HSIIGD1bVykF0O5W4KYe65/Bp2XToKojUcUJq5lkFszCLVlIXl5mUtvRGHy0Phr98QAf
	wrs2bAxG618V1lUGHl4Yb7JMv50rATDW3dYP29gui/yegPGO/vHRDVgTCJ7EAxe455EF
	XmQg==
X-Gm-Message-State: AKaTC03TFjGaEIbnyzfMa4YmTl5xqjIaulr/SmfgLehXHxdngs9A8dJ2i32+FIvs7vtCiA==
X-Received: by 10.98.144.86 with SMTP id a83mr28531791pfe.107.1480440028441;
	Tue, 29 Nov 2016 09:20:28 -0800 (PST)
Received: from ?IPv6:2601:646:8882:b8c:a19b:b7db:ed72:12bc?
	([2601:646:8882:b8c:a19b:b7db:ed72:12bc])
	by smtp.gmail.com with ESMTPSA id 1sm69071233pgp.1.2016.11.29.09.20.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Nov 2016 09:20:27 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <0fb9060b-1019-fb87-3559-ffe8eb46efc7@linux.intel.com>
Date: Tue, 29 Nov 2016 09:20:26 -0800
Message-Id: <F742B014-FEDB-42B9-83EF-BC9C2CA4F697@gmail.com>
References: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
	<cover.1480333940.git.alexander.kanavin@linux.intel.com>
	<25f83a1bf177dde8db32ac494b4f0a82839ffb43.1480333940.git.alexander.kanavin@linux.intel.com>
	<57D1D0A9-6C79-4556-A863-A6553364746E@gmail.com>
	<0fb9060b-1019-fb87-3559-ffe8eb46efc7@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
X-Mailer: Apple Mail (2.3251)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 06/18] cmake: update to 3.7.0
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
X-List-Received-Date: Tue, 29 Nov 2016 17:20:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Nov 29, 2016, at 6:01 AM, Alexander Kanavin =
<alexander.kanavin@linux.intel.com> wrote:
>=20
> On 11/29/2016 01:24 AM, Khem Raj wrote:
>>=20
>>> On Nov 28, 2016, at 5:34 AM, Alexander Kanavin =
<alexander.kanavin@linux.intel.com> wrote:
>>>=20
>>> License is still 3-clause BSD.
>>=20
>> OK. what triggered the checksum change then ?
>=20
> They added a contributor list to Copyright.txt (I'll trim the lines =
that are checksummed if that list will be constantly changing), and =
changed the header in cmake.h from
>=20
> =
/*=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>  CMake - Cross Platform Makefile Generator
>  Copyright 2000-2009 Kitware, Inc., Insight Software Consortium
>=20
>  Distributed under the OSI-approved BSD License (the "License");
>  see accompanying file Copyright.txt for details.
>=20
>  This software is distributed WITHOUT ANY WARRANTY; without even the
>  implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR =
PURPOSE.
>  See the License for more information.
> =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D*/
>=20
> to
>=20
> /* Distributed under the OSI-approved BSD 3-Clause License.  See =
accompanying
>   file Copyright.txt or https://cmake.org/licensing for details.  */
>=20

Thanks for sharing this. I think it will be good to make a note of it, =
maybe in commit msg itself.

> Alex
>=20


