Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rj8ve-0003q5-3p for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 13:29:50 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q06CMRL0020171
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jan 2012 12:22:27 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20000-02 for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2012 12:22:23 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q06CMKwV020165
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jan 2012 12:22:21 GMT
Message-ID: <1325852541.20759.94.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 06 Jan 2012 12:22:21 +0000
In-Reply-To: <cover.1325836241.git.sgw@linux.intel.com>
References: <cover.1325836241.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 00/25] Various Patches
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
X-List-Received-Date: Fri, 06 Jan 2012 12:29:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-01-05 at 23:56 -0800, Saul Wold wrote:
> The following changes since commit 4a85312568a6bb052cc511c15b4ae842ff7f8e59:
> 
>   image-mklibs/package_ipk: Remove bashisms (2012-01-05 22:26:20 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Andrea Adami (2):
>   xorg-driver: add xf86-video-fbdev from meta-openembedded
>   x11-common: remove extraneous BSP customizations
> 
> Bruce Ashfield (3):
>   kern-tools: import flexible branching support
>   linux-yocto: bump kernel version to v3.0.14
>   linux-yocto: use src_patches for out of tree kernel feature support
> 
> Nitin A Kamble (6):
>   python-pycairo: fix for x32
>   libevent: fix compilation for x32
>   vte: update patch header
>   automake-1.11.2: backport pkglibexec_SCRIPTS fix
>   mc: remove not needed fix for automake 1.11.2
>   systemtap: remove not needed fix for automake 1.11.2
> 
> Otavio Salvador (8):
>   qt4-graphics-system: add
>   qt4e.bbclass: add QT_BASE_NAME for use in recipes
>   qt4x11.bbclass: add QT_BASE_NAME for use in recipes
>   qt4-embedded.inc: use QT_BASE_NAME from qt4e.bbclass
>   qt4-x11-free.inc: use QT_BASE_NAME from qt4x11.bbclass
>   initscripts: avoid mounting /sys if it is already mounted
>   udev: ensure /dev/pts and /dev/shm does exists
> 
> Paul Eggleton (4):
>   buildhistory: add script to check for significant changes
>   classes/buildhistory: add hostname to commit message
>   classes/buildhistory: make the package version backwards error
>     non-fatal
>   classes/buildhistory: remove redundant package history checking stub
> 
> Saul Wold (2):
>   util-linux: Update patch for non-GPLv3
>   gnutls: remove gettext patch for non-GPLv3

I took all the above

>  udev: improve udev-cache robustness

but I didn't take this. We need a better solution.

Cheers,

Richard



