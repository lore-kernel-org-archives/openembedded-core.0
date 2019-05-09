Return-Path: <paul@betafive.co.uk>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id 31BAD7D712
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 12:08:51 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 4A342236D8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 08:08:52 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
	by compute1.internal (MEProxy); Thu, 09 May 2019 08:08:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=mime-version:message-id:in-reply-to:references:date:from:to
	:subject:content-type; s=fm1; bh=QoiAiV0A0eH079XqJUMAh91TxVfAOav
	EoCabmvbGwy0=; b=lPLhqbEbsIwW/F2YTJxrl0vb4Wm5ZIHqbLJ6oxIkoXU7dnW
	N5AfNeZs10ccG4WTC+tQCi2zSzxXdgbeRHgcB7MDkfgXEBL5FoEuiz/vSwCpe0SP
	+kTEWSc5IThj7szO2WW1TNI7N6FHNuQZSubl08eVsx+EVX5SESuFM4rC6spy0NcW
	9u+BljYX44qhUXHA0kWXJjgVd3O4hj4xSvXjm9wrGkdoZ8qDIE04O4aPjMON4HJX
	emG5o40ZbZxNX4CH4RP+CY8b7kJy7j75IwtZVF2NS+EAUQJXAhbRVFOEvTH3i4pM
	P7haFDDY3DZTIYACxz36RVzwnZ8aUungJxjn3MA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=QoiAiV
	0A0eH079XqJUMAh91TxVfAOavEoCabmvbGwy0=; b=TeS6M+Uy5kU5Ikfx9HOZlw
	7uh+h7yrHd3ZaMB52Ik+7ZDp4eJWmZCUPl77NMxABgBz0+HK/d1KPhdcGCDGemr4
	ONp0SmwJ2Mylpzw1vWI9tzgaX8Bzufg4ti6X3LMtwys7tibTCxBEuwP/tBgwF4p4
	FCOiT0cZ7bqwZny1RLre87Xky6WVyf8oz5UcAQPZTOzfscafVATZGgrq4M266QsJ
	88XVcuCO7OtTF9/vn7cKpmOy9k0EYmjd6ZpzmLcnbPliZ0Oe7hocQPxyywoOC1AK
	49GL/3cpJHpDoLOpEJTK13ATmq5afiHglOEOrg61GRJhNPrUzavV+6sB826pnyHg
	==
X-ME-Sender: <xms:VBjUXM03_dMvfDq-mQ9VhB_Acry1eSCSFdc4UrQdsjKYxICEB-oXqQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrkeehgdehudcutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
	fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfrfgruhhl
	uceurghrkhgvrhdfuceophgruhhlsegsvghtrghfihhvvgdrtghordhukheqnecuffhomh
	grihhnpegrlhhpihhnvghlihhnuhigrdhorhhgpdhsthhrrggtvgdrihhonecurfgrrhgr
	mhepmhgrihhlfhhrohhmpehprghulhessggvthgrfhhivhgvrdgtohdruhhknecuvehluh
	hsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:VBjUXFkahIeuI9Pf5jcfIpBDG02L9te04-8w6FU6PMBN2LJQ3zT-iQ>
	<xmx:VBjUXPtUZ97LUVkTGiJMdTI-VppdI2CIA33-D2xl1rwWQTNC7riQRg>
	<xmx:VBjUXMA8M29WisXDDug98udhWosbkTJmFxNShgChvJGMYau2SYblEw>
	<xmx:VBjUXMA3uoGOjnNHTJmRRiwWRWEvBhQadXw9vKONmcRZ3X9LBW0tFg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E89457C3DB; Thu,  9 May 2019 08:08:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-449-gfb3fc5a-fmstable-20190430v1
Mime-Version: 1.0
Message-Id: <ba43a2fb-4c12-4b35-bb40-b58ccf18ad83@www.fastmail.com>
In-Reply-To: <7a1b1694-9c7c-40eb-a998-343879c0283d@www.fastmail.com>
References: <20190508115836.15758-1-paul@betafive.co.uk>
	<20190508115836.15758-3-paul@betafive.co.uk>
	<20190508130249.GA25917@localhost>
	<7a1b1694-9c7c-40eb-a998-343879c0283d@www.fastmail.com>
Date: Thu, 09 May 2019 08:08:51 -0400
From: "Paul Barker" <paul@betafive.co.uk>
To: "OE Core" <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 09 May 2019 12:08:51 -0000
Content-Type: text/plain

On Thu, 9 May 2019, at 11:13, Paul Barker wrote:
> On Wed, 8 May 2019, at 14:02, Adrian Bunk wrote:
> > On Wed, May 08, 2019 at 11:58:36AM +0000, paul@betafive.co.uk wrote:
> > >...
> > > +--- strace-4.26.orig/strace.c
> > > ++++ strace-4.26/strace.c
> > > +@@ -26,7 +26,7 @@
> > > + #include <locale.h>
> > > + #include <sys/utsname.h>
> > > + #ifdef HAVE_PRCTL
> > > +-# include <sys/prctl.h>
> > > ++# include <linux/prctl.h>
> > > + #endif
> > > + #include <asm/unistd.h>
> > > diff --git a/meta/recipes-devtools/strace/strace_4.26.bb b/meta/recipes-devtools/strace/strace_4.26.bb
> > > index 24f92c99e5..b71122babf 100644
> > > --- a/meta/recipes-devtools/strace/strace_4.26.bb
> > > +++ b/meta/recipes-devtools/strace/strace_4.26.bb
> > > @@ -15,6 +15,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
> > >             file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
> > >             file://0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch \
> > >             file://0001-mips-o32-fix-build.patch \
> > > +           file://musl-fixes-armv8.patch \
> > >             "
> > >...
> > 
> > #include <sys/prctl.h> is the documented way for getting the prototype 
> > of prctl(), which cannot be in linux/prctl.h for obvious reasons.
> > 
> > This patch creates the following problem:
> > 
> > ../strace-4.26/strace.c: In function 'startup_child':
> > ../strace-4.26/strace.c:1355:3: warning: implicit declaration of 
> > function 'prctl' [-Wimplicit-function-declaration]
> >    prctl(PR_SET_PTRACER, PR_SET_PTRACER_ANY);
> >    ^~~~~
> > 
> 
> Ah that's definitely not a solution then. I'll have to look into this 
> further and see if I can come up with a v2 patch that doesn't cause 
> this warning.
> 

So alpine fixes this by patching the linux headers: https://git.alpinelinux.org/aports/tree/main/linux-headers/fix-aarch64-asm-ptrace.patch

I think that should be acceptable here if we just do it when building with musl libc.

Any thoughts on that before I work up a v2 patch?

Thanks,

-- 
Paul Barker
Managing Director & Principal Engineer
Beta Five Ltd

