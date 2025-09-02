Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91790CA1007
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 05:43:55 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.70505.1756791825612474437
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 22:43:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ihq1By0S;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afeec747e60so773698366b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 22:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756791824; x=1757396624; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rKyFsWjUqZV+YM2U/hjMToYNk5Hjmp9nbwfYabQ79Ps=;
        b=ihq1By0SC2FkFLd5/hTkmg3OhLR0NexrIFz8wRfdLWZSnuc9k2Ydgo0wpzwe88zR6t
         IkRlOfMYsZODclSNp0YeMjzkbvjl81zuWoNm97Bd9Ie5c3wCb7aDiF0ik9L0MeETJxMj
         JiSGItErdkCR39w8QvGp+KD+vf7e2Pb2wezNcdnA2m/MO+Dlsw7awdYCE393XkkX0YuU
         dvnR2k6AbYcYkFhAHXHajx/nnclIpWph+9MrjfZLpZ10tku0X7oddwlZKtvvB9SPUW9j
         8zcDUFWoxEv0ZffkGKqXe+fSCh/+imExbMQGTEQ/2VhjUDaGUITA7px3TL8vaPUcO7N8
         GQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756791824; x=1757396624;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rKyFsWjUqZV+YM2U/hjMToYNk5Hjmp9nbwfYabQ79Ps=;
        b=rGCXLpgHRfVNjowoVOQsPSkZpDAHcZO7jYyqr4axeSGZJPhootxwx7Ky+X9hBk5Nk4
         mxK6JM9glvhqLKKVNKtocFBbeofmqascXSVOMWQPRYmN5xcQbvt37QVJgMTOX0L5GiD1
         7ZjFMuxI9d0yLV5fesNvU0H5W1eKQPyS8Fbld9O9j++/RbTSipl4pzDg6ejf0Lt7pSaO
         oHEB9jtiFaF1fFOgE/Ph7dCnpN30HEYExQpWJsuRIxHsPG1e8rz3MzTfMCR6nRDUfPGK
         TFKqA/Q+aRiDtql84VqtfosMYRG/B/8AKPTs+rnoiN67ND63tpzUyAH1dqpjss5rTer2
         OdcA==
X-Gm-Message-State: AOJu0Yx48fdQHPSli+7JP5KInp0t2c2d+Rc0V7iFn08S7arWfGSyFt9d
	TtdatgXbMz4ZH6bt6g+6gENul8w03Uh+8yTfLi+7dcSbxzh1F+7877K9Q1lnvg==
X-Gm-Gg: ASbGnctMFk6CDnlnTj85IRgenrnl6ictGw1mHk1uTdFMsR8Shi0A5l0XZkcIiFoR6LP
	P1nIQoa3Ar1mQlfW3AutmTBeAgBB9+udmgxl5HYHyrfwnScjj6h5ADtpIkBxoJKLuxLxF+50E90
	ZiKziyah1I9xhqpcPuNh6gm0pLPta8r+3TVUd51pJgMnYsJTZLX1fK3f/sV6gl/oN8ABW/+W4tq
	IWXFFwDgF1baF4eFYWvGQ1wBmqlZPP5cUHg4ptYS8mUCQHybeqQPuBSTYykLLNQbEL5bPiyFI7N
	/J4V/KzLRaamiPRUobuIGlrt1mYnfr5MhmL8aJUIctNzMs8NcYLqA88na7zLynbESySXpoAOPdM
	qNrcnFxFSfcPnjPzpMhAcey/S2byzf/8=
X-Google-Smtp-Source: AGHT+IFwFakFQsz3+PJuGNTqRQucZN6No1l4mIZRuMlPvWCggA+59yN8295/KH4XuXjaOb8b92Jm9Q==
X-Received: by 2002:a17:907:94d6:b0:afe:d590:b6af with SMTP id a640c23a62f3a-b01d8a8b60bmr967553466b.20.1756791823627;
        Mon, 01 Sep 2025 22:43:43 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b043fd772bcsm244002366b.14.2025.09.01.22.43.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 22:43:43 -0700 (PDT)
Message-ID: <8a6ecaf3-b302-41cb-a8f2-717c15812a8a@gmail.com>
Date: Tue, 2 Sep 2025 07:43:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] runqemu: fix snapshot status log format
To: openembedded-core@lists.openembedded.org
References: <186133A59E9EBC76.5475@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <186133A59E9EBC76.5475@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 05:43:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222704

Please ignore this patch. It seems to work on EndeavourOS fine, but my
Debian12 system complains about syntax error.



On 9/1/25 17:55, Gyorgy Sarvari via lists.openembedded.org wrote:
> The snapshot status is diisplayed incorrectly, in case snasphot is disabled.
>
> Enabled state:
> SNAPSHOT: [Enabled. Changes on rootfs won't be kept after QEMU shutdown.]
>
> Disabled state:
> Disabled. Changes on rootfs will be kept after QEMU shutdown.
>
> Fix the log output to make them have the same format.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  scripts/runqemu | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 827300080a..fd61f3b605 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -1054,9 +1054,10 @@ to your build configuration.
>              logoutput.append('NFS_DIR: [%s]' % self.rootfs)
>          else:
>              logoutput.append('ROOTFS: [%s]' % self.rootfs)
> -        logoutput.append('SNAPSHOT: [%s]' %
> -                         "Enabled. Changes on rootfs won't be kept after QEMU shutdown." if self.snapshot
> -                         else "Disabled. Changes on rootfs will be kept after QEMU shutdown.")
> +
> +        logoutput.append(f'SNAPSHOT: [{"Enabled. Changes on rootfs won't be kept after QEMU shutdown." if self.snapshot 
> +                         else "Disabled. Changes on rootfs will be kept after QEMU shutdown."}]')
> +
>          if self.ovmf_bios:
>              logoutput.append('OVMF: %s' % self.ovmf_bios)
>          if (self.ovmf_secboot_pkkek1):
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222667): https://lists.openembedded.org/g/openembedded-core/message/222667
> Mute This Topic: https://lists.openembedded.org/mt/115010156/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


