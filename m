Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.322.1600728620600208354
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2020 15:50:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VE2wnEjb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id z1so14792587wrt.3
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2020 15:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=HihoNI+hi3kx7hTbVLsM8h9/RX0z2q7QtMk2IjBsH3E=;
        b=VE2wnEjbYSspRoXtbtUKvDA4BWK2fWXs9RQPke/ctr1I2+MW7fQI8uZ9BydrF1BAJi
         dxeRmySX1ebOWlkmJbZoizIfim29PzGSyUtGkgNEqWQKNnq3jDmMTS6zFtL94t79uzLZ
         fCPNcsxnwQwSRR1Jq1zXvbQEMKuDY9Ek+Xw8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=HihoNI+hi3kx7hTbVLsM8h9/RX0z2q7QtMk2IjBsH3E=;
        b=LR0ldN/q3752EUXE4T5A1XKc84iQ0ev8CRbFlCys75GXqEmB/Gpt094bjj0Dj6pA3B
         MSjvEQweTA3H4dABnVPqEqwleW2KKfVWpOpl0Uo8Myxxhglj8mm8eY8gAvEPa9rW9MC6
         /Mksk9EQDtBHjAtXzSbBNgrgcKCiiR5bzZXYH692C/88dcBl7kwH5NxwLzB03+jQN533
         c2krL/65czBwy+yupnTj14uaE8j4W4LQQyh/tm2hG7Ut5R8n5/8wjZmxTlCpctsxvtXI
         tCxAi0gP1ngzfVeZzvdmvSdRofN0WC9a8bSbleWq171WPtheD1H3epBu5LFjbTThg5DI
         Bjcw==
X-Gm-Message-State: AOAM532X3k1079RzH954c2UflAH9jBqs368cl/aNhvIsBv2YMSewffTT
	umi3B+WO30w/l50OksGrvViFBg==
X-Google-Smtp-Source: ABdhPJwPUBJ1+lM5JFcz1L1SlQZtNU0GLNqFEwn2Qd22Ix2iiYRL6jbx/ztGl8u8kmTXZ/UylSkqsw==
X-Received: by 2002:adf:ef45:: with SMTP id c5mr1944385wrp.37.1600728618895;
        Mon, 21 Sep 2020 15:50:18 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.4.9.1.b.0.3.3.1.2.9.4.4.4.0.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.4.9.1.b.0.3.3.1.2.9.4.4.4.0.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b044:4921:330b:194d])
        by smtp.gmail.com with ESMTPSA id h204sm1451852wmf.35.2020.09.21.15.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 15:50:17 -0700 (PDT)
Message-ID: <581392d58d402cf3b79f8bd36f8d5d5f7fa4c1bd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 8/8] New systemtap.bb class, and systemtap-demo.bb to illustrate it.
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Yann Dirson <yann.dirson@blade-group.com>
Cc: openembedded-core@lists.openembedded.org, Yann Dirson
 <yann@blade-group.com>
Date: Mon, 21 Sep 2020 23:50:16 +0100
In-Reply-To: <CA+4=imb9n8r-taOxj68JagEVJkisUFk3vHVbKOru8Td24kLHdg@mail.gmail.com>
References: <20200921141544.3145189-1-yann@blade-group.com>
	 <20200921141544.3145189-9-yann@blade-group.com>
	 <1c41fc0d0f0928baeacb628812cafd66de745b75.camel@linuxfoundation.org>
	 <CA+4=imb9n8r-taOxj68JagEVJkisUFk3vHVbKOru8Td24kLHdg@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2020-09-21 at 23:23 +0200, Yann Dirson wrote:
> 
> 
> Le lun. 21 sept. 2020 à 21:46, Richard Purdie <
> richard.purdie@linuxfoundation.org> a écrit :
> > On Mon, 2020-09-21 at 16:15 +0200, Yann Dirson wrote:
> > > From: Yann Dirson <yann@blade-group.com>
> > > 
> > > ---
> > >  meta/classes/systemtap.bbclass                | 74
> > +++++++++++++++++++
> > >  .../systemtap/systemtap-demo_git.bb           | 71
> > ++++++++++++++++++
> > >  2 files changed, 145 insertions(+)
> > >  create mode 100644 meta/classes/systemtap.bbclass
> > >  create mode 100644 meta/recipes-kernel/systemtap/systemtap-
> > demo_git.bb
> > 
> > I'm afraid this patch is going to throw warnings all over the
> > autobuilder, e.g.:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/2488
> > 
> > (and there will be more).
> > 
> > We are trying to ensure all warnings are solved so that any that do
> > show are real issues and this patch would significantly distract
> > from
> > that.
> 
> OK, we could default to built just the handful of probes that should
> always build, and give instructions for those willing to use the
> current behaviour.

I think that is going to be safer and we could grow into more examples
if/as/when we van build them.

> 
> > I'm also wary that we're now in feature freeze for release so
> > perhaps
> > these changes should wait until 3.3?
> 
> OK, I can reroll a series with just the fixes.

That would be great.

> For the rest should I just wait for the gatesgarth branch to be
> created and resubmit then ?

Once we start taking new work on master, yes.

Also, for a new recipe like this we need a maintainers entry, else we
see:

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/1377

Cheers,

Richard


