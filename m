Return-Path: <zhangjialing@loongson.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E123C77B7C
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 06:34:40 +0000 (UTC)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by mx.groups.io with SMTP id smtpd.web10.7780.1685514872291339525
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 23:34:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: loongson.cn, ip: 114.242.206.163, mailfrom: zhangjialing@loongson.cn)
Received: from loongson.cn (unknown [10.20.42.22])
	by gateway (Coremail) with SMTP id _____8Cxu+pz6nZks98CAA--.1988S3;
	Wed, 31 May 2023 14:34:28 +0800 (CST)
Received: from [10.20.42.22] (unknown [10.20.42.22])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dx97Vz6nZkvvCBAA--.14282S3;
	Wed, 31 May 2023 14:34:27 +0800 (CST)
Message-ID: <d3412267-bb01-0bad-9390-8ad36aa90715@loongson.cn>
Date: Wed, 31 May 2023 14:34:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [OE-core] [PATCH v4] Fixes pseudo build in loongarch64
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Mark Hatle <mark.hatle@kernel.crashing.org>
References: <20230530113302.1473632-1-zhangjialing@loongson.cn>
 <0570392a611b9b31ba3cf34300462849e4b37b88.camel@linuxfoundation.org>
From: =?UTF-8?B?5byg5a625bKt?= <zhangjialing@loongson.cn>
In-Reply-To: <0570392a611b9b31ba3cf34300462849e4b37b88.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dx97Vz6nZkvvCBAA--.14282S3
X-CM-SenderInfo: x2kd0wxmldzxtqj6z05rqj20fqof0/1tbiAQAIB2R154BmgAADsd
X-Coremail-Antispam: 1Uk129KBjvJXoW7Ww4rJrW7GFyfKw4UXF18Xwb_yoW8Gr17pF
	WfA3WY9an7Ja48Jrs5ua48Wwn2ka1xtr43WF13Kry7Zw43Jr1fJFn29rWftay7C34I9F4F
	qF1xJwsxKa4qyrJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
	IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487Mx
	AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
	Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwI
	xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8
	JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
	C2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7XTmDUUUU
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 06:34:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181991

Hi,

I'm sure in a loongarch64 glibc  don't  has these functions . We can 
find the libc.abilist file in the glibc  source code .

I found no __fxstat in loongarch

eg:```

➜  glibc git:(master) cat 
./sysdeps/unix/sysv/linux/x86_64/64/libc.abilist |grep __fx
GLIBC_2.2.5 __fxstat F
GLIBC_2.2.5 __fxstat64 F
GLIBC_2.4 __fxstatat F
GLIBC_2.4 __fxstatat64 F
➜  glibc git:(master) cat 
./sysdeps/unix/sysv/linux/loongarch/lp64/libc.abilist|grep __fx
```

在 2023/5/30 20:23, Richard Purdie 写道:
> On Tue, 2023-05-30 at 19:33 +0800, zhangjialing@loongson.cn wrote:
>> From: JiaLing Zhang <zhangjialing@loongson.cn>
>>
>> Fixes [YOCTO #15110]
>>
>> Some functions used in the project have been removed from glibc. After the removal of these functions,
>> the architecture in glibc will not include the removed functions.
>> This patch resolves the usage and compilation issues on the loongarch64 architecture
> Whilst this might make things compile, I'm not convinced this is right.
> I suspect that with this patch applied, you'd miss intercepting some
> function calls that need intercepting.
>
> As far as I can tell, the __fxstat64() function and friends should
> exist even on a new architecture like loongarch64. Are you sure these
> don't exist in a loongarch64 glibc?
>
> Cheers,
>
> Richard


