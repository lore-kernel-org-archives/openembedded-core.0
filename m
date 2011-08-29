Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qy1Lg-0000Kk-4Y for openembedded-core@lists.openembedded.org;
	Mon, 29 Aug 2011 14:53:56 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7TCmwaR002956
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2011 13:48:58 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22015-03 for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2011 13:48:54 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7TCmpg2002950
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2011 13:48:53 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1314387279.git.sgw@linux.intel.com>
References: <cover.1314387279.git.sgw@linux.intel.com>
Date: Mon, 29 Aug 2011 13:48:43 +0100
Message-ID: <1314622123.5939.283.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 00/21]
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
X-List-Received-Date: Mon, 29 Aug 2011 12:53:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-26 at 12:39 -0700, Saul Wold wrote:
> Richard,
> 
> A variety of changes
> 
> Sau!
> 
> 
> The following changes since commit 81aa4bfbde871af1d569b64499c34a315bf6218e:
> 
>   classes/sanity: enhance the network connectivity test (2011-08-25 08:49:12 -0700)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Bruce Ashfield (1):
>   linux-yocto-rt: qemumips: fix boot panic
> 
> Dmitry Eremin-Solenikov (1):
>   opkg-utils: ignore packages disapperaring filelist generation
> 
> Dongxiao Xu (6):
>   package.bbclass: Fix recrdeptask of image type recipes
>   base-passwd: Use BPN in FILES paths
>   bitbake.conf: Use BPN in FILES paths
>   multilib.bbclass: Fix renaming logic for "FILES_", "RDEPENDS_", etc
>   multilib.bbclass: add "pkg_postinst" and "pkg_postrm" as renaming
>     elements
>   multilib.bbclass: add renaming for INITSCRIPT related variables
> 
> Jessica Zhang (1):
>   [YOCTO #1396] Fix adt-installer for consistent naming for powerpc and
>     add all arch template for installation
> 
> Kang Kai (3):
>   bitbake.conf: set includedir_nativesdk
>   qt4-tools-nativesdk: remove gcc standard paths
>   cmake-nativesdk: remove gcc standard paths
> 
> Kumar Gala (2):
>   gcc-4.6: Drop gcc-poison-parameters.patch as its not need
>   gcc-4.5.1: Drop gcc-poison-parameters.patch, replace with bug fix
>     patch
> 
> Liming Wang (2):
>   script/runqemu: change boot command line for qemuppc
>   scripts/runqemu: disable unfs boot mode for qemuppc
> 
> Martin Jansa (1):
>   eglibc: fix gconv packaging after
>     5486cac29db6e67051fff7637a0abc9aeab661e5
> 
> Mike Crowe (2):
>   kernel.bbclass: support kernel image type of vmlinux.gz
>   kernel.bbclass: Find the kernel consistently.
> 
> Phil Blundell (1):
>   pango: make x11 support conditional on DISTRO_FEATURES
> 
> Xiaofeng Yan (1):
>   qt4e-demo-image: Fix bug 999

Merged to master, thanks.

Richard



