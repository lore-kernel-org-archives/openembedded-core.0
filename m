Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93CFCC43217
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 16:30:45 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.339.1648053044476366687
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Mar 2022 09:30:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=athKqBs3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id t11so2901600wrm.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Mar 2022 09:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=8R3sVcchDHVNq9EiNUXSuJKMjfWBP88+Asz6bWygdBA=;
        b=athKqBs3WUU2aEbSsds5lLPb9dccwYGY60ppZ96Loq9owyrg66Rc3yzJkJxZdUH7wO
         uL5HsPfpPfKz1ibhcF+/I9WR6i6x/81p+4SnKl8Jhm8r9zHpmpAG+DciII+OWu2k/u7S
         pBCm6/Dd6YyC3HbTVz4DEDa0ClVVOeOokkciY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=8R3sVcchDHVNq9EiNUXSuJKMjfWBP88+Asz6bWygdBA=;
        b=UkXoEaLA3URnayf3uLbCQDmlpH65JAoV5rvoQB96oLzVq5M5GFALYD7Iz9k/75bhOw
         aTpDG8SB3MFjWl6BAhHwJB2LpZAEFzHUh3JFKJgTilf4wBWklRyGNobPGkJDF9vKpXue
         UZbYadzxbMoXGiYiqgFb3WJZ4lIU5XrFChIiCZvosp1HwbWftiLKV7lx++Z9LZlxHyjb
         T8eIywi98AnC4Qj1Z6WlVIOM7qzlB2tF0WWpRu8Ztu6/RZPXKs/HET7M8YerntffmZJt
         KTczkko2o+bbA2szxzd+XRMyB+8DJIEK/wCC8QDeFx8oYZ5wh2ev6k4ENsND0OArr8XB
         uSew==
X-Gm-Message-State: AOAM5304/Sb5R5xJptuEL7PSeHQHIDAirThV3T/ga4PywsJOKlwGBMQU
	ZMPiVx9To5TVKSxrSp1EcYqp8Q==
X-Google-Smtp-Source: 
 ABdhPJyP1HMoW+o/uuErWaRUzKKSbM1ZoLVv2C4RtlLsazY+GTv2XLmJescBf550cENxRxQfG1s3CQ==
X-Received: by 2002:a05:6000:1047:b0:204:101:7c79 with SMTP id
 c7-20020a056000104700b0020401017c79mr607304wrx.277.1648053042675;
        Wed, 23 Mar 2022 09:30:42 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:aaba:716e:9c38:ad87?
 ([2001:8b0:aba:5f3c:aaba:716e:9c38:ad87])
        by smtp.gmail.com with ESMTPSA id
 f9-20020a0560001a8900b0020582807408sm309118wry.20.2022.03.23.09.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 09:30:42 -0700 (PDT)
Message-ID: 
 <f739e5cf67d1f7eb40a18dde20aea90ea3200d15.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/5] qemu: Depend on virtual/egl
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Ross Burton <ross@burtonini.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Mar 2022 16:30:38 +0000
In-Reply-To: 
 <CAMKF1so19J5LtAcO-kc14nBWUEjqOqTGZhk3A7vhTruMkgNugA@mail.gmail.com>
References: <20220308155252.2454464-1-raj.khem@gmail.com>
	 <CAAnfSTtiGgXAi675oJ1oxkX+r-f1bwT7+Utc-8ddvPwC_zaTSw@mail.gmail.com>
	 <CAMKF1so19J5LtAcO-kc14nBWUEjqOqTGZhk3A7vhTruMkgNugA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Mar 2022 16:30:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163589

On Thu, 2022-03-17 at 08:29 -0700, Khem Raj wrote:
> On Wed, Mar 9, 2022 at 4:30 AM Ross Burton <ross@burtonini.com> wrote:
> > 
> > On Tue, 8 Mar 2022 at 15:52, Khem Raj <raj.khem@gmail.com> wrote:
> > > -PACKAGECONFIG[glx] = "--enable-opengl,--disable-opengl,virtual/libgl"
> > > +PACKAGECONFIG[glx] = "--enable-opengl,--disable-opengl,virtual/egl"
> > 
> > Either the packageconfig name is wrong, or this patch is wrong: GLX is
> > explicitly big-GL not EGL.
> 
> Neither seems to be wrong. see
> https://github.com/qemu/qemu/blob/master/configure#L2289-L2313
> 
> It's expecting epoxy with egl. So virtual/egl is a better
> representation. Maybe we should
> add epoxy to depends section of packageconfig separately.

I think Ross' point is that the PACKAGECONFIG option could do with renaming
since it isn't GLX at all...

Cheers,

Richard


