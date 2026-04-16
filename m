Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3FA5F8D74F
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 14:11:15 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15198.1776348672204328601
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 07:11:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=KaSiVI2Q;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-488971db0fdso80847405e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 07:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776348670; x=1776953470; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3C8hvJiJCdmJistd4sSGxG/BrY+qFf9kDebIcFbXHV8=;
        b=KaSiVI2QWP2f6fnr91RylT2RvN7IlYrpkIMQAF0CYnpclr03xBRzOCYGIenHdSAfPd
         f0Mzqy4CY4mYuAeP/UpqYGZYJTp9IvGtadtP6dGocOt0fJu34yFjqu/SyImKOFZnOJwK
         Kil6/zRjj8fnIP8a/qAXDg69OexDmMrF54i6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776348670; x=1776953470;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3C8hvJiJCdmJistd4sSGxG/BrY+qFf9kDebIcFbXHV8=;
        b=nPLz1dNUaFzxEQqAEq0OvYMao1LmxyQRL0AudgNpt6MUI4bKhypnY238uEMoz91yW0
         G3OiZTzKGrQ+2EeBtne16ShmqYi/XRu6eavpJCZkvQk6lOW1/AWPO5cqNFdOVFCerMh0
         8kpCwfq0oX+0e+EX0cHWWg0pJ4h83FcweBa2jHzACHqDZX/4hf9m0MA3u8xJ+xELj1kV
         XnJ7j6IruCNbaRSutjYhg75t1QTBYEYjgNzld59uxB4j5UKTDQPCj4D7fZdMur/wbDdb
         UsZfRxGj6T/G/OIVrQ0GDNjrwtBdjiWgykTMG+AE/t50voFczuYfOCwFASCRQfrW2feA
         QLlA==
X-Forwarded-Encrypted: i=1; AFNElJ+15tn/Mm8W4J5tu5ybQmbv7eived/UTWjRLM8dNzIBLvpl2giOijpj6S8wIexBJ/p3Ykal6zpUkvxybkPyIXBuIQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy/wY+2LrQhxhu384miZ+0RSVoOyj/te/pTqztVlbFM8dh9Hp0j
	RzUe6SYn42YLh+jfAw+KWChscMCVbpdJ4AVlctUCIjLkV3F11YV/pdKQa6LazUuIbgVXgOQiCUG
	gplE7n3DVm2zs
X-Gm-Gg: AeBDieuYYsGFPIYd9U2LzBmSfxsvNjW8IW6tkfiIR14yb8QrGFL4dt378tcaMA7Ofjq
	Lrd42yUbJWSAt1f8MNLRfXZU5CeQi0ziPzg+sHCe0jdIQvCS0xGKIFg//AytSN+w75uc21Z7FJk
	xpBcUbj93efe2J3v9D5lyCE+bzodc0PqUgLVQ1huUAzSFhN3yZKe4o5kpqvoInBBeEIl6k1fUqf
	DPqqXX5FQn7dee3ieKr4AVAZBDhKvT7tkxjp18rzjgh/1CM7gbbHS7JQxJYqFRCBJw4X0LD0i/K
	ADRpv6/OxJr2t56S4Iq4OH45ZCeYIVCnM3oPLwXsditSSt6ZyWaM2In2rfxVCwlR6CJKN/jAHg4
	XMNhTzXEz9s1Oy64sgmTjhnSaYjKpW9AE60oP5Cavt8S8I1ffWf8jJeJnUVQ5/r94FslpyFuox9
	JWxgE/A2cxj09NHnWEMUoMQs7hlfrswUaZKG0CkbiWi3iTIsn1SCFMzTXXgZXHzZa8ng1yZPRDG
	boNYAx3xRZmGkqup9AAtoguXUwTXySubMja
X-Received: by 2002:a05:600c:4715:b0:488:9e54:94c0 with SMTP id 5b1f17b1804b1-488d67e7dd4mr384535035e9.8.1776348670494;
        Thu, 16 Apr 2026 07:11:10 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f585cea1sm56060495e9.15.2026.04.16.07.11.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 07:11:09 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Apr 2026 16:11:09 +0200
Message-Id: <DHUN1SXX5RDI.1OA9PUGO3NH3H@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <martin.jansa@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [whinlatter][PATCH 9/9] binutils: backport patch to
 fix build with glibc-2.43 on host
X-Mailer: aerc 0.20.0
References: <20260409152839.2894434-1-martin.jansa@gmail.com>
 <20260409152839.2894434-9-martin.jansa@gmail.com>
In-Reply-To: <20260409152839.2894434-9-martin.jansa@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 14:11:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235408

On Thu Apr 9, 2026 at 5:28 PM CEST, Martin Jansa via lists.openembedded.org=
 wrote:
> From: Martin Jansa <martin.jansa@gmail.com>
>
> Fixes:
> ../../../gprofng/libcollector/linetrace.c: In function =E2=80=98__collect=
or_ext_line_install=E2=80=99:
> ../../../gprofng/libcollector/linetrace.c:219:45: error: expected identif=
ier before =E2=80=98_Generic=E2=80=99
>   219 |   if (java_follow_env !=3D NULL && CALL_UTIL (strstr)(java_follow=
_env, COLLECTOR_JVMTI_OPTION))
>       |                                             ^~~~~~
> ../../../gprofng/libcollector/linetrace.c:219:34: note: in expansion of m=
acro =E2=80=98CALL_UTIL=E2=80=99
>   219 |   if (java_follow_env !=3D NULL && CALL_UTIL (strstr)(java_follow=
_env, COLLECTOR_JVMTI_OPTION))
>       |                                  ^~~~~~~~~
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---

Hello Martin,

Thank you for your patches. Ultimately, I took the equivalent patch from
Zolt=C3=A1n:
https://lore.kernel.org/all/20260407133521.840916-1-zboszor@gmail.com/

Regards,

>  .../binutils/binutils-2.45.inc                |  1 +
>  ...tect-against-standard-library-macros.patch | 31 +++++++++++++++++++
>  2 files changed, 32 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0022-gprofng-=
protect-against-standard-library-macros.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/reci=
pes-devtools/binutils/binutils-2.45.inc
> index 16a63cabc5..f5456c0b0f 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.45.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
> @@ -39,6 +39,7 @@ SRC_URI =3D "\
>       file://0015-CVE-2025-11081.patch \
>       file://0016-CVE-2025-11082.patch \
>       file://0017-CVE-2025-11083.patch \
> +     file://0022-gprofng-protect-against-standard-library-macros.patch \
>       file://CVE-2025-11414.patch \
>       file://CVE-2025-11412.patch \
>       file://CVE-2025-11413.patch \
> diff --git a/meta/recipes-devtools/binutils/binutils/0022-gprofng-protect=
-against-standard-library-macros.patch b/meta/recipes-devtools/binutils/bin=
utils/0022-gprofng-protect-against-standard-library-macros.patch
> new file mode 100644
> index 0000000000..0fa0a93991
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0022-gprofng-protect-agains=
t-standard-library-macros.patch
> @@ -0,0 +1,31 @@
> +From 5f66aee7f4bec7a2d8378034116f5e5c3dc50f41 Mon Sep 17 00:00:00 2001
> +From: Andreas Schwab <schwab@suse.de>
> +Date: Sat, 22 Nov 2025 11:29:43 +0100
> +Subject: [PATCH] gprofng: protect against standard library macros
> +
> +The CALL_UTIL macro can expand to an unparsable expression of the argume=
nt
> +is a macro, like with the new const-preserving standard library macros i=
n
> +C23.
> +
> +	* gprofng/src/collector_module.h (CALL_UTIL): Add parens to not
> +	expand its argument if it is a function-like macro.
> +
> +Upstream-Status: Backport [2.46 5f66aee7f4bec7a2d8378034116f5e5c3dc50f41=
]
> +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> +---
> + gprofng/src/collector_module.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/gprofng/src/collector_module.h b/gprofng/src/collector_modu=
le.h
> +index b64d69c45ab..859a6dd1f7d 100644
> +--- a/gprofng/src/collector_module.h
> ++++ b/gprofng/src/collector_module.h
> +@@ -119,7 +119,7 @@ typedef struct CollectorUtilFuncs
> + extern CollectorUtilFuncs __collector_util_funcs;
> + extern int __collector_dlsym_guard;
> +=20
> +-#define CALL_UTIL(x) __collector_util_funcs.x
> ++#define CALL_UTIL(x) (__collector_util_funcs.x)
> +=20
> + /* The following constants define the meaning of the "void *arg"
> +  * argument of getFrameInfo().


--=20
Yoann Congal
Smile ECS


