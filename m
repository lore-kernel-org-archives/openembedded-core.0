Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id A8B207CF9C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 08:17:19 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id v14so2478857wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2019 01:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=aZeNA/ANBsKxHFCany+mHVj1x4AcvVqFm5VKGFbgUrs=;
	b=qpu2IHLAcbWzBXwyDsvH7XiTaOJH2zAvT4NpUywzyUDy7Hk86MA+WIl3jhKhVqZHTq
	dlbR7kZfW1By5mK3rgpgvO07WW1UURIn+91iiewXzmcdr6LDbBIrAP1wCCvqPmj3YLUT
	eu7oB1+dUotI6M1PpJDYE8DP7ZUPp7OJ4I2dvTHmbp+PYQ7SVFgF2vdBCe7li8rMHrO+
	of7NHMBF14oO9FyREcA9WQWF4hEmxPaUTU/mUhNxHW50uT1k1Ynanw1bH4I1XcxB0J0h
	4nmmzmSSFllQsX0tiAVqKoPanr6pLu+Y9ktYb7ViLJjw8eAbQtn39k1aApCpxs32bbNN
	ulhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=aZeNA/ANBsKxHFCany+mHVj1x4AcvVqFm5VKGFbgUrs=;
	b=gfhLStLPOj24h1UcYyyE7lbrOmyHwToO+/Ec2MV3sKC57O3T42J6Vwb+V+qH0hce5o
	O2+kp5MaAfU7Kqi/Yx+YS38C8PuuhFGebHRShIqh5Qih11cIhVhuf5f1hJBIqRT+u8o+
	gLShIXcsLG+sq70LnXQT4j60PbKdSrcWI46HMsQsNyG7/K6vCu35E0XaXqQW17J3sNgn
	chpFpreE+jr7XMNQ4mLim8MXdZMnO8XGKZ9Twn66o2DuSvBqNrvvDjBIl1H4HFxrUkXi
	rjuUgQrcq2K5Fs85gwbjK24IauYQR0c1Nd/nSjqi59395SzlbzrKnS/nFAGBgK6aOnep
	N1TQ==
X-Gm-Message-State: APjAAAXcy1SFYLCFWJlQWO0qHqVwdx4S91foTeste+P8uQPhrqMT4k1b
	B4DZAehuVWVW/X/j4qOvokNiKHvf
X-Google-Smtp-Source: APXvYqyUFBrExVc29upaO44srURrqShXGcZCu0uFVEudHJ5/ZSwZ3NbAakkSuHTnWiAfzqa1m506DQ==
X-Received: by 2002:a1c:c504:: with SMTP id v4mr2691959wmf.45.1554193040049;
	Tue, 02 Apr 2019 01:17:20 -0700 (PDT)
Received: from [10.128.45.74] ([141.113.67.87])
	by smtp.gmail.com with ESMTPSA id
	w18sm17936550wru.24.2019.04.02.01.17.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Apr 2019 01:17:19 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16D57)
In-Reply-To: <7cbdc5ba6d0647678b7a3d2906f87a31@bio-logic.net>
Date: Tue, 2 Apr 2019 10:17:18 +0200
Message-Id: <48E585E9-78F9-4074-AF65-34CA70DE5D96@gmail.com>
References: <cover.1554106752.git.xavier.berger@bio-logic.net>
	<CANNYZj_CKFRAg9WByRfD56tOiV8FW-VfS4KyEN2YAniAxhaAtA@mail.gmail.com>
	<7cbdc5ba6d0647678b7a3d2906f87a31@bio-logic.net>
To: Xavier Berger <xavier.berger@bio-logic.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PULL][PATCH 0/2] Implement debian packages GPG signing
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
X-List-Received-Date: Tue, 02 Apr 2019 08:17:19 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Yes, that is fine. Let me know if something is not clear in that test case.

Btw, the apt version we have is badly out of date (and has a significant sec=
urity issue I think) so if you can update that, that=E2=80=99d be awesome.

Alex

> On 2 Apr 2019, at 9.36, Xavier Berger <xavier.berger@bio-logic.net> wrote:=

>=20
> Hi Alexender,=20
>=20
> I'm working on test case but I've a lot of things to understand (and setup=
 to perform).
> I'm basically taking dnf as example and creating a test for apt. Please le=
t me know if you think my strategy is not correct.
>=20
> I'll let you know here when it will work.
>=20
> Xavier
>=20
> -----Original Message-----
> From: Alexander Kanavin <alex.kanavin@gmail.com>=20
> Sent: lundi 1 avril 2019 16:50
> To: Xavier Berger <xavier.berger@bio-logic.net>
> Cc: OE-core <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] [PULL][PATCH 0/2] Implement debian packages GPG sig=
ning
>=20
>> On Mon, 1 Apr 2019 at 15:57, Xavier Berger <xavier.berger@bio-logic.net> w=
rote:
>> Xavier Berger (2):
>>  gpg-sign: Add parameters to gpg signature function
>>  package_manager: sign DEB package feeds
>>=20
>> meta/lib/oe/gpg_sign.py        |  6 +++++-
>> meta/lib/oe/package_manager.py | 19 ++++++++++++++++---
>=20
> How do we make sure this does not regress? Can you add a test case similar=
 to one for rpm feed signing?
>=20
> Alex

