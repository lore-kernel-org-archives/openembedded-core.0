Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RpqOh-0000sf-Tz
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 01:07:32 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 Jan 2012 15:59:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="110427870"
Received: from unknown (HELO [10.255.14.96]) ([10.255.14.96])
	by fmsmga001.fm.intel.com with ESMTP; 24 Jan 2012 15:59:45 -0800
Message-ID: <4F1F45F0.208@linux.intel.com>
Date: Tue, 24 Jan 2012 15:59:44 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1327447344.git.josh@linux.intel.com>
	<f7bd8523525f541676e8b2e416a4960b45cd7d7e.1327447344.git.josh@linux.intel.com>
	<CAMKF1sq=xpgO=4Ne0YQdkhqXhh_+VcpA2Xyx_Cm3xccUcv3d2A@mail.gmail.com>
In-Reply-To: <CAMKF1sq=xpgO=4Ne0YQdkhqXhh_+VcpA2Xyx_Cm3xccUcv3d2A@mail.gmail.com>
Subject: Re: [PATCH 2/4] linux-tools: don't build perf when GPLv3 in INCOMPATIBLE_LICENSE
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
X-List-Received-Date: Wed, 25 Jan 2012 00:07:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/24/2012 03:42 PM, Khem Raj wrote:
> On Tue, Jan 24, 2012 at 3:26 PM, Joshua Lock<josh@linux.intel.com>  wrote:
>> Long term we should look at moving perf to a separate recipe but as a
>> short term solution this patch will ensure that when GPLv3 is in
>
> would I be asking too much to do that instead of this patch :)
> I think it will be good thing in general since other layers
> now have to define these tasks if they inherit from oe-core kernel class.
>
Khem,

The issue is timing and resources to do this work, it a larger task that 
may take more than a few days to refactor perf into it's own recipe and 
share the source area (ala work-shared/gcc).  We need to get the 
non-GPLv3 build working again and this seems like the most direct route 
to accomplish that.

Sau!


> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


