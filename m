Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.16353.1602256880884053393
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2020 08:21:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=A8ZpShoj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id e18so10697993wrw.9
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2020 08:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=EMWUTmGyMh67RAsj7TS4t2ElZ8v3B4/r/33NjGSb36U=;
        b=A8ZpShojSEaq0jUEhhR13+9daDeT/gy6SlFzgeT5iLwqDEXkWNtsrQla/hpWzj7Zgq
         bHM+Pui/NHIzhybQBAQUsfaYfgqjBfKsHwaDu1fcEe9gmpUs4RiS07r6TNNz2445E04A
         i8X7GXW1HWnVtVYI9XYb2NbwxU9DI3/DDhdRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=EMWUTmGyMh67RAsj7TS4t2ElZ8v3B4/r/33NjGSb36U=;
        b=nQ5XdHq+9bVpe/kuPMOusherN1qgXDj8Q2IyMi2uz0Hl5NZa5069NXwsU6XZBR0/mu
         qlLzJ+f3gW3B1ACbatw8P+NoqCUSxMKBLjjqiAKRlEu/mzFIurqthOjk1hohA4hHTT2S
         jhKnihAsRpEhSKKXWdjA+W8HPo/BpG3QaeNrXCu/x12wllqjnbCLApigcM1/w2ikhs/C
         KGOzblAq5NVzDIEo2XDb2YL8lLnTs2H7zJagKSDoorntgQ0yZ+hvNUaRBmKxu3FN/U0a
         E0T/n6fZ9xgYBYUnQN0GuBQjLNbkdb0elTipd+ZXDOpz7fVzI6BRcHXWCMw878kzdRIY
         Zz/Q==
X-Gm-Message-State: AOAM531KtNFOtk6xjzjn0f0rMzc4HZcJPiLLhCYmC6S3DYDhW5TDUzp9
	/HRaSQEIg8xTScasl9GCBLB6Kg==
X-Google-Smtp-Source: ABdhPJxgmXj5uXkvw+nZlEqkMVvqyWjD35YRhcHlcL8fvv1CUieLdSZZOtwn0WgLTSBCocTblNcXCg==
X-Received: by 2002:adf:a29a:: with SMTP id s26mr15619329wra.197.1602256879219;
        Fri, 09 Oct 2020 08:21:19 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 0.6.6.4.7.a.b.4.4.1.e.0.e.3.c.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (0.6.6.4.7.a.b.4.4.1.e.0.e.3.c.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:2c3e:e14:4ba7:4660])
        by smtp.gmail.com with ESMTPSA id v3sm13251579wre.17.2020.10.09.08.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 08:21:18 -0700 (PDT)
Message-ID: <aae716b473615f22ce4c6b8ba4ad5ebc33f7ab30.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rngd: fix --debug to also filter syslog() calls
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Yann Dirson <yann.dirson@blade-group.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, Yann Dirson
 <yann@blade-group.com>
Date: Fri, 09 Oct 2020 16:21:17 +0100
In-Reply-To: <CA+4=imaZG5EtbwVbei9yCmELA4jDHhJ_DeNAfALKdTbbchOCkg@mail.gmail.com>
References: <20201009085527.1993257-1-yann@blade-group.com>
	 <9993e144fbf35c6b3231108bc7b23f8ff92b5246.camel@linuxfoundation.org>
	 <CA+4=imaZG5EtbwVbei9yCmELA4jDHhJ_DeNAfALKdTbbchOCkg@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2020-10-09 at 16:19 +0200, Yann Dirson wrote:
> 
> 
> Le ven. 9 oct. 2020 à 15:00, Richard Purdie <
> richard.purdie@linuxfoundation.org> a écrit :
> > On Fri, 2020-10-09 at 10:55 +0200, Yann Dirson wrote:
> > > From: Yann Dirson <yann@blade-group.com>
> > > 
> > > Debug logs were only controlled by --debug flag while in --
> > foreground mode.
> > > In --daemon mode (the default for us) /var/log/message got
> > stuffed with
> > > details of entropy pool refilling, which is useless in
> > production, and
> > > hamful when log rotation then gets rid of the more useful logs.
> > > 
> > > This change makes the two modes consistently only produce debug
> > logs when
> > > --debug is specified.
> > > 
> > > Signed-off-by: Yann Dirson <yann@blade-group.com>
> > > ---
> > >  .../rng-tools/rngd-debug-filter.patch         | 22
> > +++++++++++++++++++
> > >  .../rng-tools/rng-tools_6.10.bb               |  1 +
> > >  2 files changed, 23 insertions(+)
> > >  create mode 100644 meta/recipes-support/rng-tools/rng-
> > tools/rngd-debug-filter.patch
> > > 
> > > diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd-debug-
> > filter.patch b/meta/recipes-support/rng-tools/rng-tools/rngd-debug-
> > filter.patch
> > > new file mode 100644
> > > index 0000000000..320f0257e6
> > > --- /dev/null
> > 
> > 
> > This patch has no description, author or Upstream-Status:
> > information
> > in it. It needs such information to be considered. It would be
> > helpful
> > if the change was submitted upstream too, not sure if you've looked
> > at
> > that? We try not to carry patches if we can.
> 
> Lignthnig-speed upstream merged the patch after I re-rolled, is it
> worth a v3 tagged "accepted" ?

Please, it can be "Backport" now since it is!

Thanks for sending it, saves us carrying the patch and helps upstream
too.

Cheers,

Richard

