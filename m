Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SyGx6-0005cL-E5
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 08:38:08 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Aug 2012 23:26:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="176401982"
Received: from dell-desktop (HELO [10.237.105.32]) ([10.237.105.32])
	by orsmga001.jf.intel.com with ESMTP; 05 Aug 2012 23:26:21 -0700
Message-ID: <501F63FF.1070401@intel.com>
Date: Mon, 06 Aug 2012 09:28:15 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Wolfgang Denk <wd@denx.de>
References: <1343997523-4117-1-git-send-email-radu.moisan@intel.com>
	<20120803161915.399D1203B3D@gemini.denx.de>
In-Reply-To: <20120803161915.399D1203B3D@gemini.denx.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][RFC] u-boot: Upgrade to upstream stable 2012.07
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
X-List-Received-Date: Mon, 06 Aug 2012 06:38:08 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/03/2012 07:19 PM, Wolfgang Denk wrote:
> Dear Radu Moisan,
>
> In message <1343997523-4117-1-git-send-email-radu.moisan@intel.com> you wrote:
>> Building u-boot requires UBOOT_MACHINE. In the u-boot README file
>> building u-boot is achieved with "make NAME_config" and then
>> "make all". I assumend UBOOT_MACHINE to be the "NAME" part and thus,
> Actually a plain
>
> 	make NAME
>
> does the same as "make NAME_config && make all".
>
> You might also consider running "./MAKEALL NAME" instead, which
> aut-adjusts to te number of available cores on the build host, so you
> get somewhat reduced build times.

I've tried to build this way but got into some errors and did not 
pursued further in debugging them. However, because UBOOT_MACHINE is 
already used as NAME_config, would be difficult to change it to NAME and 
ask everyone who use it, to switch. I will go with current configuration 
"make NAME_config" & "make all"

radu


