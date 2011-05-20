Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QNZRm-0001Mn-7C
	for openembedded-core@lists.openembedded.org;
	Sat, 21 May 2011 01:49:34 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 20 May 2011 16:46:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,244,1304319600"; d="scan'208";a="440063228"
Received: from unknown (HELO [10.255.12.76]) ([10.255.12.76])
	by azsmga001.ch.intel.com with ESMTP; 20 May 2011 16:46:34 -0700
Message-ID: <4DD6FD57.5030900@linux.intel.com>
Date: Fri, 20 May 2011 16:46:31 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1305874831.git.sgw@linux.intel.com>
	<1305891903.3424.592.camel@rex>
In-Reply-To: <1305891903.3424.592.camel@rex>
Subject: Re: [PATCH 00/12] 20-May-2011 Consolidated Pull
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
X-List-Received-Date: Fri, 20 May 2011 23:49:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 05/20/2011 04:45 AM, Richard Purdie wrote:
> On Fri, 2011-05-20 at 00:06 -0700, Saul Wold wrote:
>> This is building green on x86 and ARM.
>>
>> This contains updated pull requests from Khem and Dexuan.  I have some
>> non-gplv3 fixes along with a fix to the u-boot patch due to a bad checksum.
>>
>> I have again included the gcc 4.6 enabler for x86 and arm, the kernel 
>> updates are in place. Feel free to remove it, but I think we get a good QA
>> pass and move forward, if not we fall back to gcc 4.5.x for RC2.
>>
>> Thanks for your considersation
> 
> I've merged some of this but I do have some concerns with a few of the
> patches:
> 
>> Khem Raj (6):
>>   conf: Create distro overridable IMAGE varibales
> 
> Phil had concerns about this and to be honest I agree with him. More
> thought is needed with this, we need more of an overall plan.
> 
>>   distcc_2.18.3.bb: Fix compilation on uclibc
> 
> I think Phil's comment on this is valid and needs to be addressed.
> 
>>   opkg_svn.bb: Install rcS.d into ${D} instead of ${IMAGE_ROOTFS}
> 
> Should be using $D, *not* ${D}.

Really? It was my understanding these are equivalent, with the {} form
being the less ambiguous of the two for use when concatenating strings
of variables. What am I missing?

http://tldp.org/LDP/abs/html/parameter-substitution.html

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


