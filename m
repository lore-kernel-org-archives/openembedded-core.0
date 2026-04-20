Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB0CF557E8
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 08:44:33 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15482.1776674671136897396
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 01:44:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=uun4JI5F;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A5BD4C5C987
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 08:45:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D75645FFA5;
	Mon, 20 Apr 2026 08:44:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D734C10460BFA;
	Mon, 20 Apr 2026 10:44:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776674668; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=EdWfaDtOshVjksv+nBbeNRth7KttSgrzdq5X26jwxtk=;
	b=uun4JI5F9ktzBTotBWG6xv8SvMPWLCn2YF3ycoT+eqUnrdGQZzA0qg/um64QcXkVXScePk
	vug00q/R7835qeh9RHEYK1nhXC1NEWxocZ5v3+21hyH8TLDHl3U1WlMc9SQ2sxc7JDQGXD
	U0miVIuWP2zMVkQqxkbzpF5SEd/umNWjdEG39268VZykwMH4xCcWjwXcdGkLDVtsPF8DBC
	iX+ljHe3F9lJ/pafwWI1KEpMsoCtQG9gj+Tph3+s81DsMdavOkDGPjaLtCK8TD3MFaohNQ
	4bfld+AS1OVdXQ22XSEcfWoSv4qngMMHN2pKVKTTBjwGsnxTgJyGWmoV7stz4g==
Message-ID: <af76f008-c484-450f-8c6a-955d4957a173@bootlin.com>
Date: Mon, 20 Apr 2026 10:44:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][scarthgap 00/11] Patch review
To: openembedded-core@lists.openembedded.org
References: <cover.1774824253.git.yoann.congal@smile.fr>
Content-Language: en-US, fr
Cc: Yoann Congal <yoann.congal@smile.fr>
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <cover.1774824253.git.yoann.congal@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 08:44:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235556

Hello, Yoan


On 3/30/26 00:46, Yoann Congal via lists.openembedded.org wrote:
> Please review this set of changes for scarthgap and have comments back =
by
> end of day Tuesday, March 31.
>=20
> Passed a-full on autobuilder:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3546
> Note: This particular build had a gnutls patch that I removed because i=
t needed a small change[0].
> Build (currently running) without the gnutls patch: https://autobuilder=
.yoctoproject.org/valkyrie/#/builders/29/builds/3551
>=20
> [0]: https://lore.kernel.org/openembedded-core/DHFLXG1K82R7.3EOQRZ2H6KW=
8Q@smile.fr/T/#t
>=20
> The following changes since commit 41597b5260fb5ca811d0fb4ae7e65246d617=
34eb:
>=20
>    Revert "scripts/install-buildtools: Update to 5.0.16" (2026-03-26 09=
:48:20 +0000)
>=20
> are available in the Git repository at:
>=20
>    https://git.openembedded.org/openembedded-core-contrib stable/scarth=
gap-nut
>    https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstab=
le/scarthgap-nut
>=20
> for you to fetch changes up to e6f3b2e043259650d80fb6f761797c5cf5587eb5=
:
>=20
>    python3-pyopenssl: Fix CVE-2026-27459 (2026-03-30 00:09:38 +0200)
>=20
> ----------------------------------------------------------------
>=20
> Jo=C3=A3o Marcos Costa (Schneider Electric) (1):
>    spdx: add option to include only compiled sources
>=20
> Martin Jansa (3):
>    dtc: backport fix for build with glibc-2.43
>    elfutils: don't add -Werror to avoid discarded-qualifiers
>    binutils: backport patch to fix build with glibc-2.43 on host
>=20
> Michael Halstead (2):
>    yocto-uninative: Update to 5.0 for needed patchelf updates
>    yocto-uninative: Update to 5.1 for glibc 2.43
>=20
> Nguyen Dat Tho (1):
>    python3-cryptography: Fix CVE-2026-26007
>=20
> Paul Barker (1):
>    tzdata,tzcode-native: Upgrade 2025b -> 2025c
>=20
> Richard Purdie (1):
>    pseudo: Add fix for glibc 2.43
>=20
> Vijay Anusuri (2):
>    python3-pyopenssl: Fix CVE-2026-27448
>    python3-pyopenssl: Fix CVE-2026-27459
(...)

Was the commit below not picked, or am I missing something?

commit b24d5cda19136fb8120154279eedd55d162b4640
Author: Jo=C3=A3o Marcos Costa (Schneider Electric)=20
<joaomarcos.costa@bootlin.com>
Date:   Fri Apr 3 11:32:30 2026 +0200

     linux-yocto/6.6: update CVE exclusions (6.6.123)

     This new version of cve-exclusion_6.6.inc was generated with oe-core=
's
     latest version of the generate-cve-exclusions.py.

     Regarding the database used and how this file was generated:

     Generated at 2026-04-03 09:30:32.247568+00:00 for kernel version=20
6.6.123
     From cvelistV5 cve_2026-04-03_0700Z

     The backporting of the generate-cve-exclusions.py script from master=
 to
     Scarthgap is handled in a different patch.

     Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric)=20
<joaomarcos.costa@bootlin.com>

However, I see the commit below, prior to this one, was kept:

linux/generate-cve-exclusions: backport script from master branch

I'm not really used to the backports schedule/workflow, so please excuse=20
me if I misinterpreted something.

Thanks!

--=20
Best regards,
Jo=C3=A3o Marcos Costa

