Return-Path: <akash.hadke@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4992C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 07:54:17 +0000 (UTC)
Subject: Re: [poky][master][kirkstone][PATCH] cve-check.bbclass: Add anonymous
 function to get patched CVEs from recipe
To: openembedded-core@lists.openembedded.org
From: "akash hadke" <akash.hadke@kpit.com>
X-Originating-Location: =?utf-8?q?Dornstadt=2C_Baden-W=C3=BCrttemberg=2C_DE_?=
 =?utf-8?q?=28212=2E118=2E206=2E70=29?=
X-Originating-Platform: Linux Chrome 102
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 19 Jul 2022 00:54:12 -0700
References: <AAE95E75-469F-4C53-8922-CE8FD80701CD@arm.com>
In-Reply-To: <AAE95E75-469F-4C53-8922-CE8FD80701CD@arm.com>
Message-ID: <11682.1658217252298072413@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="PkgyLGhcMeYpi25gzCzX"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Jul 2022 07:54:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168275

--PkgyLGhcMeYpi25gzCzX
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Actually, I wanted to get all patched CVE numbers from a recipe in one vari=
able, and the value of that variable will be used in other tasks. And for t=
his purpose, I used the anonymous function because without it I will not be=
 able to get the value of CVE_PATCHED in other tasks.

--PkgyLGhcMeYpi25gzCzX
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Actually, I wanted to get all patched CVE numbers from a recipe in one vari=
able, and the value of that variable will be used in other tasks. And for t=
his purpose, I used the anonymous function because without it I will not be=
 able to get the value of CVE_PATCHED in other tasks.

--PkgyLGhcMeYpi25gzCzX--

