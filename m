Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 923D310BA434
	for <webhook@archiver.kernel.org>; Sat, 28 Mar 2026 00:07:33 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2159.1774656445697785959
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 17:07:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1Fq2T03D;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-482f454be5bso34757215e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 17:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774656444; x=1775261244; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F9xgCiHYTmYFx3SS/X0+Q01rYJkhogY1I3Ce4rLRMNg=;
        b=1Fq2T03D7MNZRi4pWQVozW0+PiVL+UL+TAjS4mCNLlTBQEj8EaTCCyL80lg3vz3L+3
         J6b9znY31KX7JdIKNTQVwzhYsinJ0QZ1M1iTMQEL7NO4RwQxbI3sFp6hmM1HcAblrbX4
         OVOAY9bnZEJo58mmvWAe0ZErdNg6IRNpbQkTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774656444; x=1775261244;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F9xgCiHYTmYFx3SS/X0+Q01rYJkhogY1I3Ce4rLRMNg=;
        b=EpD8iQVh9BGbKU4ZPGb9TaIgfPca7DIj4LlHfNUGeUfhuPBZxE3qQEWyo2UTmKE08f
         tec4bcESegCK1LqVr0Ia6MB1hKNVit32C0xRewjXtsvDHqGend4O1lZHoUVdfsMKMApK
         7V0g+8mdSQnFK+mPP4FExbjEIEz6AOXq37tF8cM4+kKqeoVin1PTfilaSNzHbYbhWLce
         GUNWbjJilXF3pjgT95NPOAwZad1kbKkt3bd1vhunCpjKvuYh5gykIcuqZmQqFUAIhCmK
         SHHQJOeID1Yy5ejPUGOhcMqc5tjnXzZ/gRZ7TRRhnCKMy1xxhWKNR8LqXC/yL9KJzFYZ
         sMTw==
X-Forwarded-Encrypted: i=1; AJvYcCUp8Z2Ydr9f1X4ljvG+KyllFDo2zOtlxP+dKC8HCqbsHcy7+JT5AxBV65gYT+HdVZrLhBbnOhboaaFSMxpyHAMJ+g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxYClC/+gck1YxJFWQTqvk7ir5yL5yIWUs9hWrO6yeTD9YWcCGb
	dezpNkTXxGuRopWuetJkXL7XhdDGdKZaamcUHKviYMcUxqcZ6T093TijimDe4clOq/0=
X-Gm-Gg: ATEYQzyngtE3lGAyEubGqmCzzQQtnSptFX09BwEwBR2oxe41g8eBlKqRsxWKrJ1BNZx
	ohQwcIDn+BHmyM9ObJkXXOKe3RqiAw/Pe6KkOn7J0pB9+yDcrXC+69xFVlZUQoHsc8IhxGBacYC
	7zKNhLNpSPJT+9g1VAaHkulweblBiB28EvnDmNrrQsxOtgX5t8f7J7WrET8/kVAvMR/WGEn8a24
	9I0Y97pbYF1Fcva0IMpFztkXdGfjMEIPs+/UrytROHg3AMBvWPc8R0xwuBgSYMzMchNm2qAH+Vp
	NNY4o/5XcNsL6snv84uyMr3idB75YrZnBrdbQFLA/Hzwo8MZo3DZbhCEefEmsfhjnJb27f2En1i
	amZKeW8Yww5PbhdSuQCxRaEk5Brb5iZfMrs9W0nd5qLDkmNAsdVe2s24ZXFqMxaJj/fKrB9GT3N
	v4gRK4q/m1AJrviGlCz/Vv2MgySWTRjRhEIUlX+2BkAtSMB4RvtQQXB5CJ0FN6iolZTx3pokgMq
	q2zM2GRJkOgWHQ=
X-Received: by 2002:a05:600c:c172:b0:486:f893:56c6 with SMTP id 5b1f17b1804b1-48729109ac4mr57680925e9.10.1774656443957;
        Fri, 27 Mar 2026 17:07:23 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725eb5417sm39428345e9.3.2026.03.27.17.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 17:07:22 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Mar 2026 01:07:21 +0100
Message-Id: <DHDZ7EG0XTX2.115YOC91NT8OQ@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH 5/6] elfutils: don't add -Werror to
 avoid discarded-qualifiers
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <martin.jansa@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260326181450.1262870-1-martin.jansa@gmail.com>
 <20260326181450.1262870-5-martin.jansa@gmail.com>
In-Reply-To: <20260326181450.1262870-5-martin.jansa@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Mar 2026 00:07:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234113

On Thu Mar 26, 2026 at 7:14 PM CET, Martin Jansa via lists.openembedded.org=
 wrote:
> From: Martin Jansa <martin.jansa@gmail.com>
>
> With glibc-2.43 on host elfutils-native fails with:
> elfutils-0.191/libcpu/riscv_disasm.c:1259:46: error: initialization disca=
rds =C3=A2=C2=80=C2=98const=C3=A2=C2=80=C2=99 qualifier from pointer target=
 type [-Werror=3Ddiscarded-qualifiers]
>
> elfutils-0.194 in master doesn't have this issue thanks to this patch avo=
iding -Werror from:
> https://git.openembedded.org/openembedded-core/commit/?id=3D1d6ac3c811798=
732e6addc798656bbe104661d77
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---

Hello

Isn't this patch (and 6/6) also needed on whinlatter?
Can you send what is needed from series to whinlatter please?

Thanks!

>  .../elfutils/elfutils_0.191.bb                |  1 +
>  ...001-config-eu.am-do-not-force-Werror.patch | 34 +++++++++++++++++++
>  2 files changed, 35 insertions(+)
>  create mode 100644 meta/recipes-devtools/elfutils/files/0001-config-eu.a=
m-do-not-force-Werror.patch
>
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.191.bb b/meta/reci=
pes-devtools/elfutils/elfutils_0.191.bb
> index 0fd6d31af1..5156e5c9f6 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.191.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.191.bb
> @@ -23,6 +23,7 @@ SRC_URI =3D "https://sourceware.org/elfutils/ftp/${PV}/=
${BP}.tar.bz2 \
>             file://0001-tests-Makefile.am-compile-test_nlist-with-standar=
d-C.patch \
>             file://0001-debuginfod-Remove-unused-variable.patch \
>             file://0001-srcfiles-fix-unused-variable-BUFFER_SIZE.patch \
> +           file://0001-config-eu.am-do-not-force-Werror.patch \
>             file://CVE-2025-1352.patch \
>             file://CVE-2025-1365.patch \
>             file://CVE-2025-1372.patch \
> diff --git a/meta/recipes-devtools/elfutils/files/0001-config-eu.am-do-no=
t-force-Werror.patch b/meta/recipes-devtools/elfutils/files/0001-config-eu.=
am-do-not-force-Werror.patch
> new file mode 100644
> index 0000000000..d4e141927f
> --- /dev/null
> +++ b/meta/recipes-devtools/elfutils/files/0001-config-eu.am-do-not-force=
-Werror.patch
> @@ -0,0 +1,34 @@
> +From e169c3fc734be1783b3e1a4768dbec05fb64cb4f Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex@linutronix.de>
> +Date: Fri, 22 Nov 2024 12:50:48 +0100
> +Subject: [PATCH] config/eu.am: do not force -Werror
> +
> +This is undesirable when compiler versions may not be the same
> +as what upstream is using for their own testing.
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +---
> + config/eu.am | 2 --
> + 1 file changed, 2 deletions(-)
> +
> +diff --git a/config/eu.am b/config/eu.am
> +index 0b7dab5..5e7a03f 100644
> +--- a/config/eu.am
> ++++ b/config/eu.am
> +@@ -99,7 +99,6 @@ AM_CFLAGS =3D -std=3Dgnu99 -Wall -Wshadow -Wformat=3D2=
 \
> + 	    $(LOGICAL_OP_WARNING) $(DUPLICATED_COND_WARNING) \
> + 	    $(NULL_DEREFERENCE_WARNING) $(IMPLICIT_FALLTHROUGH_WARNING) \
> + 	    $(USE_AFTER_FREE3_WARNING) \
> +-	    $(if $($(*F)_no_Werror),,-Werror) \
> + 	    $(if $($(*F)_no_Wunused),,-Wunused -Wextra) \
> + 	    $(if $($(*F)_no_Wstack_usage),,$(STACK_USAGE_WARNING)) \
> + 	    $(if $($(*F)_no_Wpacked_not_aligned),$(NO_PACKED_NOT_ALIGNED_WARNI=
NG),) \
> +@@ -109,7 +108,6 @@ AM_CXXFLAGS =3D -std=3Dc++11 -Wall -Wshadow \
> + 	   $(TRAMPOLINES_WARNING) \
> + 	   $(LOGICAL_OP_WARNING) $(DUPLICATED_COND_WARNING) \
> + 	   $(NULL_DEREFERENCE_WARNING) $(IMPLICIT_FALLTHROUGH_WARNING) \
> +-	   $(if $($(*F)_no_Werror),,-Werror) \
> + 	   $(if $($(*F)_no_Wunused),,-Wunused -Wextra) \
> + 	   $(if $($(*F)_no_Wstack_usage),,$(STACK_USAGE_WARNING)) \
> + 	   $(if $($(*F)_no_Wpacked_not_aligned),$(NO_PACKED_NOT_ALIGNED_WARNIN=
G),) \


--=20
Yoann Congal
Smile ECS


