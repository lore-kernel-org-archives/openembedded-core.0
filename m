Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qth0J-0007qx-5s for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 16:21:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7HEHMxN007696
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2011 15:17:22 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06315-08 for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2011 15:17:18 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7HEH94C007690
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2011 15:17:12 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1313560883.git.sgw@linux.intel.com>
References: <cover.1313560883.git.sgw@linux.intel.com>
Date: Wed, 17 Aug 2011 15:17:01 +0100
Message-ID: <1313590621.13995.40.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 00/27] Updates and various fixes
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
X-List-Received-Date: Wed, 17 Aug 2011 14:21:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-08-16 at 23:26 -0700, Saul Wold wrote:
> This address some issues with the x11 and bluez patches recently,
> it also has the latest kernel update. There is also a multi-lib 
> change that needs your more detailed review.
> 
> The ofono patch from Anders had a question from Koen, so we might
> want to hold on that one, otherwise it looks OK to me.

> The following changes since commit 13db5f420ca9bff98561f80d78958278734ad1f4:
> 
>   distro-tracking: Update info for gpgme, libassuan, apr... after last upgrade. (2011-08-15 15:26:04 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Anders Darander (5):
>   qt4: allow a reduction in build time
>   qmake_base: add uclibceabi
>   connman: use DISTRO_FEATURES to enable wifi and bluetooth
>   ofono: conditionally enable bluetooth
>   create-pull-request: increase likelihood of detecting a rename
> 
> Bruce Ashfield (3):
>   linux-yocto: bump version string to 3.0.1
>   qemu: change default kernel to 3.0.x
>   linux-yocto: meta SRCREV bump
> 
> Dexuan Cui (10):
>   bluez-hcidump: upgrade from 2.0 to 2.1
>   tcf-agent: add openssl into DEPENDS
>   cronie: upgrade from 1.4.7 to 1.4.8
>   mdadm: upgrade mdadm from 3.2.1 to 3.2.2
>   util-macros: upgrade from 1.14.0 to the latest version 0.15.0
>   freetype: upgrade from 2.4.4 to 2.4.6
>   xproto: upgrade from 7.0.21 to 7.0.22
>   glproto: upgrade from 1.4.13 to 1.4.14
>   dri2proto: upgrade from 2.4 to 2.6
>   distro_tracking_fields.inc: update the info for the following recipes
> 
> Dmitry Eremin-Solenikov (1):
>   libxcb: enable native/nativesdk builds as was done previously in
>     meta-oe
> 
> Dongxiao Xu (4):
>   rootfs_rpm: Fix DEFAULTTUNE setting in multilib case
>   package_rpm: enhance strip_multilib function
>   package_rpm: Fix package rename issue in multilib case
>   gtk-icon-cache: Adding MLPREFIX when dynamically set RDEPENDS
> 
> Lianhao Lu (1):
>   package(_ipk).bbclass: opkg using ALL_MULTILIB_PACKAGE_ARCHS
> 
> Phil Blundell (2):
>   cmake.bbclass, perlnative.bbclass: arrange for cmake to find
>     perl-native
>   libproxy: remove dependency on X libs
> 
> Zhai Edwin (1):
>   qemu: Make qemu buildable inside qemux86/qemuppc target

Merged to master with the exception of the ofono and qt patches from
Anders which need smal tweaks.

Cheers,

Richard



