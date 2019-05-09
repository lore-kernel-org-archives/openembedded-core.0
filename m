Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 945E37DF2A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 13:43:55 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id v11so3157701wru.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2019 06:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=3qpyfLyr9JJDmVULdXpCz4fhDQ9xwmrrAiEOuBf+XY0=;
	b=CzCCGONwmHtR60c+oxrGnasNqCnd+sxFA01f0FHcpR//LJxD1minRE8+d3U/8+7yaQ
	VOu6zyZhp55sf4LuF8xZD2+BCnKZd7wciZTIaq9o3UmnL66IinXpVa+gymsXAiB+Fw0o
	VxsfB+4J5tqJvqYRlG/eoZwi9743x1zYj2zOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=3qpyfLyr9JJDmVULdXpCz4fhDQ9xwmrrAiEOuBf+XY0=;
	b=rErifRy3A3EMpjONTn8eOQWiMFwXvEi9Bw2ifNys++TJ+pRZC5Q7Oz+5XP77qrtbDP
	7fL54lLS/GZsPbh/2+sl7PYqD3Xf/Tx/ESfXu6AKGcis2DKIIQjDQkrTrOXbVMVa2LXv
	pxTq/dou8aIhkojXknoFK6UVbBBWfZKPZRUkSFkQo8E9ViNpTazQZ7nsLc7k4FUOos3g
	pJCrx5UEnWG75D6qnbi3gimeNDrPw2jLuyJfWa/42z3+21XyU7mWeEIlyESMeCL2AjWI
	1AL62ZDPlnN57ckOptI0ArQCiXAVzpbmvYShaqEi1UhNzZ2AKYxUBjLC/2xKPsOtTAOL
	iVlg==
X-Gm-Message-State: APjAAAVCEEtVSjatEGpsROa48tcEYGbLIlTEPTz7EnQxXb2lMK6ybzow
	k6pmbQiZtzQY0Vptey9/T1PVcQ==
X-Google-Smtp-Source: APXvYqw5ZdKzbPRHGM22ifgrmlAqJaWhvFqLfDvbUbTrJ/cpB1q3FqsKDM/lrvd+lYHBT9ZBW6yznw==
X-Received: by 2002:adf:dbcc:: with SMTP id e12mr3142909wrj.134.1557409436353; 
	Thu, 09 May 2019 06:43:56 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 4sm3267539wrf.61.2019.05.09.06.43.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 09 May 2019 06:43:55 -0700 (PDT)
Message-ID: <74876e92becd2c2b04831dc4776faabd87fc53c9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Barker <paul@betafive.co.uk>, OE Core
	<openembedded-core@lists.openembedded.org>
Date: Thu, 09 May 2019 14:43:54 +0100
In-Reply-To: <ba43a2fb-4c12-4b35-bb40-b58ccf18ad83@www.fastmail.com>
References: <20190508115836.15758-1-paul@betafive.co.uk>
	<20190508115836.15758-3-paul@betafive.co.uk>
	<20190508130249.GA25917@localhost>
	<7a1b1694-9c7c-40eb-a998-343879c0283d@www.fastmail.com>
	<ba43a2fb-4c12-4b35-bb40-b58ccf18ad83@www.fastmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] strace: Fix aarch64 build with musl
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
X-List-Received-Date: Thu, 09 May 2019 13:43:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-05-09 at 08:08 -0400, Paul Barker wrote:
> On Thu, 9 May 2019, at 11:13, Paul Barker wrote:
> > On Wed, 8 May 2019, at 14:02, Adrian Bunk wrote:
> > > On Wed, May 08, 2019 at 11:58:36AM +0000, paul@betafive.co.uk
> > > wrote:
> > > > ...
> > > > +--- strace-4.26.orig/strace.c
> > > > ++++ strace-4.26/strace.c
> > > > +@@ -26,7 +26,7 @@
> > > > + #include <locale.h>
> > > > + #include <sys/utsname.h>
> > > > + #ifdef HAVE_PRCTL
> > > > +-# include <sys/prctl.h>
> > > > ++# include <linux/prctl.h>
> > > > + #endif
> > > > + #include <asm/unistd.h>
> > > > diff --git a/meta/recipes-devtools/strace/strace_4.26.bb
> > > > b/meta/recipes-devtools/strace/strace_4.26.bb
> > > > index 24f92c99e5..b71122babf 100644
> > > > --- a/meta/recipes-devtools/strace/strace_4.26.bb
> > > > +++ b/meta/recipes-devtools/strace/strace_4.26.bb
> > > > @@ -15,6 +15,7 @@ SRC_URI = "
> > > > https://strace.io/files/${PV}/strace-${PV}.tar.xz \
> > > >             file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
> > > >             file://0001-tests-sigaction-Check-for-mips-and-
> > > > alpha-before-usin.patch \
> > > >             file://0001-mips-o32-fix-build.patch \
> > > > +           file://musl-fixes-armv8.patch \
> > > >             "
> > > > ...
> > > 
> > > #include <sys/prctl.h> is the documented way for getting the
> > > prototype 
> > > of prctl(), which cannot be in linux/prctl.h for obvious reasons.
> > > 
> > > This patch creates the following problem:
> > > 
> > > ../strace-4.26/strace.c: In function 'startup_child':
> > > ../strace-4.26/strace.c:1355:3: warning: implicit declaration of 
> > > function 'prctl' [-Wimplicit-function-declaration]
> > >    prctl(PR_SET_PTRACER, PR_SET_PTRACER_ANY);
> > >    ^~~~~
> > > 
> > 
> > Ah that's definitely not a solution then. I'll have to look into
> > this 
> > further and see if I can come up with a v2 patch that doesn't
> > cause 
> > this warning.
> > 
> 
> So alpine fixes this by patching the linux headers: 
> https://git.alpinelinux.org/aports/tree/main/linux-headers/fix-aarch64-asm-ptrace.patch
> 
> I think that should be acceptable here if we just do it when building
> with musl libc.
> 
> Any thoughts on that before I work up a v2 patch?

This really needs to get fixed upstream. I don't mind a patch but only
if its gone upstream, we don't want to be carrying patches to libc-
headers.

Cheers,

Richard


