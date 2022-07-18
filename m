Return-Path: <martin.beeger@online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA34C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 16:47:13 +0000 (UTC)
Subject: Re: [PATCH] cmake: read asm flags correctly from environment in
 toolchain file
To: openembedded-core@lists.openembedded.org
From: "Martin Beeger" <martin.beeger@online.de>
X-Originating-Location: Cologne, North Rhine-Westphalia, DE (194.8.217.178)
X-Originating-Platform: Linux Firefox 91
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 18 Jul 2022 09:47:10 -0700
References: <12b94281-a1c7-f847-a1f7-011669e5cde0@online.de>
In-Reply-To: <12b94281-a1c7-f847-a1f7-011669e5cde0@online.de>
Message-ID: <22536.1658162830175506094@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="385ghP4UrnUYrm3FkmsU"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 16:47:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168241

--385ghP4UrnUYrm3FkmsU
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I looked further, and the variable is misspelt and should be CMAKE_AS_FLAGS=
 to have any effect. Furthermore, it is not recommended to set it explicitl=
y, as cmake will initialize it to the correct default. If the toolchain fil=
e from open embedded in general contains ASFLGS, cmake wills et that as CMA=
KE_AS_FLAGS automatically and pass those parameters on.

This variable did not change this behaviour because it was spelt differentl=
y, although I assume the author intended to do that.
I would still suggest removing this variable. (as this patch does)

--385ghP4UrnUYrm3FkmsU
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I looked further, and the variable is misspelt and should be CMAKE_AS_FLAGS=
 to have any effect. Furthermore, it is not recommended to set it explicitl=
y, as cmake will initialize it to the correct default. If the toolchain fil=
e from open embedded in general contains ASFLGS, cmake wills et that as CMA=
KE_AS_FLAGS automatically and pass those parameters on.<br /><br />This var=
iable did not change this behaviour because it was spelt differently, altho=
ugh I assume the author intended to do that. <br />I would still suggest re=
moving this variable. (as this patch does)

--385ghP4UrnUYrm3FkmsU--

