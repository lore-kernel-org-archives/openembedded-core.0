Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QqPFN-0005f0-FD for openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2011 14:47:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p78ChToW002686
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Aug 2011 13:43:29 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02217-03 for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2011 13:43:25 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p78ChL8c002680
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Aug 2011 13:43:23 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1312692935.git.sgw@linux.intel.com>
References: <cover.1312692935.git.sgw@linux.intel.com>
Date: Mon, 08 Aug 2011 13:42:51 +0100
Message-ID: <1312807371.14274.174.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [Updated CONSOLIDATED PULL 00/15] Fixes for M3 and getting master to build
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
X-List-Received-Date: Mon, 08 Aug 2011 12:47:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-08-06 at 22:01 -0700, Saul Wold wrote:
> Richard,
> 
> This has Bruce's updated Kernel, which has taken a spin on the fuzzy builder,
> along with a fix for M3 BSP failures and a couple of other bug and build fixes.
> I also remembered to include the SRC_URI checksums this time for the recipe 
> updates.
> 
> Thanks
> 	Sau!
> 
> 
> The following changes since commit 7a278238d9b08e0315e92d386282cb488cc0c7b4:
> 
>   bitbake.conf/powerpc64: Set baselib to 'lib64' for ppc64 (2011-08-05 17:48:23 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Bruce Ashfield (4):
>   linux-yocto: pass KMACHINE to updateme, not MACHINE
>   linux-yocto: allow configuration of arbitrary branches
>   linux-yocto: update atom-pc preempt-rt definition
>   linux-yocto: merge v3.0.1
> 
> Koen Kooi (3):
>   gst-plugins: partially sync packaging with OE .dev
>   gtk-icon-cache bbclass: don't assing to global RDEPENDS
>   gtk-icon-cache: fix RDEPENDS append bug

I squashed these two into one

> Kumar Gala (1):
>   gcc: use ${base_lib} to match gcc default configuration
> 
> Mei Lei (2):
>   python-native: Fix a compiler finding issue
>   apr-util: disable pqsql support to avoid configure error
> 
> Saul Wold (5):
>   gdb: Update to 7.3
>   liburcu: Update to 0.6.4
>   lttng-ust: Update to 0.15
>   lttng-control: Update to 0.89

, fixed the piece in lttng-control that belonged in lttng-ust

>   kernel-yocto: add CCACHE_DIR dependency to do_kernel_configme

and merged them all to master, thanks.

Richard



