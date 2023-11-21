Return-Path: <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95EDCC61D88
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 08:58:28 +0000 (UTC)
Subject: Re: [PATCH v8 3/8] image-combined-dbg: make this the default
To: openembedded-core@lists.openembedded.org
From: "Enguerrand de Ribaucourt" <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Originating-Location: FR (80.15.101.118)
X-Originating-Platform: Linux Firefox 119
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 21 Nov 2023 00:58:23 -0800
References: <DB5PR02MB10213E5FE440BEAB46DA58849EFB4A@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213E5FE440BEAB46DA58849EFB4A@DB5PR02MB10213.eurprd02.prod.outlook.com>
Message-ID: <31313.1700557103147600421@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 08:58:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190959

While the debug-only rootfs is not usable by itself, changing the way it's =
currently combined (from the doc) could produce unintended side effects.
Check out this post for explanations: https://lists.openembedded.org/g/open=
embedded-core/message/190490

