Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rt0ur-0000IC-L2
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 18:57:49 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 02 Feb 2012 09:49:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113363955"
Received: from unknown (HELO [10.255.14.238]) ([10.255.14.238])
	by fmsmga001.fm.intel.com with ESMTP; 02 Feb 2012 09:49:52 -0800
Message-ID: <4F2ACCBF.6030303@linux.intel.com>
Date: Thu, 02 Feb 2012 09:49:51 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1327795253-24794-1-git-send-email-schnitzeltony@googlemail.com>
	<1327795253-24794-2-git-send-email-schnitzeltony@googlemail.com>
	<4F26CD01.4050700@linux.intel.com>
	<CAPhnLPCXc6j4W8k_Ed=_Q52fLYvDB5EqFm0V8-Yg19ZC36JNEw@mail.gmail.com>
	<CALbNGRQg80gvCMjwEXeddMnUO2A4aMVG9KZsT04iH082b=MJTA@mail.gmail.com>
In-Reply-To: <CALbNGRQg80gvCMjwEXeddMnUO2A4aMVG9KZsT04iH082b=MJTA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] atk: add native / disable introspection / merge atk.inc->recipe / change license
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
X-List-Received-Date: Thu, 02 Feb 2012 17:57:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 02/01/2012 01:20 AM, Andreas Müller wrote:
> On Wed, Feb 1, 2012 at 2:07 AM, Flanagan, Elizabeth
> <elizabeth.flanagan@intel.com>  wrote:
>>
>> - LICENSE needs to be ast parsable. It should be:
>>
>> LICENSE = "GPL-2.0+&  LGPL-2.1+"
> I grepped around: We have exactly ONE hit for each ( GPL-2.0+ /
> LGPL-2.1+ ) in oe-core. This approach does not seem common to me..
>>
>> - LGPLv2.1. It really does matter, IMHO.
>>
>> For some reason OBS says this is only LGPL-2.1+ I haven't looked at it
>> too closely, but COPYING is pretty clear here.
>>
>> -b
>>
> Sorry to say so: The original patch did not touch license at all. It
> just moved it from inc ->  bb. I feel a bit hijacked here and loose
> motivation of further versions of this patch...
>
Andreas,

I am sorry you feel this way, I appreciate the work the that you and all 
the community members contribute to this project. We are not trying to 
hijack anyone one here. One of the key values that OE-Core and Yocto 
Project are trying to provide is a best in class with the metadata, and 
a very important part of that is the LICENSE values, when we notice it's 
wrong, we want to correct it.

We will pull the v2 change and then Beth will correct the LICENSE meta-data.

Thanks for your work!

Sau!

> Andreas
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


