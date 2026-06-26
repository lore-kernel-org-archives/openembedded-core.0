Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26535C43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 15:26:08 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37524.1782487565244040612
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 08:26:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=viIFc/s5;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49241dbf9c1so9657385e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 08:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782487563; x=1783092363; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7tbhzwOigAxoR12g77YLW6+wlo6QFeuG8EKNDq5Zv8=;
        b=viIFc/s5RywVWpVv34JLeaVDcAAZPZ2hubJfXPoL/nWKbdLIsqy/PyPm0MbyOsilte
         VXJKW7bnqYBhN4AOfAQ6Bf86biEiwrfSirD5NVCOGmwfmWxjT6hHLOWj5EuKqEnAKJOb
         LvUoUmhf3y2MFckwFyCth+guGpvmzOJHle/Nw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782487563; x=1783092363;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A7tbhzwOigAxoR12g77YLW6+wlo6QFeuG8EKNDq5Zv8=;
        b=dK8Px1lxNj3PsbPyxEgcMwtrvYCULKuDpeKA7iiu8BcBLlRTZsTE4bTBo0l0QI4S4q
         P3wjel7oI6OuOCYB/tLlSby6/sVc/TLcfdNdDMRYD/MXsd6rtzjEv0cWMyR3MG6hKH9u
         8JhHvMz+QJ/7VU7ouKMCw3lf8LOoJfxywkOg35CjkbLz/tCVwNIhi9rhwpEp1Fm6k8YU
         HHdbZVYbIw4EgypGMc7/4Yrb5tYMSWN3U5dLbJkzOLT6UIp2wW1rujeey5zk2HOa171i
         zgltfD1+fljY+b6/RzwFLA+4QWJmuqYMXPGgGjgWANwlLAt+YuksfkCdtFwaXpJl0mNC
         vJFw==
X-Gm-Message-State: AOJu0Yxp+yXOHmnsA54+pj2yN8pd0o5UkJaRNnDGem6NIQSi0mYgQKfA
	P9WcMn7QnMXXVhXT8DXq3pd2twMG/CTgYMBJ6WdESSA1Ut7vDs42TrFeFiPAJos3BFA=
X-Gm-Gg: AfdE7cmwd/FTMz8UfsirXna5h9DqeSUnIPI5rnyXeEfVSJsepVjc+1FijAOGQ6YFKaS
	iOPQxIAm/Bglo4U+KJhl5HYzadOrHTtYYOJJu990BLWFwIxQQLMlrF0u/u6HKmnvnmjTDrq2Agb
	KzU65K3gUS4f5F3XdQtDlX+vgCIBLSfSaIJ//42qleqG5+Yei6Ro4BTfUi7w+q2NLse9S69GO8X
	OS3tA3HTxCs1y+BfBxXuAMRTW0gN1zKVCGRrYhH83ydFj/2QUfQ75qV272583jXMRju6bbcUtZZ
	9gJ7lQNaYKLp+9l7aQU8VHUuAXEd5K43j3z5AHmWLEl8QOFhDAeCF5KqEuWBBaEskHBKEhZIdbx
	E3V3N770m4HzGOb+f9IRCeT6ds2JkrBAFTXRyiy2iSPjqQ3pMx7z5e/yosYT4Kn/K61yK/5SrHb
	hQP1WP1W7dy3LO5EmD7kmmXAfRiPzl3cSE/9qFWZ60AN+vssmSAvTIVNlNa5boEn3nLJH0I0ZU4
	+iXbpFieQcNkSM2
X-Received: by 2002:a05:600d:8499:10b0:490:e196:6574 with SMTP id 5b1f17b1804b1-49266864b4cmr84503165e9.13.1782487563378;
        Fri, 26 Jun 2026 08:26:03 -0700 (PDT)
Received: from localhost (2a01cb001331aa00dc663d106f146c8c.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:dc66:3d10:6f14:6c8c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49268ff1be9sm86541655e9.8.2026.06.26.08.26.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 08:26:03 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Jun 2026 17:26:02 +0200
Message-Id: <DJJ33TR36YJC.24WW5E1PX60Z2@smile.fr>
Subject: Re: [PATCH RFC 0/3] RFC: Fixing rust segfault (#16058) to support
 Ubuntu 26.04 on Scarthgap
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>, <ccasciato@21sw.us>,
 <paul@pbarker.dev>, <randy.macleod@windriver.com>, <ross.burton@arm.com>,
 <sundeep.kokkonda@windriver.com>, <SunilKumar.Dora@windriver.com>,
 "Alexander Kanavin" <alex@linutronix.de>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
X-Mailer: aerc 0.20.0
References: <20260626-ycongal-scarthgap-rust-segfault-v1-0-97df64b7b298@smile.fr> <CANNYZj81E4G9gSBPHNNsxg4JiJ_wEnmCoSkNdQ2bzJBjF5q=DA@mail.gmail.com>
In-Reply-To: <CANNYZj81E4G9gSBPHNNsxg4JiJ_wEnmCoSkNdQ2bzJBjF5q=DA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 15:26:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239650

On Fri Jun 26, 2026 at 4:57 PM CEST, Alexander Kanavin wrote:
> On Fri, 26 Jun 2026 at 13:38, Yoann Congal <yoann.congal@smile.fr> wrote:
>> I've hacked the backport until it passes testing:
>> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4085
>> ... but I'm really *NOT* sure this is the right approach. Hence this RFC
>> with the patches I ended-up with.
>>
>> If anyone could check/review/improve these patches to help me get them
>> to a mergable state, that'd be nice. Otherwise, I would have no other
>> choice than never support Ubuntu 26.04 on Scarthgap.
>
> I had a quick look, and they're basically ok.
>
> The key check is to run ldd on the rust-native pieces and confirm that
> they indeed start linking libLLVM*so dynamically after the patches (if
> it comes from rust-llvm, it's probably named differently). E.g. on my
> master build:
>
> alex@Zen2:/srv/storage/alex/yocto/build-64-alt$ ldd
> tmp/sysroots-components/x86_64/rust-native/usr/lib/librustc_driver-5e2c75=
e9f7705310.so
>     linux-vdso.so.1 (0x00007f8f929d0000)
>     libLLVM.so.22.1 =3D> not found
>     libstdc++.so.6 =3D> /lib/x86_64-linux-gnu/libstdc++.so.6 (0x00007f8f8=
ca00000)
>
> alex@Zen2:/srv/storage/alex/yocto/build-64-alt$ ldd
> tmp/sysroots-components/x86_64/rust-native/usr/bin/rustc
>     linux-vdso.so.1 (0x00007f3eee009000)
>     librustc_driver-5e2c75e9f7705310.so =3D>
> /srv/storage/alex/yocto/build-64-alt/tmp/sysroots-components/x86_64/rust-=
native/usr/bin/../lib/librustc_driver-5e2c75e9f7705310.so
> (0x00007f3ee8400000)
>     libc.so.6 =3D> /lib/x86_64-linux-gnu/libc.so.6 (0x00007f3ee820c000)
>     libLLVM.so.22.1 =3D> not found
>     libstdc++.so.6 =3D> /lib/x86_64-linux-gnu/libstdc++.so.6 (0x00007f3ee=
7e00000)

Ok! So that looks good, because with the patches I get:
$ ldd tmp/sysroots-components/x86_64/rust-native/usr/bin/rustc
	linux-vdso.so.1 (0x00007ffc06548000)
	librustc_driver-686d20105d1a2cf7.so =3D> $BUILD/tmp/sysroots-components/x8=
6_64/rust-native/usr/bin/../lib/librustc_driver-686d20105d1a2cf7.so (0x0000=
7fcec0a00000)
	libstd-64729a5a222c378b.so =3D> $BUILD/tmp/sysroots-components/x86_64/rust=
-native/usr/bin/../lib/libstd-64729a5a222c378b.so (0x00007fcec08c0000)
	libc.so.6 =3D> /lib/x86_64-linux-gnu/libc.so.6 (0x00007fcec06de000)
	libLLVM-17.so =3D> not found
	libstdc++.so.6 =3D> /lib/x86_64-linux-gnu/libstdc++.so.6 (0x00007fcec04000=
00)
	libgcc_s.so.1 =3D> /lib/x86_64-linux-gnu/libgcc_s.so.1 (0x00007fcec4d63000=
)
	libm.so.6 =3D> /lib/x86_64-linux-gnu/libm.so.6 (0x00007fcec0320000)
	$BUILD/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2 =3D> /=
lib64/ld-linux-x86-64.so.2 (0x00007fcec4d98000)

And even: $ oe-run-native rust-native /bin/ldd $BUILD/tmp/work/x86_64-linux=
/rust-native/1.75.0/recipe-sysroot-native/usr/bin/rustc
Getting sysroot...
	linux-vdso.so.1 (0x00007ffd807b1000)
	librustc_driver-686d20105d1a2cf7.so =3D> $BUILD/tmp/work/x86_64-linux/rust=
-native/1.75.0/recipe-sysroot-native/usr/bin/../lib/librustc_driver-686d201=
05d1a2cf7.so (0x00007f9ab0800000)
	libstd-64729a5a222c378b.so =3D> $BUILD/tmp/work/x86_64-linux/rust-native/1=
.75.0/recipe-sysroot-native/usr/bin/../lib/libstd-64729a5a222c378b.so (0x00=
007f9ab06c0000)
	libc.so.6 =3D> /lib/x86_64-linux-gnu/libc.so.6 (0x00007f9ab04de000)
	libLLVM-17.so =3D> $BUILD/tmp/work/x86_64-linux/rust-native/1.75.0/recipe-=
sysroot-native/usr/bin/../lib/./libLLVM-17.so (0x00007f9aab000000)
	libstdc++.so.6 =3D> /lib/x86_64-linux-gnu/libstdc++.so.6 (0x00007f9aaac000=
00)
	libgcc_s.so.1 =3D> /lib/x86_64-linux-gnu/libgcc_s.so.1 (0x00007f9ab04be000=
)
	libm.so.6 =3D> /lib/x86_64-linux-gnu/libm.so.6 (0x00007f9ab03de000)
	$BUILD/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2 =3D> /=
lib64/ld-linux-x86-64.so.2 (0x00007f9ab4ae2000)

=3D> It does, in fact, dynamically link on the built libLLVM-17.so.

Thanks!

>
> Alex


--=20
Yoann Congal
Smile ECS


