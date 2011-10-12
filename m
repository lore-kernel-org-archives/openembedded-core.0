Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RE4Tv-000291-Gj
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 21:28:47 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 12 Oct 2011 12:23:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,336,1315206000"; d="scan'208";a="25660670"
Received: from unknown (HELO [10.255.15.63]) ([10.255.15.63])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Oct 2011 12:23:01 -0700
Message-ID: <4E95E914.6060009@linux.intel.com>
Date: Wed, 12 Oct 2011 12:23:00 -0700
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110930 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1318371066.git.josh@linux.intel.com>
	<1318423059.23801.151.camel@ted> <4E95D1C1.2020000@linux.intel.com>
	<1318447114.23801.178.camel@ted>
In-Reply-To: <1318447114.23801.178.camel@ted>
Subject: Re: [RFC PATCH 0/1] QA check for defined packages
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
X-List-Received-Date: Wed, 12 Oct 2011 19:28:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 10/12/2011 12:18 PM, Richard Purdie wrote:
>>> Obviously, you can skip to b) if you already have a package feed.
>>
>> a), right? Indeed I expect that this will be more in line with certain
>> proposed use cases.
> 
> No, you'd skip the package feed generation and just end up using it so
> skip a) and start from b).

My bad, I read that as skip b), not skip to b). Apologies.

>>> So we'd be talking about two UI's that could effectively hand off to
>>> each other and share a "build in progress" feedback to the user system.
>>> The image construction dialog would have a "Missing Packages? Build them
>>> here" type switch. This would mean the build system can continue on at
>>> what it does best yet the UI can let the users do what they want to do,
>>> particularly on a prebuilt package feed.
>>
>> I like it. I think we had to "write one to throw away" to realise quite
>> how much data we're missing up front but I support the proposed design.
> 
> I'd not say thrown away. We've moved a lot of the code forward and
> significant pieces would get reused...

Quite right, I meant the spirit of the quote. I've tried where possible
to create re-usable components for hob. The crumbs module of the bb ui
is chock full these days and there were various changes to core BitBake
that will hopefully be useful outside of hob.

Cheers,
Joshua
--
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre


