Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TBnkv-0006LS-8B for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 16:17:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8CE4tdN020299;
	Wed, 12 Sep 2012 15:04:55 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19954-05; Wed, 12 Sep 2012 15:04:50 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8CE4k6T020293
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 12 Sep 2012 15:04:47 +0100
Message-ID: <1347458689.11710.18.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Wed, 12 Sep 2012 15:04:49 +0100
In-Reply-To: <cover.1347434214.git.sgw@linux.intel.com>
References: <cover.1347434214.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED REQUEST v2 00/35] Misc Fixes (CV Only)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Sep 2012 14:17:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-09-12 at 00:23 -0700, Saul Wold wrote:
> This contains various fixes from teh community along with a few 
> updates.  The Kernel update seems to have trigged a mpc8315 failure, but 
> I am sure Bruce will deal with it quickly.
> 
> This also include Bruce and my change that now allows us to elimate the 
> x32 layer and by setting the DEFAULTTUNE enable x32 build for any BSP.
> 
> Phil B. has confirmed his change with BUILD_HISTORY.
> 
> This is a good change set and should be merged.
> 
> There are a couple of meta-yocto changes that I need to pull
> together also, but they are minor.

I pulled most of this in. I took an alternative patch for x32 as
discussed in other emails. I also dug back and took the older quota
patch, not yours since the other DEPENDS one is correct, its an unusual
corner case.

Cheers,

Richard



