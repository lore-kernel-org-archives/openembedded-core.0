Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E301BC433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 09:03:52 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.6859.1643879030990293326
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 01:03:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=YezN/lBE;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from [10.88.0.104]
 (dslb-002-205-233-038.002.205.pools.vodafone-ip.de [2.205.233.38])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 4111F8388D;
	Thu,  3 Feb 2022 10:03:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643879028;
	bh=G1FJXaqUcDVvLjZ78ZUDRD2/so9pckiHFVyllz11LQA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YezN/lBElnGWvLNyPUN3mq4xrI8ObPmOlZQZc+1ugtUAoNyqfEg+2jsFjp97m/jdm
	 QltswuHieeG3z0tdjON3WyeYtjcI5Gq/dztKEeW00iuueDIq3oMciFJXMyUZaCE0ui
	 fG7gLKIIfqr8SDwhdrUwM+ZWtgzuWAZgwRUAo9jhp6MC7vjqaHjC9Ye++NfUY5/kdi
	 uBPFHJ8NPmqrMX6hrHvNh3U0FpSOKAHWmOXi4V9I5dTLH2dM+3DTfnS5vhGVOWHrjZ
	 C9ccANlQXeqsd7TYZjZclI+qofeqn4nZUteUwjdvcf1XDRO194lrZYUqPKIehy+9Ok
	 D4CwTvZ/FbN7g==
Message-ID: <9c67feaf-d39e-1928-84bf-0f14eba29d1c@denx.de>
Date: Thu, 3 Feb 2022 10:03:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 02/12] gstreamer1.0-plugins-base: 1.18.5 -> 1.19.90
Content-Language: en-US
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Marek Vasut <marex@denx.de>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Alexander Kanavin <alex.kanavin@gmail.com>
References: <20220202134233.2091916-1-ch@denx.de>
 <20220202134233.2091916-3-ch@denx.de>
 <CANPvuRk4fdDOSsw27G5FWKXDO5D9btha79DKTcy8LRn8QDFxyQ@mail.gmail.com>
From: Claudius Heine <ch@denx.de>
Organization: Denx Software Engineering
In-Reply-To: 
 <CANPvuRk4fdDOSsw27G5FWKXDO5D9btha79DKTcy8LRn8QDFxyQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 09:03:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161267

Hi Jose,

On 2022-02-02 18:57, Jose Quaresma wrote:
[...]
>      =C2=A0SRC_URI =3D
>     "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins=
-base-${PV}.tar.xz
>     <https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins=
-base-$%7BPV%7D.tar.xz>
>     \
>                =20
>     file://0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patc=
h \
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-viv-fb-Make-=
sure-config.h-is-included.patch \
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-ssaparse-enh=
ance-SSA-text-lines-parsing.patch \
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-glimagesink-D=
ownrank-to-marginal.patch \
>=20
>=20
> Why is this patch dropped? As Far as I know it is not merged upstream.

Good catch! Thanks. Not sure why I dropped it. I will add a rebased=20
version to v2.

