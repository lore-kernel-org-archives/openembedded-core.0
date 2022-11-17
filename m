Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 493FDC433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 11:47:13 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web10.13477.1668685618060559323
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Nov 2022 03:47:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=I41l+wrD;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67, mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-2.intern.sigma-chemnitz.de (mail-mta-2.intern.sigma-chemnitz.de [192.168.12.70])
	by mail-out-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id 2AHBksZY065340
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 12:46:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1668685614;
	bh=GuOxdBDb4JT0mN2jCEF2XS/CvO5r774qceJFBj0M3G0=; l=1071;
	h=From:To:Cc:Subject:References:Date:In-Reply-To;
	b=I41l+wrD9kyDkRpwbSv4yt/LPF8EREENxeoTl5RcTLrHa0PQifmz+u65YT+LBkS74
	 h4ycb9/X82Un4krcAQoFRWoqViOnDn1GskkT9OYcBav5fVfJBB66xr5IHJq5TC+/sy
	 e9RWZUCpKe+Uf93jZhyeVnmyNmNjLlNKMml8Qjcfj94QivlV4Dz5xIAyvrwzF8Q/L0
	 XdBT063Lg6XzuJtAn7PV4mCEDoYpghc/mjQu27G9zGkUvJv0anCFC9nCavx5irBO2n
	 T8QI/OhsrdkBS66KBC/3VLavqRRbczK80yKzMwcOsUbaBrqMkVy8+gJYevm55yGKpA
	 HD23/84lcgIqw==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local [192.168.16.32])
	by mail-mta-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTP id 2AHBkq0d074668
	for <openembedded-core@lists.openembedded.org> from enrico.scholz@sigma-chemnitz.de; Thu, 17 Nov 2022 12:46:52 +0100
Received: from mail-msa-3.intern.sigma-chemnitz.de ([192.168.12.73])
	by reddoxx.intern.sigma-chemnitz.de with ESMTP
	id G8GJV8G6MX; Thu, 17 Nov 2022 12:46:52 +0100
Received: from ensc-pc.intern.sigma-chemnitz.de (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-3.intern.sigma-chemnitz.de (8.15.2/8.15.2) with ESMTPS id 2AHBkpea054707
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 17 Nov 2022 12:46:51 +0100
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.96)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1ovdM3-00DWO8-2d;
	Thu, 17 Nov 2022 12:46:51 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] sstate: show progress bar again
References: <20221116112425.2173010-1-enrico.scholz@sigma-chemnitz.de>
	<CANPvuR=SJ35jquRnLYmkBaZ=YjX-sVp9QLQGSMmU9qE996ei4g@mail.gmail.com>
Date: Thu, 17 Nov 2022 12:46:51 +0100
In-Reply-To: <CANPvuR=SJ35jquRnLYmkBaZ=YjX-sVp9QLQGSMmU9qE996ei4g@mail.gmail.com>
	(Jose Quaresma's message of "Wed, 16 Nov 2022 15:36:39 +0000")
Message-ID: <lya64phkgk.fsf@ensc-pc.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-REDDOXX-Id: 63761f2cc12256ade0c4b1a5
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 11:47:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173418

Jose Quaresma <quaresma.jose@gmail.com> writes:

>> Transition to ThreadPoolExecutor (eb6a6820928472ef194b963b606454e731f9486f)
>> broke he
>>
>> | Checking sstate mirror object availability: ...
>>
>> progress bar because the removed 'thread_worker' was still referenced
>> in an asynchronous function.  As the result of the future is never
>> read, the resulting backtrace is silently discarded.
>
> I have tested the patch at the time and the progress bar works as expected,
> maybe something breaks after that.

Probably, you saw only the full 100% bar produced by
'bb.event.ProcessFinished'

But the patch does

| -        def checkstatus(thread_worker, arg):
| +        def checkstatus(arg):
|  ...
|                  bb.event.fire(bb.event.ProcessProgress(msg, len(tasklist) - thread_worker.tasks.qsize()), d)

This will always raise an exception and 'bb.event.ProcessProgress' will
never be fired.


> Can the num_tasks_done be moved to there and call the first
> next(num_tasks_done) so we can remove the +1 on the ProcessProgress

I will send a v2



Enrico

