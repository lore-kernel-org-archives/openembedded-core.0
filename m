Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QFfO4-0006YK-0R
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Apr 2011 06:33:04 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 Apr 2011 21:30:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,284,1301900400"; d="scan'208";a="740021592"
Received: from unknown (HELO [10.255.13.24]) ([10.255.13.24])
	by orsmga001.jf.intel.com with ESMTP; 28 Apr 2011 21:30:29 -0700
Message-ID: <4DBA3EE3.6020006@linux.intel.com>
Date: Thu, 28 Apr 2011 21:30:27 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1303889119.git.sgw@linux.intel.com>	<a34718a02b76e37c59ff67d9e182bd7b64c9f125.1303889119.git.sgw@linux.intel.com>
	<1303981552.21461.43.camel@rex>
In-Reply-To: <1303981552.21461.43.camel@rex>
Cc: Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: Re: [PATCH 34/52] logging: add bb* logging mechanisms for bash recipe functions
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
X-List-Received-Date: Fri, 29 Apr 2011 04:33:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 04/28/2011 02:05 AM, Richard Purdie wrote:
> Hi Darren,
> 
> On Wed, 2011-04-27 at 00:29 -0700, Saul Wold wrote:
>> The following logging mechanisms are to be used in bash functions of recipes.
>> They are intended to map one to one in intention and output format with the
>> python recipe logging functions of a similar naming convention: bb.plain(),
>> bb.note(), etc.
>>
>> For the time being, all of these print only to the task logs. Future
>> enhancements may integrate these calls with the bitbake logging infrastructure,
>> allowing for printing to the console as appropriate. The interface and intention
>> statements reflect that future goal. Once it is in place, no changes will be
>> necessary to recipes using these logging mechanisms.
> 
> This looks good but could you do a search and replace of any existing
> users of the oe* functions and then remove them from base.bbclass
> please? At the very least they should be calling the bb* equivalents.
> I'd like to clean up this kind of thing as we go.

Sure thing. Is a follow-up patch acceptable or do you want me to
resubmit these in one series?

--
Darren

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

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


