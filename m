Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C41EC63705
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:01 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.6966.1649515916142051499
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Apr 2022 07:51:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Lu/ir/t5;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id bx5so11138182pjb.3
        for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Apr 2022 07:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=LRO1F0C9QRyDJCE1bnrwiC++btgcumz8cX1puPmFwFs=;
        b=Lu/ir/t51pS27+Lgg60v9Ax6OQtphrxsn6deFegLSMOPXNBxspjzOYAWGBjrnnDDlh
         SDChXgXorFwigAhqmP8VBN8n2gyh/wNR3vnLZsnvKQ0gMBStCNVkL5esaTrC8miU6Np2
         vrmipgAljACcup7OB03T168AHXT4FzF1xw/NtAw4j2FXJ1ZvO0l37mguid0FknIAISYy
         BxkYwCkjC01F+vjaBw5wqoEqMcXu8SvKEgTeo94Jr6TEGpVI0vpj2cNKQWMvWXH02dO/
         dp3AiA3NX1SVT3s7iG3Gx9asH+xp11vZLIyDyq/ou+zH2higBFwnmumBDH905jWJXt7i
         imHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=LRO1F0C9QRyDJCE1bnrwiC++btgcumz8cX1puPmFwFs=;
        b=GAiZ5KeFKYjyMJvL3IGBVfUGca71kYZ0t/FxYUwDdFuRhtTLUt34NaECuGxnSuwJos
         7hO6eLhh2U+l5/Q/R4WCJRQ9apGn/VvTLSkO3DYWqZ7h8zmonS2p3vHa1LOpvI+GUzIF
         VtkqTMlkvcqrsr7+R+GLVuQ10QomY2OwEyNshgBnHwfbbuia6VZ8yJVafinlt+r573QU
         UN7dOlxs2dHEV7oNyQ4WpTRmdgUHUrAt2/L4m46tzioWwa2RXKPuKMjjFQKRLehi8jAr
         CrHOTwMv0B/p46qXUXq6WRhYDWGLsnJvjhZXqfwRNi7Hr0FpPcrc6BBsNLEXOk06gm34
         wtbw==
X-Gm-Message-State: AOAM530ZbeubOktrTYQMAmwLWRW7knFtJdhxzBRr7Qh3hpdS3kFgpJSA
	zrEkX0KZJ4Ogn9+lZaTCyEA7baih9xfLNw==
X-Google-Smtp-Source: 
 ABdhPJwCTab0Bzr9mOXcZObnSMK2A9ChuN/lB+KS6WOCPtbBmJBTRPpF0j4Nwn+TvdArUMLOdBBbdQ==
X-Received: by 2002:a17:902:d88f:b0:155:e660:b769 with SMTP id
 b15-20020a170902d88f00b00155e660b769mr24014324plz.36.1649515915471;
        Sat, 09 Apr 2022 07:51:55 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0::a9f9? ([2601:646:9200:a0f0::a9f9])
        by smtp.gmail.com with ESMTPSA id
 h2-20020a056a00170200b004fae65cf154sm31038144pfc.219.2022.04.09.07.51.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Apr 2022 07:51:55 -0700 (PDT)
Message-ID: <85ac6756-1b64-ca49-1e7f-9731668f842a@gmail.com>
Date: Sat, 9 Apr 2022 07:51:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH 2/2] mesa: update to 22.0.1
Content-Language: en-US
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-core@lists.openembedded.org
References: <20220409141500.815506-1-open.source@oleksandr-kravchuk.com>
 <20220409141500.815506-2-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20220409141500.815506-2-open.source@oleksandr-kravchuk.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164189



On 4/9/22 07:15, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>   meta/recipes-graphics/mesa/mesa.inc                           | 4 ++--
>   meta/recipes-graphics/mesa/{mesa_22.0.0.bb => mesa_22.0.1.bb} | 0
>   2 files changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-graphics/mesa/{mesa_22.0.0.bb => mesa_22.0.1.bb} (100%)
> 
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 21fa1a6a9e..20295a0ff0 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -22,7 +22,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>              file://0001-util-format-Check-for-NEON-before-using-it.patch \
>              "
>   
> -SRC_URI[sha256sum] = "e6c41928b5b9917485bd67cec22d15e62cad7a358bf4c711a647979987601250"
> +SRC_URI[sha256sum] = "c05f9682c54560b36e0afa70896233fc73f1ed715e10d1a028b0eb84fd04426f"
>   
>   UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
>   
> @@ -34,7 +34,7 @@ do_install:append() {
>       fi
>   }
>   
> -DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native"
> +DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native python3-pygments-native python3-markupsafe-native"

could you also describe the reason for these additional dependencies in 
commit message ?

>   EXTRANATIVEPATH += "chrpath-native"
>   PROVIDES = " \
>       ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '', d)} \
> diff --git a/meta/recipes-graphics/mesa/mesa_22.0.0.bb b/meta/recipes-graphics/mesa/mesa_22.0.1.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa_22.0.0.bb
> rename to meta/recipes-graphics/mesa/mesa_22.0.1.bb
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164188): https://lists.openembedded.org/g/openembedded-core/message/164188
> Mute This Topic: https://lists.openembedded.org/mt/90356472/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

