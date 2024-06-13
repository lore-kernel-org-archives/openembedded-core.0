Return-Path: <egyszeregy@freemail.hu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48320C27C4F
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 13:54:13 +0000 (UTC)
Subject: Re: [PATCH] archiver.bbclass: Fix work-shared checking for kernel recipes
To: openembedded-core@lists.openembedded.org
From: "Livius" <egyszeregy@freemail.hu>
X-Originating-Location: =?UTF-8?B?U3R1dHRnYXJ0LCBCYWRlbi1Xw7xydHRlbWJlcmcsIERF?= (194.39.218.19)
X-Originating-Platform: Windows Chrome 125
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 13 Jun 2024 06:54:04 -0700
References: <CANPvuRm4b5+=LiKksGny0TOU=MigiHzh81FYpuGQUfmM4MifGA@mail.gmail.com>
In-Reply-To: <CANPvuRm4b5+=LiKksGny0TOU=MigiHzh81FYpuGQUfmM4MifGA@mail.gmail.com>
Message-ID: <30741.1718286844774043564@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 13:54:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200602

I also tested, it works nicely for symbolic link sources (it returns the re=
al path). As we see the best to use os.path.realpath() to check the source =
path in is_work_shared() function.
I will send a V2 patch soon to get it in the code.

