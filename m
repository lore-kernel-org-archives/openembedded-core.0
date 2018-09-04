Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id 03F317469B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 20:38:44 +0000 (UTC)
Received: by mail-vk0-f41.google.com with SMTP id 125-v6so1858954vke.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2018 13:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TatWDCLoNuo231By8hutMamRUjV1iihaae1EwcJ+4f8=;
	b=fdTuJRe2zGtk6DPyFE3nYRlBSqaSTDwwYRIs8DHz4C1Vb6e27A5tiBp6GPe1/ja6CK
	hvlscTGfV7Lxl5n8u6Z+LoNFfd/1cQqpvAPTQmn95DJqwGVx7slBfLM0ECNWvnyPr6Ms
	8222sIGXhPE+HP4Do/P1DtRPO/Gr57wX1VvAsoe4b1Xv1sJEElKhhvfPqHwC6BK2jPck
	i0exu4Turx63Pif0F5GgFkd03QI37wMHBootQZ4FJse7dbdnaVEssEz96DUX5zrlyAbG
	noIkak+B9ZnKZsKXAf4vQtD6BtJnAIq8lpkrqgaAx7uCWIlQX2eOooA0Ve8GZoCUV5VE
	VAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TatWDCLoNuo231By8hutMamRUjV1iihaae1EwcJ+4f8=;
	b=VWHdtRWAoIGYGNMwu5WMtm1V++rt8lXC3flTtT7bMW6d0zYAKrHGjHxpEHZ94jyC5h
	gqaFmXAKJ7pPWJCD1eqLd5XLspqV3jFPq2QvxfLWZzg9+tg1fPVf+9SB2CpdZsRnloGb
	j4L3dYAKa4ncWJiTBugX/De9Ymq9NQ6YW+51ORmPr/CCSWTW2AXELWchrvSsYLjo20fw
	ht29zlqtEstw4pW49IfoICi4SLDOiDl3WlMbEi21bbsRNSv2GlCMlA1bvQqDuXq7ggIh
	SC4MXuhit1luvI8BxFzXHXk4SEziPL74vku1FeSWaPvDa469/P60aCb+XFbhoafIRdcX
	FwKQ==
X-Gm-Message-State: APzg51BW6w820N8aWDydnykvFsI6Qa5t2ix+5le4KbebqXkFSmtU/7aa
	SVEXI/OntLeQk819SeD34s84dS1SzipSP1FbKFA=
X-Google-Smtp-Source: ANB0Vdb/BFwEXRs7/oeu+cgFnwkwrNd1KMbXND8OWVU3ueDSU9Kcf8qFhgIYXm99PMdk7q2BylgxiJdnPSiWQds5lrM=
X-Received: by 2002:a1f:c2:: with SMTP id 185-v6mr6178407vka.53.1536093525479; 
	Tue, 04 Sep 2018 13:38:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9f:3481:0:0:0:0:0 with HTTP;
	Tue, 4 Sep 2018 13:38:44 -0700 (PDT)
In-Reply-To: <1f7ed298deed1f23ccd6e67b4701985660abe575.1535451643.git.alex.kanavin@gmail.com>
References: <cover.1535451643.git.alex.kanavin@gmail.com>
	<1f7ed298deed1f23ccd6e67b4701985660abe575.1535451643.git.alex.kanavin@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 4 Sep 2018 13:38:44 -0700
Message-ID: <CAJ86T=XVPbDxD82w8h5ZgZNvf4sFKaYo9pBEWwT_aZjNTJYAdg@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 2/6] cryptodev-tests: port to openssl 1.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Sep 2018 20:38:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 28, 2018 at 3:23 AM, Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
> From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>
> This leaves openssh as the only recipe that requires openssl 1.0 (or libressl).
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  .../cryptodev/cryptodev-tests_1.9.bb               |   3 +-
>  .../files/0001-Port-tests-to-openssl-1.1.patch     | 103 +++++++++++++++++++++
>  2 files changed, 105 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-kernel/cryptodev/files/0001-Port-tests-to-openssl-1.1.patch
>
> diff --git a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.9.bb b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.9.bb
> index 9afb3de..617db6c 100644
> --- a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.9.bb
> +++ b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.9.bb
> @@ -2,10 +2,11 @@ require cryptodev.inc
>
>  SUMMARY = "A test suite for /dev/crypto device driver"
>
> -DEPENDS += "openssl10"
> +DEPENDS += "openssl"
>
>  SRC_URI += " \
>  file://0001-Add-the-compile-and-install-rules-for-cryptodev-test.patch \
> +file://0001-Port-tests-to-openssl-1.1.patch \
>  "
>
>  EXTRA_OEMAKE='KERNEL_DIR="${STAGING_EXECPREFIXDIR}" PREFIX="${D}"'
> diff --git a/meta/recipes-kernel/cryptodev/files/0001-Port-tests-to-openssl-1.1.patch b/meta/recipes-kernel/cryptodev/files/0001-Port-tests-to-openssl-1.1.patch
> new file mode 100644
> index 0000000..c969126
> --- /dev/null
> +++ b/meta/recipes-kernel/cryptodev/files/0001-Port-tests-to-openssl-1.1.patch
> @@ -0,0 +1,103 @@
> +From 2fe4bdeb8cdd0b0f46d9caed807812855d51ea56 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Wed, 28 Mar 2018 20:11:05 +0300
> +Subject: [PATCH] Port tests to openssl 1.1
> +
> +Upstream-Status: Accepted [https://github.com/cryptodev-linux/cryptodev-linux/pull/36]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
> +---
> + tests/openssl_wrapper.c | 33 +++++++++++++++++++++++++++++++++
> + 1 file changed, 33 insertions(+)
> +
> +diff --git a/tests/openssl_wrapper.c b/tests/openssl_wrapper.c
> +index 038c58f..dea2496 100644
> +--- a/tests/openssl_wrapper.c
> ++++ b/tests/openssl_wrapper.c
> +@@ -4,6 +4,7 @@
> + #include <openssl/aes.h>
> + #include <openssl/evp.h>
> + #include <openssl/hmac.h>
> ++#include <openssl/opensslv.h>
> +
> + //#define DEBUG
> +
> +@@ -23,10 +24,17 @@ enum ctx_type {
> +       ctx_type_md,
> + };
> +
> ++#if OPENSSL_VERSION_NUMBER >= 0x10100000L
> ++union openssl_ctx {
> ++      HMAC_CTX *hmac;
> ++      EVP_MD_CTX *md;
> ++};
> ++#else
> + union openssl_ctx {
> +       HMAC_CTX hmac;
> +       EVP_MD_CTX md;
> + };
> ++#endif
> +
> + struct ctx_mapping {
> +       __u32 ses;
> +@@ -63,6 +71,16 @@ static void remove_mapping(__u32 ses)
> +       switch (mapping->type) {
> +       case ctx_type_none:
> +               break;
> ++#if OPENSSL_VERSION_NUMBER >= 0x10100000L
> ++      case ctx_type_hmac:
> ++              dbgp("%s: calling HMAC_CTX_free\n", __func__);
> ++              HMAC_CTX_free(mapping->ctx.hmac);
> ++              break;
> ++      case ctx_type_md:
> ++              dbgp("%s: calling EVP_MD_CTX_free\n", __func__);
> ++              EVP_MD_CTX_free(mapping->ctx.md);
> ++              break;
> ++#else
> +       case ctx_type_hmac:
> +               dbgp("%s: calling HMAC_CTX_cleanup\n", __func__);
> +               HMAC_CTX_cleanup(&mapping->ctx.hmac);
> +@@ -71,6 +89,7 @@ static void remove_mapping(__u32 ses)
> +               dbgp("%s: calling EVP_MD_CTX_cleanup\n", __func__);
> +               EVP_MD_CTX_cleanup(&mapping->ctx.md);
> +               break;
> ++#endif
> +       }
> +       memset(mapping, 0, sizeof(*mapping));
> + }
> +@@ -127,10 +146,17 @@ static int openssl_hmac(struct session_op *sess, struct crypt_op *cop)
> +
> +               mapping->ses = sess->ses;
> +               mapping->type = ctx_type_hmac;
> ++#if OPENSSL_VERSION_NUMBER >= 0x10100000L
> ++              ctx = mapping->ctx.hmac;

Assigning the (uninitialised?) value of mapping->ctx.hmac to ctx here
looks redundant?

> ++
> ++              dbgp("calling HMAC_CTX_new");
> ++              ctx = HMAC_CTX_new();
> ++#else
> +               ctx = &mapping->ctx.hmac;
> +
> +               dbgp("calling HMAC_CTX_init");
> +               HMAC_CTX_init(ctx);
> ++#endif
> +               dbgp("calling HMAC_Init_ex");
> +               if (!HMAC_Init_ex(ctx, sess->mackey, sess->mackeylen,
> +                               sess_to_evp_md(sess), NULL)) {
> +@@ -172,10 +198,17 @@ static int openssl_md(struct session_op *sess, struct crypt_op *cop)
> +
> +               mapping->ses = sess->ses;
> +               mapping->type = ctx_type_md;
> ++#if OPENSSL_VERSION_NUMBER >= 0x10100000L
> ++              ctx = mapping->ctx.md;

And same comment here.

> ++
> ++              dbgp("calling EVP_MD_CTX_new");
> ++              ctx = EVP_MD_CTX_new();
> ++#else
> +               ctx = &mapping->ctx.md;
> +
> +               dbgp("calling EVP_MD_CTX_init");
> +               EVP_MD_CTX_init(ctx);
> ++#endif
> +               dbgp("calling EVP_DigestInit");
> +               EVP_DigestInit(ctx, sess_to_evp_md(sess));
> +       }
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

