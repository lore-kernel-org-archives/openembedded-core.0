Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F6BC433FE
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 15:42:07 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web09.12226.1664466121959027756
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 08:42:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z0GrXn0h;
 spf=pass (domain: gmail.com, ip: 209.85.160.173,
 mailfrom: danismostlikely@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id y2so1001212qtv.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 08:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date;
        bh=V5m7Pr8sATK4bD1wKmpi3465nvBHgd33mfVghuLVbLE=;
        b=Z0GrXn0hP9WqnKRGFZaDqkIe01DW9wL1P0iQlT3en0yKDGwzQgbrPhaw0i5d0U7tD9
         Z3OPe4fSNONFHrjmj4t4hRVuCtR5bIqphnPob6qnQ9M4tBDbXh4eGw8fNTwyAPjQod1L
         uzGqic6r6JPeLFrAqjB8MX0Z5RYHCeJWpCRgiEBoBiC1X6kL3tQ5FXURlxIvUZUmBuHC
         yWm8jtldYaZ/Kw9TOTpL8k73ITf8Ch/vN4N0BZpTL2JAtVWGCz/y9khGLsn2sTRPoRDd
         AW2PW7oMayuaq+vtPTdEc2/dyIQQ+7xXvxrn+mPSR/5SiodS/Eqn8BiJ9iy/UvBWUmZQ
         V49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=V5m7Pr8sATK4bD1wKmpi3465nvBHgd33mfVghuLVbLE=;
        b=NhBundA4kazcguc8RWS78A/zyprKaFOoJ11K8vxjLspwr2xE0TycNsPJ9JcK6Knsl1
         R64L1Kq/SL3BQGk1PsAKnZ92v0dBGq/UJ3sg7CJIR3bL3jwmdxqh73scxA1OfKkdcuO4
         ZZvnqOwxrni3e3IIHXtFFV33C0KJILn/tAThrH62pvpm9yXRsG26UtqjDL0fXgeB0253
         jXHen0DiQq2H97pO9e7xYrLA95kzIqg5NQmqeYt6GKzKEUX6lxoMENWptOzBmwY85JiY
         Jv86ZiH0kIumbAhz2E+a0bzZXMB8w0rOHYog9ZisD3y1c/0uQ2UWarBdyGznrk3tmyp2
         d37A==
X-Gm-Message-State: ACrzQf3cqrb48/x4RG6x8wvg8O/a5yrFLsACDUP4xK4bPB4uFW/+4i4a
	iuuMVubXr5TcRGaIRWF56ycNGsozZio=
X-Google-Smtp-Source: 
 AMsMyM5eb6KaeQK6h3pCjj7wtymA9+sS5EN0/Yh4hwZFAr2E0FdjumekVX4H1B0IYDFUlWp5COiKCg==
X-Received: by 2002:a05:622a:15d4:b0:35c:dda3:7bc5 with SMTP id
 d20-20020a05622a15d400b0035cdda37bc5mr2944493qty.676.1664466120997;
        Thu, 29 Sep 2022 08:42:00 -0700 (PDT)
Received: from git.shadrach.duckdns.org ([204.83.204.148])
        by smtp.gmail.com with ESMTPSA id
 b188-20020ae9ebc5000000b006b58d8f6181sm5915857qkg.72.2022.09.29.08.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 08:42:00 -0700 (PDT)
Date: Thu, 29 Sep 2022 09:41:58 -0600 (CST)
From: Dan McGregor <danismostlikely@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: openembedded-core@lists.openembedded.org,
    Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: Re: [OE-core] [PATCH 3/3] systemd: generate manpages indexes
In-Reply-To: 
 <f272f8ecb7f5dd8c34b6abfb64d89f8bc209bdd7.camel@linuxfoundation.org>
Message-ID: <712a80b5-7b54-be2b-99c3-3d35ff935b0c@gmail.com>
References: <20220928221320.1763684-1-danismostlikely@gmail.com>
 <20220928221320.1763684-3-danismostlikely@gmail.com>
 <f272f8ecb7f5dd8c34b6abfb64d89f8bc209bdd7.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 15:42:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171194

On Thu, 29 Sep 2022, Richard Purdie wrote:

> On Wed, 2022-09-28 at 16:13 -0600, Dan McGregor wrote:
>> From: Daniel McGregor <daniel.mcgregor@vecima.com>
>>
>> Now that python3-lxml is in core, use it to generate
>> systemd.directives and systemd.index manual pages.
>>
>> Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
>> ---
>>  meta/recipes-core/systemd/systemd_251.4.bb | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/systemd/systemd_251.4.bb b/meta/recipes-core/systemd/systemd_251.4.bb
>> index 910ea71bf64..b4ad7e45eb0 100644
>> --- a/meta/recipes-core/systemd/systemd_251.4.bb
>> +++ b/meta/recipes-core/systemd/systemd_251.4.bb
>> @@ -159,7 +159,10 @@ PACKAGECONFIG[localed] = "-Dlocaled=true,-Dlocaled=false"
>>  PACKAGECONFIG[logind] = "-Dlogind=true,-Dlogind=false"
>>  PACKAGECONFIG[lz4] = "-Dlz4=true,-Dlz4=false,lz4"
>>  PACKAGECONFIG[machined] = "-Dmachined=true,-Dmachined=false"
>> -PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
>> +PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,python3-lxml-native xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
>> +# Ensure we're seeing the XML catalog from the build system and not the host.
>> +# Otherwise, the build may fail generating the manpages.
>> +export XML_CATALOG_FILES="${STAGING_ETCDIR_NATIVE}/xml/catalog"
>
> Wasn't there a fix that means this isn't required now?
>
> https://git.yoctoproject.org/poky/commit/?id=544c3255b1b1d2be7d7c77f0d64cc4a11a947887
> https://git.yoctoproject.org/poky/commit/?id=fbc8f3d395711db00cae32d2502588ea9b61b1da

Could be, I've been sitting on this change for *years*, but haven't 
submitted it because python3-lxml wasn't in core. Last time I tested 
without setting XML_CATALOG_FILES it failed, but now I see that I also 
removed libxslt-native from the PACKAGECONFIG depends list. I'll test 
with libxslt-native and without setting XML_CATALOG_FILES and probably 
send a v2.

>
> Cheers,
>
> Richard
>

