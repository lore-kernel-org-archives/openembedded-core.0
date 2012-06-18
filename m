Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SgbOi-0002Xk-V8 for openembedded-core@lists.openembedded.org;
	Mon, 18 Jun 2012 14:49:37 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5ICcsf5005101
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2012 13:38:54 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04750-02 for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2012 13:38:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5ICcgaK005094
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2012 13:38:44 +0100
Message-ID: <1340023123.8481.20.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 18 Jun 2012 13:38:43 +0100
In-Reply-To: <cover.1339911478.git.sgw@linux.intel.com>
References: <cover.1339911478.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [Consolidated Pull 00/23] uClibc/RPM Updates & Other fixes
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
X-List-Received-Date: Mon, 18 Jun 2012 12:49:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-06-16 at 22:39 -0700, Saul Wold wrote:
> Richard,
> 
> Been tested on the ab over the weekend, reviewed.
> 
> Autobuild turned up a latent dependency issue with mdadm!
> 
> Sau!
> 
> The following changes since commit 63d1ae1c2828cda03828b4c3fdde037d7a23f1e4:
> 
>   directfb: added missing Upstream-status (2012-06-15 15:41:11 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Bruce Ashfield (1):
>   meta-skeleton: add linux-yocto-custom reference recipe
> 
> Kang Kai (4):
>   cleanup-workdir: update the way to check obsolete dirs
>   cleanup-workdir: replace commands with subprocess
>   cleanup-workdir: only deal dirs related to current arch
>   cleanup-workdir: update help text
> 
> Khem Raj (9):
>   uclibc_0.9.33.bb: Upgrade to latest git
>   site/x86_64-linux-uclibc: Cache definitions of guint32/guint64
>   rpm: Fix compilation on uclibc
>   rpm: Use link time check for libssp
>   sat-solver: Fix build on uclibc
>   libzypp: Fix build with uclibc
>   rpm: pass lrt and lpthread to link step explicitly for uclibc
>   zypper: Fix build on uclibc
>   libzypp: Define OECMAKE_CXX_LINK_FLAGS when compiling for uclibc
> 
> Laurentiu Palcu (2):
>   core-image-gtk-directfb, qt4e-demo-image: Remove module-init-tools
>     from IMAGE_INSTALL list
>   puzzles: upgrade to r9561
> 
> Mark Hatle (1):
>   busybox: Fix syslog configuration file
> 
> Robert Yang (1):
>   gcc-cross: argument list too long when do_install
> 
> Saul Wold (3):
>   directfb: fix Upstream-status -> Upstream-Status
>   curl: Use gnutls for target and openssl for native
>   mdadm: add binutils to DEPENDS
> 
> Xiaofeng Yan (2):
>   multilib.conf: Add the support of multilib for lsbinitscripts
>   lsbinitscripts: Add the header for functions.patch

Merged to master, thanks.

(Including updated version of the mdadm patch)

Richard



