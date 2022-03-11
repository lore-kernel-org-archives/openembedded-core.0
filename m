Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA31CC433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 16:28:40 +0000 (UTC)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web08.7506.1647016119092830261
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 08:28:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=w0DjKE9O;
 spf=pass (domain: linaro.org, ip: 209.85.217.45,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-vs1-f45.google.com with SMTP id h30so10016791vsq.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 08:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GL44+4VDMW7KpeBmebZUo2WXsqp+lNZBlAnGFJ0F92o=;
        b=w0DjKE9OSi0JYzvClBS3aWy1CXvXPCvPhIPIyrhnWltj8hL+8qiuC+Ui+WMQDsPAVj
         1o8JjZK7sCaSv57PiFqntlb3kJnqwyDItKmMBTU/fScR8pxEu5xrJH4e2xZazwSHuXNT
         t2lPF4/rkQEd1quH3jSMCtlmHR3jJiYHoPz1VGhCtQHfIbv2II7axIkjtGlXOCHbpcnL
         s0w9gmR9CV+llc1apE+Doit3qcpXjUp+zIKQIzA1J7ajb9cpqwUTALEcHYwX6m09SxDk
         JOIw0kgbMvKVSrQuqa0oNnAtKgtoAKCpqyKD2GIeUzwP6uBTF+0wW/MskEXeQFsLXDKQ
         rqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GL44+4VDMW7KpeBmebZUo2WXsqp+lNZBlAnGFJ0F92o=;
        b=iQDdeq2zi2MZpSl0W0mBWkPTxeCP/+sx47S0cSCDll/sObAtv4xpxwIP5/NCe+Cccc
         W0SNTfoYgZLkyacRvk8HUSPDnrvXJqB+cQr0QBVr83V3iAOoWyH+4jh5N3bJZgQcD9Z9
         1ltWsWMjdFm7eobfE4ySj2nVAoHE22h5dYfGSNWSCiXdVNpxRh9K2sRl/JtH3vLwfd1C
         /fQAN7Vx1X8w2Jf+daMpI05+AcKmmAw6QNRazTuWRyW66RpfeB4EcyHTwotN6XTK+yhl
         QdyaRIOJtwZe0ecv+ZZHzOVYnXTz7g7xcxXZw8IvITZcHhNBvxG/Tf9uBWmiTtyDY0wo
         8eIA==
X-Gm-Message-State: AOAM530wR2lcfIXXq0KFsyRBghxxin+G1qXIX9Ct071X3+oaxiSeUIcD
	gKdZsAr/zwcyt1Fs5IcNs4rassfPHFSyaDtmwvjCtw==
X-Google-Smtp-Source: 
 ABdhPJzvVHTXJUURlbwRH4ieX+A0q3d1VAiTeUf7MCTmxXqft7JYb91QwbvZefrfZbgUTmJ6R20gcHhdpHL31TuAbG8=
X-Received: by 2002:a05:6102:ed5:b0:322:ba55:d279 with SMTP id
 m21-20020a0561020ed500b00322ba55d279mr1617621vst.77.1647016118122; Fri, 11
 Mar 2022 08:28:38 -0800 (PST)
MIME-Version: 1.0
References: <20220310183234.608500-1-ralph.siemsen@linaro.org>
 <CAOSpxdYpQn_wMjHSQjkb23yeg+5hP=LMUCUZNiWyJ6_9t7b-nw@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdYpQn_wMjHSQjkb23yeg+5hP=LMUCUZNiWyJ6_9t7b-nw@mail.gmail.com>
From: Ralph Siemsen <ralph.siemsen@linaro.org>
Date: Fri, 11 Mar 2022 11:28:27 -0500
Message-ID: 
 <CANp-EDYr1D974n-Gbuppr3DL=E1J0Pwa3p3uSg3X6TUwGCYd6w@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] bind: update to 9.11.36
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Mar 2022 16:28:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163058

On Thu, Mar 10, 2022 at 9:34 PM Steve Sakoman <steve@sakoman.com> wrote:
>
> This passed a-full on the autobuilder:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3347
>
> So I'll be including this in my final pull request for the 3.1.15 release..

That's great, thank you.

Note that this is likely the last release of bind 9.11.x series.
This branch is EOL according to [1] and [2].

So that will make things interesting if/when the next CVE comes out...

[1] https://www.isc.org/download/
[2] https://kb.isc.org/docs/aa-00896

Regards,
Ralph

