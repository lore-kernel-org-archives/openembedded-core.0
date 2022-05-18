Return-Path: <akash.hadke@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F467C433EF
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 09:46:15 +0000 (UTC)
Subject: Re: [poky][master][PATCH 1/3] cve_check.py: Add new method
 get_ignored_cves
To: openembedded-core@lists.openembedded.org
From: "akash hadke" <akash.hadke@kpit.com>
X-Originating-Location: =?utf-8?q?Dornstadt=2C_Baden-W=C3=BCrttemberg=2C_DE_?=
 =?utf-8?q?=28212=2E118=2E206=2E70=29?=
X-Originating-Platform: Linux Chrome 100
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 18 May 2022 02:46:15 -0700
References: 
 <722011c32a289bb9945a491e1f9b9e290e62c3ea.camel@linuxfoundation.org>
In-Reply-To: 
 <722011c32a289bb9945a491e1f9b9e290e62c3ea.camel@linuxfoundation.org>
Message-ID: <13088.1652867175060959086@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="QQadQNEgIe6qCbaNer80"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 09:46:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165794

--QQadQNEgIe6qCbaNer80
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

I tried modifying the cve-check.bbclass but did not able to get the solutio=
n for disabling the NVD data, because when we inherit cve-check it executes=
 the cve_check task that checks CVEs from NVD DB. So I am also not sure how=
 to disable it hence I used the separate bbclass.

--QQadQNEgIe6qCbaNer80
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,<br /><br />I tried modifying the cve-check.bbclass but did not =
able to get the solution for disabling the NVD data, because when we inheri=
t cve-check it executes the cve_check task that checks CVEs from NVD DB. So=
 I am also not sure how to disable it hence I used the separate bbclass.

--QQadQNEgIe6qCbaNer80--

