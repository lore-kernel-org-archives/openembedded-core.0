Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ABE5C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 09:23:18 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.6989.1643880196927329861
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 01:23:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=XZWURCWU;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from [10.88.0.104]
 (dslb-002-205-233-038.002.205.pools.vodafone-ip.de [2.205.233.38])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 7808E838B7;
	Thu,  3 Feb 2022 10:23:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643880194;
	bh=VVIhd5jGimioIux7VmLoKvJ7+cP0QuWtzM38wUvRr2A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XZWURCWUIEOm8wTmfENh2Wj3Re4bCJdO1ozQ58izdFYiHDZ44F0k2ASK1WGDUQUej
	 zl5nXn35g7kdCiDd4mHNv85sqkMnvopMfaDF0ETTVP+zx4Mi3g1O/6IQz6ama3bCdD
	 OTi3bihUBS3lpr6m6q3gZT0/Sm+c0igb0HQuMT9n5nBFIOeIm7Tb5gUTZ5+5jFkd5M
	 UZ0gUW3vkLoVByiqnVqKQBYz8I8A7Ee660wgFGVzuVVPL7+/kkkfG/jPQnaR181vcD
	 yZMTIUBkC14WGf+AWh9Ia9zJkSoWHFZrLFb3Go/t3u+OoJiXVoDA2HgF2+6MQPlY/d
	 NXkCIuK3fZlPg==
Message-ID: <0f220dee-4692-df7c-a9be-c8389e760246@denx.de>
Date: Thu, 3 Feb 2022 10:23:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 04/12] gstreamer1.0-plugins-bad: 1.18.5 -> 1.19.90
Content-Language: en-US
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Marek Vasut <marex@denx.de>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Alexander Kanavin <alex.kanavin@gmail.com>
References: <20220202134233.2091916-1-ch@denx.de>
 <20220202134233.2091916-5-ch@denx.de>
 <CANPvuR=E93iFh61EOqP=AacTiZUA_99drgWEs3xK8KYH1wQyfA@mail.gmail.com>
From: Claudius Heine <ch@denx.de>
Organization: Denx Software Engineering
In-Reply-To: 
 <CANPvuR=E93iFh61EOqP=AacTiZUA_99drgWEs3xK8KYH1wQyfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 09:23:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161269

On 2022-02-02 18:57, Jose Quaresma wrote:
> Hi,=C2=A0Claudius
>=20
> There are=C2=A0some new options on the gstreamer bad=C2=A0that=C2=A0are=
 not updated on=20
> this patch.
> more precisely what will be done to use the new gpl option ?

Hmm... I am not sure. `gpl` probably needs to be added because we=20
already have `faad` and others which require it. I will at least that in =
v2.

For all other features I am open to suggestions about which should be add=
ed.

regards,
Claudius

