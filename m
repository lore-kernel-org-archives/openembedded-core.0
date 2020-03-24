Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.4065.1585050616126121779
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 04:50:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=f7gGf8XV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id l20so3103456wmi.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2020 04:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=BbS2dtzAOq/eVmg6vm1DkQtzyFvh9rnM/ynKnpc8/zc=;
        b=f7gGf8XVa6Sc7nuzNpVdGX2eOzTCJRKKb4I64Ia2zWyV88HPfUQvH7tSclNUmbN5Lz
         Ez3B8EQ2U6SFjRBRCwgb5BaQmiyRVL13UJ9jYknjiYIIOHGHtHeQGACclHgkYc7CV9UY
         Ka1Ti90AykxW0+U576aOHfxQXH/Ksz9KDwBPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=BbS2dtzAOq/eVmg6vm1DkQtzyFvh9rnM/ynKnpc8/zc=;
        b=A9F3J2+hIK5t5SU3E+6fMLoirIZ0x1s8IK5WLoJx3ZrPoAgkqP72MKfpw5fjL8YS7f
         FIDSIZDrNTlF2cmflQGKfWFd4VYnAdiSuHtqWgt/dCbzSDlMzo48b0wdRVjsuxVpf86q
         /bnngO5T+kTvexIARpCN2rhAu/jG+910uNUUh1u9cHwX7XoIrcJWy/ja5/2OoH3uKfFa
         fqy8VJGY+bhpxa17qGHNrZwhk90IYPxZ8NWt7wlHbZbS1+L3yymJX89I12PsJgjKeSL/
         d6xdQcrxfp1bdJrhokar+qeLfk075GGFs3N1CPTZibnhY8iR5mp94iZ8PSS/sVN9lJd2
         YHWg==
X-Gm-Message-State: ANhLgQ2Goc50eBCkhxuVxuGrDxLR6KhwmqyMgaO8Bfd+b0a0FPE2fX48
	oTuikXCr8L37XePnAaWfF7oQNg==
X-Google-Smtp-Source: ADFU+vve6imOy/Ii+5xVtfQS8NITc0JoZFdeeuO7S0azSVNcwx/vQ0SyhX59Inzq3yzxlj4EexXm+A==
X-Received: by 2002:a7b:cbcf:: with SMTP id n15mr5440068wmi.13.1585050614671;
        Tue, 24 Mar 2020 04:50:14 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id p13sm16149910wru.3.2020.03.24.04.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 04:50:14 -0700 (PDT)
Message-ID: <ab2b3e84dea3b88666bf4807466b4bb64ab359b3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] lto.inc: Add global LTO distro policy file
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Adrian Bunk <bunk@stusta.de>, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 24 Mar 2020 11:50:13 +0000
In-Reply-To: <20200324112723.GA10278@localhost>
References: <20200323232529.3658577-1-raj.khem@gmail.com>
	 <20200324112723.GA10278@localhost>
User-Agent: Evolution 3.35.92-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-03-24 at 13:27 +0200, Adrian Bunk wrote:
> On Mon, Mar 23, 2020 at 04:25:29PM -0700, Khem Raj wrote:
> > Distros which want to enable LTO can utilize this file, it only
> > covers
> > packages from OE-Core, other layers should include there own
> > exclusion
> > list for recipe which dont work with LTO
> > ...
> > +++ b/meta/conf/distro/include/lto.inc
> > @@ -0,0 +1,23 @@
> > +LTO_pn-glibc = ""
> > +LTO_pn-gcc-runtime = ""
> > +LTO_pn-libgcc-initial = ""
> > +LTO_pn-libgcc = ""
> > +LTO_pn-libpam = ""
> > +LTO_pn-elfutils = ""
> > +LTO_pn-perl = ""
> > +LTO_pn-busybox = ""
> > +LTO_pn-libxcrypt = ""
> > +LTO_pn-curl = ""
> > +LTO_pn-libcap = ""
> > +LTO_pn-python3 = ""
> > +LTO_pn-libproxy = ""
> > +LTO_pn-libbsd = ""
> > ...
> 
> It would be better to have these in the individual recipes,
> it is much easier to understand what is going on when all
> recipe-specific information is in the recipe.

I disagree. These files do let someone working on specific enablement
see the status collectively and allow people to opt in/out of a given
development feature.

At some point in the future that can tip into making more sense in a
recipe but its a staged process and things often make sense to start
like this.

Cheers,

Richard

