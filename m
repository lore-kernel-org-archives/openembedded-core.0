Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qm21J-0000Mu-KV for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 13:11:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6RB77K6029362
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 12:07:07 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28892-04 for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 12:07:03 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6RB6wJ2029356
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 12:06:58 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
Date: Wed, 27 Jul 2011 12:06:48 +0100
Message-ID: <1311764808.2344.354.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [Consolidated & Tested 00/35] July 27
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
X-List-Received-Date: Wed, 27 Jul 2011 11:11:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Saul,

On Wed, 2011-07-27 at 00:46 -0700, Saul Wold wrote:
> The following changes since commit 02031d766f983cd7e01e468cb2c926604313cd2a:
> 
>   arch-ia32.inc: Fix up TUNE_ARCH variable conflicts (2011-07-26 22:39:49 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/live

I merged the following:

> Bruce Ashfield (1):
>   machine/qemu: set preferred linux-yocto kernel version
> 
> Enrico Scholz (2):
>   console-tools: removed wildcard from SRC_URI
>   module-init-tools: do not build static utilities for -cross

[I've made a note on this one to remove the static patch from that
recipe]

> Kang Kai (5):
>   libpam: update to 1.1.4 and add subpackage xtests
>   cups: add pam support
>   screen: add pam support
>   sudo: add pam support
>   shadow: update pam related configure files
> 
> Khem Raj (2):
>   libxcb: Add missing DEPENDS on libxdmcp
>   siteinfo: Rework the siteinfo for powerpc to fix uclibc fallout
> 
> Koen Kooi (1):
>   dropbear: don't override DISTRO_TYPE if it is already set
> 
> Paul Eggleton (6):
>   meta/conf/local.conf.sample: remove oprofileui-native related
>     settings
>   meta/conf/local.conf.sample: improve comments/layout

[merged with fixes to remove the patch conflict it contained]

>   meta/conf/local.conf.sample: improve terminal examples/comments
>   eglibc: remove unnecessary FILESPATHPKG usage
>   scripts/combo-layer: keep carriage returns at the end of lines
> 
> Saul Wold (5):
>   libcap: Update to 2.22 with License Clarification
>   Remove -live.bb recipes
>   Remove -directdisk.bb recipes
>   classes/image*: Revamp creation of live images

[fixed to inherit the right class]

>   utils.bbclass: Don't forget to pass the cmdline options
> 
> Tom Rini (8):
>   siteinfo: Move certain samba entries to common-linux
>   siteinfo: Move certain bash entries to common-linux
>   x86_64-linux siteinfo: Add bash info
>   siteinfo: Move certain mysql entries to common-linux

>   siteinfo: Move certain db entries to common-linux
>   siteinfo: Move general realloc/malloc values to common-$libc
>   siteinfo: Move (getpgrp|setpgrp|setgrent|*get{pwuid,grgid}) to
>     common-libc
> 
> Wenzong Fan (2):
>   cronie: enable PAM support for cronie
>   at: enable pam support
> 
> Xiaofeng Yan (3):
>   openssh: Support PAM
>   dropbear: Support pam
>   polkit: Support pam

I discussed this one with Paul and we've agreed to patch bitbake so I
didn't take it:

  meta/conf/local.conf.sample: remove nonfunctional BBINCLUDELOGS
    setting

I dropped this as per discussion and comments from Phil:

  siteinfo: Move the rp-pppoe entry to common-linux

Cheers,

Richard




