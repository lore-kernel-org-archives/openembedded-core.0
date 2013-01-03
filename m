Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1Tqfux-0004hD-Cq
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 09:12:49 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jan 2013 23:57:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,402,1355126400"; d="scan'208";a="239424111"
Received: from dell-desktop (HELO [10.237.105.59]) ([10.237.105.59])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2013 23:57:41 -0800
Message-ID: <50E53B68.6020505@intel.com>
Date: Thu, 03 Jan 2013 10:03:52 +0200
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1356022882.git.radu.moisan@intel.com>
	<50D8FDBE.4030203@linux.intel.com> <50DDABA4.70309@intel.com>
	<4078626.EH4CM1sFWo@helios>
In-Reply-To: <4078626.EH4CM1sFWo@helios>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/28][RFC] systemd Integration
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
X-List-Received-Date: Thu, 03 Jan 2013 08:12:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 01/01/2013 12:10 AM, Paul Eggleton wrote:
> On Friday 28 December 2012 16:24:36 Radu Moisan wrote:
>> On 12/25/2012 03:13 AM, Saul Wold wrote:
>>> Also, you do not provide very clear information at the beginning, but
>>> I assume to enable systemd, it's just setting DISTRO_FEATURE +=
>>> "systemd", or is there more?
>> DISTRO_FEATURES_INITMAN = "systemd" it's all you need. DISTRO_FEATURE +=
>> "systemd" might also work in some extent since I'm checking against
>> DISTRO_FEATURES, however there are variables like
>> VIRTUAL_RUNTIME_init_manager (which is inherited legacy) which get set
>> from DISTRO_FEATURES_INITMAN. The way to go is with DISTRO_FEATURES_INITMAN.
> Can you explain why we need another variable for this?
Initially I went for VIRTUAL-RUNTIME_init_manager, but Richard suggested 
I should get rid of lower case ambiguity and he proposed 
DISTRO_FEATURES_INITMAN.

Radu


