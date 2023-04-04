Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC01C761A6
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 10:49:41 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.98156.1680605373813675292
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 03:49:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NyFAxG17;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id ek18so128806969edb.6
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 03:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680605372;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CNEaA0JyAsrCcc5U62fdTl3vDpm83UYKEUExMd1+ovY=;
        b=NyFAxG17ujWYGGW7tUaAVhq19bDZujuHL3q5A2HgLdR/oUZdKGHrQUwXgTOcWQCTK5
         UjVTSsxabu/xn2h9dvu3jZy+3orYYUdz9DBvspfx6r5FMGNyodXovKjSQgCr68quLP9c
         XL1Yn+9jHojEiw2Xh3aLA5jlbx+gRmNgHVuihYRrLX/n1OyX/W8aW5u1YbUCzJQpeNRq
         Wdoq8fxxwWivRhbfntrhw5jCfQvvEN0s4SXZclOvA26WxmXseoK+PoGK1UTuxRo3jEDQ
         JAG5sOzEYJD7C31TyiYvqHzyuBs5vGZvTJJns80ZSxSp9JOR8altlaoO059YCLctCth8
         5VrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680605372;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CNEaA0JyAsrCcc5U62fdTl3vDpm83UYKEUExMd1+ovY=;
        b=LB1PwAeEoZiVtUH7uxx2jlTxJIwOVO7fZgiPapCf4or4ClG61dpiV2inpDGo4aHpgv
         mo6gTuQvievpzvQeS+p63zj4Nnm0viZbu0mUVIIY8XekNWuppjTwFlAfIOFsgQx7kdDt
         MRaoJBPpxbDiUPhzZfyyg9oDuGobupgugvNEob2E/25B8QnAFF0cYVNxbvYs9XtKH/Zq
         8nLVf28bsgcnmhY+UjAp0orE6e2fUOZupsFyiRnjQIWf11i/fNcvVPRiCzbrVUicwH7i
         PMe1BUabqkQBWqBHz1ujGkvFL/XeaFNMwEx/VEwRmuvJs7s00iKDd3JB9JNqSifn/Rsk
         ENQg==
X-Gm-Message-State: AAQBX9fZM5dCeDa+keP4f4FRRD1jAYhSYRNXFTXNVw2/Qz02HBHXDxsY
	nDB+aHkEEotJ7BI75QC/DK2g1e0L9bA=
X-Google-Smtp-Source: AKy350bpuiZocm3TnNHW9y9snW1dy+eGvcKjM80Y8T9yH1VB0EQol+qnFyUN2bNJKl87+Gve3h2VWg==
X-Received: by 2002:a17:906:4bc4:b0:8af:2107:6ce5 with SMTP id x4-20020a1709064bc400b008af21076ce5mr1516070ejv.35.1680605372040;
        Tue, 04 Apr 2023 03:49:32 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id q15-20020a17090676cf00b00947c0cecceasm5191426ejn.206.2023.04.04.03.49.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 03:49:31 -0700 (PDT)
Message-ID: <5352b840-e276-ddf6-2f2a-6292c00d8f67@gmail.com>
Date: Tue, 4 Apr 2023 12:49:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [OE-core] [PATCH] mesa: fix non-trivial designated initializers
 issue
Content-Language: en-US
To: Kai Kang <kai.kang@eng.windriver.com>,
 openembedded-core@lists.openembedded.org
References: <20230404092124.27242-1-kai.kang@windriver.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <20230404092124.27242-1-kai.kang@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 10:49:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179683

2023. 04. 04. 11:21 keltezéssel, Kai Kang írta:
> From: Kai Kang <kai.kang@windriver.com>
>
> It fails to compile intel/compiler/brw_simd_selection.cpp with g++ 7.5.0:

Mesa officially needs GCC 8.0.0 or later.
https://docs.mesa3d.org/install.html

>
> | mesa-23.0.0/src/intel/compiler/brw_simd_selection.cpp: In function ‘int
>    brw_simd_select_for_workgroup_size(const intel_device_info*,
>    const brw_cs_prog_data*, const unsigned int*)’:
> | mesa-23.0.0/src/intel/compiler/brw_simd_selection.cpp:205:7: sorry,
>    unimplemented: non-trivial designated initializers not supported
> |        };
> |        ^
>
> Initialize the leading 2 members to fix the issue.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   ...on.cpp-fix-non-trivial-designated-in.patch | 59 +++++++++++++++++++
>   meta/recipes-graphics/mesa/mesa.inc           |  1 +
>   2 files changed, 60 insertions(+)
>   create mode 100644 meta/recipes-graphics/mesa/files/0001-brw_simd_selection.cpp-fix-non-trivial-designated-in.patch
>
> diff --git a/meta/recipes-graphics/mesa/files/0001-brw_simd_selection.cpp-fix-non-trivial-designated-in.patch b/meta/recipes-graphics/mesa/files/0001-brw_simd_selection.cpp-fix-non-trivial-designated-in.patch
> new file mode 100644
> index 0000000000..9db738cdc0
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/files/0001-brw_simd_selection.cpp-fix-non-trivial-designated-in.patch
> @@ -0,0 +1,59 @@
> +From 6fd92cfc8a52a1884b8bc45b9ac0c7ceaf492a58 Mon Sep 17 00:00:00 2001
> +From: Kai Kang <kai.kang@windriver.com>
> +Date: Mon, 27 Mar 2023 21:19:36 +0800
> +Subject: [PATCH] brw_simd_selection.cpp: fix non-trivial designated
> + initializers issue
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +It fails to compile intel/compiler/brw_simd_selection.cpp with g++ 7.5.0:
> +
> +| mesa-23.0.0/src/intel/compiler/brw_simd_selection.cpp: In function ‘int
> +  brw_simd_select_for_workgroup_size(const intel_device_info*,
> +  const brw_cs_prog_data*, const unsigned int*)’:
> +| mesa-23.0.0/src/intel/compiler/brw_simd_selection.cpp:205:7: sorry,
> +  unimplemented: non-trivial designated initializers not supported
> +|        };
> +|        ^
> +
> +Initialize the leading 2 members to fix the issue.
> +
> +Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/22138]
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +---
> + src/intel/compiler/brw_simd_selection.cpp | 6 ++++--
> + 1 file changed, 4 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/intel/compiler/brw_simd_selection.cpp b/src/intel/compiler/brw_simd_selection.cpp
> +index 1515e538b74..4c065f9884a 100644
> +--- a/src/intel/compiler/brw_simd_selection.cpp
> ++++ b/src/intel/compiler/brw_simd_selection.cpp
> +@@ -232,10 +232,14 @@ brw_simd_select_for_workgroup_size(const struct intel_device_info *devinfo,
> +                                    const struct brw_cs_prog_data *prog_data,
> +                                    const unsigned *sizes)
> + {
> ++   void *mem_ctx = ralloc_context(NULL);
> ++
> +    if (!sizes || (prog_data->local_size[0] == sizes[0] &&
> +                   prog_data->local_size[1] == sizes[1] &&
> +                   prog_data->local_size[2] == sizes[2])) {
> +       brw_simd_selection_state simd_state{
> ++         .mem_ctx = mem_ctx,
> ++         .devinfo = devinfo,
> +          .prog_data = const_cast<struct brw_cs_prog_data *>(prog_data),
> +       };
> +
> +@@ -257,8 +261,6 @@ brw_simd_select_for_workgroup_size(const struct intel_device_info *devinfo,
> +    cloned.prog_mask = 0;
> +    cloned.prog_spilled = 0;
> +
> +-   void *mem_ctx = ralloc_context(NULL);
> +-
> +    brw_simd_selection_state simd_state{
> +       .mem_ctx = mem_ctx,
> +       .devinfo = devinfo,
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 8f72f25c17..caab1eff6d 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -17,6 +17,7 @@ PE = "2"
>   SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>              file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
>              file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
> +           file://0001-brw_simd_selection.cpp-fix-non-trivial-designated-in.patch \
>              "
>   
>   SRC_URI[sha256sum] = "01f3cff3763f09e0adabcb8011e4aebc6ad48f6a4dd4bae904fe918707d253e4"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179678): https://lists.openembedded.org/g/openembedded-core/message/179678
> Mute This Topic: https://lists.openembedded.org/mt/98056265/3617728
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


