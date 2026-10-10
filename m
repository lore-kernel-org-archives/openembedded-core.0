Return-Path: <marcel@ziswiler.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8900ACA9EC1
	for <webhook@archiver.kernel.org>; Sat, 10 Oct 2026 20:00:54 +0000 (UTC)
Received: from mout.perfora.net (mout.perfora.net [74.208.4.194])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15433.1791662444927410250
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Oct 2026 13:00:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=marcel@ziswiler.com header.s=s1-ionos header.b=uQcSxqgG;
 spf=pass (domain: ziswiler.com, ip: 74.208.4.194, mailfrom: marcel@ziswiler.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziswiler.com;
	s=s1-ionos; t=1791662443; x=1792267243; i=marcel@ziswiler.com;
	bh=rPUnoJH+N7MUNjA1GCvAxk5paHi9S2sJ/9AaOuWbUmM=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=uQcSxqgGtrkp4wl/ra1EVEzEfEGeJ6/vAQ1n7NVxXlWP8S+jSoqpITcrf8G1C+cl
	 3dkVk/PJSCureK/dChFi1hviX3+Zmz2hVuSSKtc/9tce31GJ8lHFZxYL80DWASTzs
	 hZypjVDPmQYbTwqvWTfw5ymwR3wg5H8nWW/Xpk6GysXtJF3QCw86eeQg0VTYgnCno
	 KdH6CWSLQNJ5KsRnn3C0jWphE33Hux6lqlV9Ikz8BCBmcE6zwhKNqmJtrpmgaWx2B
	 TmYKTRyY3eBTf2XToq0Dok9rUK7svJJrercC8dgrVxgWNlSU7njnscxZKF1QYw1o4
	 vlwxa5npzRxKXhvZNg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelay.perfora.net (mreueus003
 [74.208.114.78]) with ESMTPSA (Nemesis) id 0MaHgk-1wvtR5139M-00SSFa; Sat, 10
 Oct 2026 22:00:43 +0200
Message-ID: <51ce6c98f2f466092ba077da44f0232bbcc16366.camel@ziswiler.com>
Subject: Re: [PATCH 0/2] mesa 26.2.4 upgrade and gallivm llvm 23 build fix
From: Marcel Ziswiler <marcel@ziswiler.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Ross Burton	
 <ross.burton@arm.com>, Khem Raj <raj.khem@gmail.com>, Zoltan Boszormenyi	
 <zboszor@gmail.com>, Deepesh Varatharajan
 <Deepesh.Varatharajan@windriver.com>,  Antoine Gouby
 <antoine.gouby@toradex.com>
Date: Sat, 10 Oct 2026 22:00:39 +0200
In-Reply-To: <cover.1791224526.git.marcel.ziswiler@codethink.co.uk>
References: <cover.1791224526.git.marcel.ziswiler@codethink.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.0 (by Flathub.org) 
MIME-Version: 1.0
X-Provags-ID: V03:K1:KBl33YIsIozNy0B8WANfElEbo4CV+gl7O939qxQFapSsWoA8Xhq
 Ctd0yyLJR/Ruu7Vo9PxWB3IFyFFYoam8nHFNKs6qhm1T0aVx6AxHvWOjiH3CZbqx82lvqxY
 H1PA5jtN80LgvAsOkcacDRGU3MnDcsCT/edUPq41BJUNjG+gvb8k4yMzOi5/SM4XgRP3aPo
 JjTCbcuCe3S5SVW4nQX6Q==
UI-OutboundReport: notjunk:1;M01:P0:ME+AsTtEGDE=;KdywWcWDN+dZ6eD/zwcLAzbIBaL
 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
 BJjL7f1e/IETPZPkKMHoKD1J
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Oct 2026 20:00:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247500

On Mon, 2026-10-05 at 20:36 +0200, Marcel Ziswiler wrote:
> This series upgrades mesa to 26.2.4 and fixes a gallivm llvm 23 build iss=
ue.
>=20
> Build tested on x86_64 and run tested on LicheePi 4A.

Any comments anybody? Thanks!

Cheers

Marcel

> Marcel Ziswiler (2):
> =C2=A0 mesa,mesa-tools-native: upgrade 26.2.3 -> 26.2.4
> =C2=A0 mesa: gallivm llvm 23 build fix
>=20
> =C2=A0...uiltin_cpu_supports-for-avx2-detecti.patch |=C2=A0 2 +-
> =C2=A0...on-t-encode-build-path-into-binaries.patch |=C2=A0 2 +-
> =C2=A0...gallivm-adapt-for-JITLink-in-LLVM-23.patch | 51 ++++++++++++++++=
+++
> =C2=A0...sdetects-64bit-atomics-on-mips-clang.patch |=C2=A0 2 +-
> =C2=A0...er-jay-jay_ir.h-do-not-used-typed-en.patch |=C2=A0 2 +-
> =C2=A0...c-do-not-use-arm-fpu-instructions-if.patch |=C2=A0 2 +-
> =C2=A0meta/recipes-graphics/mesa/mesa.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 +-
> =C2=A07 files changed, 59 insertions(+), 7 deletions(-)
> =C2=A0create mode 100644 meta/recipes-graphics/mesa/files/0001-gallivm-ad=
apt-for-JITLink-in-LLVM-23.patch

