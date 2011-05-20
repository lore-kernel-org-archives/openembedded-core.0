Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1QNZVw-0001PC-SH
	for openembedded-core@lists.openembedded.org;
	Sat, 21 May 2011 01:53:53 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 20 May 2011 16:50:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,244,1304319600"; 
   d="scan'208";a="5509527"
Received: from unknown (HELO [10.255.12.39]) ([10.255.12.39])
	by fmsmga001.fm.intel.com with ESMTP; 20 May 2011 16:50:54 -0700
Message-ID: <4DD6FE5D.5080804@intel.com>
Date: Fri, 20 May 2011 16:50:53 -0700
From: Saul Wold <saul.wold@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1305874831.git.sgw@linux.intel.com>	<1305891903.3424.592.camel@rex>
	<4DD6FD57.5030900@linux.intel.com>
In-Reply-To: <4DD6FD57.5030900@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
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
X-List-Received-Date: Fri, 20 May 2011 23:53:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/20/2011 04:46 PM, Darren Hart wrote:
>
>
> On 05/20/2011 04:45 AM, Richard Purdie wrote:
>> On Fri, 2011-05-20 at 00:06 -0700, Saul Wold wrote:
>>> This is building green on x86 and ARM.
>>>
>>> This contains updated pull requests from Khem and Dexuan.  I have some
>>> non-gplv3 fixes along with a fix to the u-boot patch due to a bad checksum.
>>>
>>> I have again included the gcc 4.6 enabler for x86 and arm, the kernel
>>> updates are in place. Feel free to remove it, but I think we get a good QA
>>> pass and move forward, if not we fall back to gcc 4.5.x for RC2.
>>>
>>> Thanks for your considersation
>>
>> I've merged some of this but I do have some concerns with a few of the
>> patches:
>>
>>> Khem Raj (6):
>>>    conf: Create distro overridable IMAGE varibales
>>
>> Phil had concerns about this and to be honest I agree with him. More
>> thought is needed with this, we need more of an overall plan.
>>
>>>    distcc_2.18.3.bb: Fix compilation on uclibc
>>
>> I think Phil's comment on this is valid and needs to be addressed.
>>
>>>    opkg_svn.bb: Install rcS.d into ${D} instead of ${IMAGE_ROOTFS}
>>
>> Should be using $D, *not* ${D}.
>
> Really? It was my understanding these are equivalent, with the {} form
> being the less ambiguous of the two for use when concatenating strings
> of variables. What am I missing?
>
Bitbake parsing occurs first and translates the ${D}, but not the $D, 
see RP's comment in the main thread for this patch.

Sau!

> http://tldp.org/LDP/abs/html/parameter-substitution.html
>
> Thanks,
>



