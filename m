Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88179CAC5B0
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 20:17:29 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.3687.1759436248329409868
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Oct 2025 13:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=joOCHUdX;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b472842981fso214622066b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 13:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759436247; x=1760041047; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lxGZH8x2IGRGBJxGPtLys6/jVwit7oYSCKgJ84sMaGA=;
        b=joOCHUdXrQ5iRW0rMVMMERaeRAIBUTh9wHBrUBC72CI/Ogf63F95VWEtHfOeBR49o1
         vim/oT1u4UIsUQbMvF8Cfm+Hjr2TrLcoCjunkDhyu1BBeh+JssN9WGFAWACuw6utSltN
         g9J5HobvD7qUjwm8uNFOmGT18704956s5flUiNeCHk8Q7QeaRdbSXN40vb8n9XYrUmck
         r/mXENGC3xmoEVyMSV+jgRGYAepU+8gzMg5ESuMIDPWpVR7HP79Hw2zR3OjK7hAQsIeq
         bBvfIPvwB0LsNwuj+NW9vpArMWZakA36F/VcQGO6h4s7aeLuBAKdKKR7wWIY4UZ4eNV1
         lguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759436247; x=1760041047;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lxGZH8x2IGRGBJxGPtLys6/jVwit7oYSCKgJ84sMaGA=;
        b=lAieFamedxqMZ4qXTrZ2xUynR4pK38BPaHuQ2qadAAuIhCFUrsKTAvkQdL/XKRrTPm
         1nkSf0qbkgSuzRH93sNf2dThsbBukWc2WNaDte3CtsALyDHlesdza2tLVA5evnSLM+dn
         LxS16ZOfIblJfbezk47C1tjThvRvjsNxP8lEmBez4Q/gnQPvjqgRLr2nAdIW3IH6y8Fi
         TE5EsqIezew9Z9mJ1dq+JhcEs1ez7+5AdrToA4WHzt7ksy6Gm3AkeptIPDlKe1qlgwOz
         ZQN0j7KktZ8aVj17BFPWpPEL/7I86NftroKnFKmJ+7Z9ciAvM9u/B5Rs5pRY3yFodsel
         cwMg==
X-Forwarded-Encrypted: i=1; AJvYcCWJLrgq6sZ7/OiaeNFCURS1TeWbA9PaeCUX8/H69kkYbma+QLTw+Ge54J3ETI3KfaayFl5zFDK/uv/w1PB/r7KIGQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwSCk5iAg2wMvH1IlsUCKPATCjTAOXGVq/uKBVi6Vr+LYicp/ya
	o4lEhAIG+8WBmMTGozT2gYHka19TKTM2PZF4ZqlIi6ukx9pY1+KTUrBq
X-Gm-Gg: ASbGncvEZ85ntgM/CKN/Eglj9xF+AVX08TtvaV2k1vEVYJ9f11VJsKswST9zDoqJnTu
	SoR9y6dzyC0X+TcQ2MILwDvsbHwH8Fza+exablEXzHD8ujG3ikqN/ZJ/DIxKWenP+aqLsVkx1JN
	FF9OtqUNHXI9khktmIkW1BZWA4axwtOMoFfE5PlkGvrFdBjfTgLIpR/8Y+Pj+bJBtK+uWu7aoYK
	KLOi2BStN07fKeZGNQp10FRB4k4b0QoM4aQk9AdkXeGNVTkvqqXaHIGTbF3TSAdjRFBXW3svchp
	THOSpb5+KHLMglSyQ8Nj8FLF7e1B5OEJMJkxHtHKqXVq0gWmtVPskBMCT1FUX4kMwb8YJNIC2rl
	HrW4AbjB/Q9nDgF8J1Qwrp+W81hmD7IQt8vzImoVsvUb5afKLujMRAGM=
X-Google-Smtp-Source: AGHT+IHM45Gu0znbABzQZosHxrL1y1L5F26S10W9oDeqBOEZA1NDr9fV9uLY0a3id/Vnu6C0A1QDXg==
X-Received: by 2002:a17:906:6a0c:b0:b3e:bb87:772c with SMTP id a640c23a62f3a-b49c1974cf3mr83404766b.17.1759436246446;
        Thu, 02 Oct 2025 13:17:26 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869c4c34dsm260793066b.80.2025.10.02.13.17.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 13:17:25 -0700 (PDT)
Message-ID: <daacfe77-1864-4edc-a5ad-bd5c52b7c9a1@gmail.com>
Date: Thu, 2 Oct 2025 22:17:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] How to have multiple rust cargo vendors
To: t.f.g.geelen@gmail.com, openembedded-core@lists.openembedded.org
References: <CAJo0Az632gtPBnWcszxzodqHTnagfqCDW5_d33WnbL_m_Hoezw@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAJo0Az632gtPBnWcszxzodqHTnagfqCDW5_d33WnbL_m_Hoezw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 20:17:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224380

You can add those in the SRC_URI, as regular git repos, with +=. Make
sure to set the "name" parameter to the crate name, and set the
"destsuffix" to ensure the sources won't mix. After do_configure step
one of the cargo/rust classes will go through the SRC_URI content, and
add these git-crates to the cargo config as local patches.

On 10/2/25 21:40, Tom Geelen via lists.openembedded.org wrote:
> I'm trying to create a recipe for uv (https://docs.astral.sh/uv/) to
> be added to meta-python.
> Problem I currently cannot seem to resolve is that I need multiple
> cargo vendor support.
>
> I have created the draft recipe and added the inc file with the crates
> using the update-crates command.
> However it missed several crates as they are not from crates.io but
> via git (see below).
>
> How would I add this to the recipe below?
>
> SUMMARY = "An extremely fast Python package and project manager,
> written in Rust."
> HOMEPAGE = "https://pypi.org/project/uv/"
> LICENSE = "Apache-2.0 & BSD-2-Clause & MIT"
> LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
>                     file://LICENSE-MIT;md5=45674e482567aa99fe883d3270b11184"
> RECIPE_MAINTAINER = "Tom Geelen <t.f.g.geelen@gmail.com>"
>
> SRC_URI[sha256sum] =
> "e6e1289c411d43e0ca245f46e76457f3807de646d90b656591b6cf46348bed5c"
>
> inherit pypi python_maturin cargo-update-recipe-crates
>
> require ${BPN}-crates.inc
>
> SRCREV = "d8efd77673c9a90792da9da31b6c0da7ea8a324b"
>
> PYPI_PACKAGE = "uv"
>
>
> [[package]]
> name = "version-ranges"
> version = "0.1.1"
> source = "git+https://github.com/astral-sh/pubgrub?rev=d8efd77673c9a90792da9da31b6c0da7ea8a324b#d8efd77673c9a90792da9da31b6c0da7ea8a324b"
> dependencies = [
>  "smallvec",
> ]
>
> Regards,
>
> Tom
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224379): https://lists.openembedded.org/g/openembedded-core/message/224379
> Mute This Topic: https://lists.openembedded.org/mt/115558933/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


