Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E31D6C433EF
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 14:35:20 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web09.37446.1653921314341875113
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 07:35:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ggPXQVr6;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.50,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f50.google.com with SMTP id q21so21272663ejm.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 07:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GlWPMwxooSBjf4m+BywV5RQ0+d39lHFH7gCd2wwJUO8=;
        b=ggPXQVr64okF3XzCufwuYsgqxQ3MkxhODEjbpzez9J/GnX76LhT1tBIIwcJ5kUD+r5
         2CozH961+4KC+LSx0NBPlU7XI/InHJu6rp4OHjoaYaPINi00erycETpfxo7ulybuRQow
         KqvaaCBC3eOYkK9hgYpJZMH1Im5tQq4FoLuCriaORNOKVHibC+ODWE2vdHBcDQtbM/2k
         DIi3mFPGDtFOi77zWvRTweWDewcFdTqDN01gg/OG5nIoFrRpcbXnQetoi/ormepXtTfW
         vV9xeQ5eL32I6rvrxVMSh7VUdGOCIHtRQaRuheuGlPlxRjrqJ2pBcrZB/1cl1lDj/yy9
         PDVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GlWPMwxooSBjf4m+BywV5RQ0+d39lHFH7gCd2wwJUO8=;
        b=kIuOOx0SY6Y65EkjGYEydP2FFQyFY4WlD0CZ3X18njyjuLXCE0/SJZQEC+cQkHB/G6
         ZmBLV9aRAjM5f3dzMdU1Umk+8KWUzm5vLjy2eh7VnIAJTZ9tgzsq+u54zxsyE3KReG4+
         5Tu7M+vk6MztrblXy63GZbCg57V5YWlWz00BOf9uiQzkXWywo3swcs3yjK+EQX6cFxPS
         UU3e4bYCj4qnot2df9G2mCV1eCWAwSM1TdWhg9zp8u5Cer8r7mHUO6afg5z2X3Jg14CA
         hRtRout0fq+KQ5sukk5vK19hG0hezZqPycOX1OxAbr67DG33PM1VmWYKu2vxKJBmkX3g
         lM3A==
X-Gm-Message-State: AOAM531bCqpwOmP8aV/UZ2H/UEx3RvJbFMuLcqo+tV8B0RFc/Fw8WidT
	78aaw0O8Ev8kZdtnctp8kzuu5wWmpFsFIuPADRDzsg==
X-Google-Smtp-Source: 
 ABdhPJw7y8lj9XjnxKerkuCbd5Tqkg2zESBRIRpQ5mOM9vSncgBT0NQ0InhSpnCoIbopxPQzXrovjOQ1RS3dJDvnVc0=
X-Received: by 2002:a17:907:2dab:b0:6fe:e1f0:3e8b with SMTP id
 gt43-20020a1709072dab00b006fee1f03e8bmr35864240ejc.55.1653921312448; Mon, 30
 May 2022 07:35:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220525092659.771559-1-lkml@jv-coder.de>
In-Reply-To: <20220525092659.771559-1-lkml@jv-coder.de>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 30 May 2022 04:35:01 -1000
Message-ID: 
 <CAOSpxdZ6OyVH-FPQLi=t6Vp=airtau73oDg+-AKDQryNRADRxQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libseccomp: Add missing files for ptests
To: "J?rg Vehlow" <lkml@jv-coder.de>
Cc: openembedded-core@lists.openembedded.org,
	Joerg Vehlow <joerg.vehlow@aox.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 14:35:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166286

On Tue, May 24, 2022 at 11:27 PM J?rg Vehlow <lkml@jv-coder.de> wrote:
>
> From: Joerg Vehlow <joerg.vehlow@aox.de>
>
> pfc files are used e.g. in 38-basic-pfc_coverage.sh
> valgrind_test.supp is required, when valgrind is installed, otherwise
> all valgrind tests fail

Is this issue specific to 2.5.4 or does it also apply to the 2.5.3
version in kirkstone?

Thanks!

Steve

> Signed-off-by: Joerg Vehlow <joerg.vehlow@aox.de>
> ---
>  meta/recipes-support/libseccomp/libseccomp_2.5.4.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb b/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb
> index c76f3c3573..731d9ae08d 100644
> --- a/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb
> +++ b/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb
> @@ -37,6 +37,10 @@ do_install_ptest() {
>      for file in $(find tests/*.tests -type f); do
>          install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
>      done
> +        for file in $(find tests/*.pfc -type f); do
> +        install -m 644 ${S}/${file} ${D}/${PTEST_PATH}/tests
> +    done
> +    install -m 644 ${S}/tests/valgrind_test.supp ${D}/${PTEST_PATH}/tests
>      for file in $(find tools/* -executable -type f); do
>          install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tools
>      done
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166108): https://lists.openembedded.org/g/openembedded-core/message/166108
> Mute This Topic: https://lists.openembedded.org/mt/91329522/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

