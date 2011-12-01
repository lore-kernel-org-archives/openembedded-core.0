Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RWBbx-0001A4-8e
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 19:43:57 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 01 Dec 2011 10:37:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="82179530"
Received: from unknown (HELO [10.7.199.149]) ([10.7.199.149])
	by orsmga002.jf.intel.com with ESMTP; 01 Dec 2011 10:37:14 -0800
Message-ID: <4ED7C95A.4060701@linux.intel.com>
Date: Thu, 01 Dec 2011 10:37:14 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1322594901.git.nitin.a.kamble@intel.com>
	<48bd68cce53c87c7f9296a0a0ad5286efef7d5cc.1322594901.git.nitin.a.kamble@intel.com>
	<1322598026.3077.11.camel@lenovo.internal.reciva.com>
	<9DA5872FEF993D41B7173F58FCF6BE94E3D9E7EE@orsmsx504.amr.corp.intel.com>
	<1322604347.3077.18.camel@lenovo.internal.reciva.com>
	<9DA5872FEF993D41B7173F58FCF6BE94E3D9E9B9@orsmsx504.amr.corp.intel.com>
	<1322758679.26081.242.camel@phil-desktop>
	<1322759839.17484.141.camel@ted>
	<1791C583-61A2-4087-8250-255FA25DAB22@dominion.thruhere.net>
In-Reply-To: <1791C583-61A2-4087-8250-255FA25DAB22@dominion.thruhere.net>
Subject: Re: [PATCH 1/4] gmp: also generate the libgmpcxx library & package it properly
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
X-List-Received-Date: Thu, 01 Dec 2011 18:43:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 01/12/11 09:26, Koen Kooi wrote:
> 
> Op 1 dec. 2011, om 18:17 heeft Richard Purdie het volgende geschreven:
> 
>> On Thu, 2011-12-01 at 16:57 +0000, Phil Blundell wrote:
>>> On Tue, 2011-11-29 at 14:51 -0800, Kamble, Nitin A wrote:
>>>> Thank you for the explanation. BTW where can I find official rules about signed-off-by line
>>>
>>> The "Signed-off-by" idiom originated with the kernel people and
>>> Documentation/SubmittingPatches in the linux source tree contains a
>>> fairly good description of what it means to them.
>>>
>>> I'm not sure that there are any official rules about its use in OE apart
>>> from what's in the Commit Patch Message Guidelines (see the wiki).
>>
>> The yocto docs do mention what the specific meaning of the line is.
> 
> <pedantic mode>But this is oe-core.</pedantic mode>. Shall we all agree it's the same for OE-core as well?

Isn't that the standard mode? ;-)

I expect folks have the same understanding as stated in the kernel and
Yocto docs when using SOB - I see no reason for OE Core to introduce
ambiguity.

Joshua
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre


