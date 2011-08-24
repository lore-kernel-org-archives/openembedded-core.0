Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qw2JV-0000jY-Qc for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 03:31:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7O1Qj75014524
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2011 02:26:45 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12645-10 for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2011 02:26:41 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7O1Qa6Z014518
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2011 02:26:39 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1314043945.git.sgw@linux.intel.com>
References: <cover.1314043945.git.sgw@linux.intel.com>
Date: Tue, 23 Aug 2011 18:26:34 -0700
Message-ID: <1314149194.5939.65.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 00/19] various fixes and updates
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
X-List-Received-Date: Wed, 24 Aug 2011 01:31:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-22 at 14:51 -0700, Saul Wold wrote:
> Richard,
> 
> This includes a 3.0.3 kernel update, along with changes from
> many different people. Jessica is OK with the POKY-> OECORE change
> 
> Sau!
> 
> 
> The following changes since commit 9134800548a03bfe3a7e351a15f2129bcb3cc680:
> 
>   xcb/libpthreads: Add BBCLASSEXTEND to resolve missing providers in world builds (2011-08-19 16:27:29 -0700)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Bruce Ashfield (2):
>   linux-yocto: move more default values into linux-yocto.inc
>   linux-yocto: update SRCREVs for 3.0.3
> 
> Chris Larson (3):
>   libpcre: the generated libtool uses HOST_SYS
>   rpm: be certain we don't prefix our binaries
>   image_types_uboot: add uboot mkimage fs types
> 
> Darren Hart (3):
>   tune: add missing closing quote to arch-armv7a.inc for AVAILTUNES
>   tune: remove thumb flag from non-thumb cortexa8 tune variables
>   tune: Add hard floating point variants of cortexa8 tunes
> 
> Jiajun Xu (2):
>   libsdl: do not inherit nativesdk
>   task-core-x11-sato: add libsdl into sato image
> 
> Khem Raj (1):
>   recipes: Delete patch=1, its default and replace pnum with striplevel
> 
> Lianhao Lu (1):
>   adt-installer: Removed the hard coded repo url.
> 
> Martin Jansa (1):
>   utils.bbclass: skip empty paths when handling FILESEXTRAPATHS
> 
> Otavio Salvador (4):
>   Use OECORE_DISTRO_VERSION instead of POKY_DISTRO_VERSION
>   kernel.bbclass: save kernel image name into $kerneldir
>   scripts/runqemu: add support to pass bootparams to kernel
>   scripts/combo-layer: fix configuration file handling
> 
> Robert Yang (1):
>   bitbake meta-toolchain with gcc 4.5.1 failed
> 
> Saul Wold (1):
>   at: fix RDEPENDS -> RDEPENDS_${PN}

Merged to master with the exception of one of Darren's changes which
I've emailed separately about.

Cheers,

Richard



