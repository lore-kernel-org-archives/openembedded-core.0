Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>)
	id 1RuuCS-0006Mg-Um; Wed, 08 Feb 2012 00:11:49 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Feb 2012 15:03:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="105083441"
Received: from unknown (HELO [10.255.14.116]) ([10.255.14.116])
	by orsmga001.jf.intel.com with ESMTP; 07 Feb 2012 15:03:44 -0800
Message-ID: <4F31ADD0.9050206@linux.intel.com>
Date: Tue, 07 Feb 2012 15:03:44 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Paul Eggleton <paul.eggleton@linux.intel.com>
References: <29270F77-234D-4561-974D-C8E266898FA3@beagleboard.org>
	<20120207224904.GC13125@sakrah.homelinux.org>
In-Reply-To: <20120207224904.GC13125@sakrah.homelinux.org>
Subject: Re: [meta-openembedded][RFC] meta-multimedia layer
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
X-List-Received-Date: Tue, 07 Feb 2012 23:11:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/07/2012 02:49 PM, Khem Raj wrote:
> On (07/02/12 12:08), Koen Kooi wrote:
>> Hi,
>>
>> During FOSDEM Paul Eggleton and I discussed moving a few multimedia recipes (libav, xbmc, faac, faad, etc) out of meta-oe into a new meta-multimedia layer hosted in the meta-openembedded git repo. This would allow e.g. meta-baryon to drop a number of recipes while avoiding the need to drag in the complete meta-oe layer.
>>
>> Thoughts?
>
> yes idea is fine. Will it then host all multimedia related stuff ? or
> just whats in meta-oe is being moved.
>
This is a good idea, we should get a good proposal so it's clear what's 
moving where and how.  Currently this should start with meta-oe and we 
can then evaluate if anything in oe-core should move there.

This is similar to the starting point we have with gnome, but we needed 
to keep some of that in core.

Thanks for the effort.

Sau!


> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


