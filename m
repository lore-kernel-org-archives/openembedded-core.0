Return-Path: <emil.kronborg@protonmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87C54C54E58
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 15:52:59 +0000 (UTC)
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
 by mx.groups.io with SMTP id smtpd.web11.11626.1711209175705645565
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Mar 2024 08:52:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@protonmail.com header.s=protonmail3 header.b=bMe4iPdy;
 spf=pass (domain: protonmail.com, ip: 185.70.40.134, mailfrom: emil.kronborg@protonmail.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1711209173; x=1711468373;
	bh=LeY5ZMDHGHn13GXmzCxc6rWuQK4ewxMuhBmBoP/hCrc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=bMe4iPdy+oQPsHZvGD0UIjqFkVPmLrDOmWlfZUz7PMnouswax8isHJlebqdUFdbug
	 PumYHvJiWyM+orgU4VokF2LYzZS4isXyzzvGcioyhF2qi/1iyBVmDiV2kE7Vseh+gU
	 ekaT62kxamkIrGIH12MMIWcGwgEF6sj+WEHp+zuooXf3uv3mhqyw47F79ShdS9eOEb
	 ycREso2psrN0Huf1dzBRikvY4CGi/5SZDabc0xT//cHByP/EOljGTIaSucwHP5cKYA
	 3QdvCnx60/8Gny6Ol5Z7G1D08yLSYhTZn1ipIbdv9AeIBLrnTb4zrLmOWj3btgWusO
	 vPWB1ziGl44iQ==
Date: Sat, 23 Mar 2024 15:52:38 +0000
To: Ross Burton <Ross.Burton@arm.com>
From: Emil Kronborg <emil.kronborg@protonmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, "rasmus.villemoes@prevas.dk" <rasmus.villemoes@prevas.dk>
Subject: Re: [OE-core] [PATCH v2] pypi.bbclass: remove vendor from CVE_PRODUCT
Message-ID: <hihzpxlb4u43fcgdrmznu2ecraskzge7e7imv744ywx5uflvr7@zv2ski5dh4lt>
In-Reply-To: <9310D06F-A46C-4AE7-B2F8-947562735CAC@arm.com>
References: <20240320160459.227582-1-emil.kronborg@protonmail.com> <9310D06F-A46C-4AE7-B2F8-947562735CAC@arm.com>
Feedback-ID: 20949900:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Mar 2024 15:52:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197455

On Thu, Mar 21, 2024 at 17:16 +0000, Ross Burton wrote:
> Have you got comparison reports for a world run before and after this cha=
nge so we can see what the difference is?

No. After setting CVE_PRODUCT for around 5 python-* recipes, I noticed
a pattern, which led me to pypi.bbclass. Here, I saw that the product is
hardcoded to 'python', and thought it would be easier (and more correct)
to fix it in a single place instead of multiple recipes.

--=20
Emil Kronborg


