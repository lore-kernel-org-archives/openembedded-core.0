Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47534C44512
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 06:40:54 +0000 (UTC)
Subject: Re: [PATCH v2 2/3] module.bbclass/make-mod-scripts: inhibit default dependencies
To: openembedded-core@lists.openembedded.org
From: "mark.yang" <mark.yang@lge.com>
X-Originating-Location: Gangseo-gu, Seoul, KR (27.122.242.71)
X-Originating-Platform: Windows Chrome 150
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 15 Jul 2026 23:40:50 -0700
References: <20260714132642.2225115-1-mark.yang@lge.com> <20260714132642.2225115-3-mark.yang@lge.com> <DJZ434ABE440.139ZCYRQH7UM9@bootlin.com> <DJZ6XMICUYAK.1U6TMONPZO9YJ@bootlin.com>
In-Reply-To: <DJZ6XMICUYAK.1U6TMONPZO9YJ@bootlin.com>
Message-ID: <743437.1784184050660443153@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="waoWCNg47itl5WJfJIlT"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 06:40:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241060

--waoWCNg47itl5WJfJIlT
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

Thanks for testing the series and for the follow-up.

I tried to reproduce this on current master (c2bd43b373) with the
three patches applied, and the test passes here:

RESULTS - bbtests.BitbakeTests.test_non_gplv3: PASSED (184.91s)

Looking at the failure itself, I don't think patch 2/3 can trigger it.

Happy to dig further if your retest still point

Thanks,
Mark

--waoWCNg47itl5WJfJIlT
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Mathieu,<br /><br />Thanks for testing the series and for the follo=
w-up.<br /><br />I tried to reproduce this on current master (c2bd43b373) w=
ith the<br />three patches applied, and the test passes here:<br /><br />&n=
bsp; RESULTS - bbtests.BitbakeTests.test_non_gplv3: PASSED (184.91s)<br /><=
br />Looking at the failure itself, I don't think patch 2/3 can trigger it.=
<br /><br />Happy to dig further if your retest still point<br /><br />Than=
ks,<br />Mark</div>

--waoWCNg47itl5WJfJIlT--

