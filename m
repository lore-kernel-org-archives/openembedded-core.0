Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TW6Py-0001LM-H8
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Nov 2012 15:16:00 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 07 Nov 2012 06:01:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,730,1344236400"; d="scan'208";a="238534112"
Received: from unknown (HELO [10.255.14.129]) ([10.255.14.129])
	by orsmga002.jf.intel.com with ESMTP; 07 Nov 2012 06:01:56 -0800
Message-ID: <509A69D2.4000500@linux.intel.com>
Date: Wed, 07 Nov 2012 06:01:54 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Jack Mitchell <jack.mitchell@eumx.net>
References: <1352294053-21248-1-git-send-email-sgw@linux.intel.com>
	<1352294053-21248-2-git-send-email-sgw@linux.intel.com>
	<509A61A1.50306@eumx.net>
In-Reply-To: <509A61A1.50306@eumx.net>
Cc: "open >> 'Patches and discussions about the oe-core layer'"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] upstream_tracking: Update for 1.4 Planning
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
X-List-Received-Date: Wed, 07 Nov 2012 14:16:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/07/2012 05:26 AM, Jack Mitchell wrote:
> On 07/11/12 13:14, Saul Wold wrote:
>> The following need updating based on this review:
>> kconfig-frontends
>> libcheck
>> sqlite3
>> libmad
>> less
>> sysstat
>> psmisc
>>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> ---
>>   .../conf/distro/include/upstream_tracking.inc      |   58
>> ++++++++++----------
>>   1 files changed, 29 insertions(+), 29 deletions(-)
>>
>> diff --git a/meta-yocto/conf/distro/include/upstream_tracking.inc
>> b/meta-yocto/conf/distro/include/upstream_tracking.inc
>> index fd422cf..7140477 100644
>> --- a/meta-yocto/conf/distro/include/upstream_tracking.inc
>> +++ b/meta-yocto/conf/distro/include/upstream_tracking.inc
>> @@ -86,7 +86,7 @@ RECIPE_UPSTREAM_VERSION_pn-bluez4="4.101"
>>   RECIPE_UPSTREAM_DATE_pn-bluez4="Jun 22, 2012"
>>   CHECK_DATE_pn-bluez4 = "Aug 27, 2012"
>>   RECIPE_UPSTREAM_VERSION_pn-boost = "1.51.0"
>> -CHECK_DATE_pn-boost = "Aug 27, 2012"
>> +CHECK_DATE_pn-boost = "Nov 02, 2012"
>>   RECIPE_UPSTREAM_DATE_pn-boost = "Aug 20, 2012"
>>   RECIPE_UPSTREAM_VERSION_pn-btrfs-tools="git"
>>   RECIPE_UPSTREAM_VERSION_pn-busybox = "1.20.2"
>> @@ -137,7 +137,7 @@ RECIPE_UPSTREAM_DATE_pn-connman="Aug 22, 2012"
>>   CHECK_DATE_pn-connman = "Aug 28, 2012"
> [snip]
>
> Hi Saul,
>
> How is this maintainers file intended to work? The reason I ask is that
> ConnMan is quite outdated (1.4) and the latest version (1.9) includes
> some very nice features such as CLI configuration.
>
This should have gone to the Poky mailing list, I was a little too quick 
to send it here.

There are two files one, maintainers.inc and the other upstream_tracking 
this is used to keep track of the up stream version.

The idea is that this file is where you can go to see who is maintaining 
the recipe, this does not mean we will not accept patch, upgrades or ... 
from other to recipes.  It's intended as a fallback if no one else updates.

Connman was probably delayed in getting updated because the 1.3 release 
was happening.

> I don't want to try and find time to do it, if it is already in progress
> somewhere or is intended to be imminently updated.
>
I can't say how imminent it is, you can check with the person 
maintaining it, that would be: Cristian Iorga <cristian.iorga@intel.com>

Sau!


> Cheers,
> Jack.
>
>


