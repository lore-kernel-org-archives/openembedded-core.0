Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 55BCB60684
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 14:15:38 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id 8-v6so13933266oip.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 07:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7FVasBbd0Iuer6EalrwZ9gsiblAI9JuHN8AcZiXc6+0=;
	b=LViH1GYseC+HNPCmy1YaozanVwTk0S5nI91Fyu4i7wnvJCoUgJnESdWsi/QJecXLWc
	OIfMHiq0w8IE1rR+o6qIjk6Wbc7MbcQkSrDX4W1IByGkZMzDC6YEypu3n6ovE6yfySyb
	a0BjYWgzt8DVP1PLqNmIe1QV7aOeXe5yOlfBcUgYARs5e0XaZjhfsKuULqb54F9zKb7Y
	U56gcYg1O4GS5UdBSvN5+G9pFxqIa2wyya2M85D6JkKDZ5bp7li74pVsHjX+5tl9gbHL
	DlP7X/60iFhoBHkzDlPC3XkU9q1gUMioNhrCC5DlgocYDUGlWhxpfWYVpwgxQNPsnFSf
	0FBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7FVasBbd0Iuer6EalrwZ9gsiblAI9JuHN8AcZiXc6+0=;
	b=JsWqQig6ZBl7nWRYL4BiBgosoSIBf8+yaOTlJuxgQp/SKyKDgccy/+6xCj30Y6Mqn4
	yFbKvzMmE4QyNKPUmPNYrcKv2YhupTnix+85MR/LyasC1wEFuRUd52dRAuKmjZPnW/QV
	9kjz4y0Wz9jipSfSnA7wFCcrNMROaHQEv/uyXmXL9ViBMZEZsvY4UU3pRcQ1dDIFNlV7
	0CWaJe7uT/uyXMN49zYKNfEZAmo6yhjok+6ULoNzQW+Fl1s5Uo7roD4KVyz+TrW5SA4L
	1FZMq6mcwSro3uRRQt82fbBItOCL8b/F4B8twZumK3UpkJJagH1KOA9esxJg6NBK2OI+
	zQOw==
X-Gm-Message-State: APzg51C5iNJvqdX4nO/klhOO+VY8eaRp4noB+XFrGqCsLdJrl9EPuv8+
	yKO41q0S5SjiXc4l3/nsvLwmF6lTMD5T4spyhLfJiA==
X-Google-Smtp-Source: ANB0VdZPdvQ/rNRofP7FksZIUPKlRf+YbaGInOKOEXxuucxKaIineI6dSGn9kpjy2Q0orIc9W9Rlm+O6vullfSK/7XU=
X-Received: by 2002:aca:a8c1:: with SMTP id
	r184-v6mr30772639oie.215.1536156939231; 
	Wed, 05 Sep 2018 07:15:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:5c9b:0:0:0:0:0 with HTTP;
	Wed, 5 Sep 2018 07:15:38 -0700 (PDT)
In-Reply-To: <CAJ86T=XVPbDxD82w8h5ZgZNvf4sFKaYo9pBEWwT_aZjNTJYAdg@mail.gmail.com>
References: <cover.1535451643.git.alex.kanavin@gmail.com>
	<1f7ed298deed1f23ccd6e67b4701985660abe575.1535451643.git.alex.kanavin@gmail.com>
	<CAJ86T=XVPbDxD82w8h5ZgZNvf4sFKaYo9pBEWwT_aZjNTJYAdg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 5 Sep 2018 16:15:38 +0200
Message-ID: <CANNYZj9wJy7D34Q07du659rhUPce=38tfLj2owpc3BXr_0FKVA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
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
X-List-Received-Date: Wed, 05 Sep 2018 14:15:38 -0000
Content-Type: text/plain; charset="UTF-8"

Note that the upstream accepted the patch as it is (frankly I don't
remember how the line appeared there), so you should probably send a
fix directly to them :)

Alex

2018-09-04 22:38 GMT+02:00 Andre McCurdy <armccurdy@gmail.com>:
> On Tue, Aug 28, 2018 at 3:23 AM, Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
>> From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>>
>> This leaves openssh as the only recipe that requires openssl 1.0 (or libressl).
>>
>> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>> ---
>>  .../cryptodev/cryptodev-tests_1.9.bb               |   3 +-
>>  .../files/0001-Port-tests-to-openssl-1.1.patch     | 103 +++++++++++++++++++++
>>  2 files changed, 105 insertions(+), 1 deletion(-)
>>  create mode 100644 meta/recipes-kernel/cryptodev/files/0001-Port-tests-to-openssl-1.1.patch
>>
>> diff --git a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.9.bb b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.9.bb
>> index 9afb3de..617db6c 100644
>> --- a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.9.bb
>> +++ b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.9.bb
>> @@ -2,10 +2,11 @@ require cryptodev.inc
>>
>>  SUMMARY = "A test suite for /dev/crypto device driver"
>>
>> -DEPENDS += "openssl10"
>> +DEPENDS += "openssl"
>>
>>  SRC_URI += " \
>>  file://0001-Add-the-compile-and-install-rules-for-cryptodev-test.patch \
>> +file://0001-Port-tests-to-openssl-1.1.patch \
>>  "
>>
>>  EXTRA_OEMAKE='KERNEL_DIR="${STAGING_EXECPREFIXDIR}" PREFIX="${D}"'
>> diff --git a/meta/recipes-kernel/cryptodev/files/0001-Port-tests-to-openssl-1.1.patch b/meta/recipes-kernel/cryptodev/files/0001-Port-tests-to-openssl-1.1.patch
>> new file mode 100644
>> index 0000000..c969126
>> --- /dev/null
>> +++ b/meta/recipes-kernel/cryptodev/files/0001-Port-tests-to-openssl-1.1.patch
>> @@ -0,0 +1,103 @@
>> +From 2fe4bdeb8cdd0b0f46d9caed807812855d51ea56 Mon Sep 17 00:00:00 2001
>> +From: Alexander Kanavin <alex.kanavin@gmail.com>
>> +Date: Wed, 28 Mar 2018 20:11:05 +0300
>> +Subject: [PATCH] Port tests to openssl 1.1
>> +
>> +Upstream-Status: Accepted [https://github.com/cryptodev-linux/cryptodev-linux/pull/36]
>> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> +
>> +---
>> + tests/openssl_wrapper.c | 33 +++++++++++++++++++++++++++++++++
>> + 1 file changed, 33 insertions(+)
>> +
>> +diff --git a/tests/openssl_wrapper.c b/tests/openssl_wrapper.c
>> +index 038c58f..dea2496 100644
>> +--- a/tests/openssl_wrapper.c
>> ++++ b/tests/openssl_wrapper.c
>> +@@ -4,6 +4,7 @@
>> + #include <openssl/aes.h>
>> + #include <openssl/evp.h>
>> + #include <openssl/hmac.h>
>> ++#include <openssl/opensslv.h>
>> +
>> + //#define DEBUG
>> +
>> +@@ -23,10 +24,17 @@ enum ctx_type {
>> +       ctx_type_md,
>> + };
>> +
>> ++#if OPENSSL_VERSION_NUMBER >= 0x10100000L
>> ++union openssl_ctx {
>> ++      HMAC_CTX *hmac;
>> ++      EVP_MD_CTX *md;
>> ++};
>> ++#else
>> + union openssl_ctx {
>> +       HMAC_CTX hmac;
>> +       EVP_MD_CTX md;
>> + };
>> ++#endif
>> +
>> + struct ctx_mapping {
>> +       __u32 ses;
>> +@@ -63,6 +71,16 @@ static void remove_mapping(__u32 ses)
>> +       switch (mapping->type) {
>> +       case ctx_type_none:
>> +               break;
>> ++#if OPENSSL_VERSION_NUMBER >= 0x10100000L
>> ++      case ctx_type_hmac:
>> ++              dbgp("%s: calling HMAC_CTX_free\n", __func__);
>> ++              HMAC_CTX_free(mapping->ctx.hmac);
>> ++              break;
>> ++      case ctx_type_md:
>> ++              dbgp("%s: calling EVP_MD_CTX_free\n", __func__);
>> ++              EVP_MD_CTX_free(mapping->ctx.md);
>> ++              break;
>> ++#else
>> +       case ctx_type_hmac:
>> +               dbgp("%s: calling HMAC_CTX_cleanup\n", __func__);
>> +               HMAC_CTX_cleanup(&mapping->ctx.hmac);
>> +@@ -71,6 +89,7 @@ static void remove_mapping(__u32 ses)
>> +               dbgp("%s: calling EVP_MD_CTX_cleanup\n", __func__);
>> +               EVP_MD_CTX_cleanup(&mapping->ctx.md);
>> +               break;
>> ++#endif
>> +       }
>> +       memset(mapping, 0, sizeof(*mapping));
>> + }
>> +@@ -127,10 +146,17 @@ static int openssl_hmac(struct session_op *sess, struct crypt_op *cop)
>> +
>> +               mapping->ses = sess->ses;
>> +               mapping->type = ctx_type_hmac;
>> ++#if OPENSSL_VERSION_NUMBER >= 0x10100000L
>> ++              ctx = mapping->ctx.hmac;
>
> Assigning the (uninitialised?) value of mapping->ctx.hmac to ctx here
> looks redundant?
>
>> ++
>> ++              dbgp("calling HMAC_CTX_new");
>> ++              ctx = HMAC_CTX_new();
>> ++#else
>> +               ctx = &mapping->ctx.hmac;
>> +
>> +               dbgp("calling HMAC_CTX_init");
>> +               HMAC_CTX_init(ctx);
>> ++#endif
>> +               dbgp("calling HMAC_Init_ex");
>> +               if (!HMAC_Init_ex(ctx, sess->mackey, sess->mackeylen,
>> +                               sess_to_evp_md(sess), NULL)) {
>> +@@ -172,10 +198,17 @@ static int openssl_md(struct session_op *sess, struct crypt_op *cop)
>> +
>> +               mapping->ses = sess->ses;
>> +               mapping->type = ctx_type_md;
>> ++#if OPENSSL_VERSION_NUMBER >= 0x10100000L
>> ++              ctx = mapping->ctx.md;
>
> And same comment here.
>
>> ++
>> ++              dbgp("calling EVP_MD_CTX_new");
>> ++              ctx = EVP_MD_CTX_new();
>> ++#else
>> +               ctx = &mapping->ctx.md;
>> +
>> +               dbgp("calling EVP_MD_CTX_init");
>> +               EVP_MD_CTX_init(ctx);
>> ++#endif
>> +               dbgp("calling EVP_DigestInit");
>> +               EVP_DigestInit(ctx, sess_to_evp_md(sess));
>> +       }
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

