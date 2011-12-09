Received: from mail-out.m-online.net ([212.18.0.9])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <wd@denx.de>)
	id 1RZA7E-00072P-3h for openembedded-core@lists.openembedded.org;
	Sat, 10 Dec 2011 00:44:32 +0100
Received: from frontend1.mail.m-online.net (unknown [192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 9D2951C1D9EB;
	Sat, 10 Dec 2011 00:30:59 +0100 (CET)
X-Auth-Info: a5iBwZRGrdhWswuyPlDMvV/wTT/341Yonfa77tQENrs=
Received: from diddl.denx.de (host-80-81-18-216.customer.m-online.net
	[80.81.18.216])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 937251C00065;
	Sat, 10 Dec 2011 00:30:59 +0100 (CET)
Received: from gemini.denx.de (unknown [10.0.0.2])
	by diddl.denx.de (Postfix) with ESMTP id 636C91A376B;
	Sat, 10 Dec 2011 00:30:59 +0100 (CET)
Received: from gemini.denx.de (localhost.localdomain [127.0.0.1])
	by gemini.denx.de (Postfix) with ESMTP id E7DC41926E19;
	Sat, 10 Dec 2011 00:30:58 +0100 (CET)
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Martin Jansa <martin.jansa@gmail.com>
From: Wolfgang Denk <wd@denx.de>
MIME-Version: 1.0
In-reply-to: <20111209080731.GB3848@jama.jama.net>
References: <1323415475-21361-1-git-send-email-fransmeulenbroeks@gmail.com>
	<20111209075504.GA4082@ad.chargestorm.se>
	<20111209080731.GB3848@jama.jama.net>
Comments: In-reply-to Martin Jansa <martin.jansa@gmail.com>
	message dated "Fri, 09 Dec 2011 09:07:31 +0100."
Date: Sat, 10 Dec 2011 00:30:58 +0100
Message-Id: <20111209233058.E7DC41926E19@gemini.denx.de>
Subject: Re: [PATCH] u-boot: renamed dir from uboot to the more appropriate u-boot
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Dec 2011 23:44:32 -0000
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 8bit

Dear Martin Jansa,

In message <20111209080731.GB3848@jama.jama.net> you wrote:
> 
> On Fri, Dec 09, 2011 at 08:55:05AM +0100, Anders Darander wrote:
> > * Frans Meulenbroeks <fransmeulenbroeks@gmail.com> [111209 08:25]:
> > 
> > > recipe dirs normally have the name of the (main) package and the official name is u-boot
> > 
> > From this I guess that there aren't any other changes in the patch,
> > apart from the renames?
> > 
> > Next time, could you add '-M' to `git format-patch`, to make git detect
> > renames? That results in smaller and easier to review patches.
>
> Just because of "Coordinating inter-layer dependencies" thread I have to
> say, that this will break parsing for people using ie meta-openmoko and
> meta-nokia BSP layers:
>
> meta-nokia/recipes-bsp/uboot/u-boot_git.bb:require recipes-bsp/uboot/u-boot> .inc
> meta-openmoko/recipes-bsp/uboot/u-boot_git.bb:require recipes-bsp/uboot/u-b> oot.inc
>
> But I'll try to update meta-smartphone layers as soon as this change is
> applied in oe-core..
>
> meta-ti is already using recipes-bsp/u-boot so I guess it's worth
> renaming.

It's highly advisable to perform the rename ASAP. There is an
Austrian lawyer who claims to have IP rights on the name "uboot".

We had to sign a Cease and Desist Notice and update all web pages to
change all ocurrences of "uboot" into "u-boot" (which actually
required extensions to the wiki we used).

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
I can't say I've ever been lost, but I was bewildered once for  three
days.                                     - Daniel Boone (Attributed)


