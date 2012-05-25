Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SXrmc-0002Qb-G7 for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 12:30:10 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4PAJwx1032649
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2012 11:19:58 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31893-07 for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2012 11:19:52 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4PAJplZ032643
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2012 11:19:52 +0100
Message-ID: <1337941190.20169.24.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 25 May 2012 11:19:50 +0100
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [Consolidated Pull 00/45] Random Fixes & Pre-Automake Updates
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
X-List-Received-Date: Fri, 25 May 2012 10:30:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-05-24 at 23:41 -0700, Saul Wold wrote:
> Richard,
> 
> This has a number of fixes from the community along with a partial
> set of Nitin's changes for the pending automake update.
> 
> Sau!
> 
> 
> The following changes since commit 0f795f81fe5ad3ef78c21a177eca90fbc8810f81:
> 
>   qemu: disable vnc-jpeg compression (2012-05-24 08:53:40 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Bogdan Marinescu (3):
>   lttng2-ust: updated to version 2.0.2
>   lttng-tools: updated to 2.0.1
>   Updated distro-tracking-fields.inc
> 
> Jiajun Xu (2):
>   ltp: Upgrade LTP to version 20120401
>   distro_tracking_fields: update information for ltp
> 
> Mark Hatle (1):
>   package.bbclass: Add additional debugging for dependencies
> 
> Martin Jansa (2):
>   wpa-supplicant: add wpa_supplicant.conf to CONFFILES and don't
>     install it twice
>   wpa-supplicant: don't let postinst fail when dbus-1 reload fails
> 
> Mihai Lindner (1):
>   sudo: fixed wrong `chmod` path
> 
> Nitin A Kamble (29):
>   gmp: fix build with automake 1.12
>   mpfr: fix build with automake 1.12
>   popt: fix build with automake 1.12
>   rpm: fix build with automake 1.12
>   libxml2: fix build with automake 1.12
>   shadow shadow-native: fix build with automake 1.12
>   libtasn1: fix build with automake 1.12
>   systemtap: fix build with automake 1.12
>   libmpc: fix build with automake 1.12
>   libcheck: fix build with automake 1.12
>   texinfo: fix build with automake 1.12
>   libidn: fix build with automake 1.12
>   glew: fix build with automake 1.12
>   findutils: fix build with automake 1.12
>   lrzsz: fix build with automake 1.12
>   minicom: fix build with automake 1.12
>   lighttpd: fix build with automake 1.12
>   libfm: fix build with automake 1.12
>   libcroco: fix build with automake 1.12
>   gmp-4.2.1: fix build with automake 1.12
>   coreutils-native-6.9: fix build with automake 1.12
>   grub-0.97: fix build with automake 1.12
>   diffutils-2.8.1: fix build with automake 1.12
>   grep-2.5.1a: fix build with automake 1.12
>   gawk-3.1.5: fix build with automake 1.12
>   findutils-4.2.31: fix build with automake 1.12
>   make-3.81: fix build with automake 1.12
>   avahi: fix install issue
>   pango: fix dependencies to avoid build issue
> 
> Paul Eggleton (1):
>   opkg-nogpg: add file path
> 
> Richard Purdie (2):
>   fontconfig-native: Be clear about FILE search path
>   binutils: Drop old/stale/broken csl recipe
> 
> Robert Yang (2):
>   utils.bbclass: remove the unused oe_system
>   oe/process.py: remove it since it is unused and duplicated
> 
> Saul Wold (1):
>   ltp: Add attr to DEPENDS list
> 
> Steffen Sledz (1):
>   dropbear: fix include dependent PR generation

I merged these apart from the pango change. There are failures on the
autobuilder but not from these changes as far as I can tell (I've sent
out other patches).

Cheers,

Richard



