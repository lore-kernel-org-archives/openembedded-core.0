Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (down.free-electrons.com
	[37.187.137.238])
	by mail.openembedded.org (Postfix) with ESMTP id 9298577251
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 18:43:41 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 110)
	id BA5F1291; Thu, 12 Nov 2015 19:43:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
	shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (unknown [88.191.26.124])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 80D7821C;
	Thu, 12 Nov 2015 19:43:40 +0100 (CET)
Date: Thu, 12 Nov 2015 19:43:40 +0100
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20151112184340.GE4230@piout.net>
References: <1447351617-7516-1-git-send-email-alexandre.belloni@free-electrons.com>
	<5644D9F1.2030705@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5644D9F1.2030705@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] tune-cortexa5.inc: Allow tuning for vfpv3d16, vfpv3 and neon-vfpv4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Nov 2015 18:43:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 12/11/2015 at 12:26:57 -0600, Mark Hatle wrote :
> Seems odd to me that the package arch are the same between the generic (assumed
> to be the default ARMv7a, which is USUALLY VFPv4-D32 in most cases.)
> 
> If we want to limit to v3 and/or D16.  It might make sense for a different
> package arch, otherwise there is no way to separate the feeds in a
> multiple-machine configuration with different per-target optimizations.
> 
> (similarly the -neon versions as well, but that is existing code)
> 

Yeah, I'm also not sure this is the correct thing but all the package
arch for tune-armv7a* are armv7a so I've replicated that.

Also, I just realized there are no users for armv7a*-vfpv3* in oe-core,
maybe I should leave those tunes in my soc specific BSP layer?

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

