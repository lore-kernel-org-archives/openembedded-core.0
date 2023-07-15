Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 732F9EB64DC
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 11:14:32 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.9945.1689419662275578879
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 04:14:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=BrRYS96Z;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 2379B84731;
	Sat, 15 Jul 2023 13:14:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1689419659;
	bh=iGZnDcmhwAlXQ3dTsCOS0APt80rJZEL3iivvehIfz2A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BrRYS96ZaH9Q7wB1P68Dc3Q55lxp7sR0WnZTrxdiAOQMvtXJRlGQaE7577Q2BxTu2
	 wXjJwfjkaK/v1ckZ3IIayenII4tHO6TScu+7bHz063UsJo56vqVf9/ssfEQ61Ci/m+
	 hr0En1tnMwJhMdSPHHpiqo1r53KJiV24lPzzSleJKhyigYwc1V23NX3GbISS1F5c7V
	 3/tpB9IAKR8se/hUlHxdz+/07xbnkkLKZzNnXriGOzG5ljqyG5dAiyFLbfvc7fYQnY
	 Bb4wvywSCoXbivpumWPIpDoR0Km31xrnQbFRaBKHBTtOeRKtFrPiOWFG/QPQ7XVxFB
	 9HygXyJmpVDxg==
Message-ID: <c851b7c8-892a-f592-56f1-a69bfa06c193@denx.de>
Date: Sat, 15 Jul 2023 13:14:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core] [PATCH 1/2] u-boot: Switch to nobranch=1
To: Alexander Kanavin <alex.kanavin@gmail.com>, Tom Rini <trini@konsulko.com>
Cc: Fabio Estevam <festevam@gmail.com>, Fabio Estevam <festevam@denx.de>,
 openembedded-core@lists.openembedded.org
References: <20230714161823.20685-1-festevam@gmail.com>
 <CANNYZj-8RV6tz_7kEH6uz=yZeyd=bPts6AoBqTd5DL3rGGu+yg@mail.gmail.com>
 <20230714213719.GX2066889@bill-the-cat>
 <CANNYZj8-vQbGEO3yMgRbk2j2L-XOc2EeG6=2w2GhFwUuZqD=mw@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CANNYZj8-vQbGEO3yMgRbk2j2L-XOc2EeG6=2w2GhFwUuZqD=mw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 11:14:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184310

On 7/15/23 06:56, Alexander Kanavin wrote:
> Then we=E2=80=99ll consider options, such as moving variable bits out o=
f .inc or
> introducing a variable that strips last number from PV. I would want to
> avoid recipes fetching from dangling branch-less commits in core. The
> commit being on a branch is a QA check by the fetcher.

What difference does it make whether the commit is in a branch or not ,=20
as long as it is referenced ?

