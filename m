Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 540167CB98
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 16:12:38 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id z84so4483859wmg.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 08:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=KnUnXNczqxIgJPkZ2X8Gy/OhjIaOIOadEJ0M57YLeG8=;
	b=F2lHybN3XRD0RzJF2s/Zs5Wnue1zepqjL3+QwSWR8KSPUYLdSucUidYGpJRWXUu0er
	ZSOI7J2RZQs0U1/+3AH+HkA9MN3SyEAtv5BrAuuTALU57sUJ3W0UomzJTLbIJtVcBsBn
	xk0Af3hUBPZjbPkGALk6GC/C+lUNAVbkFcsaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=KnUnXNczqxIgJPkZ2X8Gy/OhjIaOIOadEJ0M57YLeG8=;
	b=Fm30UKjsDNghWwdyqz2qsOkUkiAVEeyEV8uNjn7q71QmUzUW05/4dmrAH2W179XZyW
	8Pck6M0wroVrFKw7aX0oFDQqVthkLeI1AvgEaz5OnwMwZ637N9mfK8FlLwWiSgXWk8NH
	u+XJEz+alg9mb8RsOAWGO1FIXX2Nl+0pY95u+jsoeJzBkcf0NGOynUzwPugvDr6VyNQp
	Y321ZweE4rWpbtamHIUUbdntpp+g+n4HXKRoatTi4b3W+Sz689pk7COEQTd0jLcr38XR
	6rZVLPNTei9tZlH9yajTsdpT5zk0FhKq86KY343BsbASpkHIEnDBg8zLuv5AGu2/ZdJg
	dyoA==
X-Gm-Message-State: AHQUAuYs0fbxBWTb19xC7r2VNqeOt88SqhlVjBOfXKhIml2tUVZg4rFC
	TkDPXKvSvQPnKBd8yuxr5gGTTQ==
X-Google-Smtp-Source: AHgI3IZVGMYtEQMi+FMetNW+KBKQ4GiZ/fLRq7FDWic+jE6YaYxCcAYZmglE8HoV22TSOqSLtdtS6w==
X-Received: by 2002:a1c:cb86:: with SMTP id b128mr5622930wmg.46.1550938358814; 
	Sat, 23 Feb 2019 08:12:38 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p16sm10592013wro.25.2019.02.23.08.12.37
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 23 Feb 2019 08:12:38 -0800 (PST)
Message-ID: <c2b3d2ad4287960a5805627ef550dad30e2b82d3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Petr Vorel <petr.vorel@gmail.com>, Khem Raj <raj.khem@gmail.com>, Daniel
	=?ISO-8859-1?Q?D=EDaz?= <mrchapp@gmail.com>
Date: Sat, 23 Feb 2019 16:12:36 +0000
In-Reply-To: <20190116152809.GA407@x230>
References: <20190115230612.18947-1-petr.vorel@gmail.com>
	<f945d8518ac05d37fbba3a134dc09d6c89acbc7a.camel@linuxfoundation.org>
	<CAMKF1spaQmVW_=5bgus7nkw5Q9vU+DQH+qTzMj27i8omxg1DwA@mail.gmail.com>
	<20190116152809.GA407@x230>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/1] ltp: Update to 20190115
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
X-List-Received-Date: Sat, 23 Feb 2019 16:12:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-01-16 at 16:28 +0100, Petr Vorel wrote:
> Hi Richard, Khem,
> 
> > > Thanks for looking at this. Unfortunately it failed in testing on
> > > most
> > > targets:
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/46/builds/181/steps/7/logs/step1b
> > > (one failure given as an example).
> > > Warnings as errors are good during development but sometimes less
> > > useful during release due to the variety of end user
> > > configurations.
> > with glibc 2.29 in play
> > http://errors.yoctoproject.org/Errors/Details/216829/
> 
> Thanks for your reports.
> Is there any way I could easily reproduce it?
> Some config I can download?
> I'm testing with default config.
> I'm sorry for dummy question, I'm more experienced with Buildroot.

Sorry for not replying sooner. We just hit this issue again:

http://errors.yoctoproject.org/Errors/Latest/?filter=480efd388db578106a8a2129c0382b7e56a1ee36&type=commit&limit=150

This time I think I understand where the error is coming from though:

http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/distro/include/security_flags.inc

does:

security_flags.inc:SECURITY_STRINGFORMAT ?= "-Wformat -Wformat-security -Werror=format-security"
security_flags.inc:SECURITY_CFLAGS ?= "${SECURITY_STACK_PROTECTOR} ${SECURITY_PIE_CFLAGS} ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"

so the reproducer should be to add "-Wformat -Wformat-security
-Werror=format-security" to CFLAGS when building ltp.

Cheers,

Richard


