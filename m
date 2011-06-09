Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QUhB5-0002U1-Lg
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 17:29:48 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 09 Jun 2011 08:26:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,341,1304319600"; d="scan'208";a="11368070"
Received: from unknown (HELO [10.7.199.151]) ([10.7.199.151])
	by orsmga002.jf.intel.com with ESMTP; 09 Jun 2011 08:26:27 -0700
Message-ID: <4DF0E623.9080603@intel.com>
Date: Thu, 09 Jun 2011 08:26:27 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <15E9EFF9-235F-45CF-A2AC-BFE047710335@dominion.thruhere.net>
In-Reply-To: <15E9EFF9-235F-45CF-A2AC-BFE047710335@dominion.thruhere.net>
Subject: Re: bitbake -s broken?
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
X-List-Received-Date: Thu, 09 Jun 2011 15:29:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/08/2011 03:20 AM, Koen Kooi wrote:
> Hi,
>
> Apart from -b being broken as I reported earlier -s seems to be broken as well now:
>
> koen@dominion:/OE/tentacle/sources/meta-openembedded/meta-oe/recipes-gnome$ MACHINE=beagleboard bitbake -s  | head -n10
> Loading cache...done.
> Loaded 1622 entries from dependency cache.
> WARNING: No bb files matched BBFILE_PATTERN_htc-layer '^/OE/tentacle/sources/meta-smartphone/meta-htc/'
> Package Name                                   Latest Version         Preferred Version
> ============                                   ==============         =================
>
> <bb.cache.CoreRecipeInfo object at 0x3c96750>                    :171-r3
> <bb.cache.CoreRecipeInfo object at 0x3c96710>                  :2.8.0-r1
> <bb.cache.CoreRecipeInfo object at 0x3c96750>              :1.0.0c-r13.0
> <bb.cache.CoreRecipeInfo object at 0x3c96710>                 1:1.0.4-r2

I bisected this error this morning to this commit:

cache.py: Refactory Current Cache implementation
http://git.pokylinux.org/cgit/cgit.cgi/poky/commit/?id=8df355140c5afb683cb97fed82f679366e60320b

This bug is preventing me from doing another documentation build audit 
with the latest master.

I have filed bug #1149 to track this issue.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


