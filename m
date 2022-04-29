Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A403AC433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 04:48:14 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web12.6494.1651207684954909046
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 21:48:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GIAv2ms3;
 spf=pass (domain: gmail.com, ip: 209.85.222.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id a22so2042153qkl.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 21:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wrwr95JfxVV86U7gO8BB7cjgqtp9mZCMfIizdLyudKs=;
        b=GIAv2ms3N00k2oHi0qfwJolMgsUAWhnP+KJL3gTOt1cirehaOkTFzM3lP5kDGdx7Ge
         slfjfBViqvZWvbjEbGD+QnSn0oaAEyvUOe5dSnFY1XwYu24wIrcRThmDN7qKIs53xGcI
         Lax+gVhnULMXdMqfuQAHvQdCvzrpt2QXa3F6mbTJzWE65QigR71630RmTFsGY/2a9xjr
         99NEY1L+5f41YinIQ/pvxxN3+84hTEF6CPaVR/RKQmeiY27l+CJXzS4lm1xSXx4APA1k
         6vfhM9/tpW6Td4ZfPUCCytXEvsSjkzABpccQ0cYkpU+bvU491IvrBaX6ab1F7tRdcEfa
         x2Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wrwr95JfxVV86U7gO8BB7cjgqtp9mZCMfIizdLyudKs=;
        b=ldifFXBGpvadHnRKOS4YJKNRX/tF4ADTffKcACfWofdTXkBA1+QhjtkCAMHmrxtc8m
         TX+q+vcmlpZ8KOE2unVzvZaq+IYNm7r0uCMa2uuUs8H2dt6UNUSnvM1BH6GVBZs+Hcdl
         VLxTWeBBKB6TMtb5wuUfiGAd9dmuAOKYp57OIGEZuJvFiwGanGrBy6SfC4SoIKaD7ysB
         gINmPOd1mwi/1lEK7cd8aUHYsWUnx5/6DhhnD86/lmF+0lkvWmivqMYQ02KTn+8E/4Ep
         HggTdm+BW3hxpoOf2i6pM0i8DqhJ9+ypgVTcUVYy7N5NacmjheeRxObEKpaxLDIPh2S0
         iE5g==
X-Gm-Message-State: AOAM530sRvv29oLCZO2+BW/fjN4oz1FwTXcthmSGimJxLQUgGzgt73TF
	hyydCX9kkWzJt5B3QkzOpexduk1ZL9FOeHkB1AVsagMoSjk=
X-Google-Smtp-Source: 
 ABdhPJywY9Xyg94KhDBIFhV5d2n7a3/j8lYAr32HlahMCnDjs7VbpeDkbE8sGnMpb+D3RtPkWk7pVZN9VA6Aw8OLHrg=
X-Received: by 2002:a37:6297:0:b0:69f:ac0b:5f18 with SMTP id
 w145-20020a376297000000b0069fac0b5f18mr3151336qkb.180.1651207683862; Thu, 28
 Apr 2022 21:48:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220429022238.38588-1-Qi.Chen@windriver.com>
In-Reply-To: <20220429022238.38588-1-Qi.Chen@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Apr 2022 21:47:38 -0700
Message-ID: 
 <CAMKF1soXsZsyvu-wP8Qac+=qrfx_2tw3TYkW_BpjDj+kBnCOYw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] go-helloworld: remove unused GO_WORKDIR
To: Chen Qi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 04:48:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164989

lgtm, thanks for fixing it

On Thu, Apr 28, 2022 at 7:23 PM Chen Qi <Qi.Chen@windriver.com> wrote:
>
> The GO_WORKDIR is used only in go-mod.bbclass. As this recipe does
> not inherit go-mod.bbclass, this variable is useless here.
>
> This go-helloworld recipe was made to inherit go-mod.bbclass and build
> in module-aware mode. However, it was found that we need to build go
> recipes in GOPATH mode in order to support offline build. As a result,
> this recipe was changed back to only inherit go.bbclass. But the GO_WORKDIR
> setting was not cleaned up.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-extended/go-examples/go-helloworld_0.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
> index 0faab39b66..d0de035921 100644
> --- a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
> +++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
> @@ -11,7 +11,7 @@ UPSTREAM_CHECK_COMMITS = "1"
>
>  GO_IMPORT = "golang.org/x/example"
>  GO_INSTALL = "${GO_IMPORT}/hello"
> -GO_WORKDIR = "${GO_INSTALL}"
> +
>  export GO111MODULE="off"
>
>  inherit go
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164986): https://lists.openembedded.org/g/openembedded-core/message/164986
> Mute This Topic: https://lists.openembedded.org/mt/90768475/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

