Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D0FC001B0
	for <webhook@archiver.kernel.org>; Sun, 16 Jul 2023 01:01:51 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.9316.1689469306211700258
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 18:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=jLy/qM3G;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 5DC99862A8;
	Sun, 16 Jul 2023 03:01:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1689469304;
	bh=OTGNALJ7D/Hup33HGK77i7o8XJ2BrkvIYx4VwT8F5Bc=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=jLy/qM3GzwO9lNVN6R5CApPVHvmtXUfo2/tWCP2Rrgkwj1KW2TSkBVg06+WEj9c5x
	 wUfk361YKFQCdQT/gWaY3WtIfgG1y24s7DWPdvK2wqvtODe8h8z8ZTU5KADFFp2hdp
	 ROc7aCZTLGUllLAWp6T61ARww/XIJ+ou0t+NYl63RQXEuRj3kjI7iKj1hal/o21ma4
	 U++hC65OuTWoFaXLGMzSOvvfzU9OyuFvX4vWpBX0iO9ehJ/9ntkoR9kCuVkKapsV8H
	 amNy8gK9FBeKpHwlUbRJJMQMd5MKPAyY/MtY3tJY63xu318S7RTzjuobvvBMFTkDg+
	 E1bJb0UfkMLrQ==
Message-ID: <a8148cd0-46f0-2f52-10cd-d90747179a33@denx.de>
Date: Sun, 16 Jul 2023 03:01:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Marek Vasut <marex@denx.de>
Subject: Re: [OE-core] [PATCH 1/2] u-boot: Switch to nobranch=1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>, Fabio Estevam <festevam@denx.de>,
 Tom Rini <trini@konsulko.com>, openembedded-core@lists.openembedded.org
References: <20230714161823.20685-1-festevam@gmail.com>
 <CANNYZj-8RV6tz_7kEH6uz=yZeyd=bPts6AoBqTd5DL3rGGu+yg@mail.gmail.com>
 <20230714213719.GX2066889@bill-the-cat>
 <CANNYZj8-vQbGEO3yMgRbk2j2L-XOc2EeG6=2w2GhFwUuZqD=mw@mail.gmail.com>
 <c851b7c8-892a-f592-56f1-a69bfa06c193@denx.de>
 <CANNYZj9o5B7y2yFYtHfwhv=KYk74+ZWqC-kuysP2qRY6ifhMeQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CANNYZj9o5B7y2yFYtHfwhv=KYk74+ZWqC-kuysP2qRY6ifhMeQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Jul 2023 01:01:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184410

On 7/15/23 15:00, Alexander Kanavin wrote:
> If you don=E2=80=99t list which branch a commit is on, it may be not in=
 a branch at
> all

That itself is not a problem as long as the commit is referenced, right?

> and not intended for downstream consumption

We do know that specific U-Boot commit is intended for consumption.

>, or on a private or
> personal branch which is also not intended for private consumption.

This is also not applicable here.

> Requiring to name the branch guards us from either possibility, and mea=
ns I
> do not have to go and check that manually or trust you blindly.

This protection is really weak, this check fails on every single=20
possibly bogus commit which is already on any random branch, so what is=20
the gain here really ?

