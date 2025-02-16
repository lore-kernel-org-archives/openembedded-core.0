Return-Path: <rogerio.borin@toradex.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30F70C02198
	for <webhook@archiver.kernel.org>; Sun, 16 Feb 2025 20:09:35 +0000 (UTC)
Subject: Re: Broken FIT image signing since "u-boot: kernel-fitimage: Fix dependency loop if UBOOT_SIGN_ENABLE and UBOOT_ENV enabled"
To: openembedded-core@lists.openembedded.org
From: "Rogerio Guerra Borin" <rogerio.borin@toradex.com>
X-Originating-Location: =?UTF-8?B?U8OjbyBQYXVsbywgU2FvIFBhdWxvLCBCUg==?= (189.33.122.79)
X-Originating-Platform: Linux Firefox 134
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 16 Feb 2025 12:09:31 -0800
References: <VcVL.1739730983448118565.i0SN@lists.openembedded.org>
In-Reply-To: <VcVL.1739730983448118565.i0SN@lists.openembedded.org>
Message-ID: <23568.1739736571143906971@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="EWRUTXq176zb3HUlWomA"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Feb 2025 20:09:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211508

--EWRUTXq176zb3HUlWomA
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

As a follow up, I performed some tests by reverting the d7bd9c627661 and I =
found that without that commit the behavior matches what I got on kirkstone=
 or, in other words, it matches the documented behavior.

--EWRUTXq176zb3HUlWomA
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>As a follow up, I performed some tests by reverting the d7bd9c627661 a=
nd I found that without that commit the behavior matches what I got on kirk=
stone or, in other words, it matches the documented behavior.</div>
<div>&nbsp;</div>

--EWRUTXq176zb3HUlWomA--

