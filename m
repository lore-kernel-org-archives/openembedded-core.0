Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98D2AC4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 14:39:14 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.48690.1712932746832315690
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Apr 2024 07:39:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FwCO/+1S;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6EBDA20008;
	Fri, 12 Apr 2024 14:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712932744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h8z/5flVmkcxxhcMfZqKpm2u8JRVMl00f2P+hgsZEzQ=;
	b=FwCO/+1SHvQ86rn+uy1wQnI+0/Bp51YXHiiW/VGirKcYi8QCbB0/8Whr5mW7EQJGm0TxmS
	0CPBK6ipIFeSmgogIeO63r3cBbPxgs/3d0OdVJc1T9Hw/EU27pxk8byn3vClpmr2NkFkBe
	7WgbTtgJ/3QybXla51BwbkMNaHRHLAIZYfE4kAHSJ7/89fFCivjCsON6d3rb7k409h3if0
	qjQqZogLMGXGj6SGDbVT7W8U+eOfAXKvV1GOphRuNxZfkFoFwC8GICuIiY8vOyYTqh+kN6
	ZYRFiPsvxNP42NuV/uv9VcIIQ2HihbXhCIEHjSnLQFAS4mLzgL44SSUHuCsmPA==
Date: Fri, 12 Apr 2024 16:39:04 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Simone =?iso-8859-1?Q?Wei=DF?= <simone.p.weiss@posteo.com>
Cc: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 10/33] gnutls: upgrade 3.8.4 -> 3.8.5
Message-ID: <2024041214390494ce0c8b@mail.local>
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
 <1712646620-16608-10-git-send-email-wangmy@fujitsu.com>
 <202404100045092623c1a2@mail.local>
 <0175215d2582da11040d25cd9981531fbbddf237.camel@posteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0175215d2582da11040d25cd9981531fbbddf237.camel@posteo.net>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 14:39:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198170

On 11/04/2024 19:41:09+0000, Simone Wei� wrote:
> On Wed, 2024-04-10 at 02:45 +0200, Alexandre Belloni via
> lists.openembedded.org wrote:
> > Failed ptests:
> > {'gnutls': ['alerts',
> > ����������� 'cert-status',
> > ����������� 'ciphersuite-name',
> > ����������� 'dtls-etm',
> > ����������� 'dtls10-cert-key-exchange',
> > ����������� 'dtls12-cert-key-exchange',
> > ����������� 'keylog-env',
> > ����������� 'mini-chain-unsorted',
> > ����������� 'mini-record-failure',
> > ����������� 'mini-overhead',
> > ����������� 'mini-record',
> > ����������� 'mini-record-2',
> > ����������� 'record-retvals',
> > ����������� 'rehandshake-switch-cert',
> > ����������� 'rehandshake-switch-cert-allow',
> > ����������� 'rehandshake-switch-cert-client',
> > ����������� 'rehandshake-switch-cert-client-allow',
> > ����������� 'rsa-encrypt-decrypt',
> > ����������� 'rsa-psk',
> > ����������� 'rsa-psk-cb',
> > ����������� 'rsaes-pkcs1-v1_5',
> > ����������� 'tls-etm',
> > ����������� 'tls-force-etm',
> > ����������� 'tls-neg-ext4-key',
> > ����������� 'tls10-cert-key-exchange',
> > ����������� 'tls11-cert-key-exchange',
> > ����������� 'tls10-server-kx-neg',
> > ����������� 'tls12-anon-upgrade',
> > ����������� 'tls12-cert-key-exchange',
> > ����������� 'tls11-server-kx-neg',
> > ����������� 'tls12-server-kx-neg',
> > ����������� 'tls13-cert-key-exchange',
> > ����������� 'tls13-server-kx-neg',
> > ����������� 'version-checks']}
> > 
> > 
> Hi,
> 
> is there a autobuilder link to this? I tried it locally and all was fine.
> Would like to check it just to see if I can spot a difference. Or do you
> (Wang Mingyu) already check at the moment?

https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6489/steps/12/logs/stdio

https://autobuilder.yocto.io/pub/non-release/20240409-25/testresults/qemux86-64-ptest/gnutls.log

> 
> Best

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

