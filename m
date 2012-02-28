Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1S2AhN-0000GU-0x
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 01:13:45 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 Feb 2012 16:02:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="112424163"
Received: from cfjohns1-mobl1.amr.corp.intel.com (HELO envy.home)
	([10.7.199.145])
	by orsmga001.jf.intel.com with ESMTP; 27 Feb 2012 16:02:58 -0800
Message-ID: <4F4C1990.9090903@linux.intel.com>
Date: Mon, 27 Feb 2012 16:02:24 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120131 Thunderbird/10.0
MIME-Version: 1.0
To: Saul Wold <saul.wold@intel.com>
References: <cover.1330371008.git.bruce.ashfield@windriver.com>
	<a2440ad66968c13a0db6f97f69b04b8670ac9ffd.1330371008.git.bruce.ashfield@windriver.com>
	<4F4C1077.3030106@intel.com>
In-Reply-To: <4F4C1077.3030106@intel.com>
X-Enigmail-Version: 1.3.5
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] linux-yocto: update 3.2 kernel to v3.2.7
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
X-List-Received-Date: Tue, 28 Feb 2012 00:13:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 02/27/2012 03:23 PM, Saul Wold wrote:
> On 02/27/2012 11:34 AM, Bruce Ashfield wrote:
>> Updating the 3.2 kernel recipe to the latest -stable release.
>>
>> Signed-off-by: Bruce Ashfield<bruce.ashfield@windriver.com>
>> ---
>>   meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb |    9 +++++----
>>   meta/recipes-kernel/linux/linux-yocto_3.2.bb    |   19 ++++++++++---------
>>   2 files changed, 15 insertions(+), 13 deletions(-)
>>
> 
> I noticed that there are 3 Packaging WARNINGS in this build, we are 
> trying to improve the overall Quality by reducing the warnings. These 
> are probably general to all linux-yocto recipes.
> 
> Can you address these:
> 
> WARNING: For recipe linux-yocto, the following files/directories were 
> installed but not shipped in any package:
> WARNING:   /lib/modules/3.2.2-yocto-standard+/build
> WARNING:   /lib/modules/3.2.2-yocto-standard+/source
> WARNING:   /etc/modprobe.d
> 

https://bugzilla.yoctoproject.org/show_bug.cgi?id=2036

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


