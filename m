Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0993E7F2A8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 08:02:24 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id j16so20141662wrr.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2019 01:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=TAuJ0abaM258Etc9JZsw7P8rYzFUkxErtnBVgdhRfYo=;
	b=T1Rv7+jRBvMjLlDkbO2NThutu8nr0nRPH6j3cyt2VzjP7DGi/aOFRndFPtRJHygohI
	nCIQJp6DFhZKAJ5Md0+fGQQRAUf9jnBPKnqvkQ2kfP18wy+6csX3f8q9axr5UodM1H8b
	yYFt86auflWJjqD2z/a/tAlPh1zJ2JJXrmpXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=TAuJ0abaM258Etc9JZsw7P8rYzFUkxErtnBVgdhRfYo=;
	b=fpvHFFqwuz0qUO7RfAcpEr9e7Yjq/4En6LiDoxhO0k1Zv9ev3hVICrv6SVRNCTIXUa
	M1tx8uxuXAdIK53oWQ00NqoQr8ndE4qgZYzP9mWuo0z19l/NBeMJyAXPV1NxT+Peqtvl
	yqFedRhmgWRjHZQE5OsKS7jfzqlzgb5NFhOaPEq7yPQXNxQd1zLJiA0u6ymNgmUt5S9F
	C/YyKBBVQH4Kkd8mc4ahoQdwsuxzfTyrsK3/Rd4ij6Ek6/IwLxQ1kGYrkAV+e6m2epLe
	Gf0J4+brQkxyvJtnmw7se9zqv8Pi2qyl9JulUNyc9wS/4zV3MKsXqQ55FZjWMDzLMDn8
	3Smw==
X-Gm-Message-State: APjAAAWafDYbgpOSLgK4yaZB66Ss90VWykRJ6mRwEe2EmK/pzcSOyhrh
	JS5LLgkFK++okukipq/ohP27Pw==
X-Google-Smtp-Source: APXvYqyGERm/CRCmQPUBCil24BH1jwCanKjKGGZnLVxVyU93NnFdIyy+7iXCge7iQ+BdQ9n9c3Wuvw==
X-Received: by 2002:adf:f801:: with SMTP id s1mr1907133wrp.320.1567584145721; 
	Wed, 04 Sep 2019 01:02:25 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d12sm2146014wme.33.2019.09.04.01.02.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Sep 2019 01:02:25 -0700 (PDT)
Message-ID: <bb4ead501ecf2e767837336bebf7ea35fc19bc9a.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: akuster808 <akuster808@gmail.com>, Bruce Ashfield
	<bruce.ashfield@gmail.com>
Date: Wed, 04 Sep 2019 09:02:20 +0100
In-Reply-To: <49a3113a-5d8b-8eac-c678-4c138654ea35@gmail.com>
References: <5f601d9d33b2868c3962194eb23ccf5e23722110.camel@linuxfoundation.org>
	<CADkTA4P8bJsJWweh_3JfKs-R=D-Jbp=Mc1mz3f6Gm7pGdFXZbQ@mail.gmail.com>
	<49a3113a-5d8b-8eac-c678-4c138654ea35@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Summary of M3 status
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
X-List-Received-Date: Wed, 04 Sep 2019 08:02:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-09-03 at 19:59 -0700, akuster808 wrote:
> 
> On 9/3/19 5:39 AM, Bruce Ashfield wrote:
> > On Tue, Sep 3, 2019 at 4:10 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > I'm going to summarise the current state as it will help people
> > > see the
> > > set of issues we have. We have three issues blocking the current
> > > patch
> > > queue and kernel uprev, spread over four machines and five
> > > autobuilder
> > > targets:
> > > 
> > > qemumips64:
> > > 
> > >   
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/987
> > > 
> > >   RESULTS - parselogs.ParseLogsTest.test_parselogs: FAILED
> > > (1.97s)
> > > 
> > >   Central error: [    1.689184] kprobes: failed to populate
> > > blacklist: -22
> > >   [happens 5.2 kernel only]
> > I'll have a look at the kprobes log. Could just be something we
> > need
> > to whitelist, but I'll root cause it.
> > 
> > > qemumips:
> > > 
> > >   qemu machine locks up:
> > > 
> > >   
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/982
> > > 
> > >   (happens with 5.0 and 5.2 kernels and qemu 4.0 and 4.1 and is
> > > in
> > >    master. Not sure of the original cause)
> > > 
> > > qemuarm64:
> > > 
> > >   Central error: [    1.816386] kprobes: failed to populate
> > > blacklist: -22
> > > 
> > >   RESULTS - parselogs.ParseLogsTest.test_parselogs: FAILED
> > > (1.11s)
> > > 
> > >   
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/329
> > >   
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/985
> > >   [happens 5.2 kernel only]
> > > 
> > > qemuarm:
> > > 
> > >   
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/38/builds/990
> > >   
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/989
> > > 
> > >   See compile failure for stap.StapTest.test_stap below.
> > >   [happens 5.2 kernel only]
> > And I can look at this one as well.
> > 
> > If anyone gets to them first, let me know!
> 
> There is a patch under test in master-next. I just noticed it. Guess
> it
> means some got to it before either of us.

It means we had autobuilder time so I tried the obvious fix. It didn't
help and the problem remains, help very much appreciated.

Cheers,

Richard


