Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SuLaU-000557-Sv
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 12:46:35 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 26 Jul 2012 03:35:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="173419277"
Received: from dell-desktop (HELO [10.237.105.32]) ([10.237.105.32])
	by azsmga001.ch.intel.com with ESMTP; 26 Jul 2012 03:35:02 -0700
Message-ID: <50111DB6.5040506@intel.com>
Date: Thu, 26 Jul 2012 13:36:38 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1343283462-25435-1-git-send-email-radu.moisan@intel.com>
	<5010E3CF.3060709@intel.com>
	<919CF905-E475-44CE-8050-94A39C204208@dominion.thruhere.net>
	<1756274.ud5AYazWdz@helios>
	<F0E3167B-ECF8-494D-83E8-0D31CC826E65@dominion.thruhere.net>
	<50110B50.3030900@intel.com>
	<446507ED-01C5-4006-B9AE-C8D77B61C213@dominion.thruhere.net>
	<CAJTo0LZOq=8kZVZoebfMTauCb=zcdm2ORbq5M4O-GWKETtHJ_Q@mail.gmail.com>
In-Reply-To: <CAJTo0LZOq=8kZVZoebfMTauCb=zcdm2ORbq5M4O-GWKETtHJ_Q@mail.gmail.com>
Subject: Re: [PATCH v3] dbus: include dbus-launch in the main dbus package
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
X-List-Received-Date: Thu, 26 Jul 2012 10:46:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

should I create a single patch that changes dbus-x11 to dbus, or one for 
each package?

Radu

On 07/26/2012 01:23 PM, Burton, Ross wrote:
> On 26 July 2012 10:51, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>> What's the point of PROVIDES += dbus-x11, it build fine without it (I'm not questioning the correctness of this, just want to understand the need for it).
>> This morning you said:
>>
>> "it does not build, it complains about nothing providing dbus-x11"
>>
>> That's what the PROVIDES is for.
> Without seeing the logs, I expect the error was when building the
> image.  Nothing will build-depend on dbus-x11 because it isn't a
> source package.
>
> Radu, as a follow-up patch please remove all instances of dbus-x11,
> replacing with dbus if required.
>
> Ross
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



