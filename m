Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id CED2671D8C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Feb 2017 02:02:35 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id o64so5186999pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 18:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=XZVoYDcTJK7zL67BcH0iLbmLfqpTGREgX1vdxxCH0mg=;
	b=XAGJ+dmkarSbqiZdwUBCIeTMYEtaPERLIs7NMvF1BvZvei9moDwL+9h1GQBDyF5lLE
	nAYjjj9+Rmy9po9pm2n+hvR69cTCHoFNdFAnBKXnuOkBDUHMd94sXICcl7UBmcNjnRQ0
	6Zz4HMC6ukPm++duQbGYjMfZrXtMp/+1pXjDWbN6TbKn13KMhQ9HTU8i7NEsTvh9LL3k
	8IIGLUlumKzag6kP9FJj0wOU8ZI+989bQuORvcZoq9In5WziYgNJ0+iRMWKzJCbEXrGL
	IceR/Ypp3G/UJ41fAnRubfTkEoDnAxKXlhhkdrrFqrzMbo2jDeuUtH2+/91peVl/vfmr
	0pJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=XZVoYDcTJK7zL67BcH0iLbmLfqpTGREgX1vdxxCH0mg=;
	b=Ndp8qsnaaDvep79D0s4FAHAodcsFIzzoRxrQK8cXmlyGvLqkFn2FJWC2H9mLq2fnYc
	+NsAUxl8lJHXugXIIZATMwGRY2ZAFwTAX55W3DifIEOAtRIQWPU48UNgjRVJVYpQX/xU
	dw2GUPVXZoxgWuMbHAwyeNzJZ8UhtR5RpJacXYfR7tVaGQ7HGjRMSb8hfBEDAtVr+YLs
	pX9YJBkjHyQOUTpJtB5fDRbi/Xx9fNhv4zGppJ4nNJPF4A7Qs3sXJ9bk0Rb/Ykdeht3R
	ksotBcjArryVIuu+mayz+GwKwXAzNx24e2KfgTXSYOX4sSoJN9jCJHCGHYEVa0MimITe
	Uadw==
X-Gm-Message-State: AMke39ldQCj3B2+xe5rrD1uyxAO/uE8FPyKMNVsGbLg3FaTCXTmhOWVQ+mnJS3O4EmZZIw==
X-Received: by 10.84.253.22 with SMTP id z22mr3564657pll.0.1487383355829;
	Fri, 17 Feb 2017 18:02:35 -0800 (PST)
Received: from haswell (c-76-102-32-192.hsd1.ca.comcast.net. [76.102.32.192])
	by smtp.gmail.com with ESMTPSA id
	q64sm21862800pga.0.2017.02.17.18.02.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Feb 2017 18:02:35 -0800 (PST)
Date: Fri, 17 Feb 2017 18:02:29 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20170218020229.GA30443@haswell>
References: <cover.51e0eb88ea69468cf5a410aa7194c25cf61d57b7.1485530988.git-series.patrick.ohly@intel.com>
	<fe94df71a407adfc7082faff5bbe6441984a85d6.1485530988.git-series.patrick.ohly@intel.com>
	<1487365991.4999.49.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1487365991.4999.49.camel@linuxfoundation.org>
User-Agent: Mutt/1.7.2 (2016-11-26)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v5 01/12] acpica: move from meta-oe to OE-core
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
X-List-Received-Date: Sat, 18 Feb 2017 02:02:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 17-02-17 13:13:11, Richard Purdie wrote:
> On Fri, 2017-01-27 at 16:30 +0100, Patrick Ohly wrote:
> > From: Fathi Boudra <fathi.boudra@linaro.org>
> > 
> > qemu support for UEFI in OE-core depends on OVMF, which needs the
> > iasl
> > tools provided by this recipe. There's also an iasl recipe in
> > meta-luv, but than can and will be replaced by this one, thus
> > reducing
> > overall maintenance work.
> > 
> > Copied from meta-openembedded rev fa65be9ba (current master).
> > 
> > Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> 
> This fails on musl:
> 
> https://autobuilder.yocto.io/builders/nightly-musl/builds/160/steps/BuildImages/logs/stdio
> 
> |      ^~~~~~~~~~~~~~
> | i586-poky-linux-musl-gcc  -m32 -march=i586 --sysroot=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl/build/build/tmp/work/i586-poky-linux-musl/acpica/20150515-r0/recipe-sysroot -c  -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl/build/build/tmp/work/i586-poky-linux-musl/acpica/20150515-r0=/usr/src/debug/acpica/20150515-r0 -fdebug-prefix-map=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl/build/build/tmp/work/i586-poky-linux-musl/acpica/20150515-r0/recipe-sysroot-native= -fdebug-prefix-map=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl/build/build/tmp/work/i586-poky-linux-musl/acpica/20150515-r0/recipe-sysroot=  -D_CYGWIN -D_GNU_SOURCE -I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/include -DACPI_ASL_COMPILER -I../../../source/compiler -Iobj -Wall -o obj/asllistsup.o ../../../source/compiler/asllistsup.c
> | ../../../source/compiler/aslfiles.c: In function 'FlOpenMiscOutputFiles':
> | ../../../source/compiler/aslfiles.c:595:45: error: invalid application of 'sizeof' to incomplete type 'FILE {aka struct _IO_FILE}'
> |              memcpy (stderr, stdout, sizeof (FILE));
> |                                              ^~~~
> | Copied obj/acpiexamples to ../bin/acpiexamples

FILE object cannot be used in any reasonable way, only a pointer to FILE has well defined uses

-Khem

