Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53845C3DA7F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 18:19:41 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.40499.1723054771440351366
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 11:19:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hOw3fUXe;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7a1d6f4714bso12132585a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 11:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723054770; x=1723659570; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B57UG4koi5DoychMhLazbQMWmqry2kpPjlzfKMe8hmI=;
        b=hOw3fUXehQi+Nrw6OiO15iEdp6Z/Si0oHxRTcj0fYFSWhYuLbd392+YYwqtnsPGF/1
         M4eeK5H8lhhmSzWxUFZFNCx+Z8gZNZyJfKpNiyERHs+CUVlbJ+54vwFL2bWys/bPO7dv
         cPZVN9E3DyvrGHoJINjmPG72kLGwH4GJcbZe3+fdjoD+abwSnvPTUX6s2FCrCJ26hlLn
         iP//WsVVRZfpjXbsNVXQGZnDP9yYx5wC3Xk2Z3owSuiDtKx5GyJYdVlcpgum7sRBhiZc
         sIXsS9UUer1WZ9X7lfbtLk+hAAqNGmGWUDIzv3HrUkgUE9vhJ2I96Kdakx7W81W76GZ7
         7+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723054770; x=1723659570;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B57UG4koi5DoychMhLazbQMWmqry2kpPjlzfKMe8hmI=;
        b=sUAjm3JSQKkQ0ZVxCtTEupFhAMQD+n+mvQ7FLsJX7WK8+P1gnnSJ/OQf/57PMXTHuB
         XgvX/a4c1GkqO3puvZ0tkrhGWFMtTEjM3mLVomYPHUAdSCRMabI5GhMZl0S8h1khpjCF
         MCZaVRpX1Jjva94XrbYUrE3k0iCwAkVLa04tbh/wlN0sonpafPk9hjPm0ShIX2elIQL1
         6OyDfS3xtpYNGM/PDW7aJaii2OMaa0GB+WZdZl7cOVkzyxEuOMwnmGZLVmLpJDNtd6CU
         fKCeYWLnr29bRhSVBsoxppapjXoxuNpB7cd848a226jgcvL9SkLYTgC+9nXCcpfECA4g
         nqKg==
X-Gm-Message-State: AOJu0YwP/kmsRHq64M17XdlIbubzdIFmn1fwHIviGJX1WUNSbmamzRbM
	OEtW+YugsAjVUdlLiWE1mktbsMmvItk1IVPe1zhIGJO3zGE9hqlvwwmZT+Yb
X-Google-Smtp-Source: AGHT+IGKmvR2w4r3xYd8zMgX6GPWuQRBXchnigTuH2TvSQ/iWVyER+ibIAYmu5Cdy/iTzyE72lJ/oQ==
X-Received: by 2002:a05:620a:4588:b0:7a1:e49b:9461 with SMTP id af79cd13be357-7a377c368f0mr562714085a.26.1723054770172;
        Wed, 07 Aug 2024 11:19:30 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a3786c1c3fsm82244485a.113.2024.08.07.11.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 11:19:29 -0700 (PDT)
Date: Wed, 7 Aug 2024 14:19:28 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/8][v2] linux-yocto: introduce v6.10
Message-ID: <ZrO6sO2w1MmiEonE@gmail.com>
References: <cover.1722970092.git.bruce.ashfield@gmail.com>
 <23faefd973c63f9b0ec8a735acb1ff1409776163.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23faefd973c63f9b0ec8a735acb1ff1409776163.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 18:19:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203095

In message: Re: [PATCH 0/8][v2] linux-yocto: introduce v6.10
on 07/08/2024 Richard Purdie wrote:

> On Tue, 2024-08-06 at 14:55 -0400, bruce.ashfield@gmail.com wrote:
> > Here's v2 of the patch series.
> > 
> > In a similar manner to v1, I've got yocto/yocto-bsp patches along
> > side the
> > oe-core ones .. just to save us both some synchronization and
> > juggling.
> > 
> > �- the 6.10.3 update contains kconfig changes to fixup some of the
> > �� warnings seen in v1
> > �- I've updated the parselogs exceptions to fix the issues with
> > �� qemumips*. I didn't run in directly on the AB, so there's a chance
> > �� these will need a tweak.
> > �- As discussed I've pinned genericarm64 to 6.6 until it is updated
> > �� to 6.10
> > �- meta-virt has been updated, so xen should be fine now
> > 
> > �- meta-arm/meta-agl will still need updates from their maintainers.
> 
> Thanks Bruce!
> 
> This did look better but there is a new issue that has appeared:
> 
> musl core-image-full-cmdline qemux86:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/9349
> 
> musl core-image-full-cmdline qemux86-64:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/9361/steps/12/logs/stdio
> 
> sysvinit weston build:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/9334/steps/13/logs/stdio
> 
> and also arm and x86-64 selftests in weston:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/3695
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6988
> https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/3695
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/7045
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/7053
> 
> all showing a traceback:
> 
>  8.163704] NFSD: Using /var/lib/nfs/v4recovery as the NFSv4 state recovery directory
> [    8.166639] NFSD: Using legacy client tracking operations.
> [    8.168227] NFSD: Using /var/lib/nfs/v4recovery as the NFSv4 state recovery directory
> [    8.170571] ------------[ cut here ]------------
> [    8.171987] kernel BUG at /fs/nfsd/nfs4recover.c:534!
> [    8.172757] Oops: invalid opcode: 0000 [#1] PREEMPT SMP PTI
> [    8.173575] CPU: 1 PID: 386 Comm: rpc.nfsd Not tainted 6.10.3-yocto-standard #1
> [    8.174587] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.3-0-ga6ed6b701f0a-prebuilt.qemu.org 04/01/2014
> [    8.177362] RIP: 0010:nfsd4_legacy_tracking_init+0x17e/0x1b0 [nfsd]
> [    8.186979] Code: 89 de 48 c7 c7 f0 8e 51 c0 e8 3e fb ff ff 85 c0 41 89 c4 0f 85 2d 2d 00 00 48 c7 c7 90 bd 56 c0 45 31 e4 e8 d4 b7 08 c6 eb 08 <0f> 0b 41 bc f4 ff ff ff 48 8b 45 d8 65 48 2b 04 25 28 00 00 00 75
> [    8.192013] RSP: 0018:ffffae1d40653ca0 EFLAGS: 00010286
> [    8.193466] RAX: 0000000000000049 RBX: ffff9c2a82d94000 RCX: 0000000000000000
> [    8.195370] RDX: 0000000000000000 RSI: 00000000ffffefff RDI: 0000000000000001
> [    8.202191] RBP: ffffae1d40653cd0 R08: ffffffff870a7fa8 R09: 00000000fffff000
> [    8.210819]  ? do_error_trap+0x6c/0x90
> [    8.204171] R13: ffffffff87663e80 R14: ffff9c2a82d94000 R15: ffff9c2a826c09c0
> [    8.205187] FS:  00007f11b564a740(0000) GS:ffff9c2a8f880000(0000) knlGS:0000000000000000
> [    8.206335] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    8.207169] CR2: 000055b21bf12048 CR3: 0000000004c86000 CR4: 00000000001506f0
> [    8.208173] Call Trace:
> [    8.208547]  <TASK>
> [    8.208860]  ? __die_body.cold+0x19/0x1f
> [    8.209437]  ? __die+0x2e/0x40
> [    8.209885]  ? die+0x33/0x60
> [    8.210317]  ? do_trap+0xbc/0x100
> [    8.210819]  ? do_error_trap+0x6c/0x90
> [    8.211364]  ? nfsd4_legacy_tracking_init+0x17e/0x1b0 [nfsd]
> [    8.212404]  ? exc_invalid_op+0x56/0x70
> [    8.213448]  ? nfsd4_legacy_tracking_init+0x17e/0x1b0 [nfsd]
> [    8.221589]  ? asm_exc_invalid_op+0x1f/0x30
> [    8.227504]  ? nfsd4_legacy_tracking_init+0x17e/0x1b0 [nfsd]
> [    8.234183]  nfsd4_client_tracking_init+0x5b/0x1b0 [nfsd]
> [    8.235550]  nfs4_state_start_net+0x2bf/0x360 [nfsd]
> [    8.236281]  nfsd_svc+0x162/0x340 [nfsd]
> [    8.237309]  write_threads+0xdb/0x1a0 [nfsd]
> [    8.238547]  ? __pfx_write_threads+0x10/0x10 [nfsd]

I'm not sure what is going on with these traps, I'm not able to reproduce
them locally. It must be something in 6.10.3, I'll keep trying to see it
here.

.. but, it also may be something else weird in the build, see below.

> 
> 
> 
> Also, a preempt-rt build failure:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/9340/steps/34/logs/stdio
> 
> | /home/pokybuild/yocto-worker/qa-extras2/build/build/tmp/work-shared/qemux86-64/kernel-source/kernel/events/core.c: In function 'event_sched_out':
> | /home/pokybuild/yocto-worker/qa-extras2/build/build/tmp/work-shared/qemux86-64/kernel-source/kernel/events/core.c:2286:20: error: 'struct perf_event' has no member named 'pending_sigtrap'; did you mean 'pending_irq'?
> |  2286 |         if (event->pending_sigtrap) {
> |       |                    ^~~~~~~~~~~~~~~
> |       |                    pending_irq
> | /home/pokybuild/yocto-worker/qa-extras2/build/build/tmp/work-shared/qemux86-64/kernel-source/kernel/events/core.c:2287:24: error: 'struct perf_event' has no member named 'pending_sigtrap'; did you mean 'pending_irq'?
> |  2287 |                 event->pending_sigtrap = 0;
> |       |                        ^~~~~~~~~~~~~~~
> |       |                        pending_irq
> 

This is fixed.


> meta-virt was showing config warnings:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/3471/steps/12/logs/stdio

This one should be impossible if building my 6.10.3 latest. I removed the
option that is throwing that warning on June 22nd.

Is there anyway that I can find the checked out linux-yocto recipe and see
what meta SRCREV it was using ?

I'm wondering if this mix and match is somehow showing that trap that I'm
not able to reproduce.

Bruce

> 
> And for completeness, as are meta-agl:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/3471/steps/12/logs/stdio
> 
> and meta-arm:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/5827
> 
> Cheers,
> 
> Richard
> 
> 

