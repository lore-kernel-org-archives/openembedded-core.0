Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31E52C43334
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 13:39:19 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.84052.1657028350995328822
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 06:39:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HbafI4+x;
 spf=pass (domain: gmail.com, ip: 209.85.222.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id b125so8649307qkg.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 06:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=YRvfERMBJRktFs30B5dmR3ocencmHO3aT0+LR9rumnA=;
        b=HbafI4+xe3hJVRQfI85k3w/QCA7XCv0nvFBnnSLTUxzEzRCBgXqVxFEHl/nEzKrJ6A
         R0/7Ffd0fiJ0jGEs694EgDHvFjAsyez9wJxKiwKIpLMKbU1U6C37MBCyNm86blX2YNtb
         kSPUMu62EowNeC2O7Nz2+wAZa9AIr48wZbKU32U3t3zDFORLF2jSnhxj0waGODdsnhv0
         iyEtWzSqW275mEVVPCWmF9mprLUIQZ2V8x4V/51R4MAXQ2cStdJvy+H0tOxrNFIGPc39
         1pjS8sB2uCSNPiAWr8JgR2Exkl9LSwK1JWNtwNzSO1Slmw1gOwmkAdac8DS2PA7g+Fj/
         ps4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YRvfERMBJRktFs30B5dmR3ocencmHO3aT0+LR9rumnA=;
        b=2a5av+cJHki0hfOz8BrR+uNmoamMFU4x4ZcZBZZ52Xm5CbN/OMcMJ009rnxwbaVb3k
         Wk7v0lLTDVlcc7Myi+a9oEcX7+S1Bn4Zjz62N9ZyE5yxZDJ3/KecY6/C7UcphVm6/eb0
         Au3gEeq0TXdbod6cgCeEwrcTGgZs6StHRhjpJplQWlhyBhg5KkqEGB/IoHBxddrVsWTt
         Q6ke06YUWXmAcUQVdZaAk1BVQVBk5Hte8jbOVJN96cHVte799DgBM44+TNzeXaBb9ArG
         ibq7pHXhQZzCnu8KIClDf68QPzL+9MmmQlXp4cuttpftskdJZMfr9AVW/Aq3+Jzi+j43
         31Nw==
X-Gm-Message-State: AJIora8VE0nmm2aVIfaWVwms3DQuHyDiTu+fBYlS5p/V8vhP4j1tIv8j
	LBWj0Uz9Hz6HOnZQ1kUjmMQ=
X-Google-Smtp-Source: 
 AGRyM1s9lbf7ljO9K6eYBwz/RULAPwJv3h67GF2NRs6qisWLqA9U9q9eTOU0k81VVLKRa45EZ4BzJA==
X-Received: by 2002:a05:620a:4503:b0:6b4:6ae5:d524 with SMTP id
 t3-20020a05620a450300b006b46ae5d524mr5073279qkp.445.1657028349578;
        Tue, 05 Jul 2022 06:39:09 -0700 (PDT)
Received: from ?IPV6:2607:fea8:95df:9730:959d:d09a:db6c:637c?
 ([2607:fea8:95df:9730:959d:d09a:db6c:637c])
        by smtp.gmail.com with ESMTPSA id
 h18-20020ac87772000000b002f905347586sm22417342qtu.14.2022.07.05.06.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 06:39:09 -0700 (PDT)
Message-ID: <7af70882-4835-2316-5c54-52318b5e7d4b@gmail.com>
Date: Tue, 5 Jul 2022 09:39:08 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0
Subject: Re: [OE-core] [PATCH] strace: set COMPATIBLE_HOST for riscv32
Content-Language: en-US
To: "Yu, Mingli" <mingli.yu@windriver.com>,
 openembedded-core@lists.openembedded.org
References: <20220705070318.737747-1-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20220705070318.737747-1-mingli.yu@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 13:39:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167654


On 7/5/22 3:03 AM, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Disable the build on riscv32 as it's not supported on riscv32 [1].
>
> [1] https://github.com/strace/strace/commit/69ff62ea5087506ad36a27599db088096db215da
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>   meta/recipes-devtools/strace/strace_5.18.bb | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/strace/strace_5.18.bb b/meta/recipes-devtools/strace/strace_5.18.bb
> index 08f0f1d27e..75ff58bd50 100644
> --- a/meta/recipes-devtools/strace/strace_5.18.bb
> +++ b/meta/recipes-devtools/strace/strace_5.18.bb
> @@ -18,6 +18,9 @@ SRC_URI[sha256sum] = "60293ea79ac9253d600cdc9be077ad2988ca22284a439c9e66be5150db
>   
>   inherit autotools ptest
>   
> +# Not yet ported to rv32
> +COMPATIBLE_HOST:riscv32 = "null"
> +

there might be more changes needed especially in package groups perhaps.

>   PACKAGECONFIG:class-target ??= "\
>       ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
>   "
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167640): https://lists.openembedded.org/g/openembedded-core/message/167640
> Mute This Topic: https://lists.openembedded.org/mt/92180245/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

