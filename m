Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D15FCC4332F
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 14:29:12 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web09.20064.1667485747735670431
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 07:29:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RjInqZwN;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-13bd2aea61bso2381340fac.0
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 07:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uCxCAQZ4a6fcYek4uX4e0cWHkjBKwIuebfMqBhTmwmQ=;
        b=RjInqZwNHGrOQ9QW1xp3UPbJKI9D7OXWtscenPLvSQwI8VPZ/LDtVdeNQz7V6ARTCP
         gzz05ByFsvYILMfyPFfCcNaIeWa9vtXJqEYwgf0aDJGs6qg2ttIrGI0kP4npsdejDc7t
         UBYjDJeBUKC9itQVE7DzezlUX9CcUfv/uDkexQBoKJ3+6RsKlwtLVV8GHjvQxRjzYUeq
         pAx/hrTVf71147PfQOdr3goIcsdEh+qzXI9c6qwRS3GEfxB96zW1mbviqzP1SR3YTl9c
         tpDQlujaQiMtP51NNCqHRaSaHMGeBQlsxDdHG5b3Fz1ndDc8dQ9BJEZRvdZopW4LJ8Wb
         FbhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uCxCAQZ4a6fcYek4uX4e0cWHkjBKwIuebfMqBhTmwmQ=;
        b=GCqdTBl4AfG/7f0w/SfEdUGGlvgQGqPAhqzpQRJgV5Rb2DdQHulfFN8UZLcfBV1GgA
         YDMbFYiXCP5+IuK+z6DBeTP4eRamdkmBxZZXBc+XI9I1TtKeJGAojf/NxcLe9JVXdPrX
         Ws9J++cFHm7fZLhzMq19Yh/krp2soJNHcdS+6KLHK+y89kmXOHP6GPXcsQ0Rm7V/hJaz
         b4dpyOWbP3xm2eNj6rdAnnJNgCyx8Ggs0gjT6wMMtg4GoVGUsdf1oW2Dy77iWKBG53yc
         WrteJguERQqqZmVudJ42UAyeRriZ3qrQAWxd14O1gCY3gkCx4IhtKDWyEGfEpd+xnRuY
         IAgw==
X-Gm-Message-State: ACrzQf3fSGtFF315cAxEjZjEepDoJFJdlodj1vuhXVVXz8l18+FTErH7
	E1VUYIuVqT2XlRmTfHz9k68=
X-Google-Smtp-Source: AMsMyM5DtLN/jeks+HYiqWm0aWXr+L42H2LOp2HGI3q2k9mV/lHZj3NeniyW70//bp7fuItCZEztsw==
X-Received: by 2002:a05:6870:2421:b0:13b:9e9a:317f with SMTP id n33-20020a056870242100b0013b9e9a317fmr18342233oap.238.1667485746945;
        Thu, 03 Nov 2022 07:29:06 -0700 (PDT)
Received: from ?IPV6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d? ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id h5-20020a05683040c500b0066c39c99ae5sm384631otu.25.2022.11.03.07.28.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 07:28:59 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <164f7e3d-59f7-98c7-f75e-e67fc949f462@gmail.com>
Date: Thu, 3 Nov 2022 09:28:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [OE-core] [PATCH 0/1] create-spdx: default share_src for shared
 sources
To: kweihmann@witekio.com,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: "steve@sakoman.com" <steve@sakoman.com>
References: <AM8P192MB09633133388817BF0814341EA3389@AM8P192MB0963.EURP192.PROD.OUTLOOK.COM>
Content-Language: en-US
In-Reply-To: <AM8P192MB09633133388817BF0814341EA3389@AM8P192MB0963.EURP192.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 14:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172631

I see the problem, but I'm not quite sure this is the correct solution. 
It *does* fix the problem for exact recipe that provides the source code 
(e.g. the llvm-sources recipe), but I don't think it will correctly pick 
up the sources for anything that actually uses that shared source code 
(e.g. clang); this isn't necessarily a problem in your patch however, I 
think it's actually a problem with any non-kernel recipes.


On 11/3/22 09:15, Konrad WEIHMANN via lists.openembedded.org wrote:
> https://github.com/witekio-kwe/poky spdx-fix

