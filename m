Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SZmP7-0008Q8-Eq for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 19:09:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4UGxRdH023616;
	Wed, 30 May 2012 17:59:27 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23236-06; Wed, 30 May 2012 17:59:23 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4UGxI0Q023610
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 30 May 2012 17:59:19 +0100
Message-ID: <1338397157.20169.165.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 30 May 2012 17:59:17 +0100
In-Reply-To: <4FBE9783.1080107@linux.intel.com>
References: <4FBE9783.1080107@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: [2011-1 PULL REQUEST] Fixes for the 2011-1 branch
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
X-List-Received-Date: Wed, 30 May 2012 17:09:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-05-24 at 13:18 -0700, Joshua Lock wrote:
> Hi all,
> 
> I've been working on closing bugs filed against Poky Edison/OE-Core 
> 2011-1 and would like to request a merge of the changes I have.
> 
> Rather than clutter the list with patches for such an old branch I'm 
> just including links to the git repository and a summary of changes here.
> 
> Hope that's OK.
> 
> http://git.openembedded.org/openembedded-core-contrib/log/?h=josh/edison
> 
> Changes include:
> * Back-ported several useradd and sstate patches to fix dependency 
> ordering, etc. when building images from shared state
> * A patch for syslinux to fix building on hosts with newer 3.x kernels
> * Zlib patch to ensure the pc file is shipped in the -dev package
> * Various license fixes
> * Fix for ipk SDK builds

Merged to the 2011-1 branch, thanks.

Richard



