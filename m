Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SVOHh-00019l-7x for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 16:36:01 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4IEPvFx017474
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2012 15:25:57 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02906-09 for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2012 15:25:53 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4IEPmKp017468
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2012 15:25:50 +0100
Message-ID: <1337351147.28145.7.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 18 May 2012 15:25:47 +0100
In-Reply-To: <cover.1337350637.git.sgw@linux.intel.com>
References: <cover.1337350637.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 0/9] Kernel & Multi-lib updates
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
X-List-Received-Date: Fri, 18 May 2012 14:36:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-05-18 at 17:18 +0300, Saul Wold wrote:
> Richard:
> 
> Here are some fixes including the PPC xserver issue
> 
> Sau!
> 
> 
> The following changes since commit 7163ebd92a799b8f000b2b6f303b20de468b5f90:
> 
>   Revert "kmod: Use base_libdir for installing libkmod" (2012-05-17 21:12:33 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Bruce Ashfield (3):
>   linux-yocto: intel BSP config changes
>   kern-tools: update LICENSE field to GPLv2
>   linux-yocto: policy cleanups
> 
> Gary Thomas (1):
>   xserver-kdrive: Fix X server on PowerPC when built with GCC 4.7.x
> 
> Jiajun Xu (1):
>   test-reexec: Add script to address issues when task re-execution
> 
> Lianhao Lu (3):
>   (libc-)package.bbclass: Added MLPREFIX to locale packages.
>   multilib.conf: Added multilib support for kmod.
>   multilib.bbclass: Added multilib specific package QA.
> 
> Mark Hatle (1):
>   sstate.bbclass: Make sure we don't have an empty fixmepath file

Merged to master, thanks.

Richard



