Return-Path: <akash.hadke@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC65C43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 11:21:39 +0000 (UTC)
Subject: Re: [poky][master][kirkstone][PATCH] cve-check.bbclass: Add anonymous
 function to get patched CVEs from recipe
To: openembedded-core@lists.openembedded.org
From: "akash hadke" <akash.hadke@kpit.com>
X-Originating-Location: =?utf-8?q?Dornstadt=2C_Baden-W=C3=BCrttemberg=2C_DE_?=
 =?utf-8?q?=28212=2E118=2E206=2E70=29?=
X-Originating-Platform: Linux Chrome 102
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 12 Jul 2022 04:21:31 -0700
References: <A70DCBA1-F769-485C-AE06-F71A5C85A2B5@arm.com>
In-Reply-To: <A70DCBA1-F769-485C-AE06-F71A5C85A2B5@arm.com>
Message-ID: <15370.1657624891584790233@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="6XUumrNaqUFuwucdd4XY"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 11:21:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167921

--6XUumrNaqUFuwucdd4XY
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Ross,
We can inherit cve-check by default in the configuration to export CVE info=
rmation like CVE_PRODUCT, CVE_VERSION and the newly added variable CVE_PATC=
HED. And CVE_CHECK_WITH_DB variable will avoid scanning the CVEs from DB
It will work like 2 operational mode for cve-check.bbclass

--6XUumrNaqUFuwucdd4XY
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Ross,<span style=3D"white-space: pre-wrap;"><br /></span>We can inher=
it cve-check by default in the configuration to export CVE information like=
 CVE_PRODUCT, CVE_VERSION and the newly added variable CVE_PATCHED. And&nbs=
p;<span style=3D"white-space: pre-wrap;">CVE_CHECK_WITH_DB variable will av=
oid scanning the CVEs from DB</span><br />It will work like 2 operational m=
ode for cve-check.bbclass

--6XUumrNaqUFuwucdd4XY--

