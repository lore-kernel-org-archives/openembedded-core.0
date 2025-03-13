Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E7D0C282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 14:29:21 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.16213.1741876157802730006
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 07:29:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LbadsNY5;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so6872995e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 07:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741876156; x=1742480956; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9RX22DntgFk+MYA2vilvyxqQk7ZpAldYuEGkrUTcks8=;
        b=LbadsNY5B138DLyIihLSiPsmwINd4f1+/7Q8DAPQCLREwQBQObK6Zkuv/6F14ai2Rq
         dXRak2AMfcbUJJwVZcLls24TGbg+cbiOywJEW+2uJiYcXnnpao+7Wv2qJewCBxge8Y+B
         fpCxYmjjJ9Zf8LbquZgMzhu95Xkh8IAKVbO5nSpfxBE970caA9Ob6s85KfF2h8iu1j0O
         pEA7d8H2PNAf8QXZp8Mn9X80G1fv+PQ3/kdKVyCoHMa595DigWiuP2y3KnjwppsN+/UT
         PCARa2WrzQY1s3eFFcRdXuTURuHPRvHwFXwlFOQb4vxl1a/1PpCYvanaoTi7ID5zl68+
         3zHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741876156; x=1742480956;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9RX22DntgFk+MYA2vilvyxqQk7ZpAldYuEGkrUTcks8=;
        b=hSQndsoxgHCVnVfeCCREzTMefGMJviGRURHrIFuEB1Z/SYbgIUS8D8UunrTeEIMiBM
         Zz5qZmeKAxGpH/WE8gY3wrr795w4cVlgnntgaHJN1NEpFMp/JidqRcQFeFz1sylNEqlv
         EhV7rVuxkeGsjpPv1l2F8vLptUjCgyYKK1HjeWAxyBjBOWqPfovjTt90I6k034g8sm7s
         CxnY7uwwWgmFEPd0bziX2vEJaCIXaijNN77fa2CjHbxjP7WLixHw9r1/5ELRZpR3cM2U
         0jRhq7WTlD5uVksKWjlYJXkPdaYnJPPQhU0EEm5gNfJYbiNIkYz8/2RTz0c4ZhZD5R33
         L2Tg==
X-Forwarded-Encrypted: i=1; AJvYcCXRuIWOZhh+h0QxCTB6E/V3ZM1z55ikA3bryKHE+cCh6m3moeaJCvLLH7ozYEmAn7KxLKHDIChFC/cHpKSOTpYYJg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxmBkBz6TMbKGDSuFJ/4wv0eSikxER3tn2DH9Yl+aAYKDx2he5X
	v5T6rECD3GP6vu0IksrkhpRub1c4jY6+I4ramcE6V8tCHrdpYlWi/dwiDQ==
X-Gm-Gg: ASbGncsfZWUSINzbVrZH5NJJpIfjQgqER7rg3RKpONjSIbn208Y8Y2w01wnNfD2FITo
	+azl2TgT6Jty323knpa0gFluf3E93tiFQTXyBdzErSvaGb3j7iZtTvdsxOfCv+BcadNQp0xEJRx
	Kr3Q85Le1TEYrymxEcSGY6rErTfx3K/eYpayiWxE927+DF93TpSlmF9oiomCGxDA1fMUGxkS2eS
	T/uxRTiVrnuGve9u58iNHJhOCXWwZ27zhunKdKYlkiEN9H12QuM8uTMjEhgDw9hUUM3QcY//FaL
	DwVSIc37rgcazVl3iqsJjBnSO3u2qgMd74mppRpJI9ZXmdr5pP2WoO+a+nUAbJE4AATwLNH2yHz
	Y1A==
X-Google-Smtp-Source: AGHT+IFURmb0gRPC/peiFNyStIpFWofqn6OFUREx8LpOsYKbxnUuwdQrVtueDO68bxXhn2vHpcCwlA==
X-Received: by 2002:a05:600c:470d:b0:43c:fab3:4fad with SMTP id 5b1f17b1804b1-43cfab351c6mr155188855e9.16.1741876154385;
        Thu, 13 Mar 2025 07:29:14 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d18a4c608sm21817965e9.38.2025.03.13.07.29.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 07:29:14 -0700 (PDT)
Message-ID: <82e68825-b7ad-4236-a898-3fc97fa57bd4@gmail.com>
Date: Thu, 13 Mar 2025 15:29:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/4] systemd-systemctl-native: correctly set PV
To: alex.kanavin@gmail.com, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20250311100500.355914-1-alex.kanavin@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <20250311100500.355914-1-alex.kanavin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 14:29:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212780

I don't know who else has run into this, but having

     DISTRO_FEATURES_NATIVE="systemd"

produces circular dependency between
systemd-systemctl-native and util-linux-native. FWIW, I do not know why I had it, but I 
did since 2020. With that setting removed, the build can start.

The build warns about other obsolete settings,
can this be added to the set of warnings somehow?

2025. 03. 11. 11:04 keltezéssel, Alexander Kanavin via lists.openembedded.org írta:
> From: Alexander Kanavin <alex@linutronix.de>
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   ...temd-systemctl-native.bb => systemd-systemctl-native_257.3.bb} | 0
>   1 file changed, 0 insertions(+), 0 deletions(-)
>   rename meta/recipes-core/systemd/{systemd-systemctl-native.bb => systemd-systemctl-native_257.3.bb} (100%)
>
> diff --git a/meta/recipes-core/systemd/systemd-systemctl-native.bb b/meta/recipes-core/systemd/systemd-systemctl-native_257.3.bb
> similarity index 100%
> rename from meta/recipes-core/systemd/systemd-systemctl-native.bb
> rename to meta/recipes-core/systemd/systemd-systemctl-native_257.3.bb
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#212550): https://lists.openembedded.org/g/openembedded-core/message/212550
> Mute This Topic: https://lists.openembedded.org/mt/111637143/3617728
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


