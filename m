Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UKWTa-0004uZ-8N
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 17:11:54 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 Mar 2013 08:53:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,913,1355126400"; d="scan'208";a="307655269"
Received: from unknown (HELO envy.home) ([10.255.13.151])
	by orsmga002.jf.intel.com with ESMTP; 26 Mar 2013 08:54:42 -0700
Message-ID: <5151C4BC.4050108@linux.intel.com>
Date: Tue, 26 Mar 2013 08:54:36 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@windriver.com>
References: <cover.1364308617.git.bruce.ashfield@windriver.com>
	<cd19c63a4d2874eb48c9a96a69a38af730c00834.1364308617.git.bruce.ashfield@windriver.com>
	<5151C361.7020202@linux.intel.com> <5151C3A2.4070806@windriver.com>
In-Reply-To: <5151C3A2.4070806@windriver.com>
X-Enigmail-Version: 1.5.1
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/7] linux-yocto/3.8: allow kernel feature _appends to be overriden
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Mar 2013 16:11:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 03/26/2013 08:49 AM, Bruce Ashfield wrote:
> On 13-03-26 11:48 AM, Darren Hart wrote:
>> On 03/26/2013 07:46 AM, Bruce Ashfield wrote:
>>> It was pointed out that the current way the KERNEL_FEATURES variable
>>> is appended in the base linux-yocto recipe doesn't allow the appended
>>> features to be prevented in a layer without using python code and
>>> a recipe finalize hook.
>>>
>>> To allow easier overriding of 'extra' or 'optional' features that are
>>> defined in the linux-yocto recipe, we create a KERNEL_EXTRA_FEATURES
>>> variable. This variable can be set in a layer to define extra features
>>> or cleared to prevent the recipe's extra features from being appended
>>> to the core functionality.
>>
>> You know what I'm going to say right? Docume.... right, good.
>>
>> Bruce, are you keeping a list of things that have changed and need
>> documentation in the kernel-dev manual? Could you share it?
> 
> I do have a list, I'll put it in bugzilla.

Thank you sir!

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


