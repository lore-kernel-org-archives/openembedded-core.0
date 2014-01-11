Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9AADC60EB8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2014 18:18:27 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id z2so788566wiv.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2014 10:18:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=zVmURcKbvU+n+cBdgbevSWLLLVMCowb5cjEtyTLApIM=;
	b=SG/3dTYMW8ZLvxjLk/j+JKSQH36Rn0tszXOnEnFAxSQPQVaal1OfqPiRp9u3A8mvbE
	ul3yLRMw77A4Q82XoIBZ5UeVkK2K3BVBImQV6sFNXn4Gxj6SZRTR5m52oqSEjq0z/EF6
	F20BzrzRiep4lkoudypJHzVKWXmV1d45F0L1q2hNS/1oR8lwJ1fbTWAZPqF7Hmk2PaFn
	16nMnAMVAMH6aCrzJ3LsfxUTIqksRBo+skG3W8P280goOUaRdXpTwnS3LsM+9l8LF76t
	UG4aG9B8NgGkoQAVHDG0xvCIoBt3aoxTLjjvlXK5C4VDtM872qUFn8RQUYcQ2p5ZVXIB
	tgLg==
X-Gm-Message-State: ALoCoQmYkgKlfb/fLntflnh9uSj3OGPI/bksxAUl12mwPj1pmVDgIQksrWDKRR5Ltrfz1hSfBYtw
X-Received: by 10.180.205.162 with SMTP id lh2mr8121948wic.57.1389464307433;
	Sat, 11 Jan 2014 10:18:27 -0800 (PST)
Received: from ?IPv6:2001:610:612::8565:97e6:4aaa:9490?
	([2001:610:612:0:8565:97e6:4aaa:9490])
	by mx.google.com with ESMTPSA id jw4sm7150441wjc.20.2014.01.11.10.18.26
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 11 Jan 2014 10:18:26 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAK18fxG3_D9kRoiWrPJsTQxN=EOZSx3Vue8288maf_rMGHOrvQ@mail.gmail.com>
Date: Sat, 11 Jan 2014 19:18:24 +0100
Message-Id: <175AE9EA-538B-4B3E-9693-65D8866F926B@dominion.thruhere.net>
References: <CAK18fxG3_D9kRoiWrPJsTQxN=EOZSx3Vue8288maf_rMGHOrvQ@mail.gmail.com>
To: Andrei Gherzan <andrei@gherzan.ro>
X-Mailer: Apple Mail (2.1827)
Cc: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: eglibc not buildable for on thumb2 only instructions
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
X-List-Received-Date: Sat, 11 Jan 2014 18:18:29 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 11 jan. 2014, om 17:25 heeft Andrei Gherzan <andrei@gherzan.ro> het =
volgende geschreven:

> Hello,
>=20
> I'm trying to build eglibc for a thumb2 only processor: here is the =
log http://pastebin.com/KgwtJYAC.
>=20
> I know Raj tried in the past this and I want to know if it makes sense =
to dig further into this or there is a known incompatibility in eglibc. =
I searched a in eglibc and they seem to have patches that add thumb2 =
support. So things, at least in theory, should work.

I built eglibc in thumb mode a while ago by accident using the =
meta-linaro-toolchain gcc, could you give that a try?

regards,

Koen=

