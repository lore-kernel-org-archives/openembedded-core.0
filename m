Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE54C71135
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:03 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web08.6440.1650023699570657032
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 04:54:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Dz5IJAqx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id g18so10392180wrb.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 04:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=/uOR7i28kPu8Pi2dz3o8+ivaEKSwWOJ4EyQUhfp64po=;
        b=Dz5IJAqxd4cOw3btuou9kFYt84ScF4c6/MPo75azQZHZ+LG9/yuG/HKjHv+pLnfJH0
         05WWXeS+yBqQYAC+Nfi8YRx8k9ccPTtrJsydyfT0Nf50NQRe+XSQgpvNXF2amgZLu9Nv
         ByIMNryHOPULAkL43uWT11XgQtiN9nfJKa0mg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=/uOR7i28kPu8Pi2dz3o8+ivaEKSwWOJ4EyQUhfp64po=;
        b=KSQaAdZv7TR3sbMnaNiuxsscyT7LSkveQLmrm3jJenkdQTJwSsZ0+J9M2LpUGfc9kT
         IKuFDfXURlV3kBJqYSlWjqlOUQtrXdeot8wGyB6i3j/S/805rFq15tsDqCOh8W0C/eTj
         7RBAW9TkL3QWapdFDDzqJbwBlDG5KypUHmf1eBH2tAHS6+bD3zAMozVeFf8XIL3yoq98
         ZE1uJnBU9MX6uM7cer0uX7/nmmE6GFt9g0OjBUrX06GmopbKY6JvdEHvXaUy6Drcaqiq
         3p6Qf0SpI/r84hjpEBiEXU2BmwjKaodabsEFd91TOrRbmAmO++IfSNBYfFhctWKvTfC0
         d0bQ==
X-Gm-Message-State: AOAM531MCgwX3dTNTxPaisI3alr5m6VwrzqCuafd6dMazT2pOvHd8AiN
	bYErVKvh6PrkJys3mnKI18gFIA==
X-Google-Smtp-Source: 
 ABdhPJxzDxAlA2fQTjFb745psiNQPuF8bxge+aQleLef62CoviBv+tI0bdKTg87Umfvy8zoPKguajg==
X-Received: by 2002:a5d:5601:0:b0:207:a6a6:468c with SMTP id
 l1-20020a5d5601000000b00207a6a6468cmr5286372wrv.127.1650023697864;
        Fri, 15 Apr 2022 04:54:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:11b3:ac79:b941:ad48?
 ([2001:8b0:aba:5f3c:11b3:ac79:b941:ad48])
        by smtp.gmail.com with ESMTPSA id
 f15-20020a0560001a8f00b002079912f4d8sm3923658wry.49.2022.04.15.04.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 04:54:57 -0700 (PDT)
Message-ID: 
 <4398092db8e21fdf2db1d3346ee16ccdf03804be.camel@linuxfoundation.org>
Subject: Re: [OE-core] bitbake.conf: reason for assignment of deprecated
 variable
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: michael.opdenacker@bootlin.com, Peter Kjellerstedt
 <peter.kjellerstedt@axis.com>, Markus Niebel
 <Markus.Niebel@ew.tq-group.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Apr 2022 12:54:50 +0100
In-Reply-To: <dbec5575-3687-3d8a-ef9e-03a46bc72933@bootlin.com>
References: <2d083c9ebada9a9ee8eaf9c97f3ef3171bdb2356.camel@ew.tq-group.com>
	 <5b5b2b45fe494472abcfc8e06c6480c2@axis.com>
	 <dbec5575-3687-3d8a-ef9e-03a46bc72933@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164427

On Fri, 2022-04-15 at 12:02 +0200, Michael Opdenacker via lists.openembedded.org
wrote:
> On 4/15/22 02:08, Peter Kjellerstedt wrote:
> > > -----Original Message-----
> > > From: openembedded-core@lists.openembedded.org <openembedded-
> > > core@lists.openembedded.org> On Behalf Of Markus Niebel
> > > Sent: den 11 april 2022 17:07
> > > To: openembedded-core@lists.openembedded.org
> > > Subject: [OE-core] bitbake.conf: reason for assignment of deprecated
> > > variable
> > > 
> > > Hello,
> > > 
> > > with the deprecation of SERIAL_CONSOLE the following was introduced in
> > > bitbake.conf:
> > > 
> > > 3f0d665384e6d1b7aa2854a9cc4f13e0961bacb7 (bitbake.conf: set
> > > SERIAL_CONSOLES from SERIAL_CONSOLE by default)
> > > 
> > > Since this is done after inclusion of local.conf and <machine>.conf any
> > > weak default done for a System-on-Module / CPU will be overwritten. Is 
> > > this just by forgetting to remove these lines after the deprecation or 
> > > is there still a reason to keep this as is?
> > > 
> > > Thank you
> > > 
> > > Markus Niebel
> > Given that it is almost ten years since SERIAL_CONSOLE was deprecated, 
> > it might be time to actually remove it soon...
> 
> 
> I agree, and this would allow to simplify documentation too.
> Markus, would you like to submit a patch to openembedded-core?
> Good catch by the way!

This hasn't happened in the past as we've had no good way to notify users of the
change and it would likely break existing BSPs. We do at least have some
mechanism for deprecating and warning about removed variables now which should
help.

Cheers,

Richard



