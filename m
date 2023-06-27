Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B707EB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 19:27:04 +0000 (UTC)
Subject: Re: [PATCH 3/3] vulkan-validation: Add the official Vulkan validation layers
To: openembedded-core@lists.openembedded.org
From: "Vincent Davis Jr" <vince@underview.tech>
X-Originating-Location: Richmond, Texas, US (99.113.4.128)
X-Originating-Platform: Linux Firefox 114
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 27 Jun 2023 12:26:55 -0700
References: <20230627171028.j6yianz4ppa4skff@amazon.com>
In-Reply-To: <20230627171028.j6yianz4ppa4skff@amazon.com>
Message-ID: <28192.1687894015480721156@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="LZuszAx0c8qcuSnWR3UM"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 19:27:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183499

--LZuszAx0c8qcuSnWR3UM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hey Jordan,

Yeah, the issue turned out to be a property set in SPIRV-ToolsTarget.cmake.=
 Commit bellow should explain
Although ${base_libdir} should of been ${baselib}.

https://lists.openembedded.org/g/openembedded-core/message/182445

Also, renamed recipe to vulkan-validation-layers. Let me know if you have i=
ssues everything
looks good in my setup.

https://lists.openembedded.org/g/openembedded-core/message/182446

--LZuszAx0c8qcuSnWR3UM
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hey Jordan,<br /><br />Yeah, the issue turned out to be a property set in S=
PIRV-ToolsTarget.cmake. Commit bellow should explain<br />Although ${base_l=
ibdir} should of been ${baselib}.<br /><br /><a href=3D"https://lists.opene=
mbedded.org/g/openembedded-core/message/182445" target=3D"_blank" rel=3D"no=
opener">https://lists.openembedded.org/g/openembedded-core/message/182445</=
a><br /><br />Also, renamed recipe to vulkan-validation-layers. Let me know=
 if you have issues everything<br />looks good in my setup.<br /><br /><a h=
ref=3D"https://lists.openembedded.org/g/openembedded-core/message/182446" t=
arget=3D"_blank" rel=3D"noopener">https://lists.openembedded.org/g/openembe=
dded-core/message/182446</a>

--LZuszAx0c8qcuSnWR3UM--

