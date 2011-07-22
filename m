Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QkDOy-00059v-E8 for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 12:56:32 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6MApgQP027592
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 11:51:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27374-02 for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 11:51:36 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6MApRaL027586
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 11:51:31 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1311318447.git.sgw@linux.intel.com>
References: <cover.1311318447.git.sgw@linux.intel.com>
Date: Fri, 22 Jul 2011 11:51:24 +0100
Message-ID: <1311331884.2344.128.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 00/16] July 22, 2011
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
X-List-Received-Date: Fri, 22 Jul 2011 10:56:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-22 at 00:25 -0700, Saul Wold wrote:
> Richard,
> 
> This contains more uclibc updates from Khem along with Bruce's
> 3.0 Updates.
> 
> There are a couple of small updates for .gitignore and other recipes.
> 
> Thanks
> 	Sau!
> 
> 
> The following changes since commit f175e4f28aa835abef8c3d5e2065054416692418:
> 
>   libiconv: Fix build failure on 1.13.1 (2011-07-21 22:50:06 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Bruce Ashfield (4):
>   linux-yocto: kernel-3.0 support recipe
>   kernel: copy defconfig to {B} vs {S}
>   linux-yocto: update LICENSE to GPLv2
>   kern-tools: update SRCREV
> 
> Khem Raj (6):
>   mesa-xlib, mesa-dri: Probe for newlocale() before using it.
>   task-core-tools.bb: Exclude lttng-ust for x86_64/uclibc
>   uclibc: Add patch header for sync_file_range2.patch
>   strace: Define own sigmask macro if not defined already in signal.h
>   util-linux: Replace sigsetmask with posix compliant functions
>   tclibc-uclibc: Fix TARGET_OS for powerpc
> 
> Kumar Gala (1):
>   .gitignore: Update build ignores to have wildcard
> 
> Mei Lei (1):
>   dhcp: Fix libdir issue for multilib
> 
> Nitin A Kamble (3):
>   glib-2.0: fix a compilation issue due to dtrace
>   python: fix security vulnerability
>   fix Upstream-Status line for few patches
> 
> Saul Wold (1):
>   default-versions: Update pulseaudio as arm no longer needs a seperate
>     backport

Merged to master, thanks.

Richard



