Return-Path: <lkml@jv-coder.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 031AAC433EF
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 14:43:21 +0000 (UTC)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 by mx.groups.io with SMTP id smtpd.web10.37394.1653921798991583675
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 07:43:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@jv-coder.de header.s=dkim header.b=mK/yI105;
 spf=pass (domain: jv-coder.de, ip: 5.9.79.73, mailfrom: lkml@jv-coder.de)
Received: from [10.40.94.2] (unknown [37.24.96.116])
	by mail.jv-coder.de (Postfix) with ESMTPSA id 535079F69D;
	Mon, 30 May 2022 14:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
	t=1653921795; bh=4nLhaykqajey8wx02GZ9qNdKpKNR9/Hw35qaOJsHI9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=mK/yI105XCY+SJqjY5JkOXQhAx3DfySZW+8UcbRVDIR6tx6fnmYSUxCJCHwK3tQDj
	 BcELVT1PhfnV2C7RlyHSAtbcfGENNQdK9ZwJItO1WOVad6WiuZd34uK16NZ7KFNoAr
	 +Rk+Xgr4X9dvh6kh+qdN2Ss/5mwxcjFmB57Dy6ew=
Message-ID: <ff1100eb-8f8e-5e64-0eeb-d0978d5756eb@jv-coder.de>
Date: Mon, 30 May 2022 16:43:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] [PATCH] libseccomp: Add missing files for ptests
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org,
 Joerg Vehlow <joerg.vehlow@aox.de>
References: <20220525092659.771559-1-lkml@jv-coder.de>
 <CAOSpxdZ6OyVH-FPQLi=t6Vp=airtau73oDg+-AKDQryNRADRxQ@mail.gmail.com>
From: Joerg Vehlow <lkml@jv-coder.de>
In-Reply-To: 
 <CAOSpxdZ6OyVH-FPQLi=t6Vp=airtau73oDg+-AKDQryNRADRxQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 14:43:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166287

Hi Steve,

Am 5/30/2022 um 4:35 PM schrieb Steve Sakoman:
> On Tue, May 24, 2022 at 11:27 PM J?rg Vehlow <lkml@jv-coder.de> wrote:
>>
>> From: Joerg Vehlow <joerg.vehlow@aox.de>
>>
>> pfc files are used e.g. in 38-basic-pfc_coverage.sh
>> valgrind_test.supp is required, when valgrind is installed, otherwise
>> all valgrind tests fail
> 
> Is this issue specific to 2.5.4 or does it also apply to the 2.5.3
> version in kirkstone?
I am pretty sure that depending on the configuration (e.g. valgrind
installed or bpf enabled), that these files are required in at least all
2.5 versions.
> 
> Thanks!
> 
> Steve

Joerg

