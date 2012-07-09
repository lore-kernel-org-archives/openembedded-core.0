Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SoGca-0003Rg-F0 for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 18:15:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q69G4RIP008774
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Jul 2012 17:04:27 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08270-04 for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jul 2012 17:04:23 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q69G4KNG008768
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Jul 2012 17:04:21 +0100
Message-ID: <1341849860.8066.23.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 09 Jul 2012 17:04:20 +0100
In-Reply-To: <cover.1341802889.git.sgw@linux.intel.com>
References: <cover.1341802889.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 00/41] Fixes and Updates
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
X-List-Received-Date: Mon, 09 Jul 2012 16:15:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-07-09 at 08:47 -0700, Saul Wold wrote:
> Richard,
> 
> This set contains a 2 patches that will fix multilib and non-gplv3
> build issues, along with some other patches and updates.

I'd already taken some of these individually. I've rebased and taken the
rest. I did drop the gthumb patch since there are issues there which
Ross is aware of and is working on.

Cheers,

Richard

> Alexandru DAMIAN (1):
>   curl: upgrade to 7.26.0
> 
> Bruce Ashfield (1):
>   kernel.bbclass: add non-santized kernel provides
> 
> Darren Hart (4):
>   init-install: Use swap_ratio in the calulation of swap_size
>   init-install: Correct ext2->ext3 typo in logging
>   init-install: Clean up partition alignment
>   grub-efi: Do not use help2man
> 
> Kang Kai (2):
>   initscripts: use update-alternative to handle file functions
>   lsbinitscripts: increase ALTERNATIVE_PRIORITY
> 
> Kartik Mohta (1):
>   gcc-common: Don't use "is" for comparing strings, use "=="
> 
> Laurentiu Palcu (8):
>   directfb: upgrade to 1.6.1
>   directfb-examples: upgrade to 1.6.0
>   libx11: upgrade to 1.5.0
>   libx11-trim: upgrade to 1.5.0
>   libx11-diet: upgrade to 1.5.0
>   libxi: upgrade to 1.6.1
>   xinput: upgrade to 1.6.0
>   pixman: upgrade to 0.26.2
> 
> Mark Hatle (4):
>   populate_sdk_rpm: Sync multilib configuration with rootfs_rpm
>   multilib: Enable multilib remapping for SDK generation
>   package_rpm: Avoid duplicate package generation failures
>   rpm: Fix PACKAGECONFIG dependencies
> 
> Martin Jansa (2):
>   startup-notification: bump PR because libxcb-util soname was changed
>   matchbox-panel-2: bump PR because libxcb-util soname was changed
> 
> Matthew McClintock (3):
>   libxml-parser-perl_2.41.bb: fix MakeMaker issues with using wrong
>     CC/LD/etc
>   qemu-0.15.1: add patch to fix compilatation problems on powerpc
>   packagedata.py: Fix get_subpkgedata_fn for multilib
> 
> Paul Eggleton (1):
>   classes/license: fix manifest to work with deb
> 
> Peter Seebach (1):
>   pseudo: Update to 1.3.1 (fixing chroot crash)
> 
> Richard Purdie (1):
>   utils.bbclass: add helper function to add all multilib variants of a
>     specific package
> 
> Robert P. J. Day (1):
>   recipes.txt: Add entries for "recipes-rt" and "recipes-support"
> 
> Robert Yang (3):
>   apt 0.7.14: runtime error: filename too long (tmpdir length)
>   apt 0.7.14: runtime error: Method file has died unexpectedly
>   sanity.bbclass: the tmpdir can't be longer than 410
> 
> Ross Burton (3):
>   gthumb: run make install in parallel
>   connman: remove some obviously wrong (circa early-GNOME 2?)
>     directories from FILES
>   connman: ship the empty plugins directory in the connman package
> 
> Saul Wold (3):
>   gnutls: make sure native is patched for gettext version
>   bluez4: fix packaging issue after update
>   ncurses: fix packaging issue in multilib build
> 
> Scott Garman (2):
>   runqemu: fix usage() help for MACHINE setting
>   runqemu: fix support for ext4 rootfs images




