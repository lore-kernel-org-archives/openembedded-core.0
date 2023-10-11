Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3AB9CD98FA
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 07:51:09 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.11625.1697010668441891649
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Oct 2023 00:51:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N07OYFz8;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2c16757987fso82622221fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 00:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697010666; x=1697615466; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i3nl3RswCqTUkeuUMkgpUkdtwfT8Pf9C68Qw+IwwyW8=;
        b=N07OYFz8KVl7NCDZp3SHzFD2nyoGjVKkyzIxz4GqE2aRpgb0p+vhppZ9H8609AV6LX
         FQ/IlYkJJKxusksGxMZvQiyxRejudbMxhliGXm6kNPODyw4xj0GvBb9Unu9SJpb10Vob
         KEOyb+cl3Qcr/ulxwQkX87WFLT81ZMbxmGaPUB7IwR5PsQRmIb2TisspFT5cUTJNPwRe
         Fwa1VE9DB9g8ovZGuUxe6Vgcqxtk8qn/J/cchE7pwvWp3iwg96gIzxwKaqjpfa83y3F2
         MWXBkS7roxfEpB8YMvM7V48yJzueOFJBp5s5napASwbHFmqj+jic+fNotAg/ZXvEzsKA
         ZjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697010666; x=1697615466;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i3nl3RswCqTUkeuUMkgpUkdtwfT8Pf9C68Qw+IwwyW8=;
        b=ujuuFMLCtGy8V2r0amr2pHIpM3ZQm8u6KwizfMMjV6V1RPmqe1SWrFSgTMPq5hXjZ1
         zokuHo9ti5Mb+Ebhay4kkwuY8c1FiviY1mYv1Gut933tBfnaJ4k6/MGbzgcOCnWle3XG
         xNoGljBXP3LzUG1Aoe37uEimyF3MHnRr/qz4sbNMG2JnHrH2q0ZmXME6K/tKIsapIzVx
         VQGSjgLVkyy/xjpLIC2GImXwFJFc/J3ZPamK7pRut7fXpBR9kU/XhyN6s/b9ZBasb82R
         k4Ou+sXmUXDqwungns2FuyyENxC723kJtlMTZJU/bhtu+nFkRhnDmsyjB6bCLDBjBCQE
         AjiQ==
X-Gm-Message-State: AOJu0Yxga6AdV0njjVg+95Qo6Gooq50/ArspFyvQ/Cf6+m5rOwsm3oUd
	u+qMr7yBUYns7WYMgyDCCRyHO6hX5Awj6e8Gl5U=
X-Google-Smtp-Source: AGHT+IH+yu5SNw9Vdk8Pv71XzRO/h63zskdjbWcLw1DvJeW4TSJ5HrJMkhNuHgfOywdKA0nFdpLMA0tc1PB+wu3vGsU=
X-Received: by 2002:a2e:87c3:0:b0:2c1:2995:b671 with SMTP id
 v3-20020a2e87c3000000b002c12995b671mr17872100ljj.42.1697010666363; Wed, 11
 Oct 2023 00:51:06 -0700 (PDT)
MIME-Version: 1.0
References: <20231006123214.57198-1-pramanik.souravkumar@gmail.com>
In-Reply-To: <20231006123214.57198-1-pramanik.souravkumar@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 11 Oct 2023 09:50:55 +0200
Message-ID: <CANNYZj_pwdWWzVZH-1ORfH3OmzP8uJMfWxd+jsgT=doiYwsTog@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] openssl: Upgrade 1.1.1v -> 1.1.1w
To: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
Cc: openembedded-core@lists.openembedded.org, ranjitsinh.rathod@kpit.com, 
	Sourav Pramanik <sourav.pramanik@kpit.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 07:51:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188943

Note that with this release, openssl 1.1.1 reaches end of life:

https://www.openssl.org/blog/blog/2023/09/11/eol-111/

Alex

On Fri, 6 Oct 2023 at 14:32, Sourav Kumar Pramanik
<pramanik.souravkumar@gmail.com> wrote:
>
> From: Sourav Pramanik <sourav.pramanik@kpit.com>
>
> https://www.openssl.org/news/openssl-1.1.1-notes.html
>
> Major changes between OpenSSL 1.1.1v and OpenSSL 1.1.1w [11 Sep 2023]
>
> * Fix POLY1305 MAC implementation corrupting XMM registers on Windows (CVE-2023-4807)
>
> Signed-off-by: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
> ---
>  .../openssl/{openssl_1.1.1v.bb => openssl_1.1.1w.bb}            | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-connectivity/openssl/{openssl_1.1.1v.bb => openssl_1.1.1w.bb} (98%)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1v.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1w.bb
> similarity index 98%
> rename from meta/recipes-connectivity/openssl/openssl_1.1.1v.bb
> rename to meta/recipes-connectivity/openssl/openssl_1.1.1w.bb
> index d1222dc470..8a53b06862 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1v.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1w.bb
> @@ -26,7 +26,7 @@ SRC_URI_append_class-nativesdk = " \
>             file://environment.d-openssl.sh \
>             "
>
> -SRC_URI[sha256sum] = "d6697e2871e77238460402e9362d47d18382b15ef9f246aba6c7bd780d38a6b0"
> +SRC_URI[sha256sum] = "cf3098950cb4d853ad95c0841f1f9c6d3dc102dccfcacd521d93925208b76ac8"
>
>  inherit lib_package multilib_header multilib_script ptest
>  MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188763): https://lists.openembedded.org/g/openembedded-core/message/188763
> Mute This Topic: https://lists.openembedded.org/mt/101796386/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

