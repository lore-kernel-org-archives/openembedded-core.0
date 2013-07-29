Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id F3E0A6AFB6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 16:32:22 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 29 Jul 2013 09:32:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,771,1367996400"; d="scan'208";a="372973962"
Received: from unknown (HELO helios.localnet) ([10.252.122.206])
	by fmsmga001.fm.intel.com with ESMTP; 29 Jul 2013 09:32:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jul 2013 17:32:07 +0100
Message-ID: <1931416.qSpeW4C5Z6@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-26-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <cover.1375112939.git.sgw@linux.intel.com>
References: <cover.1375112939.git.sgw@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [CONSOLIDATED PULL (Part 2) (resend) 00/14] Fixed again
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
X-List-Received-Date: Mon, 29 Jul 2013 16:32:23 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 29 July 2013 08:51:01 Saul Wold wrote:
> Clearly having a bad morning!
> 
> This one drops the Recipe Re-names from Ema, should not have been
> there.
> 
> Sau!
> 
> The following changes since commit 09deeef20ee5a0c12ad4fd89cace6e0fb832d5b1:
> 
>   external-sourcery: add missing providers (2013-07-27 23:28:29 -0700)
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
> 
> Hongxu Jia (3):
>   util-linux: use u-a for su
>   shadow: use u-a for su
>   move /bin/su to /usr/bin/su to match util-linux and shadow

Missing busybox: prefix on the latter
 
> Jukka Rissanen (1):
>   ofono: Move bluetooth enablement from .bb to .inc
> 
> Laurentiu Palcu (1):
>   csl-versions.inc: instruct user to check local.conf
> 
> Ming Liu (3):
>   libpam: deny all services for the OTHER entries

I'm not a pam expert, so I'm just assuming this is the right thing to be 
doing. It seems like it might be if you want the system to be secure by 
default, but from what I can tell it also means that every service using pam 
for authentication must explicitly provide a configuration file.

>   util-linux: fix a regression
>   util-linux: replace += with _append to EXTRA_OECONF_class-native
> 
> Paul Eggleton (1):
>   classes/sanity: check for suid root command evility
> 
> Peter Seebach (1):
>   pseudo: Always try to build 32-bit libpseudo when NO32LIBS is set to 0
> 
> Saul Wold (1):
>   bluez5: Add obex as a PACKAGECONFIG and package seperately

Otherwise:
Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

