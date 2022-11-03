Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09D6EC4332F
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 17:54:05 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web08.1619.1667498037167993949
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 10:53:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=olvCXDLA;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-13c2cfd1126so3010248fac.10
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 10:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Lsq2GKSwEvhfaTvyaRYrD5fHaUYHzOMzZvB54q7JRuU=;
        b=olvCXDLAVBhSPP81GIhQeF8F0DpZ0mZXhuhKa500Sl+q57RgVJUMaxsVSfjDW9xzDM
         Vi64xRZUqGWU/LuLCkiB15IgaNO7TZfGHbEjWttL1B2SSpyuWVN/ruT3YoeGuwL9A6Vh
         nZ4yba9QSSqkV3gRFvEn58tSZOGX85r/sVq8+7P62qetSakPJx3TM+l2IC/HvBX8ibJO
         H9EBz/iSFzyDw+xMhtZ8dWcvOzIDgH/mlF260s755vhVubLk9uVTqPvsK6HjgaPEeRUY
         VWqxQdYq6BuVaEFoxZb0UxWCRZeZlbrEEc2rLou0Gpt2JXliqhc3uGvni2jvJj3/Zxoa
         JpIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lsq2GKSwEvhfaTvyaRYrD5fHaUYHzOMzZvB54q7JRuU=;
        b=YfehXaaGp80yQauiFWwHjb+SKRckwsMHO+P4Vi3qygUmOg5l+Hswa7at0GWor+XQp4
         uwPczdDecrhCw070jd4Kd4J0uomkxaLfNtRL55e4F0qd64haZMSoiKzaP/+j71qONWrk
         U+YZKHb22G6sEHxkHAfcvbgT1Zz60x8R3er3zRn+9l74tbpclOb/LxoArxQlGl+G+mtb
         amNIehulSKqaSn4m1lDEXSwxQKvmCQw6AP1LvFCuEAeHocaBF9s9/rID9rqGDFeSW0cY
         hcwIorTOy53D/05k9qfS3R9RYccaGJIhTY89y1EhoYXfq/rYGTxRGZscU0gZXyiTcn21
         mAVQ==
X-Gm-Message-State: ACrzQf3T7kmz1uhh/m3Fs9XccaW27hKv0U8i7GXslTVqj2eXj3nGX5pX
	JR3wcv0PCXG+fUVnQljKuM48XD7By2KgjntNv9Q=
X-Google-Smtp-Source: AMsMyM7aPuI3nlkydBpKRBdo7Re/b72JNvBFFv6Y51pP8K8OdvuIdK7/nS7RSzlgF2r6bqA8TFssa02Xs9gfoEun+eg=
X-Received: by 2002:a05:6870:b00b:b0:127:2d3d:3c16 with SMTP id
 y11-20020a056870b00b00b001272d3d3c16mr28354057oae.262.1667498036409; Thu, 03
 Nov 2022 10:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <20221103124123.842602-1-richard.purdie@linuxfoundation.org> <20221103124123.842602-2-richard.purdie@linuxfoundation.org>
In-Reply-To: <20221103124123.842602-2-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Nov 2022 10:53:30 -0700
Message-ID: <CAMKF1srrxUn_at-3R8+p_NPdz+r+wsNFS7m5sQbQukvg80ROiA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] gcc-source: Drop gengtype manipulation
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 17:54:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172648

On Thu, Nov 3, 2022 at 5:41 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Whilst we patch gengtype.cc, we don't patch gengtype-lex.cc which would
> be the file which would trigger regeneration of files.
>
> The real bug that was likely the cause for this fix is probably SDE issues
> with gcc shared workdir so this code can now be dropped.
>

good catch. LGTM

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/gcc/gcc-source.inc | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-source.inc b/meta/recipes-devtools/gcc/gcc-source.inc
> index 03837f43811..bf33a4b31ff 100644
> --- a/meta/recipes-devtools/gcc/gcc-source.inc
> +++ b/meta/recipes-devtools/gcc/gcc-source.inc
> @@ -25,8 +25,6 @@ python do_preconfigure () {
>      import subprocess
>      cmd = d.expand('cd ${S} && PATH=${PATH} gnu-configize')
>      subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
> -    # See 0044-gengtypes.patch, we need to regenerate this file
> -    bb.utils.remove(d.expand("${S}/gcc/gengtype-lex.cc"))
>      cmd = d.expand("sed -i 's/BUILD_INFO=info/BUILD_INFO=/' ${S}/gcc/configure")
>      subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172627): https://lists.openembedded.org/g/openembedded-core/message/172627
> Mute This Topic: https://lists.openembedded.org/mt/94755300/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

