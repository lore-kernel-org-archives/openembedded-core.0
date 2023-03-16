Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD903C6FD19
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 14:29:57 +0000 (UTC)
Subject: Re: [PATCH] run-postinsts: Set dependency for ldconfig to avoid boot issues
To: openembedded-core@lists.openembedded.org
From: "Jermain Horsman" <jermain.horsman@nedap.com>
X-Originating-Location: Groenlo, Gelderland, NL (87.249.123.12)
X-Originating-Platform: Windows Firefox 111
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 16 Mar 2023 07:29:50 -0700
References: <16ac69d2-948a-5598-f404-c2093840e2cf@bootlin.com>
In-Reply-To: <16ac69d2-948a-5598-f404-c2093840e2cf@bootlin.com>
Message-ID: <22728.1678976990196867066@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 14:29:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178706

I actually ran across this issue myself and was wondering what the status i=
s.=20
Since it seems the patch is not included yet, but I've tested it on our sys=
tems and it does seem to prevent the issue.
Unless I've missed another fix/patch someplace else that makes this one red=
undant.

About the "After=3D" discussion, "After" should only affect the ordering of=
 jobs that are scheduled, but not actually start any by itself.
Therefore it should be fairly save to include this patch.

Sincerely,

Jermain Horsman

