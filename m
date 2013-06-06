Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id B5E826A8B6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 16:09:31 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 06 Jun 2013 09:09:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,816,1363158000"; d="scan'208";a="251540407"
Received: from unknown (HELO helios.localnet) ([10.252.121.213])
	by AZSMGA002.ch.intel.com with ESMTP; 06 Jun 2013 09:08:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Thu, 06 Jun 2013 17:08:29 +0100
Message-ID: <4045582.lhqZLrdHub@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-23-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <CAP9ODKr9zNQENpsL_ASoKRWEfTauWhRx07Ps46=5u3D5=XXxng@mail.gmail.com>
References: <CAP9ODKr9zNQENpsL_ASoKRWEfTauWhRx07Ps46=5u3D5=XXxng@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Linux kernel build dependency of 'bc'
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
X-List-Received-Date: Thu, 06 Jun 2013 16:09:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Otavio,

On Thursday 06 June 2013 12:11:04 Otavio Salvador wrote:
> I got a build failure in my auto builder; it has a very lean system install
> and it spot something it is new for me. It seems the kernel now depends on
> 'bc' util.
> 
> I tried to find a 'bc-native'  and couldn't find so I'd like to know if it
> is a known issue and if someone is already working in a 'bc-native' recipe
> to proper fix the issue.

We used to have bc in our list of required host packages in the Yocto Project 
quick start guide, but after some testing a few versions ago I removed it 
because it didn't seem to be needed. FWIW I don't have it installed on my 
primary build machine and I haven't noticed any problems as a result.

Rather than creating bc-native I think we should find out where the dependency 
on bc exists and try to patch it out (if practical); if it really is needed 
and too hard to remove, we can just add bc to the list of required host 
packages. I hope that's not the case though.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

