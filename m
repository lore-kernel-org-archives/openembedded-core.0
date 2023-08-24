Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F81EC27C40
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 08:46:24 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.6707.1692866779077281874
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 01:46:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=F4cfCNXt;
 spf=pass (domain: konsulko.com, ip: 209.85.208.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-52a250aa012so2255329a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 01:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1692866777; x=1693471577;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+1KrplRBRl1KtB7hXKbwEa06D8EzqnEgkZiey3kONfA=;
        b=F4cfCNXtdQSl0m0gs1GxotT1QKGR5uYdqosSnE+ExryCLudgwrgP7BsEA+nU1HbMsn
         V2KZX1bVlXg4SNzRJsw6eb499+FIXIuYFULpnQmqF9lJQ6t01nodBdSfB8AaVjMDsoFY
         s1OU4eviP0XZUC4m1PPeGNR2DSpRnsjlXwiEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692866777; x=1693471577;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+1KrplRBRl1KtB7hXKbwEa06D8EzqnEgkZiey3kONfA=;
        b=N3wxqhPYn7TvlK93idkZb6D/p7N8UISNd1913xbTRp9RiB8+LDPpn181HV5nytXYzH
         coC0ZFfgE9OBCIrg0jNfI7nAFqFmv03LGF8IX5gJYs+tcri51e73+GJ5DHDQZZTCtSua
         yd1DMVdnf92MA1Elh9CWBgkPfIH1HFV4+yFMa3AmBPJQYF7H0CFsCrsbeSOg39NEFNFr
         0uUssJhMOduzYblMF7PPMMCRAHkvZB80nLtsw/OvFN6JEfPl+ZqEhO+6TGDly9aOfRIw
         2ZgyxFHGG56qXXcdGhd5OJ2lZ4rxA1kQaiZGItfIsSrWKi1jVdYve9xbyCZq4ir9l8A8
         5rIQ==
X-Gm-Message-State: AOJu0Yyym0GwgxsJenNFINUakBhnl67Im9sTUhdyPsDEzh/kNYGPPm9H
	o38gIC81uIxtxWyp8QU88fK03A==
X-Google-Smtp-Source: AGHT+IHNnZMFRYRSn+3FwIaxhm3pW9dJHmALXGYVFQ9bat2NDmVWk9zLedtDmtkjk7DwtNgwcXPsag==
X-Received: by 2002:aa7:c2cd:0:b0:526:9626:e37d with SMTP id m13-20020aa7c2cd000000b005269626e37dmr10642718edp.37.1692866777147;
        Thu, 24 Aug 2023 01:46:17 -0700 (PDT)
Received: from [192.168.5.249] ([46.55.231.62])
        by smtp.gmail.com with ESMTPSA id z2-20020aa7d402000000b0052576969ef8sm10230681edq.14.2023.08.24.01.46.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 01:46:16 -0700 (PDT)
Message-ID: <93cd0bb8-ed48-584d-9596-278160dbc5c0@konsulko.com>
Date: Thu, 24 Aug 2023 11:46:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [OE-core] [PATCH 2/2] neatvnc: add new recipe
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20230823162404.457379-1-leon.anavi@konsulko.com>
 <20230823162404.457379-2-leon.anavi@konsulko.com>
 <cb6ee91b-f918-4918-868b-a192c45546d8@gmail.com>
From: Leon Anavi <leon.anavi@konsulko.com>
In-Reply-To: <cb6ee91b-f918-4918-868b-a192c45546d8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 08:46:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186647

Hi Khem,

On 23.08.23 г. 19:48 ч., Khem Raj wrote:
> On 8/23/23 9:24 AM, Leon Anavi wrote:
>> Add a new recipe for neatvnc v0.6.0, a liberally licensed VNC
>> server library with a clean interface. It is required for building
>> Weston with VNC backend.
>>
>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> ---
>>   meta/conf/distro/include/maintainers.inc     |  1 +
>>   meta/recipes-graphics/neatvnc/neatvnc_git.bb | 40 ++++++++++++++++++++
>>   2 files changed, 41 insertions(+)
>>   create mode 100644 meta/recipes-graphics/neatvnc/neatvnc_git.bb
>>
>> diff --git a/meta/conf/distro/include/maintainers.inc 
>> b/meta/conf/distro/include/maintainers.inc
>> index 11b47ffe84..f659e24a66 100644
>> --- a/meta/conf/distro/include/maintainers.inc
>> +++ b/meta/conf/distro/include/maintainers.inc
>> @@ -895,3 +895,4 @@ RECIPE_MAINTAINER:pn-zip = "Denys Dmytriyenko 
>> <denis@denix.org>"
>>   RECIPE_MAINTAINER:pn-zlib = "Denys Dmytriyenko <denis@denix.org>"
>>   RECIPE_MAINTAINER:pn-zstd = "Alexander Kanavin 
>> <alex.kanavin@gmail.com>"
>>   RECIPE_MAINTAINER:pn-aml = "Leon Anavi <leon.anavi@konsulko.com>"
>> +RECIPE_MAINTAINER:pn-neatvnc = "Leon Anavi <leon.anavi@konsulko.com>"
>> diff --git a/meta/recipes-graphics/neatvnc/neatvnc_git.bb 
>> b/meta/recipes-graphics/neatvnc/neatvnc_git.bb
>> new file mode 100644
>> index 0000000000..dc4678f082
>> --- /dev/null
>> +++ b/meta/recipes-graphics/neatvnc/neatvnc_git.bb
>> @@ -0,0 +1,40 @@
>> +SUMMARY = "A liberally licensed VNC server library"
>> +DESCRIPTION = "This is a liberally licensed VNC server library 
>> that's intended to be fast and neat."
>> +HOMEPAGE = "https://github.com/any1/neatvnc"
>> +LICENSE = "ISC"
>> +LIC_FILES_CHKSUM = 
>> "file://COPYING;md5=94fc374e7174f41e3afe0f027ee59ff7"
>> +
>> +SRC_URI = "git://github.com/any1/neatvnc;branch=master;protocol=https"
>> +
>> +SRCREV = "8b3dc1ae6099dcfa73aec3ae11df2fdc58540d14"
>> +
>> +PV = "0.6.0+git${SRCPV}"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +DEPENDS = "libdrm pixman aml zlib"
>> +
>> +PACKAGECONFIG ??= "tls"
>
> Can you check if it can support tls without gnutls/nettle ?
> if not then can we keep the default to not enable it.

Sorry, do_configure of neatvnc fails if tls is in PACKAGECONFIG without 
gnutls:

ERROR: Dependency "gnutls" not found, tried pkgconfig

In order to get VNC backend in Weston 12 working we need tls enabled in 
neatvnc. Because of this I added tls by default in PACKAGECONFIG of 
neatvnc. Should I remove it regarding these circumstances?

Best regards,
Leon

>
>> +PACKAGECONFIG[tls] = "-Dtls=enabled,-Dtls=disabled,gnutls"
>> +PACKAGECONFIG[jpeg] = "-Djpeg=enabled,-Djpeg=disabled,libjpeg-turbo"
>> +PACKAGECONFIG[examples] = "-Dexamples=true,-Dexamples=false,libpng"
>> +PACKAGECONFIG[benchmarks] = 
>> "-Dbenchmarks=true,-Dbenchmarks=false,libpng"
>> +
>> +PACKAGE_BEFORE_PN += "${PN}-examples"
>> +ALLOW_EMPTY:${PN}-examples = "1"
>> +FILES:${PN}-examples = "${bindir}"
>> +
>> +NEATVNC_EXAMPLES = "draw png-server"
>> +
>> +inherit meson pkgconfig
>> +
>> +do_install:append () {
>> +    if ${@bb.utils.contains('PACKAGECONFIG', 'examples', 'true', 
>> 'false', d)}; then
>> +        install -d ${D}${bindir}
>> +        for bin in ${NEATVNC_EXAMPLES}; do
>> +            install -m 0755 ${B}/examples/$bin ${D}${bindir}
>> +        done
>> +    fi
>> +}
>> +
>> +BBCLASSEXTEND = "native"
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#186621): 
>> https://lists.openembedded.org/g/openembedded-core/message/186621
>> Mute This Topic: https://lists.openembedded.org/mt/100918320/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub 
>> [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
-- 
Leon Anavi
Software Engineer
konsulko.com


