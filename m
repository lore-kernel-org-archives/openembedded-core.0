Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1TxbeU-0006tf-L2
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 12:04:27 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Jan 2013 02:48:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,513,1355126400"; d="scan'208";a="275110776"
Received: from unknown (HELO [10.255.15.32]) ([10.255.15.32])
	by orsmga002.jf.intel.com with ESMTP; 22 Jan 2013 02:48:50 -0800
Message-ID: <50FE6E90.5090009@intel.com>
Date: Tue, 22 Jan 2013 12:48:48 +0200
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1358635193.git.ross.burton@intel.com>
	<50FE5C29.7060102@windriver.com>
In-Reply-To: <50FE5C29.7060102@windriver.com>
Subject: Re: [PATCH 00/10] Initial systemd integration
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
X-List-Received-Date: Tue, 22 Jan 2013 11:04:28 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/22/2013 11:30 AM, ChenQi wrote:
> On 01/20/2013 06:47 AM, Ross Burton wrote:
>> Hi,
>>
>> This series has the goal of enabling core-image-minimal to boot using 
>> systemd.
>> As such it touches no real services, just the infrastructural tweaks 
>> to make the
>> init manager a distribution choice, systemd itself, and a few 
>> low-level changes.
>>
>> 95% of the credit obviously must go to the contributors of meta-systemd:
>>
>>      Andreas Müller <schnitzeltony@googlemail.com>
>>      Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
>>      Holger Hans Peter Freyther <holger@moiji-mobile.com>
>>      Khem Raj <raj.khem@gmail.com>
>>      Koen Kooi <koen@dominion.thruhere.net>
>>      Martin Jansa <Martin.Jansa@gmail.com>
>>
>> And thanks to Radu Moisan <radu.moisan@intel.com> for the work 
>> pulling together
>> a series for merging into oe-core.
>>
>> Confirmed that this series using sysvinit results in a zero-delta in
>> core-image-minimal.
>>
>> Cheers,
>> Ross
>>
>>
>
> Maybe we need to add something like below to 
> meta-yocto/conf/local.conf.sample ?
>
> # set default init manager: sysvinit or systemd
> DISTRO_FEATURES_INITMAN ?= "sysvinit"
>
> This may help make it clearer how to choose an init manager in 
> conf/local.conf file.

Sounds good to me.

Radu


