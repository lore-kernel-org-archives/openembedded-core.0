Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.421.1597255936130470421
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2020 11:12:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KdzPJjDY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id z18so2897034wrm.12
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2020 11:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=O0jygf4Ug/te2UnoaU82/35b4ri0GavAdSFltxzw3sQ=;
        b=KdzPJjDYa7Z8GnCZ1jxdWVyP0hfw/pREua1ZKeujwHDUHGKW/e48N6EyyaeMZP40SE
         bJrfNp+jPdQrtec3PYPOmWe59HGPQr0tsIZFbGYXizOiE0MGStbNVSMriMu8GY6cw9ah
         PyuSAQuPb7ukDHBOzoyCVaK6GLNPp4JxYXuv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=O0jygf4Ug/te2UnoaU82/35b4ri0GavAdSFltxzw3sQ=;
        b=tn8oDHO57UrFLcXLIwK/NjbNcM6tUen/DF3F5TtbNwc+XIrd5GLRD5fXfDAyQZPs6S
         olGurO4+CUtKcQwyGwKGAIbe41HBPGm48rK7dXys/MUOKXbVG1lPbf9QtoihQm5iEFnv
         aSu04+AsKQzzZhD8tNR1yjDhoGHUn8wy5B6AavPuwZ5NdH7BrugVEF6RnODOILrIqaJN
         uNr4uYrgQZO3amNwIG3ssMTmP4m0HDeYWDwCa2BDC51o/DZpxPdh4BF7liAD82vyyToT
         uO+xcjXRtMRog4y/4qXqvFAiThRobQTJLSNZYZ9dyguCZFpUDWnc3mIdAlUXDlOUJWd6
         Z0Og==
X-Gm-Message-State: AOAM531H4mW/+R/sUMlQDLId3rxDCss+99apaa2lDdUzUqe4aNHWDYTU
	H1dU2ecoghwicvP3HcmVw/fA1g==
X-Google-Smtp-Source: ABdhPJwQGtu/Iqsc24q+WKskpqbKBX4Ly3aOgKIf3mJqFxnM3VRoJOHQ5vICCygPfH9a2csqIquUcQ==
X-Received: by 2002:adf:ee51:: with SMTP id w17mr403548wro.239.1597255934596;
        Wed, 12 Aug 2020 11:12:14 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 9.a.c.c.d.f.6.e.e.7.9.e.9.0.c.e.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (9.a.c.c.d.f.6.e.e.7.9.e.9.0.c.e.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:ec09:e97e:e6fd:cca9])
        by smtp.gmail.com with ESMTPSA id y142sm5496350wmd.3.2020.08.12.11.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 11:12:14 -0700 (PDT)
Message-ID: <b28e4c6829ce7d4c87747b5dccd0f2541a5cf8df.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 00/10] kernel-yocto: consolidated pull request
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Aug 2020 19:12:11 +0100
In-Reply-To: <CADkTA4PN9XY_W2PZ38UhP7k_y_WCJ3UeK0sGxf9EQ0OJGd1JvQ@mail.gmail.com>
References: <162A9410849FC6A4.13432@lists.openembedded.org>
	 <CADkTA4PN9XY_W2PZ38UhP7k_y_WCJ3UeK0sGxf9EQ0OJGd1JvQ@mail.gmail.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-08-12 at 13:08 -0400, Bruce Ashfield wrote:
> 
> 
> On Wed, Aug 12, 2020 at 1:03 PM Bruce Ashfield via
> lists.openembedded.org <
> bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > 
> > Richard,
> > 
> > This is the part of my queue that is in preparation for the v5.8
> > kernel
> > and libc-headers.
> > 
> > I've been chasing issues that have (re)appeared (I fixed all these
> > once
> > before) with the recent gcc10 changes. I'm holding back the v5.8
> > core
> > changes, until I can confirm that everything is indeed still
> > working.
> 
> Also note that I am seeing some sort of test timeout on systemtap
> with qemuarm. I'm debugging it now and will put something in bugzilla
> when I know more, but from everything I can see, it isn't related to
> the kernel updates, since I can build and run the same test locally
> without issue.

I did look at a few of your failures and ended up filing bugs for them
as to me, they look like general intermittent problems. I reran those
build components that failed and they passed the next time :(

Cheers,

Richard

