Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id F19C660167
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 02:38:56 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so259873104pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 19:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=WHredTlgg8SVoBsfneT/2nZQ3WO+afncipJzHdplgs0=;
	b=NQASXqcp+6kZ+kBNwYUNE86WQUukIB43URY2BHbSbxiFoPHO1Ab3QbcFUbiMGiI8uy
	PgBISVrSLJFu60/wk680bS4UA6K6Ks+fYhA5Z4t2ZbHxUbdgl+dUtYbIznTRvajsVbxs
	+lMlubcO4bdHLPFAg0NFqYr4Cb3AngFYeH3nW6HvingA9ZlSPJHaepL3LjEqfalZ4CWZ
	5igiphkTX0lLDcwX1oy1tN3hBVVHjIBs5iV1sePdKyls2LsMr+G6xZeqjPG72c7y3rLN
	N5mjePatRUSJ4AOOjU275/s9M1EbkyUivW8vnZyzEljAjR6v+Dgp9sXi7CcxvqY+wp6K
	oEmw==
X-Received: by 10.66.120.40 with SMTP id kz8mr43269113pab.86.1429670337601;
	Tue, 21 Apr 2015 19:38:57 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:7c97:9ba6:29ea:d43f?
	([2601:9:3580:84c:7c97:9ba6:29ea:d43f])
	by mx.google.com with ESMTPSA id ux6sm3417170pab.24.2015.04.21.19.38.56
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 21 Apr 2015 19:38:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <55370702.8030101@windriver.com>
Date: Tue, 21 Apr 2015 19:38:55 -0700
Message-Id: <E8F969A6-23A1-43F1-AF42-3F86DFA9B661@gmail.com>
References: <cover.1429669271.git.liezhi.yang@windriver.com>
	<d43affadb4b82b309b05f78efaecb7cb056e3502.1429669271.git.liezhi.yang@windriver.com>
	<0B9D4FD8-56E6-44B4-96E8-E283B6F12E98@gmail.com>
	<55370702.8030101@windriver.com>
To: Robert Yang <liezhi.yang@windriver.com>
X-Mailer: Apple Mail (2.2098)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] libunwind: don't use gold for mips
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
X-List-Received-Date: Wed, 22 Apr 2015 02:38:57 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


> On Apr 21, 2015, at 7:27 PM, Robert Yang <liezhi.yang@windriver.com> =
wrote:
>=20
>=20
>=20
> On 04/22/2015 10:24 AM, Khem Raj wrote:
>>=20
>>> On Apr 21, 2015, at 7:22 PM, Robert Yang <liezhi.yang@windriver.com> =
wrote:
>>>=20
>>> +# gold doesn't work for mips
>>> +LDFLAGS_mips_append =3D ""
>>> +LDFLAGS_mips64_append =3D ""
>>> +LDFLAGS_mips64n32_append =3D ""
>>>=20
>>=20
>> how about little-endian variants ?
>=20
> Maybe we'd better set _86 _ppc and _arm one by one, please ?

yes thats what I was alluding to=

