Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29031C433FE
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 15:26:31 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.11004.1634225189914291953
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 08:26:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=C2gKQTQE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id u18so20791724wrg.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 08:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=cXlZYtDtSCJxihzDxK2vB1hP/AZbiKtHKv8y6dW0i1c=;
        b=C2gKQTQEx4XystqZ8nmoyI9fBdNp/KobXLx3HXZdeFbdjBlG4S3DCMqHGS18lD+n/f
         8YoHjJHmJzD8kXkDnI3ZPJ0yxcYu0ka1cGwVDiCTdy9BmVkR4ba40wwpwAcrzE10xK47
         3apkrNs7eZYOilKY3F68WiNSet2JCYM39m0SY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=cXlZYtDtSCJxihzDxK2vB1hP/AZbiKtHKv8y6dW0i1c=;
        b=Plzsk2/cVfr1C86F1yHRTHJ033kkVcHY6D/AoCaIKBq6jvuuc5llCVwKndGfwGu3+Z
         AxCVAlAkOmRFsPgHhc1nk9KWSRWvFG7CD9E+1Yp5acxiMKki37c7mv3KnafU86MZLXM/
         pV1UxKIEPGYUDIidoEKx9RcL64imV11XLnLb+zhh2pfwVapnaXh6fe8fJa0BMKKCTlnV
         zIZa1S8Y4s/Mn8c817K2WAtmXQYO85HzS+fKhstQo/Jeo5GFC0CSRH4DfMPOv9eNGz95
         IJEDCPOeLf1ehFbuuePb87TWl0CAUwuQmjvaMN7qm6TEcDLCvjl1BfCey5Sm6xaJT7wQ
         NdCQ==
X-Gm-Message-State: AOAM532jfsLO0jWxEPqlpgyqSox6NleyAAVDRDRA1EyrbUsQQRO6N5lA
	GNEwrU0daVvGlvwItS+NyKh9mg==
X-Google-Smtp-Source: 
 ABdhPJwyGDF3QlK7+fvHH7tDgIXIfISasLy6awlEsd8NHJzZXkgeV8d5s9YMM57OSXUxUUor9dSRvA==
X-Received: by 2002:a05:6000:551:: with SMTP id
 b17mr7452648wrf.18.1634225188312;
        Thu, 14 Oct 2021 08:26:28 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:eb5c:837c:62b1:b238?
 ([2001:8b0:aba:5f3c:eb5c:837c:62b1:b238])
        by smtp.gmail.com with ESMTPSA id
 k17sm2554022wrc.93.2021.10.14.08.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 08:26:27 -0700 (PDT)
Message-ID: 
 <466b938ab0bc487a7d0705959ca4b047acc68e74.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 7/7] reproducible: Drop
 BUILD_REPRODUCIBLE_BINARIES variable
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Oct 2021 16:26:24 +0100
In-Reply-To: 
 <CADkTA4OaNxpO_gSBRVpOypKZ3yRSEkCXQ5s39O7UkHLbq2DdVw@mail.gmail.com>
References: <20211014121025.2913401-1-richard.purdie@linuxfoundation.org>
	 <20211014121025.2913401-7-richard.purdie@linuxfoundation.org>
	 <CADkTA4MccXdOvzaEoHOX-wVj-iFsLRb7OsDpO+myowr3f0gT=w@mail.gmail.com>
	 <f83e1f3063a28ca1e761ab11656846fd71ca41e2.camel@linuxfoundation.org>
	 <CADkTA4NZRmGhb92Y22MnGsQhdxZOUtpg99pu0LahdZgyCJCzzw@mail.gmail.com>
	 <YWg0Zxz52+65ukRp@piout.net>
	 <CADkTA4OaNxpO_gSBRVpOypKZ3yRSEkCXQ5s39O7UkHLbq2DdVw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 15:26:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156961

On Thu, 2021-10-14 at 09:46 -0400, Bruce Ashfield wrote:
> On Thu, Oct 14, 2021 at 9:45 AM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> > 
> > On 14/10/2021 08:38:46-0400, Bruce Ashfield wrote:
> > > On Thu, Oct 14, 2021 at 8:32 AM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > > 
> > > > On Thu, 2021-10-14 at 08:28 -0400, Bruce Ashfield wrote:
> > > > > On Thu, Oct 14, 2021 at 8:10 AM Richard Purdie
> > > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > > 
> > > > > > We want things to be reproduicble and the variable doesn't really change
> > > > > > much any more. Drop the remaining uses and make those code paths always
> > > > > > active.
> > > > > 
> > > > > It wasn't clear to me from reading the patch.  What is the way that
> > > > > someone would now get the current timestamp into a kernel build, if
> > > > > that's the behaviour that they want ?
> > > > 
> > > > With this change they probably don't get the option. If we want that to be
> > > > configurable, we should probably move the control to a different variable which
> > > > is focused specifically on the kernel. The hardest bit is probably picking a
> > > > name!
> > > 
> > > This is probably the most surprising feature of reproducibility for
> > > kernel developers, and a question that I've gotten multiple times
> > > ("what happened to my timestamp ?" followed by "how do I turn this
> > > off?")
> > > 
> > > Most kernel developers already don't really like the "yocto workflow",
> > > and this adds another element in that category. It is common in a
> > > debug scenario to check the timestamp of the running kernel to make
> > > sure that you've actually booted the one you just built.
> > > 
> > 
> > But do kernel developers actually do their development using YP?
> > I definitively not. I do all my BSP work outside of any build system and
> > then I finally integrate everything once this is working/ready.
> 
> Many do, yup!

I've sent out a new version of this patch with an additional one which gives
people a setting to control the timestamp for the kernel.

Cheers,

Richard


