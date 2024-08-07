Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA90CC3DA7F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 08:59:07 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.29047.1723021137997190696
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 01:58:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I/n1ebXn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-367940c57ddso841064f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 01:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1723021136; x=1723625936; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XxFELJo4ErxPYdK9n3lFzud58ExYu0f6kCkNAyfjlJs=;
        b=I/n1ebXnLqAE4GSpy/roB4UmjJD8rG+bBjybN5QElLFLBThiwsu/8xKyL/x3CUlAG8
         O84pNIbit0QYoDK5yZgh+XZoD9ASze6qNECjHL5eB+XC6SkcJ2VahnhOb+YE5FgEePtJ
         6sSrtnJMyJpgo+WeeCWeQ9We8PRiniCw/DVPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723021136; x=1723625936;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XxFELJo4ErxPYdK9n3lFzud58ExYu0f6kCkNAyfjlJs=;
        b=RnRKIb5mYzC0ad+MxxxYpx9DNJ7mtqwgBO6olVfNqo6Ht4wKFby0l3BkVVRDM9O0Dg
         ZGiRKXkf/XExCuWFJ+jeH1G7KDeABCDtF2ma/FVI6Gch/lDWiVkiMBpv3vRB8EatfCRU
         9QQn8xLLuiy0Z8rNBU1rZlkt8V4rlzZ/lIsiow8AQ/cARw6RVbVBiaY4k2Mb+zxQp/EY
         LuWMp1Lw+yMtlu/HSv6cRie/bGjQv9UN4A1tJBjj4lSlKMD/LaPJMTasFyCdvRzAvCm5
         aKOdFz2iz1Z0Ewz2hjmE4jdiGaUNX9nOYTzpe9kwBNfKP8aC27I4m31wDY4iHskgCv40
         ntRg==
X-Gm-Message-State: AOJu0YzL6CI85WepwTxv1eiTnF1EH7OUNcfCDznWt+tBsR4fQmJgMlxd
	5mTZ8n9sK/43M6FVv6qIPb51FlmzzuHP6ooUOqss4YLVb9nPVlHS7tFddC8gWPc=
X-Google-Smtp-Source: AGHT+IFt35pGetKb9AqCslB3AXWtwvti5mrvtptyssEaftX8QwQ8rPph8HZbW62kIh+DBcBm2/rbzg==
X-Received: by 2002:a5d:634a:0:b0:367:9851:4f22 with SMTP id ffacd0b85a97d-36bbc1d2ee9mr12277683f8f.58.1723021136004;
        Wed, 07 Aug 2024 01:58:56 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9764:5d75:6e2a:fa63? ([2001:8b0:aba:5f3c:9764:5d75:6e2a:fa63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd05b4c0sm15495294f8f.71.2024.08.07.01.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 01:58:55 -0700 (PDT)
Message-ID: <23faefd973c63f9b0ec8a735acb1ff1409776163.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/8][v2] linux-yocto: introduce v6.10
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 07 Aug 2024 09:58:54 +0100
In-Reply-To: <cover.1722970092.git.bruce.ashfield@gmail.com>
References: <cover.1722970092.git.bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 08:59:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203061

On Tue, 2024-08-06 at 14:55 -0400, bruce.ashfield@gmail.com wrote:
> Here's v2 of the patch series.
>=20
> In a similar manner to v1, I've got yocto/yocto-bsp patches along
> side the
> oe-core ones .. just to save us both some synchronization and
> juggling.
>=20
> =C2=A0- the 6.10.3 update contains kconfig changes to fixup some of the
> =C2=A0=C2=A0 warnings seen in v1
> =C2=A0- I've updated the parselogs exceptions to fix the issues with
> =C2=A0=C2=A0 qemumips*. I didn't run in directly on the AB, so there's a =
chance
> =C2=A0=C2=A0 these will need a tweak.
> =C2=A0- As discussed I've pinned genericarm64 to 6.6 until it is updated
> =C2=A0=C2=A0 to 6.10
> =C2=A0- meta-virt has been updated, so xen should be fine now
>=20
> =C2=A0- meta-arm/meta-agl will still need updates from their maintainers.

Thanks Bruce!

This did look better but there is a new issue that has appeared:

musl core-image-full-cmdline qemux86:
https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/9349

musl core-image-full-cmdline qemux86-64:
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/9361/step=
s/12/logs/stdio

sysvinit weston build:
https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/9334/step=
s/13/logs/stdio

and also arm and x86-64 selftests in weston:
https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/3695
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6988
https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/3695
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/7045
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/7053

all showing a traceback:

 8.163704] NFSD: Using /var/lib/nfs/v4recovery as the NFSv4 state recovery =
directory
[    8.166639] NFSD: Using legacy client tracking operations.
[    8.168227] NFSD: Using /var/lib/nfs/v4recovery as the NFSv4 state recov=
ery directory
[    8.170571] ------------[ cut here ]------------
[    8.171987] kernel BUG at /fs/nfsd/nfs4recover.c:534!
[    8.172757] Oops: invalid opcode: 0000 [#1] PREEMPT SMP PTI
[    8.173575] CPU: 1 PID: 386 Comm: rpc.nfsd Not tainted 6.10.3-yocto-stan=
dard #1
[    8.174587] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel=
-1.16.3-0-ga6ed6b701f0a-prebuilt.qemu.org 04/01/2014
[    8.177362] RIP: 0010:nfsd4_legacy_tracking_init+0x17e/0x1b0 [nfsd]
[    8.186979] Code: 89 de 48 c7 c7 f0 8e 51 c0 e8 3e fb ff ff 85 c0 41 89 =
c4 0f 85 2d 2d 00 00 48 c7 c7 90 bd 56 c0 45 31 e4 e8 d4 b7 08 c6 eb 08 <0f=
> 0b 41 bc f4 ff ff ff 48 8b 45 d8 65 48 2b 04 25 28 00 00 00 75
[    8.192013] RSP: 0018:ffffae1d40653ca0 EFLAGS: 00010286
[    8.193466] RAX: 0000000000000049 RBX: ffff9c2a82d94000 RCX: 00000000000=
00000
[    8.195370] RDX: 0000000000000000 RSI: 00000000ffffefff RDI: 00000000000=
00001
[    8.202191] RBP: ffffae1d40653cd0 R08: ffffffff870a7fa8 R09: 00000000fff=
ff000
[    8.210819]  ? do_error_trap+0x6c/0x90
[    8.204171] R13: ffffffff87663e80 R14: ffff9c2a82d94000 R15: ffff9c2a826=
c09c0
[    8.205187] FS:  00007f11b564a740(0000) GS:ffff9c2a8f880000(0000) knlGS:=
0000000000000000
[    8.206335] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    8.207169] CR2: 000055b21bf12048 CR3: 0000000004c86000 CR4: 00000000001=
506f0
[    8.208173] Call Trace:
[    8.208547]  <TASK>
[    8.208860]  ? __die_body.cold+0x19/0x1f
[    8.209437]  ? __die+0x2e/0x40
[    8.209885]  ? die+0x33/0x60
[    8.210317]  ? do_trap+0xbc/0x100
[    8.210819]  ? do_error_trap+0x6c/0x90
[    8.211364]  ? nfsd4_legacy_tracking_init+0x17e/0x1b0 [nfsd]
[    8.212404]  ? exc_invalid_op+0x56/0x70
[    8.213448]  ? nfsd4_legacy_tracking_init+0x17e/0x1b0 [nfsd]
[    8.221589]  ? asm_exc_invalid_op+0x1f/0x30
[    8.227504]  ? nfsd4_legacy_tracking_init+0x17e/0x1b0 [nfsd]
[    8.234183]  nfsd4_client_tracking_init+0x5b/0x1b0 [nfsd]
[    8.235550]  nfs4_state_start_net+0x2bf/0x360 [nfsd]
[    8.236281]  nfsd_svc+0x162/0x340 [nfsd]
[    8.237309]  write_threads+0xdb/0x1a0 [nfsd]
[    8.238547]  ? __pfx_write_threads+0x10/0x10 [nfsd]



Also, a preempt-rt build failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/9340/step=
s/34/logs/stdio

| /home/pokybuild/yocto-worker/qa-extras2/build/build/tmp/work-shared/qemux=
86-64/kernel-source/kernel/events/core.c: In function 'event_sched_out':
| /home/pokybuild/yocto-worker/qa-extras2/build/build/tmp/work-shared/qemux=
86-64/kernel-source/kernel/events/core.c:2286:20: error: 'struct perf_event=
' has no member named 'pending_sigtrap'; did you mean 'pending_irq'?
|  2286 |         if (event->pending_sigtrap) {
|       |                    ^~~~~~~~~~~~~~~
|       |                    pending_irq
| /home/pokybuild/yocto-worker/qa-extras2/build/build/tmp/work-shared/qemux=
86-64/kernel-source/kernel/events/core.c:2287:24: error: 'struct perf_event=
' has no member named 'pending_sigtrap'; did you mean 'pending_irq'?
|  2287 |                 event->pending_sigtrap =3D 0;
|       |                        ^~~~~~~~~~~~~~~
|       |                        pending_irq

meta-virt was showing config warnings:

https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/3471/ste=
ps/12/logs/stdio

And for completeness, as are meta-agl:

https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/3471/ste=
ps/12/logs/stdio

and meta-arm:

https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/5827

Cheers,

Richard



