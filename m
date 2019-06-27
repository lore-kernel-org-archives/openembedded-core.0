Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 86B1C78F72
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 08:57:24 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id u8so4810234wmm.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 01:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=q0bjAtG2PEfylF6UEPNIPd54+6M5otXoz+AZx/hnPKc=;
	b=hXoUSqTRG1ou0D8sp4vdbjsNVkjZAaJ1Wboce6dt6dAsCFjYFuAWhven1wQNNLt46e
	3HVK7VUqG/T/e+z3vA1Y8hCSYkEc7yKbjRBO2eRbk3UKJYmZdsXvy9rnxcJUQDtBjuqy
	KgMZOOjyTuh3C7Slu4QhPW72AIiZ+j6RSRCzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=q0bjAtG2PEfylF6UEPNIPd54+6M5otXoz+AZx/hnPKc=;
	b=Dyy3D5X1r6VDPJhTZALmKmayyhtpf+vDuXBpbcO/Ma3Bg/5LdOo1OM5+aLfnRjr9qQ
	VJPSf/xlWhR/s+w6WI/3AhBSOpOhJu1yh7zvFkeVDEZkQ7kp69OAmnsaPvy0QURR1YBI
	laVZFa0CuFuW6+QWgd4lTWclOuGkV6gQ/5UOFNEGD8lh6Ar2i1E6D6bLkp3eWa7GxdL2
	uteVnHjRPmbct0I6VtNUw8XFQJXCMeQe4nlpWl2LRwkLI+ib4zfajzI4ujyrtsJH7d3O
	D4B6RBAJkngApsmt0DeJOi11fd4zxbgDf+q0sGl3dYGnoE4LR7vswbs88sHA6uKZO7w3
	hJeA==
X-Gm-Message-State: APjAAAWzMD87WiuMs8Rke4TyNcPYkrTJoYFkFUbSJ3l1goxWxsHyWsEV
	yKs9LfqWoEtjOzMXlHyisr9vJQ==
X-Google-Smtp-Source: APXvYqxTbgMufvGOM3j42rsUO2h6tiDfBqaZLLXiSm/+hcz0j63Z/f4yYQwdQjIQh3b71hCtQIWSMg==
X-Received: by 2002:a7b:c40c:: with SMTP id k12mr2203028wmi.122.1561625845274; 
	Thu, 27 Jun 2019 01:57:25 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l124sm7594706wmf.36.2019.06.27.01.57.24
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 27 Jun 2019 01:57:24 -0700 (PDT)
Message-ID: <b0f7d25c1d75b677f5f8bd9587a7cc054766587f.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Sinan Kaya <Okaya@kernel.org>, Alexander Kanavin
	<alex.kanavin@gmail.com>,  ChenQi <Qi.Chen@windriver.com>
Date: Thu, 27 Jun 2019 09:57:22 +0100
In-Reply-To: <5c9f4824-248c-197c-c3f7-ccd33f023aa3@kernel.org>
References: <20190625221319.102643-1-okaya@kernel.org>
	<4fd505d8-8616-b2e7-da92-6b2be9e3616f@windriver.com>
	<CANNYZj_r7wXtZy2he3y_n5cCXagpWsc+nyheGATHYq3k-dUYvQ@mail.gmail.com>
	<5647f634-725a-fd9e-3b13-369095f4d415@kernel.org>
	<5610c96f0131a38589ab36e6850dd9b7d2d78264.camel@linuxfoundation.org>
	<5c9f4824-248c-197c-c3f7-ccd33f023aa3@kernel.org>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v1] postinst-intercepts: check tool presence in intercept hooks
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
X-List-Received-Date: Thu, 27 Jun 2019 08:57:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-06-26 at 18:57 -0400, Sinan Kaya wrote:
> On 6/26/2019 5:21 PM, Richard Purdie wrote:
> > > What is so special about these?
> > Put another way, why aren't lots of people seeing failures due to
> > this?
> > 
> > You're obviously doing something differently to everyone else but
> > we're
> > having a hard time understanding what, or how we'd trigger the
> > problem
> > you're seeing. 
> > 
> > We're nervous about fixing problems we don't understand, not least
> > as
> > it potentially means we have a huge hole in our test matrix. Your
> > patches shouldn't be necessary as I understand the codebase either.
> 
> Let's see if we can peel the onion.
> 
> Can you explain how it was designed to work for cross compilation use
> case where host machine architecture != target machine architecture ?

postinst intercepts are there to collect up certain postinst commands
and call them once rather than multiple times during rootfs generation.

There are three different cases:

a) Sometimes we can use a native tool. Here, we run the native tool
with the knowledge that the output it generates is cross compatible.

b) Sometimes we run target binaries under usermode qemu. In this case
the output is target architecture specific and we have no other way to
generate the output other than with the target binary

c) We have a cross tool which can run natively but generate target
output.

> If I understand this right, all of these postinst intercepts create
> a native package dependency via inherit foobar.class.
> 
> AFAIK, Native packages are built against the host machine
> architecture not target architecture.
> 
> Where are the tools supposed to come from?

It depends which scenario above we're dealing with. Sometimes native
recipes are used, sometimes not.

> I can focus on details if my build actually follows the design.
> 
> As I said, I do not want these packages on my target machine but we
> want to run QEMU using the tools that were compiled against target
> machine in order to execute postinst intercepts.
> 
> This issue showed up in thud using core-image-minimal. It was not
> there on sumo.

The key thing is that these intercept scripts are only run if an image
contains packages which use the postinst. If the image contains the
postinst, the scripts should run correctly.

In that context your patch is concerning as for example you're saying
you can have an image which needs the gio module cache yet it doesn't
have ${libexecdir}/${binprefix}gio-querymodules (the target binary
needed to be run under qemu to generate it). We'd define that as a bug
and you're just hiding the problem with the added conditionals. So on
that basis the patch is clearly incorrect and can't be merged as it
will hide bugs.

Cheers,

Richard



