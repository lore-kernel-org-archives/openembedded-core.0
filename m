Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 664AAC636D3
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 18:38:39 +0000 (UTC)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
 by mx.groups.io with SMTP id smtpd.web11.25092.1675967914935214192
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 10:38:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=jYjn6Ic8;
 spf=pass (domain: gmail.com, ip: 209.85.221.175, mailfrom: sakoman@gmail.com)
Received: by mail-vk1-f175.google.com with SMTP id 9so1411954vkq.9
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 10:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8WmZmIFjL/JDHv/fL9V3RHMWoe1O/wCJsAgpg7ToF4M=;
        b=jYjn6Ic85OagniWuzfYV0Qw8OLOPcymrut+f2LBOntJ+2PuJyoK/maedWjcLCfsWFK
         oiskKtmZfp26HXQhKFkcobpn+USnAsHBvZg+g0q7ejxnCv9Nnuw3H7fw2r81pDZDWtUO
         fQxizap93MQ+2Q2Yxp9Zx+qNfpfqFftPomP2bt6Xfgwd83NctabQXZM05XJ1xCXVKPYG
         w9JHtsLEsJfsQts3r26xe7v4kQ2BIbRyabsicuQuAW6G1vKR3rQBtfej4qI8ea8n714I
         QZUYAN4Kx25Pfcfe0dGHLV4VeosxLAY97SCO2C9jxkdy+5/2nhzWXA+Wx7PV2EwH9DhO
         rejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8WmZmIFjL/JDHv/fL9V3RHMWoe1O/wCJsAgpg7ToF4M=;
        b=s5Z71yzOeuYZkoBGSywg+SgojqFBh1pJOBcrJ5Jn5hUt/ZL5yAmIVD80/zTfI/B81+
         Bs90CfSAzbpsd308WUG+Lg1aTyCeM6rgMO/D0S9nBVpyIMTK1GFgP14WL+9dFqjqgLu8
         AhRS7TjYdMigb0yO9U0xmAkDCdCwQVDfl/AxdvK1NXkctZdR5m7koG8J230Fn3U7SLGt
         fZ1vC7yFKk87PUnRNDuYVOfNYOiSNNnRFCSDnpJ+D6BixnO8tUn3yLRpedf5Lt5JifiB
         3XLN1L4NpyQKsr2ykQSHZ1qMP9WJpuALCNo3bUVhpbgwSMYo8NJPWh1dz7e5EX211P0O
         VUYg==
X-Gm-Message-State: AO0yUKXbe5yPA0JsydqRSOQ5J37IY/r5uTZ9zkzQCrEQnd2+3GepKv9i
	YnitWZh0xOZnB7vw8PL5ZURBqKUbvROaBBAsw9eGYSHL/Zc=
X-Google-Smtp-Source: AK7set90nqYWH25Ai5uG+LMNDb1tYlG4i8McnkQcdCxiFDh8iXItsPSKGIuC9FDTqUrbb06wPE3riohXyPSatMd3kWs=
X-Received: by 2002:a1f:9cc5:0:b0:3ea:66ca:37d5 with SMTP id
 f188-20020a1f9cc5000000b003ea66ca37d5mr2461781vke.33.1675967913731; Thu, 09
 Feb 2023 10:38:33 -0800 (PST)
MIME-Version: 1.0
References: <20230209143708.20705-1-sdoshi@mvista.com>
In-Reply-To: <20230209143708.20705-1-sdoshi@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 9 Feb 2023 08:38:22 -1000
Message-ID: <CAGDS+nkrnTfUH8_y4XzFtNEcOVdA2F91W8zDPyU67_zYwgDRBQ@mail.gmail.com>
Subject: Re: [OE-core] [langdale][PATCH-v2] Upgrade OpenSSL 3.0.7 -> 3.0.8
To: mv <sdoshi@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 18:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176968

One additional comment on the content of your subject line:

You should start with the base recipe name so reviewers know what
recipe you are changing, so something like "openssl: upgrade 3.0.7 ->
3.0.8"  would be appropriate for this patch.

Thanks!

Steve


On Thu, Feb 9, 2023 at 4:37 AM mv <sdoshi@mvista.com> wrote:
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
>  .../{openssl_3.0.7.bb => openssl_3.0.8.bb}    |  3 +-
>  2 files changed, 1 insertion(+), 45 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch
>  rename meta/recipes-connectivity/openssl/{openssl_3.0.7.bb => openssl_3.0.8.bb} (98%)
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
> similarity index 98%
> rename from meta/recipes-connectivity/openssl/openssl_3.0.7.bb
> rename to meta/recipes-connectivity/openssl/openssl_3.0.8.bb
> index 1842148592..8771884dda 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.0.7.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.0.8.bb
> @@ -12,14 +12,13 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
>             file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
>             file://afalg.patch \
>             file://0001-Configure-do-not-tweak-mips-cflags.patch \
> -           file://CVE-2022-3996.patch \
>             "
>
>  SRC_URI:append:class-nativesdk = " \
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
> View/Reply Online (#176955): https://lists.openembedded.org/g/openembedded-core/message/176955
> Mute This Topic: https://lists.openembedded.org/mt/96853888/3617601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sakoman@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

