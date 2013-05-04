Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UYXqM-0008WU-BX
	for openembedded-core@lists.openembedded.org;
	Sat, 04 May 2013 10:29:39 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 May 2013 01:09:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,610,1363158000"; d="scan'208";a="331469115"
Received: from unknown (HELO helios.localnet) ([10.255.12.27])
	by orsmga002.jf.intel.com with ESMTP; 04 May 2013 01:11:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Darren Hart <dvhart@linux.intel.com>
Date: Sat, 04 May 2013 09:11:22 +0100
Message-ID: <3611267.eqIsdCBgi9@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-19-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <5184753F.9010904@linux.intel.com>
References: <1367622401-28624-1-git-send-email-sgw@linux.intel.com>
	<5184753F.9010904@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org,
	Scott Rifenbark <scott.m.rifenbark@intel.com>
Subject: Re: [PATCH] dmidecode: fix fetch path to use BP
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
X-List-Received-Date: Sat, 04 May 2013 08:29:43 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 03 May 2013 19:41:03 Darren Hart wrote:
> On 05/03/2013 04:06 PM, Saul Wold wrote:
> > This is so the multilib prefix is not used
> 
> Thanks for catching that Saul. How do we know when to use P and when to
> use BP? 

The easiest thing is to imagine what would happen were the recipe to be 
BBCLASSEXTENDed to native - would xyz-native make sense where you've used the 
reference, or does it always need to be xyz regardless of how it is being 
built? If the former, PN (or P with the version); if the latter, BPN (or BP 
with the version).

> Where should this be documented? Maybe in the dev manual for
> writing new recipes?

It was pointed out recently on IRC that we may need to expand and adjust the 
section in the dev manual so it provides more of a step-by-step guide to 
creating a recipe, and I plan to work with Scott to do that for this cycle, so 
we should be able to include this as part of that.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


