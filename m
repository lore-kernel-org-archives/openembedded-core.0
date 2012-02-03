Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RtNsY-0005Fo-U0
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 19:28:59 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 03 Feb 2012 10:21:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="102982436"
Received: from unknown (HELO [10.255.14.238]) ([10.255.14.238])
	by azsmga001.ch.intel.com with ESMTP; 03 Feb 2012 10:21:00 -0800
Message-ID: <4F2C258B.40603@linux.intel.com>
Date: Fri, 03 Feb 2012 10:20:59 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4EB9DF31.7070904@intel.com>
	<19F0FAB3-A37C-4CB4-8A3D-771878983898@dominion.thruhere.net>
In-Reply-To: <19F0FAB3-A37C-4CB4-8A3D-771878983898@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: openssl 1.0?
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
X-List-Received-Date: Fri, 03 Feb 2012 18:28:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/09/2011 01:28 AM, Koen Kooi wrote:
>
> Op 9 nov. 2011, om 03:02 heeft Scott Garman het volgende geschreven:
>
>> Hello,
>>
>> I wanted to get some feedback from the community about OpenSSL 1.0. We currently only support 0.9.8 in oe-core. Specifically: should we add openssl 1.0 to oe-core, and should the rest of our recipes build against it by default?
>
> The openssl in meta-oe is working fine, just keep in mind that the SOVERSION changed, so you need a PR bump for everything that links against openssl when switching.
>
About 2 months have gone by with OE-core containing OpenSSL 1.0, can we 
deprecate the 0.9.8 version at this point?

If people still need 0.9.8, we can move it to meta-oe.

I will submit an RFC Patch later today to remove 0.9.8 from OE-core.

Sau!


> regards,
>
> Koen
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


