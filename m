Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qebkn-000153-9a
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 01:43:37 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 06 Jul 2011 16:39:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,489,1304319600"; d="scan'208";a="23537389"
Received: from unknown (HELO [10.255.13.240]) ([10.255.13.240])
	by azsmga001.ch.intel.com with ESMTP; 06 Jul 2011 16:39:40 -0700
Message-ID: <4E14F23C.5050001@linux.intel.com>
Date: Wed, 06 Jul 2011 16:39:40 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1309881139.2410.14.camel@phil-desktop>	<201107051731.12273.paul.eggleton@linux.intel.com>	<1309891044.3176.7.camel@lenovo.internal.reciva.com>
	<201107061506.04010.paul.eggleton@linux.intel.com>
In-Reply-To: <201107061506.04010.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] bluez-dtl1-workaround: remove PRIORITY
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
X-List-Received-Date: Wed, 06 Jul 2011 23:43:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/06/2011 07:06 AM, Paul Eggleton wrote:
> On Tuesday 05 July 2011 19:37:24 you wrote:
>> On Tue, 2011-07-05 at 17:31 +0100, Paul Eggleton wrote:
>>> Is it possible some people are still using PCMCIA/CF cards with this
>>> hardware in it?
>>
>> It's certainly possible, yes.  But I don't think that the mere
>> possibility is a very strong argument for keeping the recipe in oe-core.
>> Maybe it would be better suited to meta-oe or some BSP layer,
>
> You're right, I guess it doesn't really belong in oe-core.
>
Phil,

I will take a patch that deletes from here and adds it into the 
meta-extra's layer.

Sau!

> Cheers,
> Paul
>


