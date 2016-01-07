Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 3B7976FF84
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 15:33:36 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3pbs665ZfDz3hjZR;
	Thu,  7 Jan 2016 16:33:34 +0100 (CET)
X-Auth-Info: T1+xH7bj5RqAqKr5B/GZvIjtia7ahfq9fxpmupu4es4=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3pbs6642vGzvdWS; 
	Thu,  7 Jan 2016 16:33:34 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 7 Jan 2016 16:07:01 +0100
User-Agent: KMail/1.13.7 (Linux/3.14-2-amd64; KDE/4.13.1; x86_64; ; )
References: <1448983859-6096-1-git-send-email-marex@denx.de>
	<201512011701.12802.marex@denx.de> <20160107143831.GE2512@jama>
In-Reply-To: <20160107143831.GE2512@jama>
MIME-Version: 1.0
Message-Id: <201601071607.01877.marex@denx.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libbsd: Upgrade to 0.8.0
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
X-List-Received-Date: Thu, 07 Jan 2016 15:33:36 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thursday, January 07, 2016 at 03:38:31 PM, Martin Jansa wrote:
> On Tue, Dec 01, 2015 at 05:01:12PM +0100, Marek Vasut wrote:
> > On Tuesday, December 01, 2015 at 04:46:57 PM, Burton, Ross wrote:
> > > On 1 December 2015 at 15:42, Marek Vasut <marex@denx.de> wrote:
> > > > Looks like it depends on OpenSSL, so adding "DEPENDS = "openssl"" to
> > > > the recipe would be the solution, right ?
> > > 
> > > Assuming it's a hard dependency, yes.
> > 
> > I was wrong, I just looked into the upstream git of libbsd and there's
> > the solution:
> > 
> > http://cgit.freedesktop.org/libbsd/commit/?id=8493c7f27da2dcd2de71e9c7782
> > c3d020d89c2a2
> 
> This upgrade breaks lldpd and possibly other libbsd users as well:
> | In file included from
> | /OE/build/oe-core/tmp-glibc/work/i586-oe-linux/lldpd/0.7.19-r0/lldpd-0.7
> | .19/src/compat/compat.h:46:0,
> | 
> |                  from
> |                  /OE/build/oe-core/tmp-glibc/work/i586-oe-linux/lldpd/0.
> |                  7.19-r0/lldpd-0.7.19/src/lldpd-structs.h:41,
> | 
> |                  from /OE/build/oe-core/tmp-glibc/work/i586-oe-
linux/lldpd/0.7.19-r0/lldpd-0.7.19/src/lldpd-structs.c:21:
> | /OE/build/oe-core/tmp-glibc/sysroots/qemux86/usr/include/bsd/unistd.h: In
> | function 'setproctitle':
> | /OE/build/oe-core/tmp-glibc/sysroots/qemux86/usr/include/bsd/unistd.h:64
> | :2: error: expected declaration specifiers before '__printflike'
> | 
> |   __printflike(1, 2);
> |   ^
> | 
> | compilation terminated due to -Wfatal-errors.
> | Makefile:493: recipe for target 'lldpd-structs.lo' failed
> | make[2]: *** [lldpd-structs.lo] Error 1
> 
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=807730
> 
> Luckily it's fixed in 0.8.1, I'll send patch for that soon.

Thanks

Best regards,
Marek Vasut

