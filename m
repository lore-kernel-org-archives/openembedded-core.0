Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1T2JnH-0000pt-4K
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 12:28:43 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 Aug 2012 03:16:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,784,1336374000"; d="scan'208";a="209783321"
Received: from lpalcu-linux (HELO [10.237.105.41]) ([10.237.105.41])
	by fmsmga002.fm.intel.com with ESMTP; 17 Aug 2012 03:16:43 -0700
Message-ID: <502E1A0A.7050506@intel.com>
Date: Fri, 17 Aug 2012 13:16:42 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1345174354.git.laurentiu.palcu@intel.com>
	<92d6de11744098c3431309c5abc2f3217e166dac.1345174354.git.laurentiu.palcu@intel.com>
	<1345196331.14667.86.camel@ted>
In-Reply-To: <1345196331.14667.86.camel@ted>
Subject: Re: [PATCH 3/3] adt-installer: add support for relocatable SDK
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
X-List-Received-Date: Fri, 17 Aug 2012 10:28:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 08/17/2012 12:38 PM, Richard Purdie wrote:
> On Fri, 2012-08-17 at 06:44 +0300, Laurentiu Palcu wrote:
>> Since we made the SDK relocatable, we have to add this functionality to
>> adt-installer too.
>>
>> Other:
>>  - Changed tabs to spaces in the recipe file too.
> 
> Shell functions use tabs, python uses spaces. The OE TSC has thought
> long and hard about this and that is the decision. Its not perfect but
> the alternatives will cause more problems than any benefit is worth.
I saw so many warnings lately with "variable do_xxx contains tabs,
please remove these" I got carried by the wave! :| I'll resend the
patches and restore the tabs!

Thanks,
Laurentiu
> 
> Cheers,
> 
> Richard
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 


