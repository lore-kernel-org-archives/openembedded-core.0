Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D563C43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 08:50:42 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.88146.1783068635979997224
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 01:50:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pkWCW8lg;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so2379505e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 01:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783068634; x=1783673434; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1U0NhtkRap0y6N4x0Y3N24enB7Qj137Q9NtuQEXRfs=;
        b=pkWCW8lgmFsOEZYeiduvDWrrmbEcUYHA5PZy1tDb1r6eIQf1xnP4eHa8d4xpp2XKXg
         41ff/8Xjh/9+IF0evxgpBXUlyX3d4CpoOazQErH7gIG3BHvpCvXzmd1XTHVhIRTxPhqU
         n+KS7gz+vODsQ9nQNwc1L5NvKda+nMVEi8UOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068634; x=1783673434;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B1U0NhtkRap0y6N4x0Y3N24enB7Qj137Q9NtuQEXRfs=;
        b=Ba4xXBz09FEc/w/olI2xW0oalaIcbuGtJ0rloxcoYsASLuIfJERNZSVEQ2HnJ7/JJU
         +UpnduFEAzbjvmTVZIFVn7cpaKRYiO3pBq0Is3Ff7elkNQdebHjWDsrdtwCpwTmcF2Vg
         KaojE7Qc8+eZiMbmJNqVrIUX2YwmP9vclY73SPTUVcRmhU/AbrsNEBbSBaSuUIeaB3pt
         Ztq7aRKWVvcsYXXjqJAKDD2gKSZAQeLqaP+0AV/qJzbi5rN6/obhG7jgomZp5+aHK5tK
         eUVbQiJUtvr8SppBE7x3CDF3+v3TWZJQoyuv9S9u9z4tPwR2xQ7f7WQlxRF6xQ+Cz/9k
         3jUg==
X-Forwarded-Encrypted: i=1; AFNElJ9DtcRUloOz6MFflrQlQZJsadKR4v7MRDnWB5J6Te2Vu5l8kMBd3qOrWAPfnCySlL1QX0aPXppaWdsZDfx3FxVXMA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzRhMoYDGb51H6dtAZmSgRdBWgF3nkARgFXW+l9Gn6ClzxXzkJR
	GGdx2SjWhmXKfBEHnU9zP2OuD881BgJcKDbPxC3EbNZZYqWk8lWvuT6juufKJpvGPj0=
X-Gm-Gg: AfdE7ckhly3wqbNoqT2ATtIghwwGNzh/I50lar6SMB+rz/PqECy30ehrg9BQzom28Jn
	lwyFVJSKVUVRmHAxEXPHGMD6RrVGacIbsZ7kdLJjVC5eLOzMOEOKditgncM+3TApNxlxYSBggSG
	TKJ7rLfsVJEDsKSYDzD3djlo2ciKTZfPzHDLGtAHvyf38h20E47qgZmR1Cv8WFi+CAdJF+NDC2t
	E8YZYKVbE3n0EcM0dvCfWTkqq7hZINhDuCZCXxEYahCCmLnv2rI/aZkvkK0lHCNdrbtUmg3AziF
	4FuJ6A2FNqVnB+eXfPqULyT9nRHsM7GhA+R/DvzV6cVUv/hv7Z7IKXh0uUtOBu4NallaCP4MBpp
	TT5adPEIkhS6juxSviAIrKs/8rSy0lLHkM0AyrbcyzcqfUszzkhAStjiTYBSFoo3XX+MrLMVNKv
	isSY57P+nieqKCAYK3kJ4UWjcvj10P/uH7Lk8JqWOCk8N5ho/PTnbrUPB6O8q3LJGzsDe5Ls9/K
	Cujkg==
X-Received: by 2002:a05:600c:4690:b0:493:bee0:4360 with SMTP id 5b1f17b1804b1-493c9b6c137mr45188455e9.17.1783068633743;
        Fri, 03 Jul 2026 01:50:33 -0700 (PDT)
Received: from localhost (2a01cb001331aa0075403fb2c9c4e210.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:7540:3fb2:c9c4:e210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdab3a8sm35911775e9.6.2026.07.03.01.50.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 01:50:33 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Jul 2026 10:50:32 +0200
Message-Id: <DJOT2TN5WGAT.3LHSPDSQB54O3@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH v3] curl: fix CVE-2026-5773 - wrong
 reuse of SMB connection
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <jaipaul.cheernam@est.tech>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260623120850.29881-1-jaipaul.cheernam@est.tech>
 <20260624075504.63472-1-jaipaul.cheernam@est.tech>
In-Reply-To: <20260624075504.63472-1-jaipaul.cheernam@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 08:50:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240098

On Wed Jun 24, 2026 at 9:55 AM CEST, Jaipaul Cheernam via lists.openembedde=
d.org wrote:
> Remove PROTOPT_CONN_REUSE from SMB handler flags to prevent
> connection pooling. Without this, a second SMB request to the same
> host reuses a connection authenticated for a different share.
>
> Reference: https://curl.se/docs/CVE-2026-5773.html
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---
>  .../curl/curl/CVE-2026-5773.patch             | 48 +++++++++++++++++++
>  meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
>  2 files changed, 49 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-5773.patch

Hello,

This patch does not apply cleanly on the lastest origin/wrynose:
commit 5d1aa5c806c0 ("build-appliance-image: Update to wrynose head revisio=
ns")):
|  $ bitbake -cpatch curl
| [...]
| ERROR: curl-8.19.0-r0 do_patch: QA Issue: Fuzz detected:
|=20
| Applying patch CVE-2026-5773.patch
| patching file lib/smb.c
| Hunk #2 succeeded at 1259 with fuzz 1.
|=20
|=20
| The context lines in the patches can be updated with devtool:
|=20
|     devtool modify curl
|     devtool finish --force-patch-refresh curl <layer_path>
|=20
| Don't forget to review changes done by devtool!
|=20
| Patch log indicates that patches do not apply cleanly. [patch-fuzz]
| ERROR: curl-8.19.0-r0 do_patch: Fatal QA errors were found, failing task.

Can you rebase and send a v4?

Thanks!

>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-5773.patch b/meta/re=
cipes-support/curl/curl/CVE-2026-5773.patch
> new file mode 100644
> index 0000000000..970e04b33f
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-5773.patch
> @@ -0,0 +1,48 @@
> +From 74a169575d6412dc0ff532acdf94de35a6c2a571 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Sun, 5 Apr 2026 18:23:35 +0200
> +Subject: [PATCH] protocol: disable connection reuse for SMB(S)
> +
> +Connections should only be reused when using the same "share" (and
> +perhaps some additional conditions), but instead of fixing this flaw,
> +this change completely disables connection reuse for SMB. This protocol
> +is about to get dropped soon anyway.
> +
> +Reported-by: Osama Hamad
> +Closes #21238
> +Signed-off-by: Daniel Stenberg <daniel@haxx.se>
> +
> +CVE: CVE-2026-5773
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/74a169575=
d6412dc0ff532acdf94de35a6c2a571]
> +
> +Note: The upstream fix targets lib/protocol.c which was introduced in
> +curl 8.20.0. In 8.19.0 the SMB handler flags are still in lib/smb.c,
> +so this patch removes PROTOPT_CONN_REUSE there instead. The effect is
> +identical: SMB connections are no longer pooled for reuse.
> +
> +Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> +---
> + lib/smb.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/lib/smb.c b/lib/smb.c
> +index ccd4f3f69d..2a9f08388f 100644
> +--- a/lib/smb.c
> ++++ b/lib/smb.c
> +@@ -1242,7 +1242,7 @@
> + #endif
> +   CURLPROTO_SMB,                        /* protocol */
> +   CURLPROTO_SMB,                        /* family */
> +-  PROTOPT_CONN_REUSE,                   /* flags */
> ++  PROTOPT_NONE,                         /* flags */
> +   PORT_SMB,                             /* defport */
> + };
> +=20
> +@@ -1259,7 +1259,7 @@
> + #endif
> +   CURLPROTO_SMBS,                       /* protocol */
> +   CURLPROTO_SMB,                        /* family */
> +-  PROTOPT_SSL | PROTOPT_CONN_REUSE,     /* flags */
> ++  PROTOPT_SSL,                          /* flags */
> +   PORT_SMBS,                            /* defport */
> + };
> diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-supp=
ort/curl/curl_8.19.0.bb
> index d58b774011..3326f478b5 100644
> --- a/meta/recipes-support/curl/curl_8.19.0.bb
> +++ b/meta/recipes-support/curl/curl_8.19.0.bb
> @@ -15,6 +15,7 @@ SRC_URI =3D " \
>      file://disable-tests \
>      file://no-test-timeout.patch \
>      file://CVE-2026-6276.patch \
> +    file://CVE-2026-5773.patch \
>      file://mbedtls.patch \
>  "
> =20


--=20
Yoann Congal
Smile ECS


