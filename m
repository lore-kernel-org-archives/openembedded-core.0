Return-Path: <jan.kircher@leica-microsystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE3B3C369B1
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 09:02:12 +0000 (UTC)
Subject: Proposal: skip debug builds of native packages
To: openembedded-core@lists.openembedded.org
From: "Jan Kircher" <jan.kircher@leica-microsystems.com>
X-Originating-Location: CH (147.161.138.203)
X-Originating-Platform: Windows Firefox 137
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 16 Apr 2025 02:02:11 -0700
Message-ID: <6xHT.1744794131155604566.Q0NW@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 09:02:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214982

Following the suggestion of Khem Raj after my issue with systemd-systemctl-=
native (https://lists.yoctoproject.org/g/poky/message/13589), I propose to =
not build debug versions of *-native packages when DEBUG_BUILD is enabled. =
At least for our use-case, building debug versions of native packages is un=
necessary. Please share your opinions.

Greetings,
Jan

