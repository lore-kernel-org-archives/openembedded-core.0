Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Sgd8T-0006X2-Vo
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jun 2012 16:40:58 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Jun 2012 07:29:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="159022829"
Received: from unknown (HELO envy.home) ([10.255.12.119])
	by orsmga002.jf.intel.com with ESMTP; 18 Jun 2012 07:29:34 -0700
Message-ID: <4FDF3B00.7020809@linux.intel.com>
Date: Mon, 18 Jun 2012 07:28:16 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <cover.1339799869.git.dvhart@linux.intel.com>
	<5f472764f7cea2d386b7ee572870fc03769868fc.1339799869.git.dvhart@linux.intel.com>
	<4FDBBD8D.1050201@linux.intel.com>
	<1339863500.3339.150.camel@x121e.pbcl.net>
	<4FDCB690.8090004@linux.intel.com>
	<1340019305.14857.147.camel@phil-desktop>
In-Reply-To: <1340019305.14857.147.camel@phil-desktop>
X-Enigmail-Version: 1.4.2
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] busybox: Include setsid and cttyhack in defconfig
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
X-List-Received-Date: Mon, 18 Jun 2012 14:40:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 06/18/2012 04:35 AM, Phil Blundell wrote:
> On Sat, 2012-06-16 at 09:38 -0700, Darren Hart wrote:
>> With the above goal in mind, can you accept either of my proposed
>> patches as an interim solution? Either as an added tiny DISTRO_FEATURE
>> or as a simple addition to the defconfig? I do believe these two
>> features are useful beyond poky-tiny.
> 
> Well, obviously it isn't my place to accept or reject your patch; one of
> the oe-core maintainers would have to make that decision.  But,
> personally, given a choice between those two options I would prefer the
> latter.
> 
> However, I do still think that the best interim approach is just to
> provide a suitable, complete defconfig file in whatever layer contains
> poky-tiny.  This doesn't need to involve splitting poky-tiny into its
> own layer, doesn't require any extra tooling in oe-core in the short
> term, and doesn't necessarily even need to involve a .bbappend (although
> it would probably be easiest if it did).

I'm going to look into this approach today.


-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel




