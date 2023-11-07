Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85CAAC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 11:30:33 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.8330.1699356624408165881
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 03:30:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b7J7Jf1d;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-53d8320f0easo9151287a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 03:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699356622; x=1699961422; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXceAegItLr2vxo6+lMZgTVVWRoc96uWs1Csl67Z4so=;
        b=b7J7Jf1d9cCdgT4w3kGm32EbstHKTkqEz9h6dWmrxRMBkOHIc61ivZOec60ptZxAEn
         LDuydjqdO1n5foqWQyqS41OGDVmMmI0vhyqmMXL0ZSa/pFquGxE0kwFsTDe5nXMzfei4
         Sr3eS+A2YV6r5L8LWXzeGuZsnbOt7mS34BwdFsytJlAVDfUU/0GjKeB5bFAPSrzvn6y/
         er9ZUiRrAffazcg90cmMZ1HqQFgOKCP2o6IOV15zYN4UrdIzhV83nrOU7CYLEeg4oifZ
         YkebUlGQ2/VZ3JYBVp/LiYRnTNAyS3BJu42q+4sMujuW+FKokzbdBUou8FGFxLOiSWcy
         TT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699356622; x=1699961422;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gXceAegItLr2vxo6+lMZgTVVWRoc96uWs1Csl67Z4so=;
        b=m4ghIcYTaJTDBEkWKnWRvJHH1YuhG7boW3Bp8Q3D8c3uJ25Zs3SIggXD9Guwggz0RA
         2kdb3dwE5e6z2+gs4uYJMsdDSXE1v0F3HTiM0+1+xf2eLT8ow9Htj3gSKsanjfEB0fJi
         RuVD482dWJLWJ7Ls7cvDRGmFQgyJTAPPzf0WVjP71c6cIiA1T22C6vCNOxArZlxGMca9
         sHY/5KrXmOwbhNLwQ4t0622pPrFt4vbl526qAhmKx8HC+GTmummxZ1Alhi4H9nw6qzYh
         bqYNCEaXOEky67gnjhQbHlLKXw76ZfBwr020fkH4OPyRCKIXztvA6w03J7wV5Evu78Fp
         5wLQ==
X-Gm-Message-State: AOJu0YzgwMzM0Lqk9Zu3p/uWQf+pVDS98LJWezG7VIseIw5uase6VH2q
	++1ZUZkt96tJd4D1t3sGe/A/WvBB600=
X-Google-Smtp-Source: AGHT+IHIUnk9numWnoclwxXdfj+dmE5fh/GrZzpOgYovYQCCpDheM7A6E09+nm6NnoXCQbfXG5fSDA==
X-Received: by 2002:a50:9f06:0:b0:53f:25c4:357f with SMTP id b6-20020a509f06000000b0053f25c4357fmr23905216edf.34.1699356622087;
        Tue, 07 Nov 2023 03:30:22 -0800 (PST)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id v28-20020a50a45c000000b0053f10da1105sm5453569edb.87.2023.11.07.03.30.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 03:30:21 -0800 (PST)
Message-ID: <24b92a7a-aa29-45e7-8a5e-7c34fe131971@gmail.com>
Date: Tue, 7 Nov 2023 12:30:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: openembedded-core@lists.openembedded.org
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Subject: Baekmuk license is not known by Yocto
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 11:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190267

Hi,

I have a font package recipe for baekmuk-ttf-fonts
which can't be built under Yocto 4.3 do to these:

WARNING: baekmuk-ttf-fonts-2.2-r0 do_populate_lic: QA Issue: baekmuk-ttf-fonts: No generic 
license file exists for: Baekmuk in any provider [license-exists]
ERROR: baekmuk-ttf-fonts-2.2-r0 do_create_spdx: Cannot find any text for license Baekmuk
ERROR: Logfile of failure stored in: 
/data/test-yocto-4.3/tmp-sicom-glibc/work/all-oe-linux/baekmuk-ttf-fonts/2.2/temp/log.do_create_spdx.3195121
ERROR: Task 
(/data/test-yocto-4.3/conf/../layers/meta-sicom/recipes-support/fonts/baekmuk-ttf-fonts_2.2.bb:do_create_spdx) 
failed with exit code '1'

The recipe uses the source tarball from:
http://kldp.net/baekmuk/release/865-baekmuk-ttf-2.2.tar.gz
and this tarball contains the license in the file "COPYRIGHT".

The SPDX page for this license is: https://spdx.org/licenses/Baekmuk.html

I know the workaround is adding these lines to the recipe:

NO_GENERIC_LICENSE[Baekmuk]  = "COPYRIGHT"
INSANE_SKIP:${PN} = "license-exists"

But this license exists and is known by SPDX.
So please add this license name/text to Yocto.
Also, please backport it to nanbield.

Thanks in advance.
Zoltán Böszörményi


