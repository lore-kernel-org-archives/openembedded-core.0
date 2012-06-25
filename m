Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SjBnr-0006Vr-7h for openembedded-core@lists.openembedded.org;
	Mon, 25 Jun 2012 18:06:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5PFtNsh028627
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2012 16:55:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26014-02 for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2012 16:55:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5PFtGnd028620
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2012 16:55:17 +0100
Message-ID: <1340639719.23146.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jun 2012 16:55:19 +0100
In-Reply-To: <cover.1340402353.git.sgw@linux.intel.com>
References: <cover.1340402353.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 00/17] Misc Fixes & Updates
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
X-List-Received-Date: Mon, 25 Jun 2012 16:06:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-06-22 at 15:00 -0700, Saul Wold wrote:
> The following changes since commit e2cc4a44d510e0d473d15f207c1c886db6a5ccf7:
> 
>   [PATCH] guile: fix compilation on MIPS/PPC (2012-06-21 13:41:12 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Andrea Adami (1):
>   mtd-utils: do not stage headers in sysroot

Not taken after you requested I didn't.

> Darren Hart (1):
>   cml1.bbclass: Only delay exit if the command fails
> 
> Kang Kai (1):
>   runqemu-internal: qemu fails to run on ext2 image
> 
> Khem Raj (8):
>   gcc-4.6: Retire into toochain-layer
>   eglibc-2.13: Retire into toolchain layer
>   gcc: Remove csl gcc recipes
>   kconfig-frontends: New recipe

Not taken after you requested I didn't.

>   uclibc: Fix packaging to match the new package order
>   qemu.inc: Fix packageconfig options
>   qemu-git: Move to tip of git
>  qemu_git: set empty PACKAGECONFIG

I have said no to this until the patch set gets updated. It will just
get ignored/forgotten about otherwise.

> Paul Gortmaker (1):
>   linux-firmware: update to main repo on kernel.org
> 
> Richard Purdie (1):
>   bitbake.conf/abi_version.conf: Update to use BasicHash signature
>     generator
> 
> Saul Wold (1):
>   distrodata: Fix missed VARIABLE name change
> 
> Scott Garman (2):
>   gzip: upgrade to 1.5
>   sudo: upgrade to 1.8.5p2
> 
> Valentin Popa (1):
>   gpgme: updated to 1.3.2

Otherwise merged to master, thanks.

Richard



