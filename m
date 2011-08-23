Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Qvyw1-0003OZ-LG
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 23:55:01 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 23 Aug 2011 14:50:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="41141852"
Received: from unknown (HELO helios.localnet) ([10.255.18.108])
	by orsmga002.jf.intel.com with ESMTP; 23 Aug 2011 14:50:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Klausfpga <klausfpga@gmail.com>
Date: Tue, 23 Aug 2011 22:50:13 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <4E537A0E.2040605@gmail.com>
	<201108231725.13418.paul.eggleton@linux.intel.com>
	<4E5419B7.502@gmail.com>
In-Reply-To: <4E5419B7.502@gmail.com>
MIME-Version: 1.0
Message-Id: <201108232250.13389.paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Wiki seems dead. is openembedded wiki still active?
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
X-List-Received-Date: Tue, 23 Aug 2011 21:55:01 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 23 August 2011 22:20:55 Klausfpga wrote:
> What I wanted to know was what to checkout best:
>  origin/master/  might not be a good idea, at least last time I tried
> this I often fell into inconsistent  releases

If you mean the "openembedded" repository, there is the 2011.03-maintenance 
branch; however this is not the basis for future development. With the Yocto 
Project release coming up soon, OE-core should be fairly stable (or at least 
heading that way).

> Well with minimalist I meant kernel + base file system + busybox +
> package management

Busybox is used by default and the rest is of course mandatory. I'm not 
entirely sure we have an image in OE-core that is just console with package 
management though; we really ought to sort that out if that's the case. Even 
so this is trivial to add, you just need "package-management" in the 
IMAGE_FEATURES for your image.

> What I meant here is: Can pypy or somethign else be used in order to
> accelerate the execution of BitBake.

Not sure; I'm under the impression that Psyco made only a very small difference 
however. Most of the time taken running BitBake is in the tasks it runs (and 
the order it runs them); no generic Python tool is going to be able to improve 
that.

Cheers,
Paul

[1] http://www.yoctoproject.org

-- 

Paul Eggleton
Intel Open Source Technology Centre


