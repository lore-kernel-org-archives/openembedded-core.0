Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RVtCU-0003B9-WB
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 00:04:27 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 30 Nov 2011 14:57:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,273,1320652800"; d="scan'208";a="97190068"
Received: from unknown (HELO envy.home) ([10.255.12.165])
	by fmsmga002.fm.intel.com with ESMTP; 30 Nov 2011 14:57:45 -0800
Message-ID: <4ED6B4EE.6000703@linux.intel.com>
Date: Wed, 30 Nov 2011 14:57:50 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1322689519.git.darren@dvhart.com>
	<e7ca852c4e673a6b32be203109a704202aeace3a.1322689519.git.darren@dvhart.com>
	<6e118d2846f5606561b4ae1f3c3ae93fd69bc360.1322689519.git.darren@dvhart.com>
	<CAMKF1sotPRfvMtbMYRBCtqpAj7CfYMzOzh1EORaOtBajzywwkA@mail.gmail.com>
	<4ED6B025.1060705@linux.intel.com>
	<CAMKF1sojotYjyRDVaVu0poUDRpTYMhA_9sX7sNvLQW7n-bL5Uw@mail.gmail.com>
In-Reply-To: <CAMKF1sojotYjyRDVaVu0poUDRpTYMhA_9sX7sNvLQW7n-bL5Uw@mail.gmail.com>
X-Enigmail-Version: 1.3.3
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] autotools.bbclass: Report the missing configure path
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
X-List-Received-Date: Wed, 30 Nov 2011 23:04:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/30/2011 02:48 PM, Khem Raj wrote:
>>>> -               bbfatal "no configure script found"
>>>> +               bbfatal "no configure script found at $cfgscript"
>>>
>>> why not just do one line change something like
>>>
>>> bbfatal "configure script ${S}/configure not found"
>>
>> I prefer to use a variable when I need a value more than once. It avoids
>> future bugs where one is changed and the others were missed. As this
>> string is used 4 times, it seemed like the right call.
> 
> ok with variable still the cfgscript itself is the script and the
> message "no configure script found at $cfgscript"
> seems like $cfgscript is a location. you may want to make it
> "$cfgscript configure script not found" or something

I can see that (although I think can be argued this is correct as well -
a path with a filename is still a location). I was copying the language
used elsewhere... but from where is eluding my search at the moment. RP
has pulled these already I believe, so if the language here truly
bothers you, we can address it in a follow-on. Personally I don't think
it's really worth the trouble.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


