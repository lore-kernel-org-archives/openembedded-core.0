Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RlmOC-0002W3-Pu
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 20:02:12 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Jan 2012 10:54:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="106864248"
Received: from unknown (HELO [10.255.13.173]) ([10.255.13.173])
	by fmsmga001.fm.intel.com with ESMTP; 13 Jan 2012 10:54:38 -0800
Message-ID: <4F107DEE.4020106@linux.intel.com>
Date: Fri, 13 Jan 2012 10:54:38 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1326216024.git.josh@linux.intel.com>
	<35eca064e6310d94b517b481beef5f5a5a3f395b.1326216024.git.josh@linux.intel.com>
	<4F0F08F4.4010505@linux.intel.com>
	<20120112163127.GG3452@jama.jama.net>
In-Reply-To: <20120112163127.GG3452@jama.jama.net>
Subject: Re: [PATCH 3/3] task-base: add alsa-state to task-base-alsa
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
X-List-Received-Date: Fri, 13 Jan 2012 19:02:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



On 12/01/12 08:31, Martin Jansa wrote:
> On Thu, Jan 12, 2012 at 08:23:16AM -0800, Darren Hart wrote:
>>
>>
>> On 01/10/2012 09:39 AM, Joshua Lock wrote:
>>> This enables automatic configuration setting and restoration on systems
>>> with alsa.
>>>
>>> Signed-off-by: Joshua Lock<josh@linux.intel.com>
>>
>> Acked-by: Darren Hart<dvhart@linux.intel.com>
>
> can we use VIRTUAL_RUNTIME for this, please?
>
> for example in SHR we have alsa-state provided by fsoaudiod

That's a fine idea. VIRTUAL-RUNTIME_alsa-state?

I'm testing a patch for it now.

Cheers,
Joshua
-- 
Joshua Lock
         Yocto Project "Johannes factotum"
         Intel Open Source Technology Centre


