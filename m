Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.6846.1588682544533753905
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 05:42:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dy+TRTUL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id x25so2139018wmc.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 05:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=EjNnuGH5JUDB7/AR0MGkhHTflKZtUgD1cYzKB44kH/4=;
        b=dy+TRTULSJBxssZpGzLk2FYjA+yLw6aHAXVH+bTAhVwHTBpcWc03QvVpt5gbbmxGR+
         QvFSDtAg6du9GukttVPNmYVpEwPOcX7lfxLj/8RWoscxkT/dNiAAt9mE2IoX7aAreAyJ
         KpCWo4QYWA8u/p8WoHbAgULPvn1geRVujcvVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=EjNnuGH5JUDB7/AR0MGkhHTflKZtUgD1cYzKB44kH/4=;
        b=EeG1LuzAPPluSVZJKTW5/0xiPFJ6BO5CFPYP1Kdqm7TUX0wAwHSoZ5B6EEiCk5NWEH
         ZDCAXTqH+PBLbZNwcCoRisajtFduuRrBQQi7g+S1A+m5yo35OwHSpYHaeFRcHb7JAeQr
         YlS2Jcbko2ySKVOsBHBSuY/GtsN9+SFHL5suJvhpNhzoCayjzC4Bw0KxdqN3hAHBnfpl
         LLjDdG7c6ccO5RcvcBkT8zT87qWDcrtIfTnPblojWtBt80n96faq4onIwYgWToW8NUdm
         2jgZj3l9GCs3vRBHu3IiZgj+BtbCYvJsXzdj0WqN/EiyyEzhX/08gRDRASCRoq/3Ycr3
         S39g==
X-Gm-Message-State: AGi0Pub9/Grmd9K/kUtlypy4Zoeqw2Vaq8OOMAy7mSkNG7qunLPLq4Us
	ErWlFbOHHc7m7yIbXDsF0uUkdHgfwoo=
X-Google-Smtp-Source: APiQypJ4wv34JEqRGkg9SkbtnLHcKYG46InpaXqdYclMP/YxdsnNfUA3y5sy53sbIhF2R+lHaP/2YQ==
X-Received: by 2002:a05:600c:21d6:: with SMTP id x22mr3521014wmj.95.1588682542618;
        Tue, 05 May 2020 05:42:22 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id y63sm3760345wmg.21.2020.05.05.05.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 05:42:22 -0700 (PDT)
Message-ID: <96c996b112bb6b054d4b32d7d3283fbc60fbbf7e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] gcc-target: Ensure buildtools-extended-tarball doesn't use arch=native
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org, bunk@stusta.de
Date: Tue, 05 May 2020 13:42:21 +0100
In-Reply-To: <20200505101427.GA19882@localhost>
References: <20200501164602.1540633-1-richard.purdie@linuxfoundation.org>
	 <20200505101427.GA19882@localhost>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-05-05 at 13:14 +0300, Adrian Bunk wrote:
> On Fri, May 01, 2020 at 05:46:01PM +0100, Richard Purdie wrote:
> > A nativesdk BBCLASSEXTEND was added to gcc-target without realising
> > this
> > would pass arch=native through to it for x86-64. This heavily
> > optimises
> > gcc output for the host its running on meaning it can't be reused
> > via
> > sstate on other machines.
> > 
> > Add class-target overrides here to get the desired behaviour. All
> > targets have been covered for completeness.
> > ...
> > +EXTRA_OECONF_append_x86-64_class-target = " --with-arch=native"
> > ...
> 
> What do you expect --with-arch=native to do for the target
> of a cross compiler?

gcc-target isn't a cross compiler.

Cheers,

Richard

