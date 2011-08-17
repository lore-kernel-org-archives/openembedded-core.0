Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QthT4-0000MV-6Z for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 16:51:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7HEl4xw007960;
	Wed, 17 Aug 2011 15:47:04 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07811-02; Wed, 17 Aug 2011 15:47:00 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7HEkiU6007932
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 17 Aug 2011 15:46:49 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <42c1991f83d5faf339628d449c54cb492ffb6344.1313554368.git.dvhart@linux.intel.com>
References: <cover.1313554368.git.dvhart@linux.intel.com>
	<42c1991f83d5faf339628d449c54cb492ffb6344.1313554368.git.dvhart@linux.intel.com>
Date: Wed, 17 Aug 2011 15:46:36 +0100
Message-ID: <1313592396.13995.46.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: Re: [PATCH 1/1] kernel: restore crtsavres.o to enable building external modules on powerpc
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
X-List-Received-Date: Wed, 17 Aug 2011 14:51:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-08-16 at 21:16 -0700, Darren Hart wrote:
> Fixes [YOCTO #1276]
> 
> As of Linux kernel version 3.0.1, and much earlier, the make clean target
> removes arch/powerpc/lib/crtsavres.o. As this object is present in
> KBUILD_LDFLAGS_MODULE, it is required to build external modules, and should
> therefor not be removed by make clean.
> 
> While I do not advocate fixing buggy kernels in the generic kernel classes,
> we should probably account for this one in kernel.bbclass as it affects
> such a long list of kernel versions.
> 
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> CC: Bruce Ashfield <bruce.ashfield@windriver.com>
> CC: Tom Zanussi <tom.zanussi@intel.com>

Merged to master, thanks.

Richard



