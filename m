Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Riwya-000790-KF
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 00:44:05 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Jan 2012 15:36:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="109246263"
Received: from unknown (HELO envy.home) ([10.19.147.21])
	by fmsmga002.fm.intel.com with ESMTP; 05 Jan 2012 15:36:28 -0800
Message-ID: <4F0633EB.9030708@linux.intel.com>
Date: Thu, 05 Jan 2012 15:36:11 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <fbed4e9f94ed9bd1bb5a9c8fa37113e325f89371.1325115602.git.dvhart@linux.intel.com>
	<4EFBAC18.3040909@intel.com> <4F03982D.1080601@linux.intel.com>
	<CAAQYJAtWXeBqnf5OPWE4bpo87Uo454X8qDE7C_QEL7Pu3_k+_w@mail.gmail.com>
	<CAAQYJAvu-n9eyXV8kj3=34_wzhdfec5Nit9uUy_ar=jFK1tFaQ@mail.gmail.com>
	<1325766615.20759.67.camel@ted>
In-Reply-To: <1325766615.20759.67.camel@ted>
X-Enigmail-Version: 1.3.3
Subject: Re: [PATCH] image_types: Ensure /init exists for cpio rootfs archives
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
X-List-Received-Date: Thu, 05 Jan 2012 23:44:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 01/05/2012 04:30 AM, Richard Purdie wrote:
> On Thu, 2012-01-05 at 01:05 +0100, Andrea Adami wrote:
>> I'd say we have to test for the in-existence of the file instead of
>> blindly touching it.
>> Smthg like
>>
>> if [! -e ${IMAGE_ROOTFS}/init]; then
>> touch ${IMAGE_ROOTFS}/init
>> fi

Why? Touch creates it if it doesn't exist and updates the modtime if it
does. It doesn't modify the content of the file if it exists. What is
the motivation for testing for it's existence?

>>
>>
>> Now, repeating that block for all 4 cpio images is a bit ugly... better ideas?
> 
> Make it a shell function we call? I'd also check for
> ${base_sbindir}/init first too?

Why check for that? So we can link to it instead of creating an empty file?


--
Darren

> 
> Cheers,
> 
> Richard
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


