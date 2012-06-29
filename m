Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SkhhQ-0004cm-Df
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 22:21:52 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 29 Jun 2012 13:10:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="162373617"
Received: from unknown (HELO envy.home) ([10.255.13.25])
	by azsmga001.ch.intel.com with ESMTP; 29 Jun 2012 13:10:54 -0700
Message-ID: <4FEE0B73.4090102@linux.intel.com>
Date: Fri, 29 Jun 2012 13:09:23 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1340998763.git.dvhart@linux.intel.com>
	<4263ffefaa6f3b0069bc41c0f7578d36717edcfc.1340998763.git.dvhart@linux.intel.com>
	<5d4f56f916e6ffdfcad97895dd3ba2ecd2ba4354.1340998763.git.dvhart@linux.intel.com>
	<CAMKF1sqbrVsp_Os9QKooSDcsQmB28fBu+K0W_cXK+BPXFKj28Q@mail.gmail.com>
In-Reply-To: <CAMKF1sqbrVsp_Os9QKooSDcsQmB28fBu+K0W_cXK+BPXFKj28Q@mail.gmail.com>
X-Enigmail-Version: 1.4.2
Cc: Poky <poky@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] kernel: Add kernel headers to kernel-dev package
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
X-List-Received-Date: Fri, 29 Jun 2012 20:21:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/29/2012 01:01 PM, Khem Raj wrote:

>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 9b26580..9f3abee 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -380,7 +380,7 @@ SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
>>  ##################################################################
>>
>>  OLDEST_KERNEL = "2.6.16"
>> -STAGING_KERNEL_DIR = "${STAGING_DIR_HOST}/kernel"
>> +STAGING_KERNEL_DIR = "${STAGING_DIR_HOST}/usr/src/kernel-headers"
> 
> 
> This should be kernel instead of kernel-headers
>>


Well crap. Nice catch. Will send a V3 to account for this and the rebase
needed as the first 2 were already pulled in.


-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel




