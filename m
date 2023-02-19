Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48550C61DA4
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 14:13:19 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.32968.1676815991885629099
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 06:13:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Vpysi7XB;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.43, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f43.google.com with SMTP id et7so2737377edb.9
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 06:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i5PPZybvYluHWTxu0V0L9LbFoxEmzyF+kyJXy/4oBpQ=;
        b=Vpysi7XB3HAF198HlS11iYLgOI3uCbyP3T3d/yM7+UMnQeT58wSV4UXSQBAPHt7rZV
         Jc1Uz9Gi9UEeSa2YYKneaZ35Ipcx9XhhWgM+t9qPC6cha3JERBbWDQRjPpZ6J4YFcaP3
         +/hD+GltD2TYJwl75vUoI+v4r698ztnKkgUL0FG34bxQb8qOAlPxoq7JF8e39r7CJpBA
         td3Ua+BoUYRBH2c6mmF+DtEf1ErOLryESqAXcc6z5Qlao/oJMbe1T448kBuan3bkdTpR
         7JJGnq63eyqc/tAkMO7QZVjoVEpBodblxGyfC/hGHK3WkYn/FEJ+MtQWB59mG5N9+a/D
         abkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i5PPZybvYluHWTxu0V0L9LbFoxEmzyF+kyJXy/4oBpQ=;
        b=qhSzxqMuSGcak6BJiZL5lmBDbdlgmwspzlyBiQjQ/Yuvew50Yr+JqEd31/SgxS/hpt
         1f8DR2ijlDnAK3DUNUEFWk0vsYm3YIHjz0SHGGE6Cm8nrJGeMljkr76IaiFCm+hfYtRO
         z+9bwbFlDaZTWZOFElSvZG9r2jpH5YPP+EucC7Rwtaf/9PXhNI4YVShBoqwa2TYHDWOK
         FQETxblsXFu+aH7UEH6w7eMPbTWvvsLHG/3xmYMqFbb1IQlnpqe3FQGkF2c9QLFP3E0B
         GOtQLEmrMXQjOq99pElHxVia7t2BO3zQpubdt9ebmyp4yTK5D7n4mhYRd8yBdAU58jS2
         EUfg==
X-Gm-Message-State: AO0yUKUkjQtufkk5p0gAD+U7ZAzF6cjZcgt0UATHfmCxNTs4E4vBk8lK
	Xj4vGQl9D/0ZTRQAJSRzpeVoyTfF7LGER5gm3DP/7g==
X-Google-Smtp-Source: AK7set+Z2WFy3R5+KuFxm6X9LLewdaT93QRBcXBD8xVURbA715rV4uIqMeJNdxnTKlWTVUIUWQQCQTyXASLbrFSnOJ8=
X-Received: by 2002:a50:9f05:0:b0:4ac:cdd8:fbb5 with SMTP id
 b5-20020a509f05000000b004accdd8fbb5mr72446edf.3.1676815989743; Sun, 19 Feb
 2023 06:13:09 -0800 (PST)
MIME-Version: 1.0
References: <20230209080022.147333-1-sdoshi@mvista.com> <CA+chaQfPjoRQfsYrnqDwMq6OiE5JtR0mFMXQsrHOOuA-0CSgyA@mail.gmail.com>
In-Reply-To: <CA+chaQfPjoRQfsYrnqDwMq6OiE5JtR0mFMXQsrHOOuA-0CSgyA@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Sun, 19 Feb 2023 04:12:58 -1000
Message-ID: <CAOSpxdbUkXEn0uEfzN21jncJ_n8Ur66uskWZ4b7KGKN+1w3_MQ@mail.gmail.com>
Subject: Re: [OE-core] [[kirkstone][PATCH] openssl : Upgrade OpenSSL 3.0.7 ->
 3.0.8] openssl: Upgrade 3.0.7 -> 3.0.8
To: Martin Jansa <martin.jansa@gmail.com>
Cc: mv <sdoshi@mvista.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 14:13:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177329

On Sun, Feb 19, 2023 at 2:36 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Hello Steve, Siddharth,
>
> are you waiting for PATCHv3 with commit summary update requested in corresponding langdale review:
> https://patchwork.yoctoproject.org/project/oe-core/patch/20230209143708.20705-1-sdoshi@mvista.com/?
>
> or is something else blocking this upgrade?
>
> I'm a bit surprised that this high security issue wasn't yet merged even in oe-core/master-next and I don't see it in oe-core-contrib/stable/kirkstone-nut nor oe-core-contrib/stable/langdale-nut.

If a patch is intended for multiple branches I typically wait until
master has merged the patch before taking it into the other branches.

So that is why it isn't yet in langdale/kirkstone.

Steve

> Siddharth are you going to send v3 of all 3 (or should I send them)?
> https://patchwork.yoctoproject.org/project/oe-core/list/?series=&submitter=&state=&q=3.0.8&archive=&delegate=
> if that's all what is needed to get this merged?
>
> Regards,
>
> On Thu, Feb 9, 2023 at 9:00 AM mv <sdoshi@mvista.com> wrote:
>>
>> From: Siddharth Doshi <sdoshi@mvista.com>
>>
>> OpenSSL 3.0.8 fixes 1 HIGH level security vulnerability and 7 MODERATE level security vulnerability [1].
>>
>> Upgrade the recipe to point to 3.0.8.
>>
>> CVE-2022-3996 is reported fixed in 3.0.8, so drop the patch for that as
>> well.
>>
>> [1] https://www.openssl.org/news/vulnerabilities.html
>>
>> CVEs Fixed:
>> https://www.openssl.org/news/secadv/20230207.txt
>>
>> Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
>> ---
>>  .../openssl/openssl/CVE-2022-3996.patch       | 43 -------------------
>>  .../{openssl_3.0.7.bb => openssl_3.0.8.bb}    |  2 +-
>>  2 files changed, 1 insertion(+), 44 deletions(-)
>>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch
>>  rename meta/recipes-connectivity/openssl/{openssl_3.0.7.bb => openssl_3.0.8.bb} (99%)
>>
>> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch
>> deleted file mode 100644
>> index 6d70b323d1..0000000000
>> --- a/meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch
>> +++ /dev/null
>> @@ -1,43 +0,0 @@
>> -From 7725e7bfe6f2ce8146b6552b44e0d226be7638e7 Mon Sep 17 00:00:00 2001
>> -From: Pauli <pauli@openssl.org>
>> -Date: Fri, 11 Nov 2022 09:40:19 +1100
>> -Subject: [PATCH] x509: fix double locking problem
>> -
>> -This reverts commit 9aa4be691f5c73eb3c68606d824c104550c053f7 and removed the
>> -redundant flag setting.
>> -
>> -Fixes #19643
>> -
>> -Fixes LOW CVE-2022-3996
>> -
>> -Reviewed-by: Dmitry Belyavskiy <beldmit@gmail.com>
>> -Reviewed-by: Tomas Mraz <tomas@openssl.org>
>> -(Merged from https://github.com/openssl/openssl/pull/19652)
>> -
>> -(cherry picked from commit 4d0340a6d2f327700a059f0b8f954d6160f8eef5)
>> -
>> -Upstream-Status: Backport [https://github.com/openssl/openssl/commit/7725e7bfe6f2ce8146b6552b44e0d226be7638e7]
>> -CVE: CVE-2022-3996
>> -Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
>> ----
>> - crypto/x509/pcy_map.c | 4 ----
>> - 1 file changed, 4 deletions(-)
>> -
>> -diff --git a/crypto/x509/pcy_map.c b/crypto/x509/pcy_map.c
>> -index 05406c6493..60dfd1e320 100644
>> ---- a/crypto/x509/pcy_map.c
>> -+++ b/crypto/x509/pcy_map.c
>> -@@ -73,10 +73,6 @@ int ossl_policy_cache_set_mapping(X509 *x, POLICY_MAPPINGS *maps)
>> -
>> -     ret = 1;
>> -  bad_mapping:
>> --    if (ret == -1 && CRYPTO_THREAD_write_lock(x->lock)) {
>> --        x->ex_flags |= EXFLAG_INVALID_POLICY;
>> --        CRYPTO_THREAD_unlock(x->lock);
>> --    }
>> -     sk_POLICY_MAPPING_pop_free(maps, POLICY_MAPPING_free);
>> -     return ret;
>> -
>> ---
>> -2.30.2
>> -
>> diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.7.bb b/meta/recipes-connectivity/openssl/openssl_3.0.8.bb
>> similarity index 99%
>> rename from meta/recipes-connectivity/openssl/openssl_3.0.7.bb
>> rename to meta/recipes-connectivity/openssl/openssl_3.0.8.bb
>> index 1842148592..c80df7b2ae 100644
>> --- a/meta/recipes-connectivity/openssl/openssl_3.0.7.bb
>> +++ b/meta/recipes-connectivity/openssl/openssl_3.0.8.bb
>> @@ -19,7 +19,7 @@ SRC_URI:append:class-nativesdk = " \
>>             file://environment.d-openssl.sh \
>>             "
>>
>> -SRC_URI[sha256sum] = "83049d042a260e696f62406ac5c08bf706fd84383f945cf21bd61e9ed95c396e"
>> +SRC_URI[sha256sum] = "6c13d2bf38fdf31eac3ce2a347073673f5d63263398f1f69d0df4a41253e4b3e"
>>
>>  inherit lib_package multilib_header multilib_script ptest perlnative
>>  MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
>> --
>> 2.25.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#176918): https://lists.openembedded.org/g/openembedded-core/message/176918
>> Mute This Topic: https://lists.openembedded.org/mt/96849077/3617156
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Martin.Jansa@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

