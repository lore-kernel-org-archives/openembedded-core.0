Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2DB4C7318D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 14:29:17 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id u188so3131782wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 06:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=s+npBhvICRd57XbCxRDlBd3uLwcLdP3CtL4K3ylYlPE=;
	b=1YHwRVQq/MnU8z7oKYHwlrvsjJaNYHl6GI9YQ7rxoXfxXpne4DSGK9jmJl0qiU+B/k
	M1C875F6PvWQQgQmg6o+hrE5uf3nJzGlcN+EWcAVWunTsv2Fxxx2vQJf6YkNhHKpmJcz
	51PMEQaKnMl5nqsp8qEgwwDznCU9aKQtZSpkZlhqw2Joz47w7Cz8FP7Jl9zc2M4ucLxB
	hib2VaW9l1j6I4/C06dCT0qfWF+ZiUfmDMlDKe9n98GVBntzk483bSsAkObsmRl08xVx
	GSl7S7AJRy4Qg2FK7sfkam7c2CoAFedoV7+8+4/YWI4unvWSme/EKVh5D22SKeYP2h98
	kqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=s+npBhvICRd57XbCxRDlBd3uLwcLdP3CtL4K3ylYlPE=;
	b=mHY+A7vnVriFzBXKXZ+uthye6ZJ641SI9RoxuHUTm9gDTRa8tiRbk1pUMDFOn4+Bpl
	bK+cd3OclNjG/DtL+qVLyZl6Kpq7idgPOKNx9WuCx0ihj7rfHERF+dLFQaaA85OkLRiv
	jKz28Ple64LX1fReVXw2itlM31iP3nPQ9BFyEzT6F+EIuPiQ1N3oyuUZA182od9BALQj
	XQmiSSwB0OGg9gaHhjZg4/ed5M6uZZHQKASatV9DbbMzHNftt3KODQyxQUIUat1U7WDf
	WIkxXCJp0ufN2pyk7F7hALqZ8ezDeyuzkqXG+lGJ3CeNaZmq9jhTOyh5vvSt694wuBHb
	A/cg==
X-Gm-Message-State: AG10YORKpFFKu7Bdb3GAR6RgJy8haVKiMxAQuxdz020LIXDGw4Fy7udg4068l4K6Y66pYg==
X-Received: by 10.28.210.143 with SMTP id j137mr3667781wmg.13.1452868157380;
	Fri, 15 Jan 2016 06:29:17 -0800 (PST)
Received: from ?IPv6:2001:610:612::28ea:c3eb:9e03:177b?
	([2001:610:612:0:28ea:c3eb:9e03:177b])
	by smtp.gmail.com with ESMTPSA id w1sm2797235wmd.2.2016.01.15.06.29.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 15 Jan 2016 06:29:16 -0800 (PST)
Mime-Version: 1.0 (1.0)
From: Koen Kooi <koen@dominion.thruhere.net>
X-Mailer: iPhone Mail (13C75)
In-Reply-To: <56990180.9080407@dresearch-fe.de>
Date: Fri, 15 Jan 2016 15:29:15 +0100
Message-Id: <6AFD6AF0-3B94-44BB-BAA0-30EBB9747193@dominion.thruhere.net>
References: <5698E002.5090800@dresearch-fe.de>
	<1452863169.28375.161.camel@linuxfoundation.org>
	<5698F31E.1020905@dresearch-fe.de>
	<56990180.9080407@dresearch-fe.de>
To: Steffen Sledz <sledz@dresearch-fe.de>
Cc: Christopher Larson <clarson@kergoth.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: fido -> jethro switching problem
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
X-List-Received-Date: Fri, 15 Jan 2016 14:29:19 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> Op 15 jan. 2016 om 15:26 heeft Steffen Sledz <sledz@dresearch-fe.de> het v=
olgende geschreven:
>=20
>> On 15.01.2016 14:24, Steffen Sledz wrote:
>> And I made another interesting discovery: The exception appears on certai=
n machine types only, e.g with qemuarm it appears, with qemuarm64 or qemux86=
 not.
>=20
> It seems that all machines based on armv5e are affected.

FWIW, I'm seeing the same problem. The last time it happened it was due to t=
he fixup angstrom does for broken arm BSPs


>=20
> --=20
> DResearch Fahrzeugelektronik GmbH
> Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
> Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
> Fax: +49 30 515932-299
> Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
> Amtsgericht Berlin Charlottenburg; HRB 130120 B;
> Ust.-IDNr. DE273952058

