Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D13386B24D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 14:45:36 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 30 Jul 2013 07:45:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,778,1367996400"; d="scan'208";a="378922854"
Received: from unknown (HELO helios.localnet) ([10.252.122.217])
	by orsmga002.jf.intel.com with ESMTP; 30 Jul 2013 07:45:36 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jul 2013 15:45:35 +0100
Message-ID: <1632092.MH550064Ab@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-26-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <cover.1375194496.git.sgw@linux.intel.com>
References: <cover.1375194496.git.sgw@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [CONSOLIDATED PULL (M3 rc1) v2 00/25] Needs Final Review & ACK
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
X-List-Received-Date: Tue, 30 Jul 2013 14:45:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 30 July 2013 07:30:25 Saul Wold wrote:
> Removed bluez / obex patch in preference for Ross's (later this week).
> 
> Please review/ack for RP to pull today for M3-rc1
> 
> Thanks
> 
> Sau!
> 
> 
> The following changes since commit 09deeef20ee5a0c12ad4fd89cace6e0fb832d5b1:
> 
>   external-sourcery: add missing providers (2013-07-27 23:28:29 -0700)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>  
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/
> stage
> 
> Andre McCurdy (1):
>   lib/oe/terminal.py: add support for MATE desktop terminals
> 
> Andrei Dinu (1):
>   libpng : upgrade to 1.6.3
> 
> Colin Walters (1):
>   util-linux: Update for swapoff being a separate binary
> 
> Cristian Iorga (1):
>   iproute2: upgrade to v3.10.0
> 
> Emilia Ciobanu (4):
>   docbook-sgml-dtd-3.1-native: fix recipe name
>   docbook-sgml-dtd-4.1-native: fix recipe name
>   distrodata.bbclass: Remove whitespaces
>   distrodata.bbclass: Include PRSPV variable in upstream version
>     checking
> 
> Hongxu Jia (3):
>   util-linux: use u-a for su
>   shadow: use u-a for su
>   busybox: move /bin/su to /usr/bin/su to match util-linux and shadow
> 
> Jackie Huang (2):
>   dbus: remove build host test in configure script
>   matchbox-wm: correct the SRC_URI and add checksums
> 
> Jonathan Liu (1):
>   syslinux: update to 4.07
> 
> Jukka Rissanen (1):
>   bluez5: Only install .conf files if found
> 
> Laurentiu Palcu (1):
>   csl-versions.inc: instruct user to check local.conf
> 
> Ming Liu (2):
>   openssl: Fix multilib header conflict - opensslconf.h
>   libpam: deny all services for the OTHER entries
> 
> Muhammad Shakeel (2):
>   systemd: Remove init.d dir if systemd unit file is present and
>     sysvinit not a distro feature
>   busybox: Add syslog-init alternative only if SysV in enabled
> 
> Paul Eggleton (1):
>   classes/sanity: check for suid root command evility
> 
> Peter Seebach (1):
>   pseudo: Always try to build 32-bit libpseudo when NO32LIBS is set to 0
> 
> Ross Burton (1):
>   v86d: mark as compatible with all x86, not just qemux86
> 
> Saul Wold (1):
>   texinfo: Update to 5.1
> 
> Wenzong Fan (1):
>   ccache: allow CCACHE_DIR to be overriden

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

