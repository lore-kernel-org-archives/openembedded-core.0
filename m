Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA8EC4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 07:57:54 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.27929.1701158268311084827
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 23:57:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cfskfH2k;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2c9b8363683so881871fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 23:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701158266; x=1701763066; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uv88HhsCrmnzPVTOCZ6jiCrx7NTdXfNfBmB/HB+NJWo=;
        b=cfskfH2kzUv1z+iw6dVvv9X1jyi3C9VwrGN87TEWgxFBy9sqQhruUF6ulicAmMF/K/
         t5K1tIVLfgM8WAhTh7bZwBFY4XCq6f7BRmLkYkz4LoP6fkSFfm4Xao9lV75iWCEgeEdc
         kpZEPfrZ0axuzFJsK++nQG1ZvSoKzLJNXqiGgZpJ2iz0Qan3OFwoPSDC6px4REXPg8Cu
         3YxY91prodStWKar4LhttM5SX5wgH42kPOv8NI7R7/henGfTiCo5pw47VqsIc56EaPuE
         y93DjRIOuhvdy17fF2zB69hzar5frXsbiWKkqlL385ptYqOKPFsnr7CMz827Pjq7DdBm
         /xqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701158266; x=1701763066;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uv88HhsCrmnzPVTOCZ6jiCrx7NTdXfNfBmB/HB+NJWo=;
        b=Mbngx2sAnnsLvrLjep9Uo9TQGc9AN40vKKiFn36/MdajJt07htwQ8RKXSN5bVJ692i
         RqCRFkgTwbNz3jR/dkHLK/+F2Dxe12mhoxDCgXCNaMGW6d/bwx30nIBxhex0KXCKTJwo
         SaWalBj7eSf0OgG3c2RrM8iX1fQ92uTCptv000W00ft0gwT2HbdehophnA38apqtEGp+
         V8ILAckdkBRF/18D4N+Ro1nH10SUd1RyF/JLVEJrFeqlgoOp70ELJ96Km8zlpPneomCb
         pPilocC3rPU66dCRPSGssJNvPHA685BRbIMRN6mfBYZ0llqqbi/boTsTcjOeww7pCHd0
         28cg==
X-Gm-Message-State: AOJu0YyQupJPptb++CU2Bj16Ay26HwwxpVqkMpPSWzggF4odnzjGvPA8
	pVtd500Qqzx7sknjFM9jvTnaNOOZORbtqAdYBG/ToLnxegk=
X-Google-Smtp-Source: AGHT+IHw2KQlAGHp3/fDNaanYghUOKtMkBMgBZgD1CBo+nBTv+RURNkX8qt8aiZKkVxG7kfDEKUWOHJrm58zOk8Z3oc=
X-Received: by 2002:a05:651c:106f:b0:2c9:9842:c1d0 with SMTP id
 y15-20020a05651c106f00b002c99842c1d0mr5348928ljm.26.1701158265929; Mon, 27
 Nov 2023 23:57:45 -0800 (PST)
MIME-Version: 1.0
References: <20231128073632.38829-1-alexander.sverdlin@siemens.com>
In-Reply-To: <20231128073632.38829-1-alexander.sverdlin@siemens.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 28 Nov 2023 08:57:34 +0100
Message-ID: <CANNYZj8JtUhqErMKA7kAEd0n7gWYFy0zs-52dRxY0DkdRdJeKg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rdfind: add version 1.6.0
To: alexander.sverdlin@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 07:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191340

How about using --ignore-duplicates?
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/copy-firmware.sh?id=4124f8f928d51a1437e2fd2636b20d540edc2836

Adding a new recipe means someone has to keep it working and updated
(which means adding a maintainers.inc entry), and in this case it's
easily avoidable.

Alex

On Tue, 28 Nov 2023 at 08:36, A. Sverdlin via lists.openembedded.org
<alexander.sverdlin=siemens.com@lists.openembedded.org> wrote:
>
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>
> Add 1.6.0 recipe from meta-oe as of commit 39dfcaceba36
> ("rdfind: upgrade 1.5.0 -> 1.6.0"). It's required by linux-firmware
> installer script starting from 20230919.
>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> ---
> Shall probably come before patch "linux-firmware: require rdfind-native".
> Link: https://patchwork.yoctoproject.org/project/oe-core/patch/20231127203230.2704211-1-alexander.sverdlin@siemens.com/
>
>  meta/recipes-support/rdfind/rdfind_1.6.0.bb | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 meta/recipes-support/rdfind/rdfind_1.6.0.bb
>
> diff --git a/meta/recipes-support/rdfind/rdfind_1.6.0.bb b/meta/recipes-support/rdfind/rdfind_1.6.0.bb
> new file mode 100644
> index 00000000000..3a15fe6c9a2
> --- /dev/null
> +++ b/meta/recipes-support/rdfind/rdfind_1.6.0.bb
> @@ -0,0 +1,13 @@
> +SUMMARY = "Rdfind is a program that finds duplicate files"
> +HOMEPAGE = "https://rdfind.pauldreik.se/"
> +LICENSE = "GPL-2.0-only"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=fa22e16ebbe6638b2bd253338fbded9f"
> +
> +DEPENDS = "nettle autoconf-archive"
> +
> +SRC_URI = "https://rdfind.pauldreik.se/${BP}.tar.gz"
> +SRC_URI[sha256sum] = "7a406e8ef1886a5869655604618dd98f672f12c6a6be4926d053be65070f3279"
> +
> +inherit autotools
> +
> +BBCLASSEXTEND = "native"
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191335): https://lists.openembedded.org/g/openembedded-core/message/191335
> Mute This Topic: https://lists.openembedded.org/mt/102846891/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

