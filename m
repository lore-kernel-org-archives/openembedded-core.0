Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43B71C5AD49
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 20:27:45 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.163.1748982456508307637
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 13:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PCR9aoC7;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4a44e94f0b0so49487051cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 13:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748982455; x=1749587255; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VQx9QSp0L+K1cPJK4+KrjPf2dyEnwR9GkxjGouBw1WY=;
        b=PCR9aoC7VYeSeaCOVM7HDmwy8uZCFydIRb6orz0hcFdQPhhxOHgTOpIWK9O+8FJpjT
         z1g4MBi01ebSXcigQyiUmUQnBsRg0T2/F+hJleszx9ZAwuD0kSYjco2jaWkiesSHmKif
         LmgBNguurT65D+ywfcJjwDcDqwB1uM95Rhxz+FqIANmH/GHDORI42ceKeEjAMgYkO/Sh
         7sFDof+VRlEJjDcTrH7jrcQx6v+8k7g/yKb3bDIBHvUBo/YJwGd6HW4C+z0C2RvPlKH7
         0Gv6c4c9LNoOMvypmZP709oOq4DSmwqHA1KT0PV+phNwWK9MRU54RaI8ZxoT7S8XWzsg
         CB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748982455; x=1749587255;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VQx9QSp0L+K1cPJK4+KrjPf2dyEnwR9GkxjGouBw1WY=;
        b=oPN1ULgTdZUrVkkLpYAhBZYitnbZzo9QSQlb2DWJVs02hxsq8W97fnbfdB6+FitfBD
         61KVAzMyFS5Ucwd1nco2yrqI2s+WV5u9I4H8jnnMbN3DqvcluDCMlK3cZ1M6hrnq1FTp
         J7R0hcQRATurdvCtbEHNf4Mn2S/uOj6NQes/jpmZ544fbZGChnn5bmety7Bz35AJbLia
         qQIZjJawrF/Z5RjC56KgwIDTtqzbmqA3E1si62aw69aEJxV48NKoEPxj7iIz/hX40XiN
         eQiPN81ggUbJYxJWkNCJY/eR7VCceRlxnOGxdu8UjCToH2TWif9w/lPg0XjxeuOvAjuq
         QXaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZbtva65S2D1oXMKJw4K1b4wn+4WdgsGuFDN8NZg2HSDJMJHikfG3DXOT2B6bwXNCMc7ujEfrQkV/MNHppjIZS4A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxxHqkd0XJ4BV+y/E0NV9Z/hIZPe9x/IUeIJx2PQXMHgtUTMqIT
	8w/Luxpwd0I9g0m000X2GEjgIxvJVHKOimhXgPUbZdPiDWMbVP5ptkSth1J7RQ==
X-Gm-Gg: ASbGnct4TcJ7HKTMjARfecBaJR8G5+IiMzSShwzgYWQy82a3Ql7vVT1fQ/wqXMJ/FK5
	3cESRR/hmCe6IU7b+yJajQpgGSNCKimtek9Q6EpFpvDCI967H5bCUIl24QvumvkYORjnXTIVUmQ
	/iPKWcf95VG5Ka6aXaOpIoSMKzxnQ01uabmv53Jvjg/Swvnp4FmV74/U17hCElWHZg07LAmdLbM
	9MYxzkM5lfabhNsptqYBz2aBeOKU1AOWAwChnaSugB+CvJsdG7sBVetlb5ZH+ATFkI8ArhLAId3
	RMFymV4VpGag/YKQvWk62A5R6ZKaLVReAMW0UrMAWY3zsIyuMyGSNqhbQNz8VSeccIDZdO9tvpv
	GShdW69cxkjo137SE7Jfv4Q2D+nsP6Ce3JmOhxkZJKCu2ho8=
X-Google-Smtp-Source: AGHT+IHM1GXWU5PaDPyTb60RSmXYapSh7Au0g2+drJRxL2r8jfZ+XT699DlOCFsHex66wNn8r8b6rw==
X-Received: by 2002:a05:6a00:2da5:b0:736:6d4d:ffa6 with SMTP id d2e1a72fcca58-7480b2e0415mr513661b3a.15.1748982044047;
        Tue, 03 Jun 2025 13:20:44 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:bcff:6d7:a328:fe85? ([2601:646:8201:fd20:bcff:6d7:a328:fe85])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeab769sm9856203b3a.38.2025.06.03.13.20.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 13:20:43 -0700 (PDT)
Message-ID: <56e70695-1d21-47cb-81d5-8adc68348550@gmail.com>
Date: Tue, 3 Jun 2025 13:20:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] util-linux: fix ptest failure for musl
To: Qi.Chen@windriver.com, openembedded-core@lists.openembedded.org
References: <20250603071720.2055740-1-Qi.Chen@windriver.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20250603071720.2055740-1-Qi.Chen@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 20:27:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217823



On 6/3/25 12:17 AM, Chen Qi via lists.openembedded.org wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
> 
> The kill/decode test case fails for musl. The root cause is the test
> case only considers glibc and uses 34 as SIGRTMIN while musl uses 35.
> Add a patch to fix this issue.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/recipes-core/util-linux/util-linux.inc   |  1 +
>   .../0001-ts-kill-decode-fix-for-musl.patch    | 43 +++++++++++++++++++
>   2 files changed, 44 insertions(+)
>   create mode 100644 meta/recipes-core/util-linux/util-linux/0001-ts-kill-decode-fix-for-musl.patch
> 
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> index b0f2a9d497..2d003c28b2 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -42,6 +42,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
>              file://fcntl-lock.c \
>              file://0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch \
>              file://0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch \
> +           file://0001-ts-kill-decode-fix-for-musl.patch \
>              "
>   
>   SRC_URI[sha256sum] = "81ee93b3cfdfeb7d7c4090cedeba1d7bbce9141fd0b501b686b3fe475ddca4c6"
> diff --git a/meta/recipes-core/util-linux/util-linux/0001-ts-kill-decode-fix-for-musl.patch b/meta/recipes-core/util-linux/util-linux/0001-ts-kill-decode-fix-for-musl.patch
> new file mode 100644
> index 0000000000..efdd019cda
> --- /dev/null
> +++ b/meta/recipes-core/util-linux/util-linux/0001-ts-kill-decode-fix-for-musl.patch
> @@ -0,0 +1,43 @@
> +From e6b6e401b0046a524e2e3e3db66f1b85b06fa2d4 Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Tue, 3 Jun 2025 13:18:36 +0800
> +Subject: [PATCH] ts/kill/decode: fix for musl
> +
> +glibc uses 34 as the value of SIGRTMIN:
> +https://sourceware.org/git/?p=glibc.git;a=blob;f=signal/allocrtsig.c;h=8ed8e37dd6c41f94be6eef042ce9db1af1153228;hb=HEAD#l27
> +"""
> +static int current_rtmin = __SIGRTMIN + RESERVED_SIGRT;
> +"""
> +
> +musl uses 35 as the value of SIGRTMIN:
> +https://git.musl-libc.org/cgit/musl/tree/src/signal/sigrtmin.c
> +
> +Adjust the test case to cope with musl. Otherwise, it fails with
> +the following difference:
> +
> +  -Ignored: HUP QUIT TRAP PIPE ALRM
> +  +Ignored: HUP QUIT TRAP PIPE ALRM 34
> +
> +Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/3605]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + tests/ts/kill/decode | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tests/ts/kill/decode b/tests/ts/kill/decode
> +index 57149899e..f17ea36e2 100755
> +--- a/tests/ts/kill/decode
> ++++ b/tests/ts/kill/decode
> +@@ -53,7 +53,7 @@ ACK=
> + 	    # Sending one more USR1 is for making the signal pending state.
> + 	    "$TS_CMD_KILL" -USR1 "$PID"
> + 	    "$TS_CMD_KILL" -d "$PID" | {
> +-		if [[ $("$TS_CMD_KILL" --list=34) == RT0 ]]; then
> ++		if [[ $("$TS_CMD_KILL" --list=34) == RT0 || $("$TS_CMD_KILL" --list=35) == RT0 ]]; then

hardcoding these values are perhaps not ideal. Maybe using SIGRTMIN here 
could make it work across platforms.

> + 		    # See man signal(7).
> + 		    #   The  Linux  kernel  supports a range of 33 different real-time signals,
> + 		    #   numbered 32 to 64.  However, the glibc POSIX threads implementation in‐
> +--
> +2.34.1
> +
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#217761): https://lists.openembedded.org/g/openembedded-core/message/217761
> Mute This Topic: https://lists.openembedded.org/mt/113443532/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


