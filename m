Return-Path: <marcel@ziswiler.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A12CA9EBD
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 12:10:35 +0000 (UTC)
Received: from mout.perfora.net (mout.perfora.net [74.208.4.197])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25715.1791720633160191815
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 05:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=marcel@ziswiler.com header.s=s1-ionos header.b=cd8S5aIl;
 spf=pass (domain: ziswiler.com, ip: 74.208.4.197, mailfrom: marcel@ziswiler.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziswiler.com;
	s=s1-ionos; t=1791720632; x=1792325432; i=marcel@ziswiler.com;
	bh=PMbVLErqMdDdXKoXLXkYTNWJUlhuibO8foqIYItkSsY=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=cd8S5aIlpVeCO4IWeH8PJ/6AGO/K67OGkGATWqScnn6njRMDp1Xexb5zDSFEl5Dx
	 D9zL/Q76lC7Y+w9je+LUxfUla3kfi6cZGHTZJr/bwwL7nR4UqOm0gY/rokEbErAHi
	 N4HYzWm6KqSqkpUlWu3e2O0oh10XfbjvxmVUEAD4usOG7QvqM2/EAWoCg3ZH4op86
	 HX64d+rxIBndVYO4v4AujUFnYmtY+tRAwGJ8m38bD3sjABv26DRF76Xyu+dKgvk7z
	 W40Yfld7yiDuYDhFnn9wNsQKBkQTKsCrRTtZsbVW6eJPDgeQMFa6qXSZKRuaIRJdE
	 aOqKdzD2nxYVUqFGRQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelay.perfora.net (mreueus002
 [74.208.114.78]) with ESMTPSA (Nemesis) id 0LptxZ-1wlTJA3b0R-00p7Ok; Sun, 11
 Oct 2026 14:10:32 +0200
Message-ID: <1d9ad4f09d0935af3cab63be654e8572e3a37694.camel@ziswiler.com>
Subject: Re: [OE-core] [PATCH 0/2] mesa 26.2.4 upgrade and gallivm llvm 23
 build fix
From: Marcel Ziswiler <marcel@ziswiler.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Richard Purdie	
 <richard.purdie@linuxfoundation.org>, Ross Burton <ross.burton@arm.com>, 
 Zoltan Boszormenyi	 <zboszor@gmail.com>, Deepesh Varatharajan
 <Deepesh.Varatharajan@windriver.com>,  Antoine Gouby
 <antoine.gouby@toradex.com>
Date: Sun, 11 Oct 2026 14:10:27 +0200
In-Reply-To: <CAMKF1sp_VNWppn=cDfFOh=DTSkeB_iJ0ZmmWqFc64+tTSmJ_Xw@mail.gmail.com>
References: <cover.1791224526.git.marcel.ziswiler@codethink.co.uk>
	 <51ce6c98f2f466092ba077da44f0232bbcc16366.camel@ziswiler.com>
	 <CAMKF1sp_VNWppn=cDfFOh=DTSkeB_iJ0ZmmWqFc64+tTSmJ_Xw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.0 (by Flathub.org) 
MIME-Version: 1.0
X-Provags-ID: V03:K1:5QmStjOCX1K6G+YjXzixQ+U9JMb3SZqTDLXbOjArZjehIuPJsxn
 0OjVJFlkfHujLcsGi1UsaZO2+4SwbqBOfiNP9FID21MbghS7J4DRTxIBr3yXbDfU++DgqEg
 RFRIWoR+r3UiNXEECjYGI/Mf/QEh54L46r6TDcV+A0y958DhaL2HXPU6Smg93c3iLk0e7yC
 DXBzpvAH6pKD+lK2O+PaA==
UI-OutboundReport: notjunk:1;M01:P0:Dv+CwzLzpuU=;Ooj50yeyUVKVXPl0vDYgKceLFnV
 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
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 12:10:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247576

On Sat, 2026-10-10 at 15:00 -0700, Khem Raj wrote:
>=20
> On Sat, Oct 10, 2026 at 1:00=E2=80=AFPM Marcel Ziswiler via lists.openemb=
edded.org
> <marcel=3Dziswiler.com@lists.openembedded.org> wrote:
> > On Mon, 2026-10-05 at 20:36 +0200, Marcel Ziswiler wrote:
> > > This series upgrades mesa to 26.2.4 and fixes a gallivm llvm 23 build=
 issue.
> > >=20
> > > Build tested on x86_64 and run tested on LicheePi 4A.
> >=20
> > Any comments anybody? Thanks!
>=20
> Looks ok. Its already staged
> in=C2=A0https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dm=
athieu/master-next

Ah, yes, indeed. I forgot that openembedded-core also maintains a master-ne=
xt staging area.

I now did a successful build of openembedded-core/master-next together with=
 my latest meta-riscv/th1520-
graphics-enablement branch, which also successfully ran on the LicheePi 4A.=
 Full logs are available on my pull-
request there:

https://github.com/riscv/meta-riscv/pull/707

Thanks!

> > Cheers
> >=20
> > Marcel
> >=20
> > > Marcel Ziswiler (2):
> > > =C2=A0 mesa,mesa-tools-native: upgrade 26.2.3 -> 26.2.4
> > > =C2=A0 mesa: gallivm llvm 23 build fix
> > >=20
> > > =C2=A0...uiltin_cpu_supports-for-avx2-detecti.patch |=C2=A0 2 +-
> > > =C2=A0...on-t-encode-build-path-into-binaries.patch |=C2=A0 2 +-
> > > =C2=A0...gallivm-adapt-for-JITLink-in-LLVM-23.patch | 51 ++++++++++++=
+++++++
> > > =C2=A0...sdetects-64bit-atomics-on-mips-clang.patch |=C2=A0 2 +-
> > > =C2=A0...er-jay-jay_ir.h-do-not-used-typed-en.patch |=C2=A0 2 +-
> > > =C2=A0...c-do-not-use-arm-fpu-instructions-if.patch |=C2=A0 2 +-
> > > =C2=A0meta/recipes-graphics/mesa/mesa.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 +-
> > > =C2=A07 files changed, 59 insertions(+), 7 deletions(-)
> > > =C2=A0create mode 100644 meta/recipes-graphics/mesa/files/0001-galliv=
m-adapt-for-JITLink-in-LLVM-23.patch
> >=20
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#247500): https://lists.openembedded.org/g/openembed=
ded-core/message/247500
> > Mute This Topic: https://lists.openembedded.org/mt/121599185/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

