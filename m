Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6769C6198F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 13:01:01 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id m3so6301818wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 05:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=W9TMpb8ZGXtrepL8ArX10ZPK7Rhb5WZ4j8XvRZMyD+E=;
	b=cnNYa9ukR4SnfEnZkQ8IqCWq3whKrU8W9uRaM9iBQDXmSASu1262FDP8OUNbnj3APV
	sHwLZfvVwAmrtBe0EhMPUWt7Qp/n7KItCWlb+Ia+Bf45vbd/e8vNtZKeKpywnY7hIQMc
	R+7SjFS01UBxdcLNRbk1RDCIyV2z8s2b8mJD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=W9TMpb8ZGXtrepL8ArX10ZPK7Rhb5WZ4j8XvRZMyD+E=;
	b=SohCYeKCLZvb/pwGH2mPsoFA+g9FyFz+7K2wv1x5asxQ7IOoeRn+YIM/uYgyh21rY6
	IzSnvvT40tinnmBNW7mbhE9SYVAk0u2oqGMD2xHNkIPftceB5sna4JfFd01o8Re4uezP
	LDWUk39jZNhWBKxkRnsAFtnRqHXyMhqH60FuUGyerCp7QQcDXUSDgVEjZYmAcLDYZp9H
	6bz1+us7cyJj0pgK3T0+r4O5y1VSKJw2e1MTCWXgNzp9UEgkiGrjys4hw12PR6IA9cdD
	XTdpwGe1lncTu21Vv6oQeaG7TJ4y4lx0laSGOyXbGDjRWM1/5ygZTM46CNbkiBTS6Mx4
	JfrQ==
X-Gm-Message-State: APjAAAUC1tTwnV/gLdUCpZTK1tNyJ+OKUNc/1gqTOuf83TDvIaLUMf19
	q13ksT3sxChs7ME5tLRzsxKVmg==
X-Google-Smtp-Source: APXvYqxaskfb3K9vsCouCLfc1chXYFJHlMUmgoEKwClZ8lWoRv5YIQAAIX+XSJq5vihqu4p2Sh05Bw==
X-Received: by 2002:a1c:4e03:: with SMTP id g3mr9956975wmh.22.1582981261877;
	Sat, 29 Feb 2020 05:01:01 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d15sm13100187wrp.37.2020.02.29.05.01.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 29 Feb 2020 05:01:01 -0800 (PST)
Message-ID: <52ea156e263b169b5d2581ab5d6df8918c824215.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Victor Kamensky (kamensky)" <kamensky@cisco.com>, Jens Rehsack
	<sno@netbsd.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Sat, 29 Feb 2020 13:01:00 +0000
In-Reply-To: <c6409e21ae07e5db5c96a249903afde2f99507da.camel@linuxfoundation.org>
References: <20200224143920.19383-1-sno@netbsd.org>
	,<3bdcf798302bbb0ce1de37eca82223dd8c3778e3.camel@linuxfoundation.org>
	<BL0PR11MB3219D87CD091E6BC103A79F3CDE90@BL0PR11MB3219.namprd11.prod.outlook.com>
	<c6409e21ae07e5db5c96a249903afde2f99507da.camel@linuxfoundation.org>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Subject: Re: [PATCH v3] make: 4.2.1 -> 4.3
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
X-List-Received-Date: Sat, 29 Feb 2020 13:01:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-02-29 at 10:12 +0000, Richard Purdie wrote:
> Hi Victor,
> 
> On Sat, 2020-02-29 at 07:55 +0000, Victor Kamensky (kamensky) wrote:
> > I was able to reproduce and debugged the mips new make issue.
> > Workaround patch attached.
> > 
> > In summary: kernelmodule.KernelModuleTest.test_kernel_module
> > fails with 'fatal error: opening dependency file
> > scripts/basic/.fixdep.d: Permission denied'
> > 
> > New make-4.3 started using posix_spawn glibc call,
> > that happens to be broken on mips. On mips during posix_spawn call
> > __spawni_child function that is executed after clone makes
> > setresuid call with spurious/wrong value of ruid. Instead of -1
> > it passes 127, effectively switching real user id since test
> > runs under root. Subsequent gcc runs under wrong ruid and it
> > fails to write into /usr/src/kernel/scripts/basic directory.
> > 
> > __spawni_child uses direct system call invocation for setresuid
> > rather calling glibc function. And there is wrong code generation
> > issue somewhere in inline assembly for direct system call and/or
> > way how compiler processes it. I did not dig into it yet, it
> > looks as quite hard problem and needs more time.
> > 
> > For now I've made workaround patch that just through configure
> > ac_cv_func_posix_spawn=no parameter tells make configure not to use
> > posix_spawn on mips.
> > 
> > I will also send suggested patch through 'git send-mail'
> > 
> > Tested workaround on qemumips64, did not have time for
> > qemumips full test, verified build only and made sure that
> > posix_spawn is not used. But I believe it is the same issue.
> 
> Thanks for the quick turnaround on this, sounds like good progress on
> a
> workaround! It does massively help with the preparation for 3.1 and
> is
> much appreciated.
> 
> I've put the patch in for testing. It sounds like there may be an
> upstream glibc patch which might be the fix of the underlying issue.
> I'll probably look to merge the workaround and then we could look at
> the glibc upgrade next.
> 
> I'll report back on how the testing goes.

Looks good, thanks!

I'll merge with a comment about the issue and likely fix when we can
drop it.

Cheers,

Richard


