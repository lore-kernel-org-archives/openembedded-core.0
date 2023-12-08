Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 928B7C4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 10:26:52 +0000 (UTC)
Subject: Re: [PATCH 1/3] useradd: Fix issues with useradd dependencies
To: openembedded-core@lists.openembedded.org
From: "Jermain Horsman" <jermain.horsman@nedap.com>
X-Originating-Location: Groenlo, Gelderland, NL (149.3.168.10)
X-Originating-Platform: Windows Firefox 120
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 08 Dec 2023 02:26:50 -0800
References: <1560cc968f5f93a925cc3ba9436f13210dc4e4c5.1701952927.git.pidge@baylibre.com>
In-Reply-To: <1560cc968f5f93a925cc3ba9436f13210dc4e4c5.1701952927.git.pidge@baylibre.com>
Message-ID: <4651.1702031210098799379@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 10:26:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192036

> If recipe A requires the useradd actions of recipe B we need to
> ensure that recipe B is part of the recipe A dependancy chain. In
> order to do that, we introduce USERADD_DEPENDS. This makes sure
> that the do_populate_sysroot_setscene of recipe B exists for
> recipe A in case of a missing TMPDIR. This requires changes made in
> runqueue.py by RP.

I was wondering if all required changes including these would be considered=
 suitable to backport to e.g. kirkstone?
Or am I going to have to look forward to scarthgap for these :)

Sincerely,

Jermain

