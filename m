Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QQ0S0-0002ZB-Ne for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 19:03:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4RH0lVh004389
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 18:00:47 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04351-01 for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 18:00:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4RH0fnA004383
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 18:00:41 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1306477652.git.lianhao.lu@intel.com>
References: <cover.1306477652.git.lianhao.lu@intel.com>
Date: Fri, 27 May 2011 18:00:35 +0100
Message-ID: <1306515635.27470.284.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 00/11] Add PR service and integrate PKGV/PKGR from OE
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
X-List-Received-Date: Fri, 27 May 2011 17:03:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Lianhao,

On Fri, 2011-05-27 at 14:31 +0800, Lianhao Lu wrote:
>   git://git.pokylinux.org/poky-contrib llu/PR-service
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=llu/PR-service
> 
> Lianhao Lu (11):
>   Added the PR service.
>   conf/bitbake.conf: Added variables for PR service.
>   meta-yocto/local.conf.sample: Added PRSERV_HOST and PRSERV_PORT.
>   classes/package(prserv).bbclass: Get PRAUTO and use PKGV/PKGR.
>   classes/package_xxx.class: Use PKGE/PKGV/PKGR.
>   udev: use EXTENDPKGV instead of EXTENDPV.
>   xcb: use EXTENDPKGV instead of EXTENDPV.
>   xorg-proto: use EXTENDPKGV instead of EXTENDPV.
>   xorg-util/util-macros: use EXTENDPKGV instead of EXTENDPV.
>   linux-libc-headers: use EXTENDPKGV instead of EXTENDPV.
>   conf/bitbake.conf: Removed EXTENDPV and EXTENDPEVER.

I merged this but I did make some tweaks to both the patch series and
one of the patches. The changes I made were:

a) Squash the EXTENDPV and EXTENDPEVER changes into the base patch
making all the associated changes in one go.

b) Not include the DISTRO_PR variable for now

c) Not change the default signature handler to basichash.

For c), I'd suggest a follow up patch changing the default in poky.conf
in meta-yocto and we'll test this there. This should wait until the
PACKAGE_ARCH = "all" sstate issues we've been seeing are addressed
though.

Cheers,

Richard








