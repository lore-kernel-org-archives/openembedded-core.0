Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id B0D597E071
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 09:40:24 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id e15so2035285wrs.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 02:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=hwLoTCMcnyM8x/P9NgTeJhz+ls5b2zT0wNAKgjiH3X4=;
	b=BAA0ipNLGWpb+YeMGGTne62Jp1SphjMpWlmN3Rx15EqwSAyOt3z5I1SD/1ytOfl2uu
	JfvISqAfPgIgnkfuiJ789uzwzUCxu0Y7hNujLGBH25+sOJBLRtUIol+0RvkGh5eH0ByO
	jL/Arr14cWLdUs0x1nRpuqAbkVqo+6astgR7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=hwLoTCMcnyM8x/P9NgTeJhz+ls5b2zT0wNAKgjiH3X4=;
	b=JX7YUqBJAkUL2f7h6p2v85HNK6KPjZNUCl3KkovjyeL/fJCuJx1DB0UMA/A6/IkLzt
	ODYHayLULmaR059X0B7dcdpJvWZegrsZ+pGN3THVAsQO//N1ZjmQiM9oilGsQRW42M5e
	g2KO6gD/7JkQ7xbjIpWZMHlr+AFYjQlEoXQR2bQsg4e89CXZPMI2EHEX6yeB48j+8gr4
	WUWp8CxocQppOZsItRHLPkO34FBE6q2sbKM0pMA8t5vDk2ORqmr1XFwCJajF9YUmblAV
	+1fDsgam3ba8z4CIQApPBakq0GCoXTBF2LiNOishlKFvZsxe8UhW9l7TVve1zyBpEpuA
	Yayw==
X-Gm-Message-State: APjAAAVnWTQaAVy4BKgmaLazL2aTqZR0q6arTfkbi8edlO0DnFA2b8GW
	uXmtp0J+Mmc/Rs3bLi9lzUMR3g==
X-Google-Smtp-Source: APXvYqwDLAX6wtNbQJZZDF0jk5iiXqJl20FRO7NlgDpMKbONmHhsxCKtRhSTJzQKuM5huBZKKkNTAw==
X-Received: by 2002:a5d:4cc4:: with SMTP id c4mr3969459wrt.164.1557740425383; 
	Mon, 13 May 2019 02:40:25 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id f2sm20376119wmh.3.2019.05.13.02.40.23
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 13 May 2019 02:40:24 -0700 (PDT)
Message-ID: <eaaab67f52892780cfcc2cb8359dabe5ab365931.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: "Yu, Mingli" <mingli.yu@windriver.com>, "Burton, Ross"
	<ross.burton@intel.com>
Date: Mon, 13 May 2019 10:40:23 +0100
In-Reply-To: <5CD93813.1060907@windriver.com>
References: <5CD13414.9060408@windriver.com>
	<20190508030539.448075-1-mingli.yu@windriver.com>
	<CAJTo0LbWzug_9N5eZwaaWNX3w6wRfOCNx379DYkpODf=t71KbA@mail.gmail.com>
	<eb9506045669eaf6dc51f56fab72195c7cdba6b3.camel@linuxfoundation.org>
	<5CD93813.1060907@windriver.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] glib-2.0: fix ptest failures
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 May 2019 09:40:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2019-05-13 at 17:25 +0800, Yu, Mingli wrote:
> 
> On 2019年05月08日 20:25, richard.purdie@linuxfoundation.org wrote:
> > On Wed, 2019-05-08 at 12:54 +0100, Burton, Ross wrote:
> > > On Wed, 8 May 2019 at 04:06, <mingli.yu@windriver.com> wrote:
> > > > * Increase the timeout to 15 minutes as the default
> > > >    timeout which is 5 minutes is not enough to fix below error:
> > > >    | Executing: glib/actions.test
> > > >    | Test timed out after 300 seconds
> > > >    | cleaning up pid 13050
> > > >    | FAIL: glib/actions.test (Child process killed by signal 9)
> > > 
> > > My Debian machine runs that test in 20 seconds.
> > > 
> > > Maybe we're missing dependencies to get a working session dbus
> > > up?
> > 
> > That seems likely. I'd note that we see:
> > 
> > https://autobuilder.yocto.io/pub/non-release/20190502-12/testresults/testresult-report.txt
> > 
> > 
> > Recipe                       | Passed      | Failed   | Skipped   |
> > Time(s)
> > glib-2.0                     | 290         | 1        | 0         |
> > 427
> > 
> > and the failing test is:
> > 
> >      ptestresult.glib-
> > 2.0.glib/gdatetime.test__Child_process_killed_by_signal_6_
> > 
> > so it would seem this is working on our autobuilder tests? That
> > would
> > seem to back up Ross' comments.
> 
> Thanks Ross and RP's comments!
> 
> It's weird! Seems it succeeds in autobuilder, but I can reproduce
> the 
> glib/actions.test failure steadily in my env as below:
> # time; /usr/libexec/installed-tests/glib/actions -p;time
> user	0m0.13s
> sys	0m0.07s
> /actions/dbus/threaded: OK
> user	6m29.03s
> sys	0m50.46s

I suspect its a dependency such as the dbus session Ross mentioned.
Which image are you running this test in? Have you tried testing in
something like a core-image-sato for comparison?

It would be good to narrow down the missing dependency.

Cheers,

Richard


