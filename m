Return-Path: <paul@betafive.co.uk>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id 8AC977DD7E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 10:13:37 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id A635123075;
	Thu,  9 May 2019 06:13:35 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
	by compute1.internal (MEProxy); Thu, 09 May 2019 06:13:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=mime-version:message-id:in-reply-to:references:date:from:to
	:cc:subject:content-type; s=fm1; bh=OyuNRL6gl2ESs7aXbOiQ6ISIYwe/
	nWfz4RPDMiGThsw=; b=ZnXpL82OtgNy4LqheJTTKXBwGZ+MhHcRaMtjVwAUetMK
	VbZx8JuI/F5VyfKtcgqdonP27oi4BvWznwaYbLZah4FqYz3G63kCUSQaOaLDY5kL
	7ouIA8O/wMdUW1pFCpYJWWeW0UeulkfltiClNrmUBZiOvetSae0dMsMbmD8ANCyM
	HrvVZEhnioxuFLETEUqmg4pRYigcxmojF+ZKg2y/FS1T605MvF9LZdeW4zxwb4ME
	U+jzmjmtAAoLmPzriOH13BHcofD9imCd9PeSPG531hJk7+YJ30JT1dfdsgOqWNGY
	beKtkvlVqI91bIw3GxOgJiXAJPJqSwifq1POFkJU9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=OyuNRL
	6gl2ESs7aXbOiQ6ISIYwe/nWfz4RPDMiGThsw=; b=rHFod3CnuLVuccmmp60X9r
	MqyntPbz+bCDnMr18PhnRgZOog6u14tyzJWD80DXt4PR4tequhE3rrxSDTqlHJID
	MreYKmiEg6MPssWKWNMrvKokgNI5m6IftsZji/DgsxXPyBwRdOZ8pL6jLbL1sFye
	inqS4KLkwnsl4WuWpm9ki3S5bW3cRr5vneLTT6q7rMJ+BNG4rgxEI+pwkkBzZ9rL
	k74torY8sHKEUUFxZIJmDJ/jxPmeRq8r0+pOVLUVa+fgwBH9e79BWRhQ/D0wiU2q
	vQCZLIyVWva1+cHNUYF/ihTOhpS00CuBEAaDfhuRyKiFBbKiLKtMtTqGXhiArNXA
	==
X-ME-Sender: <xms:T_3TXCXKH9bOi6S4Eddk7cAyn7ShjEuYPrN0zer_gHY7ey0-D7AbXw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrkeehgddvjecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
	fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfrfgruhhl
	uceurghrkhgvrhdfuceophgruhhlsegsvghtrghfihhvvgdrtghordhukheqnecuffhomh
	grihhnpehsthhrrggtvgdrihhonecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhes
	sggvthgrfhhivhgvrdgtohdruhhknecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:T_3TXC1FZ8zHu4OhJoypG9EUYYsMtMI3zbTlExf2YzcpQ09YTM83Yg>
	<xmx:T_3TXBbPRV3ToFcrJ_u8lPIukBEmUL8GWlkuSUBQMEDru93D0Nieiw>
	<xmx:T_3TXNr5DXoSxdLBrClDaHgz31frE2KOnTvKb2Wuijb9qt1Z1IZ-Jg>
	<xmx:T_3TXJgnpGybgHelMsKkDnkVwiN1GmtJ-NkSnZ3c8cnw0eWA32OGJQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 21C857C3DB; Thu,  9 May 2019 06:13:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-449-gfb3fc5a-fmstable-20190430v1
Mime-Version: 1.0
Message-Id: <7a1b1694-9c7c-40eb-a998-343879c0283d@www.fastmail.com>
In-Reply-To: <20190508130249.GA25917@localhost>
References: <20190508115836.15758-1-paul@betafive.co.uk>
	<20190508115836.15758-3-paul@betafive.co.uk>
	<20190508130249.GA25917@localhost>
Date: Thu, 09 May 2019 06:13:34 -0400
From: "Paul Barker" <paul@betafive.co.uk>
To: "Adrian Bunk" <bunk@stusta.de>
Cc: OE Core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 09 May 2019 10:13:37 -0000
Content-Type: text/plain

On Wed, 8 May 2019, at 14:02, Adrian Bunk wrote:
> On Wed, May 08, 2019 at 11:58:36AM +0000, paul@betafive.co.uk wrote:
> >...
> > +--- strace-4.26.orig/strace.c
> > ++++ strace-4.26/strace.c
> > +@@ -26,7 +26,7 @@
> > + #include <locale.h>
> > + #include <sys/utsname.h>
> > + #ifdef HAVE_PRCTL
> > +-# include <sys/prctl.h>
> > ++# include <linux/prctl.h>
> > + #endif
> > + #include <asm/unistd.h>
> > diff --git a/meta/recipes-devtools/strace/strace_4.26.bb b/meta/recipes-devtools/strace/strace_4.26.bb
> > index 24f92c99e5..b71122babf 100644
> > --- a/meta/recipes-devtools/strace/strace_4.26.bb
> > +++ b/meta/recipes-devtools/strace/strace_4.26.bb
> > @@ -15,6 +15,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
> >             file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
> >             file://0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch \
> >             file://0001-mips-o32-fix-build.patch \
> > +           file://musl-fixes-armv8.patch \
> >             "
> >...
> 
> #include <sys/prctl.h> is the documented way for getting the prototype 
> of prctl(), which cannot be in linux/prctl.h for obvious reasons.
> 
> This patch creates the following problem:
> 
> ../strace-4.26/strace.c: In function 'startup_child':
> ../strace-4.26/strace.c:1355:3: warning: implicit declaration of 
> function 'prctl' [-Wimplicit-function-declaration]
>    prctl(PR_SET_PTRACER, PR_SET_PTRACER_ANY);
>    ^~~~~
> 

Ah that's definitely not a solution then. I'll have to look into this further and see if I can come up with a v2 patch that doesn't cause this warning.

-- 
Paul Barker
Managing Director & Principal Engineer
Beta Five Ltd

