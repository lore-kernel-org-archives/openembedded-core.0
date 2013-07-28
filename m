Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C6A806065F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jul 2013 10:48:21 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Jul 2013 03:45:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,763,1367996400"; d="scan'208";a="377840716"
Received: from unknown (HELO helios.localnet) ([10.252.122.181])
	by orsmga002.jf.intel.com with ESMTP; 28 Jul 2013 03:48:09 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 28 Jul 2013 11:48:07 +0100
Message-ID: <3689089.Qmu2GnWomP@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-26-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <cover.1374992484.git.sgw@linux.intel.com>
References: <cover.1374992484.git.sgw@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [CONSOLIDATED PULL (Part 2) 00/15] Tobe Reviewed and ACK'ed
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
X-List-Received-Date: Sun, 28 Jul 2013 10:48:21 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 27 July 2013 23:30:50 Saul Wold wrote:
> Paul, Ross, Richard:
> 
> This is part 2 of the C-Pull, part one was reviewed and ACK'ed on Friday,
> these where some changes that have come in since, there are some additional
> changes that I still need to review (Read-Only Rootfs specificly).
> 
> There are also 2 pending changes on poky, one from Ema for Regex and the
> other from Lazslo for the layer.conf file.
> 
> This set address some of the external toolchain stuff also.
> 
> Thanks
> 	Sau!
> 
> The following changes since commit fe6fc253d6fe4ae08cfaaa05d82df54a277f575c:
> 
>   external-sourcery: add missing providers (2013-07-26 00:07:51 -0700)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage2
>  
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/
> stage2
> 
> Andrei Dinu (1):
>   libpng : upgrade to 1.6.3
> 
> Emilia Ciobanu (2):
>   distrodata.bbclass: Remove whitespaces
>   distrodata.bbclass: Include PRSPV variable in upstream version
>     checking

PRSPV doesn't seem like an ideal name for this, since it's really 
distrodata.bbclass that it influences. That said if we're planning on rewriting 
distrodata.bbclass in the near future (and I think we should), maybe it 
doesn't really matter what it's called, as long as it never appears in any 
recipes.

> Hongxu Jia (3):
>   util-linux: use u-a for su
>   shadow: use u-a for su
>   move /bin/su to /usr/bin/su to match util-linux and shadow
> 
> Jukka Rissanen (2):
>   ofono: Add systemd support
>   ofono: Enable bluetooth automatically

The latter change doesn't really enable bluetooth automatically, it just moves 
the check to the .inc file. I'd suggest the shortlog be changed to just say 
that.

> Laurentiu Palcu (1):
>   csl-versions.inc: instruct user to check local.conf
> 
> Ming Liu (3):
>   libpam: deny all services for the OTHER entries
>   util-linux: fix a regression
>   util-linux: replace += with _append to EXTRA_OECONF_class-native
> 
> Paul Eggleton (1):
>   classes/sanity: check for suid root command evility
> 
> Peter Seebach (1):
>   Always try to build 32-bit libpseudo when NO32LIBS is set to 0

The shortlog for this should technically have a pseudo: prefix.

> Saul Wold (1):
>   bluez5: Add obex as a PACKAGECONFIG and package seperately

Otherwise:
Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

