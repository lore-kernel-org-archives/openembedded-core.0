Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1TleOx-0007NT-E6
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 12:35:00 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Dec 2012 03:20:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,322,1355126400"; d="scan'208";a="267643815"
Received: from dell-desktop (HELO [10.237.105.59]) ([10.237.105.59])
	by fmsmga002.fm.intel.com with ESMTP; 20 Dec 2012 03:20:12 -0800
Message-ID: <50D2F5C6.6080807@intel.com>
Date: Thu, 20 Dec 2012 13:25:58 +0200
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <50D1F76D.4070000@intel.com>
	<EC7262B3-B95B-4AC6-AAF3-4EA4B7C66B3F@dominion.thruhere.net>
In-Reply-To: <EC7262B3-B95B-4AC6-AAF3-4EA4B7C66B3F@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: systemd integration
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
X-List-Received-Date: Thu, 20 Dec 2012 11:35:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 12/20/2012 12:47 PM, Koen Kooi wrote:
> Op 19 dec. 2012, om 18:20 heeft Radu Moisan <radu.moisan@intel.com> het volgende geschreven:
>
>> Hi guys,
>>      I have prepared a branch on poky-contrib (rmoisan/systemd) where I pulled systemd from meta-openembedded. The goal is to merge this into oe-core, so please take a look and give me your feedback on stuff that needs work or things that I might have done wrong, so that I can prepare it for merge.
>>      At this point core-image-minimal and core-image-sato both boot fine with systemd. There still are a few warnings but not critical(at runtime), at least in my opinion, you may want to take a look at those too.
>>      You can activate systemd by  DISTRO_FEATURES_INITMAN = "systemd"
> What happens when I do DISTRO_FEATURES_INITMAN = "sysvinit systemd"?
I think it would break your build. But what would be the point of doing 
that?

Radu


