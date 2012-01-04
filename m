Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RiTnj-0004LY-4D
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 17:34:55 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Jan 2012 08:27:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="92893309"
Received: from vtippara-mobl.amr.corp.intel.com (HELO envy.home)
	([10.19.147.145])
	by orsmga001.jf.intel.com with ESMTP; 04 Jan 2012 08:27:32 -0800
Message-ID: <4F047DE3.1080102@linux.intel.com>
Date: Wed, 04 Jan 2012 08:27:15 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1325115066.git.dvhart@linux.intel.com>
	<4F039FA4.6000709@linux.intel.com>
In-Reply-To: <4F039FA4.6000709@linux.intel.com>
X-Enigmail-Version: 1.3.3
Cc: koen@dominion.thruhere.net, martin.jansa@gmail.com
Subject: Re: [PATCH 0/4] Fixes for tiny distros and linux-yocto-tiny
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
X-List-Received-Date: Wed, 04 Jan 2012 16:34:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 01/03/2012 04:39 PM, Saul Wold wrote:
> On 12/28/2011 03:38 PM, Darren Hart wrote:

>> Darren Hart (3):
>>    eglibc: Only add eglibc-utils to PACKAGES if wchar is supported
> This patch was not taken at this time due to the comment on the Mailing List

Saul,

Koen raised some concerns and suggested modifying xtrace and tzselect to
not depend on bash. I responded and suggested we keep that as a future
enhancement as it also pulls in some additional repackaging work.

Koen, any further thoughts from you?

Saul, what are you looking for as a resolution?

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


