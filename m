Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SZhoE-0002RE-TG for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 14:15:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4UC59Zm021867
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 13:05:09 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21779-04 for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 13:05:04 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4UC4x9c021852
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 13:05:00 +0100
Message-ID: <1338379499.20169.140.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 30 May 2012 13:04:59 +0100
In-Reply-To: <cover.1337714416.git.mark.hatle@windriver.com>
References: <cover.1337714416.git.mark.hatle@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 00/30] Refactor update-alternatives
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
X-List-Received-Date: Wed, 30 May 2012 12:15:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-05-22 at 14:30 -0500, Mark Hatle wrote:
> This set of commits refactors update-alternatives.  The primary purpose 
> is to cover all of the corner cases currently in oe-core (and hopefully 
> other layers) so that recipes can all use the update-alternatives class, 
> instead of manual update-alternatives calls in man post install/remove 
> scripts.
> 
> The refactored update-alternatives is compatible with the older methods, 
> but does indicate they are deprecated via a warning message.  One of the 
> key changes is that all referenced alternatives are not added to the 
> per-file dependency information.  For example, gawk sets up an 
> alternative for 'awk'.  The /bin/gawk binary now says it provides 
> /bin/awk, so that the package management systems that use per file 
> dependencies (i.e. RPM), will be able to find the minimum set of 
> packages to resolve the image.
> 
> In addition, to all of that, the references have been changed from 
> ".${PN}" to ".${BPN}" for alternatives.  This will allow the multilib
> system to work as intended by resolving multilib binaries.
> 
> All of the work has been tested using buildhistory and building various 
> images.  Buildhistory indicated only expected changes were performed.
> 
> (To avoid spamming the list, I have decided to only send the first 3 
> patches, lrzsz, busybox, util-linux and shadow-native as this is a 
> reasonable representation of the changes.  Please see the referenced 
> repository and branch below for full details on the series.)
> 
> *** BLURB HERE ***
> The following changes since commit e6333825c3482a559a0c0499e17f8f48d3042ddf:
> 
>   tune-mips64.inc: Add new tune file for mips64 big-endian (2012-05-20 20:24:37 -0700)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib mhatle/upd-alt-2
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/upd-alt-2
> 
> Mark Hatle (30):
>   update-alternatives.bbclass: Refactor the implementation
>   update-alternatives.bbclass: Change from using PN to BPN
>   which: use BPN for alternatives
>   wget: use BPN for alternatives
>   time: use BPN for alternatives
>   shadow: use BPN for alternatives
>   sed: use BPN for alternatives
>   mktemp: use BPN for alternatives
>   less: use BPN for alternatives
>   patch: use BPN for alternatives
>   tinylogin: use BPN for alternatives
>   sysvinit: use new update-alternatives
>   lrzsz: use new update-alternatives
>   openssh: use new update-alternatives
>   busybox: use new update-alternatives
>   coreutils: use new update-alternatives
>   dropbear: use new update-alternatives
>   ncurses: use new update-alternatives
>   psplash: use new update-alternatives
>   util-linux: use new update-alternatives
>   binutils: use new update-alternatives
>   tar: use new update-alternatives
>   opkg: use new update-alternatives
>   cpio: use new update-alternatives
>   grep: use new update-alternatives
>   iputils: use new update-alternatives
>   psmisc: use new update-alternatives
>   sysklogd: use new update-alternatives
>   kmod: use new update-alternatives
>   shadow-utils-native: remove unnecessary alternatives

Merged to master, thanks.

I've noticed a few issues and this obviously introduces a lot of warning
messages. I've posted a couple of fixes but we need a plan to get the
warnings resolved...

Cheers,

Richard




