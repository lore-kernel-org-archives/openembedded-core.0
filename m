Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1S8aAF-0000vF-Oy
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 17:38:03 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 Mar 2012 09:29:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129803583"
Received: from unknown (HELO envy.home) ([10.255.12.16])
	by fmsmga001.fm.intel.com with ESMTP; 16 Mar 2012 09:29:14 -0700
Message-ID: <4F636A2E.2090404@linux.intel.com>
Date: Fri, 16 Mar 2012 09:28:30 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120209 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1331848750.git.dvhart@linux.intel.com>
	<5ca651eb19c3fcb64de2ce405de0bc7fa2a8c90b.1331848750.git.dvhart@linux.intel.com>
	<4F635D37.2020406@linux.intel.com>
	<4F636283.7040800@linux.intel.com> <1331915160.18586.202.camel@ted>
In-Reply-To: <1331915160.18586.202.camel@ted>
X-Enigmail-Version: 1.4
Subject: Re: [PATCH 1/1] rt-tests: Add src/backfire to FILES_${PN}
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
X-List-Received-Date: Fri, 16 Mar 2012 16:38:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 03/16/2012 09:26 AM, Richard Purdie wrote:
> On Fri, 2012-03-16 at 08:55 -0700, Darren Hart wrote:
>> On 03/16/2012 08:33 AM, Darren Hart wrote:
>>> Hrm, this silences the warnings, but the backfire sources are not
>>> installed on the rootfs....
>>>
>>> Anyone see what is wrong with the below? Is there some magic that purges
>>> /usr/src in a minimal build?
>>
>> I was adding "/usr/src/backfire" to FILES_${PN}. It seems one should add
>> "/usr/src/backfire/*" to actually get the files.
>>
>> However, I am surprised that the warnings went away and the files were
>> still not packaged when I used "/usr/src/backfire". Is this expected
>> behavior?
>>
>> I have pushed the new version to the same branch using
>> "/usr/src/backfire/*". Built,booted,and verified on qemux86 using
>> core-image-rt.
> 
> FWIW with your original patch I'm seeing things being correctly packaged
> in the main package (rt-tests) which is consistent with the warning
> message being fixed.

I see them appear in the rt-tests "package" dir, but not in the rootfs
unless I append the "/*".

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


