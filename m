Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RdQp3-0001S6-OU
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 19:23:26 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 21 Dec 2011 10:16:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="49478825"
Received: from unknown (HELO [10.255.15.188]) ([10.255.15.188])
	by AZSMGA002.ch.intel.com with ESMTP; 21 Dec 2011 10:16:19 -0800
Message-ID: <4EF22273.3000007@linux.intel.com>
Date: Wed, 21 Dec 2011 10:16:19 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1324441819.git.shane.wang@intel.com>
	<4EF17275.6080202@linux.intel.com>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12ED757FB6@shsmsx501.ccr.corp.intel.com>
In-Reply-To: <D5AB6E638E5A3E4B8F4406B113A5A19A12ED757FB6@shsmsx501.ccr.corp.intel.com>
Subject: Re: [PATCH 0/1] [RESEND]Create a script for SUMMARY audit in recipes
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
X-List-Received-Date: Wed, 21 Dec 2011 18:23:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 20/12/11 22:10, Wang, Shane wrote:
> Saul Wold wrote on 2011-12-21:
> 
>> On 12/20/2011 08:32 PM, Shane Wang wrote:
>>> Here is the script to check which recipe provides SUMMARY and which
>>> doesnot. For those which do not, maintainer should add or update to a
>>> meaningful summary for HOB to display in description.
>>>
>> Shane,
>>
>> I guess I am not understanding why this is needed.  Why can't we use
>> DESCRIPTION which is a required entry?  Use the first X Characters of
>> DESCRIPTION?

There's a huge difference between a purposefully crafted 72 character
summary and a free-for all description field that will have to be
chopped to be displayed in the GUI. I originally chose summary as a
succinct 72 characters would fit much better in the available UI.

Aside: according to the Yocto docs the SUMMARY field should fall back to
DESCRIPTION anyway. It's just that right now we do that at the package
back-end level for each package back-end.


> OK, then HOB has a bug. To use DESCRIPTION instead of SUMMARY. I am OK with that.
> Josh, Dongxiao, did you see any problem if I change that?

I think it's the wrong solution.

Joshua
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre


