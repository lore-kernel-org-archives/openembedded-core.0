Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RIL9w-00005O-DR for openembedded-core@lists.openembedded.org;
	Mon, 24 Oct 2011 16:05:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9ODxgEf029444
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2011 14:59:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29045-05 for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2011 14:59:37 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9ODxYHv029438
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2011 14:59:35 +0100
Message-ID: <1319464775.25011.15.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 24 Oct 2011 14:59:35 +0100
In-Reply-To: <cover.1319394187.git.sgw@linux.intel.com>
References: <cover.1319394187.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 00/27] Various Updates and fixes
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
X-List-Received-Date: Mon, 24 Oct 2011 14:05:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-10-23 at 11:26 -0700, Saul Wold wrote:
> This pull requests adds some new recipes for supporting building
> oe-core with oe-core, also various patches and updates. 

I've taken a chunk of this but there were some issues.

> I also included the MACHINE_KERNEL_PR change from Dmitry per my 
> reading of the TSC Notes.

That isn't what I understood from the TSC meeting and this patch isn't
getting merged.

> Cliff Brake (1):
>   squashfs-tools: add recipe
> 

>Khem Raj (7):
>   tcmode-default.inc: Add TRANSLATED_TARGET_ARCH suffix to
>     binutils-cross-canadian
>   binutils-cross-canadian: Point sysroot to correct location
>   gcc-configure-sdk: Point sysroot to correct location
>   xserver-xorg: Add mesa-dri to depends instead of virtual/libgl
>   gcc-4.6: Backport fix for PR32219
>   coreutils: Upgrade recipe 8.12 -> 8.14
>
>Martin Jansa (5):
>   apr: add native support
>   neon: add native support
>   apr-util: add native support
>   subversion-1.6.15: add native support too
>   default-providers: switch virtual/libgl from mesa-xlib to mesa-dri
> 
> Nitin A Kamble (2):
>   tcl: upgrade from 8.5.9 to 8.5.10
>   perl: upgrade from 5.12.3 to 5.14.2
> 
> Otavio Salvador (4):
>   bootimg.bbclass: add support to disable HDD image building
>   useradd.bbclass: check if a group already exists manually
>   base-passwd: move initial criation of group and passwd to preinst
>   dbus: use useradd class to allow use in read-only filesystems
> 
> Saul Wold (2):
>  texi2html: Added recipe from OE
>  oprofile: Update to 0.9.7 and convert cvs->git

The above were merged.

>Saul Wold (3):
>   wget: Add recipe from OE
>   abiword: convert to svn
>   perl: remove debug set -x; pwd

I squashed the perl fix into the perl commit, I've commented on the
other two.

>Dmitry Eremin-Solenikov (1):
>  kernel.bbclass: respect MACHINE_KERNEL_PR
>
>Khem Raj (1):
>  libtool: Upgrade from 2.4 -> 2.4.2
> 
>Martin Jansa (2):
>  pulseaudio-0.9.23: inherit perlnative to work around build on host
>     without XML/Parser.pm
>  subversion: add 1.7.0 with native support and negative D_P for now

I've also given feedback on these. I'm holding off subversion 1.7 until
we can come up with a good plan for handling it, it likely needs bitbake
fetcher support.

Cheers,

Richard



