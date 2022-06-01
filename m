Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE62C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 15:17:06 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.9061.1654096619983519976
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 08:17:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Z7VZwGje;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.41,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f41.google.com with SMTP id m20so4416201ejj.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 08:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=juIU5tIZ3aojwe0WzxBDpx8bcbCK0ws1uaR30p2YNrI=;
        b=Z7VZwGjevdOFH1UTWJ8Cq0D4Xumff61AAdogzUoi38TupwensfLChorhk9j9K4IBfV
         iyCa+R/13ARWWu8a0XJLaqagKshvujwaSZiQhlzQTdAw0B0x5NK+YL34oZdKYSzElMkD
         YKc/GYfvz547Ptv11K5CIX6WPmqcr91xjNQr0umsI3at2zZAVMjzYnMcI/WQSb+t7xVe
         1HFCpGtsansu3GY221Gr8FoOkEGWP3gImc8Xu5VlccIWuEJSuRBIJdrfYSYuAs3qZCsW
         wJjIlAfLIcd4B/uHwqgTJN+a1GuXEdUrztpwPtcjWp+jjPGDz3aNwbU3QjOrDj7fVC6v
         NHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=juIU5tIZ3aojwe0WzxBDpx8bcbCK0ws1uaR30p2YNrI=;
        b=NJrLmceCv2c71cshtOZma1X4/gkx0AjceCyt44QF/zd47IVuxbe+ajRjn1n+/tsPA1
         oA6jIewUsHaXzJyCZvAPrGeCwE1P3PpghUCw7HC9RMACZWQbv7XiOIGlDZu2sER5zgmJ
         QqGa3iIB3jxWnRazpghlBz/gsLDS47IHiRzVDQG24DlJfgMr5Vg+Jvyb8uVz/iZvUPqt
         UTtdX19jvCNRblJPcvNhELpAookIWmL/YnIs60zP1c3Ro9UHSgoY68/GdzNfNBpEBdWv
         EtB66s1fI5zGvOMjovciTuppLmKSBSlPTRnn8r55Krad+UB670J6QPdK9qpl8BnHS7Nm
         a/qw==
X-Gm-Message-State: AOAM531VpmAOopXGiEU6sYrnX4Wd8cjYY4AIbhUL2pwv7DGzfaEqP9yk
	q3LM0/jRV/eo2VZiaDgykDq4Y9fQaGc78cbKdKAxbA==
X-Google-Smtp-Source: 
 ABdhPJyShnSo/pOXf8poLHlaUrcbe3j+qCCbpEi7Cvf5aa8fusDc95vt5ZCfQFHIq+qL5lFftgM7scnCDBHDEJsPToU=
X-Received: by 2002:a17:907:60d3:b0:6f9:6ac6:2335 with SMTP id
 hv19-20020a17090760d300b006f96ac62335mr14242ejc.628.1654096618348; Wed, 01
 Jun 2022 08:16:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220601105312.29861-1-omkarpatil10.93@gmail.com>
 <20220601105312.29861-2-omkarpatil10.93@gmail.com>
 <16F487B15DA54383.31706@lists.openembedded.org>
In-Reply-To: <16F487B15DA54383.31706@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 1 Jun 2022 05:16:47 -1000
Message-ID: 
 <CAOSpxdYJ_6JA9P6oKj1fdnT2NKm9kiuYPcpqEcjk89v6JzFsCw@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH 2/2] libxslt: Mark CVE-2022-29824 as not
 applying
To: steve@sakoman.com
Cc: omkar <omkarpatil10.93@gmail.com>,
 openembedded-core@lists.openembedded.org,
	omkar.patil@kpit.com, ranjitsinh.rathod@kpit.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 15:17:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166387

On Wed, Jun 1, 2022 at 5:09 AM Steve Sakoman via
lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
wrote:
>
> On Wed, Jun 1, 2022 at 12:53 AM omkar <omkarpatil10.93@gmail.com> wrote:
> >
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> >
> > We have libxml2 2.9.14 and we don't link statically against libxml2 anyway
> > so the CVE doesn't apply to libxslt.
>
> dunfell libxml2 is version 2.9.10!

I just noticed that we have a libxml2 patch submitted to fix CVE-2022-29824:

https://lists.openembedded.org/g/openembedded-core/message/166376

So you can adjust this patch to reflect this and resubmit it.

Steve

>
> Steve
>
> > (From OE-Core rev: c6315d8a2a1429a0fb7563b1d6352ceee7bc222c)
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit ad63694e6df4f284879f7220962a821f97928eb0)
> > Signed-off-by: Omkar Patil <omkarpatil10.93@gmail.com>
> > ---
> >  meta/recipes-support/libxslt/libxslt_1.1.35.bb | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/meta/recipes-support/libxslt/libxslt_1.1.35.bb b/meta/recipes-support/libxslt/libxslt_1.1.35.bb
> > index 0f25043743..47a38deb13 100644
> > --- a/meta/recipes-support/libxslt/libxslt_1.1.35.bb
> > +++ b/meta/recipes-support/libxslt/libxslt_1.1.35.bb
> > @@ -19,6 +19,10 @@ SRC_URI[sha256sum] = "8247f33e9a872c6ac859aa45018bc4c4d00b97e2feac9eebc10c93ce1f
> >
> >  UPSTREAM_CHECK_REGEX = "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
> >
> > +# We have libxml2 2.9.14 and we don't link statically with it anyway
> > +# so this isn't an issue.
> > +CVE_CHECK_WHITELIST += "CVE-2022-29824"
> > +
> >  S = "${WORKDIR}/libxslt-${PV}"
> >
> >  BINCONFIG = "${bindir}/xslt-config"
> > --
> > 2.17.1
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166383): https://lists.openembedded.org/g/openembedded-core/message/166383
> Mute This Topic: https://lists.openembedded.org/mt/91472462/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

