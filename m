Return-Path: <lkml@jv-coder.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D71F2C636D9
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:00 +0000 (UTC)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 by mx.groups.io with SMTP id smtpd.web11.29572.1649683955237425027
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 06:32:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@jv-coder.de
 header.s=dkim header.b=DvAAESOx;
 spf=pass (domain: jv-coder.de, ip: 5.9.79.73, mailfrom: lkml@jv-coder.de)
Received: from [192.168.178.40] (unknown [188.192.100.83])
	by mail.jv-coder.de (Postfix) with ESMTPSA id A7C8B9F694;
	Mon, 11 Apr 2022 13:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
	t=1649683951; bh=edNswfVpTp6N8zRoXrA8K8JQolIuFlmhP+DXzu/GNeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=DvAAESOxnc1xXBbYU0v/D+Uuo5nVkmDDAqhfR3wB2m7ekTxLiltH0NZLJ58qzsBZF
	 ZuupUvdPuIbJtY9cHzhcbw1bXvcH/DpPNSfNUgngx4oWwjj3eV/k5Mj51aOKhpe0Oj
	 2g4XsuFU9r/nAwHmaUw7V4YTwksuZIdEkdS4qUEE=
Message-ID: <f78f3ab8-9abd-463f-027b-91175ec23a2e@jv-coder.de>
Date: Mon, 11 Apr 2022 15:32:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH] go: Always pass interpreter to linker
Content-Language: en-US
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>, Joerg Vehlow <joerg.vehlow@aox.de>
References: <20220411123520.95107-1-lkml@jv-coder.de>
 <CANPvuRnKqQaanAZMVWym8K+t3sBm_noNNoCH=kV37RWtb8ncqw@mail.gmail.com>
From: Joerg Vehlow <lkml@jv-coder.de>
In-Reply-To: 
 <CANPvuRnKqQaanAZMVWym8K+t3sBm_noNNoCH=kV37RWtb8ncqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164226

Hi Jose,

Am 4/11/2022 um 3:30 PM schrieb Jose Quaresma:
>=20
>=20
> J?rg Vehlow <lkml@jv-coder.de <mailto:lkml@jv-coder.de>> escreveu no di=
a
> segunda, 11/04/2022 =C3=A0(s) 13:35:
>=20
>     From: Joerg Vehlow <joerg.vehlow@aox.de <mailto:joerg.vehlow@aox.de=
>>
>=20
>     When gos internal linker is used, it uses hardcoded paths to the
>     interpreter (dynamic linker). For x86_64 this hardcoded path is
>     /lib64/ld-linux-x86-64.so.2, but yocto's default dynamic linker pat=
h
>     is /lib64/ld-linux-x86-64.so.2.
>=20
>=20
> Is this correct? The first path is the seme one of the second.
Yes... of course this is wrong. /lib/ld-linux-x86-64.so.2 is the default
linker path for yocto on x86_64

Sorry about that

Joerg


