Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web09.21378.1629710500597570306
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 02:21:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DY84WnZf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id o39-20020a05600c512700b002e74638b567so2633302wms.2
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Aug 2021 02:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=NvSg07ffsZMSz0d/igRB1uRyrQVAukcZRCWSZApaS1k=;
        b=DY84WnZfI8O2PxeJLFzqHsMGej07apgE4V4VnqSvu6IJBoneuSBxm1FO6xfHkQaNUQ
         lesJZGUvLXJknwz+1XyhfER0I5g5MbMfxI4DsOPFUCKl1sSEhqCXV7MQS2xqzhjs5L0T
         ZpfoKa/d5Y8tuvroKpmmf1U3jFkaGgz5LuEyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=NvSg07ffsZMSz0d/igRB1uRyrQVAukcZRCWSZApaS1k=;
        b=rNLyxnxSbccwks1A2MsosElqyIQBaB8y4yK31+G3cD5++5eE+9cdaFfFNTy2FTkP/e
         892ykkVZbFqTEiB6R79JwPDixhei/1E67AKXG0c7fmyLpbuOkTomxjz2qcCQnYeBbYBJ
         yHt4cA069FIhaxXQyxHxsuRlWCFONSypoEvRrB28DSGwaXZlGDitbH8WaL7GDJ8PbXfF
         P/jWn042D4uurvt9gnbfODZaPXIZzUIHPvqSK0ILSxKSgVQYhOLLJjrVHSyPyv/P5Jq1
         lUYgDsSEkzgqHj8qwwoSEfVBtcJwoN7yipBfSOYn7y2N8y+P0pata3K2Xa+eB2O9g3Nl
         IXrw==
X-Gm-Message-State: AOAM531u21JBwiITtQiFUc0ny8dBiAgIzYzsiSD9Ve+eMWo/HxqUGaqF
	2XRGL0Da71Xlv96ZiXNB/a7kjw==
X-Google-Smtp-Source: ABdhPJzyaOqJQyVLlyAwpy6uNoi58W3HXtNbCSutTIzuJKk8Jcq9OlNRTecU3zdUFkb8HP1zweYyXA==
X-Received: by 2002:a7b:c92b:: with SMTP id h11mr2203131wml.62.1629710498912;
        Mon, 23 Aug 2021 02:21:38 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:d09e:54e5:5f12:c43c? ([2001:8b0:aba:5f3c:d09e:54e5:5f12:c43c])
        by smtp.gmail.com with ESMTPSA id d4sm14751480wrz.35.2021.08.23.02.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 02:21:38 -0700 (PDT)
Message-ID: <e36985f82120c87f598289c672eafdacb5e37d86.camel@linuxfoundation.org>
Subject: Re: [OE-core] [v4] [RFC] Merge meta-rust to oe-core - Aug 19 update
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>, Patches and discussions
	about the oe-core layer <openembedded-core@lists.openembedded.org>
Cc: steven@stevenwalter.org, johan.anderholm@gmail.com, derek@asterius.io, 
 cardoe@cardoe.com, dev@codyps.com, tylerwhall@gmail.com, Khem Raj
 <raj.khem@gmail.com>, vinay.kumar@blackfigtech.com,
 saul.wold@windriver.com,  martin.jansa@gmail.com, paul@pbarker.dev, Trevor
 Gamblin <trevor.gamblin@windriver.com>, anbelski@linux.microsoft.com, Vinay
 Kumar <vinay.m.engg@gmail.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Date: Mon, 23 Aug 2021 10:21:35 +0100
In-Reply-To: <3e7ff50b-57f8-0503-b514-e53a82e0b2d5@windriver.com>
References: <aa7653eb-336f-ee08-3126-e6c790a9226f@windriver.com>
	 <20210813151947.55142-1-vinay.m.engg@gmail.com>
	 <CANUMPcXHhkPrtXrfN5rfzctXEy8h-Hi4L+vKmaAmPSgC33udcg@mail.gmail.com>
	 <169C1FA457B99CA0.23238@lists.openembedded.org>
	 <15a0f2e3-dbad-2512-3e5e-f2b84c946964@windriver.com>
	 <169D3274AAECC435.19323@lists.openembedded.org>
	 <fed5f2e5-000c-b7be-1d0e-2dc26afa6bd5@windriver.com>
	 <87dacc6ecc7af109db0039894254c77b43ae8323.camel@linuxfoundation.org>
	 <3e7ff50b-57f8-0503-b514-e53a82e0b2d5@windriver.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2021-08-22 at 08:45 -0400, Randy MacLeod wrote:
> On 2021-08-22 7:19 a.m., Richard Purdie wrote:
> > On Sat, 2021-08-21 at 23:12 -0400, Randy MacLeod wrote:
> > > On 2021-08-20 10:48 p.m., Randy MacLeod wrote:
> > > With a patch from Richard, and the http_proxy check removed,
> > > $ git diff | grep "^[+-]"
> > >   --- a/meta/lib/oeqa/selftest/cases/sstatetests.py
> > >   +++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
> > >   -http_proxy = "http://example.com/"
> > >   +http_proxy = ""
> > >   
> > > we have fixed the oe-selftest that was failing.
> > >   Any volunteers to stub out the http[s]_proxy code in cargo ?
> > > I've written up a commit log that could use some review and pushed an update
> > > to:
> > >     
> > > http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=rmacleod/rust-redo-aug-17-2021-a
> > > 
> > 
> > 
> > I'm not sure you need to change cargo, I think if you remove the bit in the
> > bbclass that injects http_proxy, the tests are ok. That will perhaps break
> > anyone using proxies but for now, I think that is a reasonable step of getting
> > this moved forward?
> 
> That's what I hoped for as well but not what my testing showed.
> 
> I removed (commented out actually) the http_proxy injection here:
>  
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=rmacleod/rust-redo-aug-17-2021-a&id=a4808f787caf8d0b44cf3946cf204164f24f91d4
> 
> but the test still fails unless I mangle the test:
> 
>     meta/lib/oeqa/selftest/cases/sstatetests.py
> 
> 
>     -http_proxy = "http://example.com/"
> 
> 
>     +http_proxy = ""

Right, my point is that doesn't remove it. You need to delete it, not comment it
out.

The issue is that bitbake does variable expansion on the scripts before running
them.

It can't tell that this is a comment, just that the script differs after
variable expansion.

Cheers,

Richard



