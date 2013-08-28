Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4B7796BCB3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 20:44:54 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Aug 2013 13:44:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,977,1367996400"; d="scan'208";a="394937957"
Received: from unknown (HELO [10.255.14.210]) ([10.255.14.210])
	by orsmga002.jf.intel.com with ESMTP; 28 Aug 2013 13:44:54 -0700
Message-ID: <521E6146.7000807@linux.intel.com>
Date: Wed, 28 Aug 2013 13:44:54 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Randy MacLeod <randy.macleod@windriver.com>
References: <cover.1377568883.git.rongqing.li@windriver.com>
	<521E5C42.3070504@windriver.com>
In-Reply-To: <521E5C42.3070504@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1]libnfsidmap: Add and modify idmapd.conf
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Aug 2013 20:44:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/28/2013 01:23 PM, Randy MacLeod wrote:
> On 13-08-26 10:07 PM, rongqing.li@windriver.com wrote:
>> From: "Roy.Li" <rongqing.li@windriver.com>
>>
>> The following changes since commit
>> 58d05c817cf3be071c66c7e4dbbb9942fd7a0752:
>>
>>    xdg-utils: add runtime dependency on xprop (2013-08-23 16:08:30 +0100)
>>
>> are available in the git repository at:
>>
>>    git://git.pokylinux.org/poky-contrib roy/libnfsidmap
>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/libnfsidmap
>>
>> Zhang Xiao (1):
>>    libnfsidmap: Add and modify idmapd.conf
>>
>>   .../nfs-utils/files/Set_nobody_user_group.patch      |   18
>> ++++++++++++++++++
>>   .../nfs-utils/libnfsidmap_0.25.bb                    |    7 +++++++
>>   2 files changed, 25 insertions(+)
>>   create mode 100644
>> meta/recipes-connectivity/nfs-utils/files/Set_nobody_user_group.patch
>>
>
>
> It has only been a day and a half but was this missed?
>
>
No, there are a number of patches on hold right now as we are entering 
RC1 of the Milestone 4 and we just took on the Kernel Update which we 
are trying to settle issues with.  I am queuing things in the MUT 
(Master_Under_Test) branch in the poky-contrib repo.

Thanks for your patience and understanding.

Sau!


