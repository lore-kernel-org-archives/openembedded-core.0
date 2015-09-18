Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 8B6A476E04
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 02:11:13 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3nHJYY1JsGz3hj2H;
	Fri, 18 Sep 2015 04:11:13 +0200 (CEST)
X-Auth-Info: 3xnOs302v3z4OUw1SFYgDi5qrk8kvPnReH529rM6BRU=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3nHJYX6LXQzvdWS; 
	Fri, 18 Sep 2015 04:11:12 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Sep 2015 03:53:49 +0200
User-Agent: KMail/1.13.7 (Linux/3.14-2-amd64; KDE/4.13.1; x86_64; ; )
References: <1442500317-9064-1-git-send-email-marex@denx.de>
	<1442500317-9064-9-git-send-email-marex@denx.de>
	<ED902330-8DA9-4BA5-B910-81AD6C64B86C@gmail.com>
In-Reply-To: <ED902330-8DA9-4BA5-B910-81AD6C64B86C@gmail.com>
MIME-Version: 1.0
Message-Id: <201509180353.50008.marex@denx.de>
Cc: lftan@altera.com, waltergoossens@home.nl,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 8/8] libgpg-error: Add support for nios2
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
X-List-Received-Date: Fri, 18 Sep 2015 02:11:15 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Friday, September 18, 2015 at 03:41:40 AM, Khem Raj wrote:
> > On Sep 17, 2015, at 7:31 AM, Marek Vasut <marex@denx.de> wrote:
> > 
> > Add a patch which adds a configuration for the nios2 processor.
> > 
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > ---
> > .../0001-libgpg-error-Add-nios2-support.patch      | 45
> > ++++++++++++++++++++++ .../libgpg-error/libgpg-error_1.19.bb            
> >  |  4 +-
> > 2 files changed, 48 insertions(+), 1 deletion(-)
> > create mode 100644
> > meta/recipes-support/libgpg-error/libgpg-error/0001-libgpg-error-Add-nio
> > s2-support.patch
> > 
> > diff --git
> > a/meta/recipes-support/libgpg-error/libgpg-error/0001-libgpg-error-Add-n
> > ios2-support.patch
> > b/meta/recipes-support/libgpg-error/libgpg-error/0001-libgpg-error-Add-n
> > ios2-support.patch new file mode 100644
> > index 0000000..8362c69
> > --- /dev/null
> > +++
> > b/meta/recipes-support/libgpg-error/libgpg-error/0001-libgpg-error-Add-n
> > ios2-support.patch @@ -0,0 +1,45 @@
> > +From b2af652f43991e4ce6297917da542a9eb5135939 Mon Sep 17 00:00:00 2001
> > +From: Marek Vasut <marex@denx.de>
> > +Date: Thu, 17 Sep 2015 03:28:06 +0200
> > +Subject: [PATCH] libgpg-error: Add nios2 support
> > +
> > +Add configuration for the NIOS2 processor.
> > +
> > +Signed-off-by: Marek Vasut <marex@denx.de>
> > +---
> > + src/syscfg/lock-obj-pub.nios2-unknown-linux-gnu.h | 23
> > +++++++++++++++++++++++ + 1 file changed, 23 insertions(+)
> > + create mode 100644 src/syscfg/lock-obj-pub.nios2-unknown-linux-gnu.h
> > +
> > +diff --git a/src/syscfg/lock-obj-pub.nios2-unknown-linux-gnu.h
> > b/src/syscfg/lock-obj-pub.nios2-unknown-linux-gnu.h +new file mode
> > 100644
> > +index 0000000..3a24571
> > +--- /dev/null
> > ++++ b/src/syscfg/lock-obj-pub.nios2-unknown-linux-gnu.h
> > +@@ -0,0 +1,23 @@
> > ++## lock-obj-pub.nios2-unknown-linux-gnu.h
> > ++## File created by gen-posix-lock-obj - DO NOT EDIT
> > ++## To be included by mkheader into gpg-error.h
> > ++
> 
> how was this file generated ?

There's a tool for that, see src/gen-posix-lock-obj.c . Since I don't have
a running NIOS2/f yet, I had to approximate what it does. If you read the
source code, it's quite trivial in fact.

