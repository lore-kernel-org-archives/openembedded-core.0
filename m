Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RprVY-0002b6-UM
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 02:18:41 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 Jan 2012 17:10:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="110450421"
Received: from unknown (HELO [10.255.14.96]) ([10.255.14.96])
	by fmsmga001.fm.intel.com with ESMTP; 24 Jan 2012 17:10:53 -0800
Message-ID: <4F1F569C.1060703@linux.intel.com>
Date: Tue, 24 Jan 2012 17:10:52 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1327447344.git.josh@linux.intel.com>
	<f7bd8523525f541676e8b2e416a4960b45cd7d7e.1327447344.git.josh@linux.intel.com>
	<CAMKF1sq=xpgO=4Ne0YQdkhqXhh_+VcpA2Xyx_Cm3xccUcv3d2A@mail.gmail.com>
	<4F1F45F0.208@linux.intel.com>
	<CAMKF1sp+TWp_PneKg7P52GrytWqhcoyV+4=XU_=xk==jGQ9v3g@mail.gmail.com>
In-Reply-To: <CAMKF1sp+TWp_PneKg7P52GrytWqhcoyV+4=XU_=xk==jGQ9v3g@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 25 Jan 2012 01:18:41 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/24/2012 05:04 PM, Khem Raj wrote:
> On Tue, Jan 24, 2012 at 3:59 PM, Saul Wold<sgw@linux.intel.com>  wrote:
>>
>>
>> The issue is timing and resources to do this work, it a larger task that may
>> take more than a few days to refactor perf into it's own recipe and share
>> the source area (ala work-shared/gcc).  We need to get the non-GPLv3 build
>> working again and this seems like the most direct route to accomplish that.
>
> is that a blocker for oe-core ?
>
It's a blocker for oe-core & 1.2, and we are not sure get can get the 
refactor done by 1.2 given all the the other activities the team has, if 
there are some external resources available o complete this work, that 
would be very helpful!

Sau!



