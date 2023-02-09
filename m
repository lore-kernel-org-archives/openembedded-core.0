Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7906C636D4
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 09:19:10 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.10275.1675934341028701828
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 01:19:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k1sP6xt1;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id o20so2322533lfk.5
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 01:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KNGbihILNYFga/TGkCcVn+5dXxr9H4Oa/ofeWyXFmpU=;
        b=k1sP6xt1EaPS6cDYIjZlt2BpB3qg4Y6NV/drV7k4kcfZPEGh4wsNsMWq9sGFsXvvv/
         CoQTAYv1h1D3G6Qq09IhI7WNrA845/i2EMhWFLTojLgu9kzSSFkoZ9yemJf176bWiHDA
         FhXCBfCYlRfCUKNTdMTKBd4mZELb7CAj7uEs6BJ+ctrr8AORsoCsnnA049PURgqYDOho
         wvtZnQRo7dIuETz63RQqDnLJvjT5imng3jIFz8cmUh0wz+8ZbQ+j/YkUP3I249avmDAq
         k8jo3ygyI0F8MwCMormGxSZrtxOxpcU9WQYwN/i9v6HHAjWcuREt/MIqrdX3YcVzt/eJ
         nN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KNGbihILNYFga/TGkCcVn+5dXxr9H4Oa/ofeWyXFmpU=;
        b=4CS1EvbZSEXEaIRkIpP82YeO6HscMXyNpJWvbPVGDlXv/VrkNwx7/znGti4LDsawq4
         vJIOynibSGRAHCTVwispUrZNpMcYYC68KGug3bPpMKcTMvuTP0qjNx+djLaYPQ7x2Iqa
         ds5axlEaxD/96n9peacF5P29TjlaJPoEviUAnPr7glU7opHOYeK45IvhCyv5PDe0WS32
         tAKU01mKCUTwg3Ooz2k0z79fD4LPdA70t1R4iZuISjeXwedGTW10r4pHdg3oJcIxfK7+
         TsbfB7Qb1IOUK8ZbugGGvI9zSyyYoQjvU/ji6CtQ4DWZ7nIOref/Tv28XzZFwDTeI2Tf
         8MYQ==
X-Gm-Message-State: AO0yUKXuRlwu5EZDbs/CqBLDuC8793tNMrF0lNRL+mk1LRSyBdXrpnvM
	7ohqw2xmBVP2Q0gce6FfFChiwI2Mcj/uiwqYUok=
X-Google-Smtp-Source: AK7set8tGpLuQ6Q5ql3IE68DPnuw3ULuspIEOOZSr2YJlIZfdE722Z+sSAxyp6OZOBm49xisUprzZnxZDYLr3rHh410=
X-Received: by 2002:ac2:4944:0:b0:4db:ee9:767f with SMTP id
 o4-20020ac24944000000b004db0ee9767fmr1140472lfi.202.1675934339194; Thu, 09
 Feb 2023 01:18:59 -0800 (PST)
MIME-Version: 1.0
References: <20230209082615.148916-1-sdoshi@mvista.com>
In-Reply-To: <20230209082615.148916-1-sdoshi@mvista.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 9 Feb 2023 10:18:47 +0100
Message-ID: <CANNYZj_YnM0B7j2Cv9=vjwJkyEB89uq4g_nTpmYai12S_NXZEg@mail.gmail.com>
Subject: Re: [OE-core] [[langdale][PATCH]] Upgrade OpenSSL 3.0.7 -> 3.0.8
To: mv <sdoshi@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 09:19:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176932

Thank you, but please submit for master first, and only then for LTS branches.

Alex

On Thu, 9 Feb 2023 at 09:26, mv <sdoshi@mvista.com> wrote:
>
> From: Siddharth Doshi <sdoshi@mvista.com>
>
> OpenSSL 3.0.8 fixes 1 HIGH level security vulnerability and 7 MODERATE level security vulnerability [1].
>
> Upgrade the recipe to point to 3.0.8.
>
> CVE-2022-3996 is reported fixed in 3.0.8, so drop the patch for that as
> well.
>
> [1] https://www.openssl.org/news/vulnerabilities.html
>
> CVEs Fixed:
> https://www.openssl.org/news/secadv/20230207.txt
>
> Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> ---
>  .../openssl/openssl/CVE-2022-3996.patch       | 43 -------------------
>  .../{openssl_3.0.7.bb => openssl_3.0.8.bb}    |  2 +-
>  2 files changed, 1 insertion(+), 44 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch
>  rename meta/recipes-connectivity/openssl/{openssl_3.0.7.bb => openssl_3.0.8.bb} (99%)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch
> deleted file mode 100644
> index 6d70b323d1..0000000000
> --- a/meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From 7725e7bfe6f2ce8146b6552b44e0d226be7638e7 Mon Sep 17 00:00:00 2001
> -From: Pauli <pauli@openssl.org>
> -Date: Fri, 11 Nov 2022 09:40:19 +1100
> -Subject: [PATCH] x509: fix double locking problem
> -
> -This reverts commit 9aa4be691f5c73eb3c68606d824c104550c053f7 and removed the
> -redundant flag setting.
> -
> -Fixes #19643
> -
> -Fixes LOW CVE-2022-3996
> -
> -Reviewed-by: Dmitry Belyavskiy <beldmit@gmail.com>
> -Reviewed-by: Tomas Mraz <tomas@openssl.org>
> -(Merged from https://github.com/openssl/openssl/pull/19652)
> -
> -(cherry picked from commit 4d0340a6d2f327700a059f0b8f954d6160f8eef5)
> -
> -Upstream-Status: Backport [https://github.com/openssl/openssl/commit/7725e7bfe6f2ce8146b6552b44e0d226be7638e7]
> -CVE: CVE-2022-3996
> -Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> ----
> - crypto/x509/pcy_map.c | 4 ----
> - 1 file changed, 4 deletions(-)
> -
> -diff --git a/crypto/x509/pcy_map.c b/crypto/x509/pcy_map.c
> -index 05406c6493..60dfd1e320 100644
> ---- a/crypto/x509/pcy_map.c
> -+++ b/crypto/x509/pcy_map.c
> -@@ -73,10 +73,6 @@ int ossl_policy_cache_set_mapping(X509 *x, POLICY_MAPPINGS *maps)
> -
> -     ret = 1;
> -  bad_mapping:
> --    if (ret == -1 && CRYPTO_THREAD_write_lock(x->lock)) {
> --        x->ex_flags |= EXFLAG_INVALID_POLICY;
> --        CRYPTO_THREAD_unlock(x->lock);
> --    }
> -     sk_POLICY_MAPPING_pop_free(maps, POLICY_MAPPING_free);
> -     return ret;
> -
> ---
> -2.30.2
> -
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.7.bb b/meta/recipes-connectivity/openssl/openssl_3.0.8.bb
> similarity index 99%
> rename from meta/recipes-connectivity/openssl/openssl_3.0.7.bb
> rename to meta/recipes-connectivity/openssl/openssl_3.0.8.bb
> index 1842148592..c80df7b2ae 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.0.7.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.0.8.bb
> @@ -19,7 +19,7 @@ SRC_URI:append:class-nativesdk = " \
>             file://environment.d-openssl.sh \
>             "
>
> -SRC_URI[sha256sum] = "83049d042a260e696f62406ac5c08bf706fd84383f945cf21bd61e9ed95c396e"
> +SRC_URI[sha256sum] = "6c13d2bf38fdf31eac3ce2a347073673f5d63263398f1f69d0df4a41253e4b3e"
>
>  inherit lib_package multilib_header multilib_script ptest perlnative
>  MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176928): https://lists.openembedded.org/g/openembedded-core/message/176928
> Mute This Topic: https://lists.openembedded.org/mt/96849339/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

