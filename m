Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7091C7319C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 17:27:02 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 15 Dec 2015 09:27:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,433,1444719600"; d="scan'208";a="708127065"
Received: from mhchui-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.146.121])
	by orsmga003.jf.intel.com with ESMTP; 15 Dec 2015 09:27:00 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Wed, 16 Dec 2015 06:26:58 +1300
Message-ID: <2403291.KqQCZxqk2K@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.2.6-301.fc23.x86_64; KDE/4.14.14; x86_64; ;
	)
In-Reply-To: <567031BB.7040903@linux.intel.com>
References: <1450191753-13537-1-git-send-email-alexander.kanavin@linux.intel.com>
	<20151215152541.GA2556@jama> <567031BB.7040903@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH] valgrind: update to 3.11.0
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
X-List-Received-Date: Tue, 15 Dec 2015 17:27:03 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tue, 15 Dec 2015 17:28:59 Alexander Kanavin wrote:
> On 12/15/2015 05:25 PM, Martin Jansa wrote:
> >> +COMPATIBLE_HOST = '(i.86|x86_64|mips|powerpc|powerpc64).*-linux'
> >> +COMPATIBLE_HOST_armv7a = 'arm.*-linux'
> > 
> > Can you add armv7ve as well?
> 
> Armv7ve support is not yet in master, so you'll have to add it later I'm
> afraid.

I think by policy we don't have any restrictions on architecture-specific flags 
in OE-Core (at least, assuming they're reasonable).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

