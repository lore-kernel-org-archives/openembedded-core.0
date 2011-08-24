Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qw1Da-0007BW-4f
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 02:21:18 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Aug 2011 17:16:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="41531005"
Received: from unknown (HELO [10.255.14.203]) ([10.255.14.203])
	by orsmga001.jf.intel.com with ESMTP; 23 Aug 2011 17:16:30 -0700
Message-ID: <4E5442DE.7060103@linux.intel.com>
Date: Tue, 23 Aug 2011 17:16:30 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1314096402.git.xiaofeng.yan@windriver.com>
	<201108231318.10118.paul.eggleton@linux.intel.com>
	<63FF64B9-6C5E-4C87-9DFD-7AD9A88A5DD1@dominion.thruhere.net>
	<201108231353.13437.paul.eggleton@linux.intel.com>
	<6BCD0FB4-907F-4055-A405-F236F6D3D4AA@dominion.thruhere.net>
In-Reply-To: <6BCD0FB4-907F-4055-A405-F236F6D3D4AA@dominion.thruhere.net>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 1/1] qt4e-demo-image: Fix bug 999
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
X-List-Received-Date: Wed, 24 Aug 2011 00:21:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/23/2011 08:10 AM, Koen Kooi wrote:
>
> Op 23 aug. 2011, om 14:53 heeft Paul Eggleton het volgende geschreven:
>
>> On Tuesday 23 August 2011 13:27:11 you wrote:
>>> I would lean toward a seperate meta-qt layer, not sure if it should be
>>> hosted in the oe-core git repo, meta-oe or a completely seperate git repo.
>>
>> Possibly we should have meta-qt for Qt applications and additional libraries
>> such as Qwt (and I'm all for moving our current Qt apps there, they don't
>> really belong in OE-core IMHO). If you're suggesting moving out Qt itself
>> though, I think Qt belongs in OE-core, certainly as much as GTK+ does.
>
> I still say that gtk+ should be in it's own layer as well :) I hope to have some time in september to come up with a proposal to rearrange oe-core and meta-oe in a more logical set of layers.

Yea, we should discuss this further (post 1.1) for me, while I think 
it's important to have some demos/test with the oe-core (if we keep it 
in oe-core), I am not sure we should have all the tests there.

I would suggest possibly renaming the current meta-qt3 to meta-qt and 
including this set of demos there.

Comments?

Sau!


We already have a QT3 layer, maybe it makes sense to make that a generic 
meta-qt layer and have things reside in it.

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


