Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qrbtl-0002TE-OZ
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 22:30:38 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 11 Aug 2011 13:26:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,358,1309762800"; d="scan'208";a="37588330"
Received: from unknown (HELO [10.255.14.248]) ([10.255.14.248])
	by azsmga001.ch.intel.com with ESMTP; 11 Aug 2011 13:26:04 -0700
Message-ID: <4E443ADB.7010103@linux.intel.com>
Date: Thu, 11 Aug 2011 13:26:03 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	"Noor, Ahsan" <noor_ahsan@mentor.com>
References: <1313078412-6872-1-git-send-email-noor_ahsan@mentor.com>
	<1313078529.6733.138.camel@phil-desktop>
In-Reply-To: <1313078529.6733.138.camel@phil-desktop>
Subject: Re: [PATCH] bluez4: Added new recipe version 4.96
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
X-List-Received-Date: Thu, 11 Aug 2011 20:30:38 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/11/2011 09:02 AM, Phil Blundell wrote:
> On Thu, 2011-08-11 at 21:00 +0500, Noor, Ahsan wrote:
>> From: Noor Ahsan<noor_ahsan@mentor.com>
>>
>> * Added new recipe version 4.96.
>
> Is there a particular reason why we need both this and the old 4.82?
>
Agreed,

I would entertain a v2 that removes the older recipe, as we don't keep 
older recipes unless there is specific license issues (such as GPLv2 vs 
GPLv3), which does not seem to be the case here.

It's better to do a "git mv" if you can.

Thanks	
	Sau!

> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


