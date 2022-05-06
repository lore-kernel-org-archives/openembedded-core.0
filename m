Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D33DC433EF
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 15:41:59 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.11008.1651851709464775572
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 08:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=T2IEPRLN;
 spf=pass (domain: gmail.com, ip: 209.85.160.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id fu47so6262942qtb.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 08:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wja9gqHwhHohK6MSKKQ1Ul1j4mK4IqdlqkRxtbaFJoc=;
        b=T2IEPRLNIcU7D0hniSfTv2eBfLFf6iaSeELiv2Q0K3sQfLlvPer7E7rLpaPrf2u3Q1
         T2ArTV+2fZeJ6mfJ6734t198HGipIYj8Ut2nSq7myBuTzy5gKzhU62/PrPyonOseIheF
         K3wMBT+VpedW5Qq9eNdKGBsTDNl53XO82WmFk8PUsCmHaeUItv2U/VpQvu5CuIfN295O
         p3XvNaQuGBL4y4BZXaoEOGdSByIg+3eks9bIi4VOxAMyl+Th7Aq65CWFDxTjmNwxVFaL
         JoBwszL6yyOzfjn0ZP7NkimMq3PueYo9mcqCJk3dsjKXvpxx2oykoAQKkP4m2aM45/6I
         5e3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wja9gqHwhHohK6MSKKQ1Ul1j4mK4IqdlqkRxtbaFJoc=;
        b=JrNjVbAM+Ihvt5flyHfPdGbCzUXkHKlHPaa3Q/SBMfbm6nd0/4GMjXx0GxSMoLU0C7
         C2ZUNDJCAJTU9OaDYz6roavk7Lst987hFYX2tt9bAfUzvGxek63ZccgmNSzpABIpChga
         FHb2JZaj2yHsybQ1U9wQb+iOWNi6sQW4Da1JWkqusxTHd2mYNXwxn/FTbwPJRRHQtJgY
         SPDSND5RgiF12gys60hMWq4sgTFDkc02zjLEayXHCEcDahS4ziltvfvIeM4XoVnQ92QM
         +8USaBQrC7flpwx9crpGQnBLxqI0eoydOqPABqG+4ZlZXJWnbzArcCj7LiYbYspqc0MS
         uaXQ==
X-Gm-Message-State: AOAM533KuqVOp4AW3zgJJpxf4IjnwsVKdk/QFz1dZvIUQouExim1hU8n
	oK0hR16R6NBFV6qdUedx6gQSvnXa4X0p142Vm6w=
X-Google-Smtp-Source: 
 ABdhPJxCbbIzijj+6KGJBzVB6/U+ODmHC+15FUg+75hhVjNX1KnO4e1zIqk2DKgeHuETnhlu5os6mOVA2Em2344e+b4=
X-Received: by 2002:ac8:7d44:0:b0:2f3:af0b:dec1 with SMTP id
 h4-20020ac87d44000000b002f3af0bdec1mr3248481qtb.634.1651851708505; Fri, 06
 May 2022 08:41:48 -0700 (PDT)
MIME-Version: 1.0
References: 
 <0f338ca1e26012b86f183975252e670f11776e99.camel@linuxfoundation.org>
In-Reply-To: 
 <0f338ca1e26012b86f183975252e670f11776e99.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 May 2022 08:41:22 -0700
Message-ID: 
 <CAMKF1srnfLwbEnD=h8MNSa4WXBf8RDJ+x=uqxBfHVb14ARktvg@mail.gmail.com>
Subject: Re: gcc12 testing results
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 May 2022 15:41:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165343

yeah meta-virt is seemingly a new addition. Adding Bruce also about
the failures.

On Fri, May 6, 2022 at 8:14 AM <richard.purdie@linuxfoundation.org> wrote:
>
> I reran the gcc 12 testing. We still have an issue with linux-yocto
> 5.10 and edgerouter:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/111/builds/3046
>
> and meta-virtualization has a couple of issues:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/46
>
> Build is still going.
>
> Cheers,
>
> Richard

