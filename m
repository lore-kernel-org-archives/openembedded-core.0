Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1696661A04
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 10:12:37 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id j16so6248537wrt.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 02:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=kvfl0nkRDEM/JEDeqjOa+CRBazoWuDIXhEmXoX78J+k=;
	b=GU1vS/b0G86iWilIVpPnlt9AEIFu6MSrykuxC/ncJCVCD+vsZ8y4ZA734/wrCmgw5D
	ncDYDRdeJl2iVGcUXIAUdEUllIj/FgjSvEhpr7/1nI1DTMoVkqtk7nsMsSv2mxZSsPNw
	mURIlx0FTaM2i5tfgGljrt8IPT9zFqElzUqew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=kvfl0nkRDEM/JEDeqjOa+CRBazoWuDIXhEmXoX78J+k=;
	b=sLqxglVSN+6lFbKvBbn1r4Pw9u+XDnm+ZLK8ohKQEKQh5SwfAgwe5uhnzW+O74pxNv
	ZocmiOIl+JR7TwDG6NhElR7dEZYZkb/Adu595AyTv/4Cj+HirkHfSblcIwHyhwbpreLY
	LvVbuVLwnvmKLJXW/CeR/xjZVC76CYHVXh5xm6SHrrGsCbmqE0UOmHO7/QIwc2mH/X4Y
	JQDPBCSP5dojA8XH+7dtmioDB5IfzYz8w/uW8vvc05N5zwO2Yq5m2ov2qS5MpvGxHC+O
	GpaXng/emIOmayuPFjrADt9UBpkLrvhxpW7I2XqNN+cGm7p4KapLcaERHLGtMeZfO3dc
	htUg==
X-Gm-Message-State: APjAAAX8wSNPDGhAj2B9v8C9tQl3W0VI4jRZn0n2BlfOL5x1Kiv13azf
	TXmzw5/MKGiz9d9/vgk0Ch/oqA==
X-Google-Smtp-Source: APXvYqxsSt258U3DnqZog2CGFgTMWdfs/cLm+Exj91jtK+A8v3RalcKLil+l0bAsjjfuCxk9VkOVTA==
X-Received: by 2002:adf:a4c4:: with SMTP id h4mr10030078wrb.112.1582971158754; 
	Sat, 29 Feb 2020 02:12:38 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b18sm16540834wru.50.2020.02.29.02.12.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 29 Feb 2020 02:12:38 -0800 (PST)
Message-ID: <c6409e21ae07e5db5c96a249903afde2f99507da.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Victor Kamensky (kamensky)" <kamensky@cisco.com>, Jens Rehsack
	<sno@netbsd.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Sat, 29 Feb 2020 10:12:36 +0000
In-Reply-To: <BL0PR11MB3219D87CD091E6BC103A79F3CDE90@BL0PR11MB3219.namprd11.prod.outlook.com>
References: <20200224143920.19383-1-sno@netbsd.org>
	,<3bdcf798302bbb0ce1de37eca82223dd8c3778e3.camel@linuxfoundation.org>
	<BL0PR11MB3219D87CD091E6BC103A79F3CDE90@BL0PR11MB3219.namprd11.prod.outlook.com>
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
X-List-Received-Date: Sat, 29 Feb 2020 10:12:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Victor,

On Sat, 2020-02-29 at 07:55 +0000, Victor Kamensky (kamensky) wrote:
> I was able to reproduce and debugged the mips new make issue.
> Workaround patch attached.
> 
> In summary: kernelmodule.KernelModuleTest.test_kernel_module
> fails with 'fatal error: opening dependency file
> scripts/basic/.fixdep.d: Permission denied'
> 
> New make-4.3 started using posix_spawn glibc call,
> that happens to be broken on mips. On mips during posix_spawn call
> __spawni_child function that is executed after clone makes
> setresuid call with spurious/wrong value of ruid. Instead of -1
> it passes 127, effectively switching real user id since test
> runs under root. Subsequent gcc runs under wrong ruid and it
> fails to write into /usr/src/kernel/scripts/basic directory.
> 
> __spawni_child uses direct system call invocation for setresuid
> rather calling glibc function. And there is wrong code generation
> issue somewhere in inline assembly for direct system call and/or
> way how compiler processes it. I did not dig into it yet, it
> looks as quite hard problem and needs more time.
> 
> For now I've made workaround patch that just through configure
> ac_cv_func_posix_spawn=no parameter tells make configure not to use
> posix_spawn on mips.
> 
> I will also send suggested patch through 'git send-mail'
> 
> Tested workaround on qemumips64, did not have time for
> qemumips full test, verified build only and made sure that
> posix_spawn is not used. But I believe it is the same issue.

Thanks for the quick turnaround on this, sounds like good progress on a
workaround! It does massively help with the preparation for 3.1 and is
much appreciated.

I've put the patch in for testing. It sounds like there may be an
upstream glibc patch which might be the fix of the underlying issue.
I'll probably look to merge the workaround and then we could look at
the glibc upgrade next.

I'll report back on how the testing goes.

Cheers,

Richard




