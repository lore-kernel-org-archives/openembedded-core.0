Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8B73F6107E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 11:59:24 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id r17so2639918wrj.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 03:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=7JQTtuPe7H40DqOhz80O3ubEeL4a43CQp610AFYquWw=;
	b=UfoRDczRL/xxlg2YD0gKrF530EZOX+PEzUW1c/eab2lwISrKvHSS+VeIKYMMJhaHtH
	hUb01mEnqjcg86JRnXByIITeKh+oCjWjrvPbehls1ZNNcUhChXcYJEierxw0o7TD72E2
	zUqN71JO24A1T1x2WIdTB0A31EyBsSPTrfhWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=7JQTtuPe7H40DqOhz80O3ubEeL4a43CQp610AFYquWw=;
	b=n0jQjtgbtYkYBpLpKAfnh8nGxoAsJKlenoR++hF9tDNF+rIre/8P+XjZinHikHei3y
	Mz6LBKMjUv6p9w5Wh0Zs/M1hVXI6JkQQ5tmuFzO5THh6Nvb2EjB4mQwO+19UN/wMR4bB
	elIvhbZ08qn2MKdlBwEGLSlQ87uqOODR3gZIYyL/8y75ApkxUJWmZKyW5tKfeNsDKIvt
	y2agd4OkEXXl0RPHWTk8p9NL4TArnsweJXH8OX0U19UdncR6gHLivEMCCLobA0mIvFdA
	9fpbyxvT067Er0piRuIJ7HhGs4q3t5nMVlMEetIR905MniMBcqgiC6yTZKIZmUupgdrQ
	ApNw==
X-Gm-Message-State: APjAAAXCrKxMxDYD3RDsveARgDGli1YP17Yh1KK7ZZqm/5AnhwyNRHVa
	lvOjeTWdAspDzsE6w8mR1LOaTg==
X-Google-Smtp-Source: APXvYqw+NQ955QeJ+GsRWg62cXT4z0aCRuTovWtXCXhqnGX8tieYXXGsN9evDV9NuFr8CKoSeyjDmA==
X-Received: by 2002:adf:e809:: with SMTP id o9mr4494329wrm.405.1582891164945; 
	Fri, 28 Feb 2020 03:59:24 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d9sm12209328wrx.94.2020.02.28.03.59.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 28 Feb 2020 03:59:24 -0800 (PST)
Message-ID: <6558d8c05b858a831ecd4dd79df70f4764b10c6c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Petr Vorel <petr.vorel@gmail.com>, 
	openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Feb 2020 11:59:22 +0000
In-Reply-To: <20200228061225.32003-1-petr.vorel@gmail.com>
References: <20200228061225.32003-1-petr.vorel@gmail.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Subject: Re: [PATCH v4 1/2] ltp: Update to 20200120
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
X-List-Received-Date: Fri, 28 Feb 2020 11:59:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-02-28 at 07:12 +0100, Petr Vorel wrote:
> Removed ffsb copying file (tool removed from upstream)
> 
> Added LIBS=-lfts for MUSL.
> 
> Removed patches (accepted upstream)
> * 0002-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch
> * 0001-mkswap01.sh-Add-udevadm-trigger-before-swap-verifica.patch
> * 0001-testcases-fix-an-absent-format-string-issue.patch
> * 0001-nm01-Remove-prefix-zeros-of-the-addresses-output-by-.patch
> 
> Merged patches
> * 0006-rt_tgsigqueueinfo-disable-test-on-musl.patch
> (into 0001-build-Add-option-to-select-libc-implementation.patch as
> they
> touch the same files)
> 
> Refreshed patches (some tests have been fixed for musl)
> * 0001-Add-more-musl-exclusions.patch
> * 0001-build-Add-option-to-select-libc-implementation.patch
> 
> Updated status
> * 0008-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch
> * 0001-syscalls-Check-for-time64-unsafe-syscalls-before-usi.patch
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Changes v3->v4:
> * Fix musl build with LIBS=-lfts

Unfortunately the musl build is still failing with this version:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1627
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/1631

Cheers,

Richard


