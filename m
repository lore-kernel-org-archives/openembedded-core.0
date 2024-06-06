Return-Path: <egyszeregy@freemail.hu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9378FC27C52
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 21:41:35 +0000 (UTC)
Subject: Re: Patchtest results for [PATCH] archiver.bbclass: Fix work-shared checking for kernel recipes
To: openembedded-core@lists.openembedded.org
From: "Livius" <egyszeregy@freemail.hu>
X-Originating-Location: Budapest, HU (80.98.74.198)
X-Originating-Platform: Windows Chrome 125
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 06 Jun 2024 14:41:28 -0700
References: <0101018fef5da2bb-20fddbbf-ef4e-4418-90d6-c2ec76ea132b-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018fef5da2bb-20fddbbf-ef4e-4418-90d6-c2ec76ea132b-000000@us-west-2.amazonses.com>
Message-ID: <8404.1717709883800685810@lists.openembedded.org>
X-Old-Date: Thu, 06 Jun 2024 14:38:03 -0700
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 21:41:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200419
Message-ID: <20240606214128.XeATRlnbvyunRdN3LfhuMAoAxFonIQt8LgFOH_mIYJ8@z>

When i apply and check my patch in my git bash console i have no any error =
about "malformed diff lines".

Livius@DESKTOP-LIVIUS MINGW64 /d/Bosch/openembedded-core (master)
$ git apply --check 0001-archiver.bbclass-Fix-work-shared-checking-for-kern=
el.patch

Livius@DESKTOP-LIVIUS MINGW64 /d/Bosch/openembedded-core (master)
$ git am 0001-archiver.bbclass-Fix-work-shared-checking-for-kernel.patch
Applying: archiver.bbclass: Fix work-shared checking for kernel recipes

