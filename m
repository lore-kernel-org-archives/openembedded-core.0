Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QS8LZ-0007r1-3e for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 15:54:01 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p52DomKH013346
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Jun 2011 14:50:48 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12816-03 for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2011 14:50:44 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p52DoaFH013337
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Jun 2011 14:50:40 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1307001679.git.sgw@linux.intel.com>
References: <cover.1307001679.git.sgw@linux.intel.com>
Date: Thu, 02 Jun 2011 14:50:16 +0100
Message-ID: <1307022616.27470.541.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 00/12] 2-June-2011
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
X-List-Received-Date: Thu, 02 Jun 2011 13:54:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-02 at 01:04 -0700, Saul Wold wrote:
> Pulling a number of patches and updates from the list, they have been
> built on the autobuild.
> 
> This has the gcc fix for qt4-x11-free in the form of a gcc patch
> 
> The following changes since commit 0a496df0209c93fd00ea929b5f27faa1a6e600c0:
> 
>   clutter-1.6: Add patch to update gettext macro version (2011-06-01 18:32:30 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Jingdong Lu (1):
>   libx11: fix libX11 keysyms to pass xts5 of lsb
> 
> Kang Kai (1):
>   task-core-lsb: add cups and ghostscript into image
> 
> Koen Kooi (3):
>   u-boot: package up u-boot.bin for field upgrades
>   shadow: remove selinux entry from pam.d/login
>   avahi: enable service when using systemd
>
> Nitin A Kamble (4):
>   gettext-0.16.1: mark upstream status for gplv2 recipe's patches
>
> Phil Blundell (1):
>   rootfs_ipk: delete opkg metadata if package management not required
>     and all packages are configured
> 

I merged the above.

>   m4: upgrade from 1.4.15 to 1.4.16

Khem asked what the license change was here and it should have been
mentioned in the commit message.

>   autoconf: upgrade from 2.65 to 2.68

Not pulled as likely dependent on the above.

>   bison: upgrade from 2.4.3 to 2.5

Likewise.

> Saul Wold (2):
>   ghostscript: Fix up file locations and add i686

Why did this need the location fixups? Something sounds wrong here and
needs digging into.

>   gcc: Fix volatile access issue for ARM

I merged this.

Cheers,

Richard



