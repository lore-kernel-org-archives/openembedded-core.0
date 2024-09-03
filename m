Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6C1ECD343A
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 14:10:50 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.24206.1725372647437651229
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 07:10:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ml00KVAq;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5343eeb4973so8337877e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 07:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725372645; x=1725977445; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dLHq4YYEu2Q9wSHJgGUYSyFR0CPAMKIUBT5mD2E9q80=;
        b=Ml00KVAqk5awrTIPyBflWTIJL0xW+Yr47B5GsmSZuHl2UuT9AVz+aKaOcEVUOrXkVZ
         WP30BfZWb3iKWSM+9yxKBpq4BkfhJufWiVLHjkhj54BS8sE9mGwmq/lMoulcJopbI6Qs
         fyd0sXyf9A73sGzoGTYfT/JgvzCBWfRiWQTUqX2uikpG83eB6VWQ5JgAK7vPvqG+FoE+
         4zoO2cu1kCM7Oy3GFAROzmJbb8+DXbLbeBvfabSy6VLDB5wwbxihpax+ss8eHT74EhCQ
         l2RwKlQzwC9hEeS5jQuUjWQRxGH3VFYRdlnPWdi5gSlmBnUAd41h6Ns1nx4Y0wYVPYJs
         ZQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725372645; x=1725977445;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dLHq4YYEu2Q9wSHJgGUYSyFR0CPAMKIUBT5mD2E9q80=;
        b=lkZGXOf/CWxyWmxySkBNOnZv5XFDOMKTNcMGTiMwatrGsOZiRFsQqqpKFgvwdGJXHv
         GjTnepPfQPuisyYpVziSNm73n4M6ScKW/vEHjTsp0AgtFKKMydXnSo2VNrAS8ShMWrHr
         A8EJQFh1oCQJ+AUvva9p335VTAHDtAszd878xgb0Zs6lPxPP7dLxDOXbKv3hhK/WkkoS
         UnGqtQJe46CyLh5e75Ieqh44qcgM0l4kDOyk+hk74dlVA2sWv2eFckPdg6KCh18xsCeP
         c0Nx54JAltKuxymhZJNT3IduPC5GKJgeKtcqU8WIF8KxYXLx8Z6ucXQijZL11rRvbd3x
         tfGg==
X-Gm-Message-State: AOJu0Yw4U3eyhVaQurp1uhJaZ/PuVGRyQ4yHJMwBzrCee1M2Ff/5PK1v
	Ubyn5P5NDh5Wm6pIpcKHB51Ds1Aaqpjw1ZVp/oCbLkVsK/+IudOtOPYjidHHAehALzp5uTjR/vq
	N45WNu0DOUBVLwVw4QuUbSqcHN+w=
X-Google-Smtp-Source: AGHT+IGDKzqC0e6lTLGdQuP4jcd3e4mW4BxgOZL9WpcDXxnIkf8Aml9GJ/uDV4knall9VnM/F2ArNunayAfSIAis/Hg=
X-Received: by 2002:a05:6512:3996:b0:52c:c9e4:3291 with SMTP id
 2adb3069b0e04-53546c02e0emr9221326e87.60.1725372644638; Tue, 03 Sep 2024
 07:10:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240903133828.3762-1-mail2szahir@gmail.com>
In-Reply-To: <20240903133828.3762-1-mail2szahir@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 3 Sep 2024 16:10:32 +0200
Message-ID: <CANNYZj_s70Go0tiB_AV2-xF+6h=GhHYrZ5T1W_YquwU-_81-Kw@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] glib-2.0: Remove gvariant byteswap test
To: mail2szahir@gmail.com
Cc: openembedded-core@lists.openembedded.org, zahir.basha@kpit.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 14:10:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204167

Is this seen on the yocto autobuilder, or only in your private testing?

Also, how would we know that the issue is fixed, and this patch can be removed?

Alex

On Tue, 3 Sept 2024 at 15:38, aszh07 via lists.openembedded.org
<mail2szahir=gmail.com@lists.openembedded.org> wrote:
>
> As byteswap has some issue sporadically, remove the byteswap
> completely from gvariant. When run in QEMU, could see the
> below failure sporadically
>
> Executing: glib/gvariant.test
> Executing: glib/gvariant.test
> Test timed out after 300 seconds
> FAIL: glib/gvariant.test (Child process killed by signal 9)
>
> Until issue is fixed removing byteswap test
> from gvariant to increase stability.
>
> Signed-off-by: Zahir Hussain <mail2szahir@gmail.com>
> ---
>  ...ib-2.0-Remove-gvariant-byteswap-test.patch | 45 +++++++++++++++++++
>  meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |  1 +
>  2 files changed, 46 insertions(+)
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-glib-2.0-Remove-gvariant-byteswap-test.patch
>
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-glib-2.0-Remove-gvariant-byteswap-test.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-glib-2.0-Remove-gvariant-byteswap-test.patch
> new file mode 100644
> index 0000000000..4cefd2e522
> --- /dev/null
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-glib-2.0-Remove-gvariant-byteswap-test.patch
> @@ -0,0 +1,45 @@
> +From f4c529805aed5ee92b8d7d729cfa501be5835d7e Mon Sep 17 00:00:00 2001
> +From: aszh07 <mail2szahir@gmail.com>
> +Date: Mon, 29 Jul 2024 16:19:10 +0530
> +Subject: [PATCH] glib-2.0: Remove gvariant byteswap test
> +
> +As byteswap has some issue sporadically, remove the byteswap
> +completely from gvariant. When run in QEMU, could see the
> +below failure sporadically,
> +
> +Executing: glib/gvariant.test
> +Executing: glib/gvariant.test
> +Test timed out after 300 seconds
> +FAIL: glib/gvariant.test (Child process killed by signal 9)
> +
> +Until issue is fixed removing byteswap test
> +from gvariant to increase stability.
> +
> +Signed-off-by: Zahir Hussain <mail2szahir@gmail.com>
> +---
> + glib/tests/gvariant.c | 2 --
> + 1 file changed, 2 deletions(-)
> +
> +diff --git a/glib/tests/gvariant.c b/glib/tests/gvariant.c
> +index 939f073..a25a4a4 100644
> +--- a/glib/tests/gvariant.c
> ++++ b/glib/tests/gvariant.c
> +@@ -5656,7 +5656,6 @@ main (int argc, char **argv)
> +   g_test_add_func ("/gvariant/serialiser/tuple", test_tuples);
> +   g_test_add_func ("/gvariant/serialiser/variant", test_variants);
> +   g_test_add_func ("/gvariant/serialiser/strings", test_strings);
> +-  g_test_add_func ("/gvariant/serialiser/byteswap", test_byteswaps);
> +   g_test_add_func ("/gvariant/serialiser/children", test_serialiser_children);
> +
> +   for (i = 1; i <= 20; i += 4)
> +@@ -5679,7 +5678,6 @@ main (int argc, char **argv)
> +   g_test_add_func ("/gvariant/valist", test_valist);
> +   g_test_add_func ("/gvariant/builder-memory", test_builder_memory);
> +   g_test_add_func ("/gvariant/hashing", test_hashing);
> +-  g_test_add_func ("/gvariant/byteswap", test_gv_byteswap);
> +   g_test_add_func ("/gvariant/byteswap/non-normal-non-aligned", test_gv_byteswap_non_normal_non_aligned);
> +   g_test_add_func ("/gvariant/parser", test_parses);
> +   g_test_add_func ("/gvariant/parser/integer-bounds", test_parser_integer_bounds);
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
> index 35b51a3ec9..3beb324383 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
> @@ -49,6 +49,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
>             file://CVE-2024-34397_16.patch \
>             file://CVE-2024-34397_17.patch \
>             file://CVE-2024-34397_18.patch \
> +           file://0001-glib-2.0-Remove-gvariant-byteswap-test.patch \
>             "
>  SRC_URI:append:class-native = " file://relocate-modules.patch"
>
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204163): https://lists.openembedded.org/g/openembedded-core/message/204163
> Mute This Topic: https://lists.openembedded.org/mt/108244763/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

