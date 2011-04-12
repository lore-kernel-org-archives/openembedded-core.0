Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1Q9XzF-0005Eb-4x
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Apr 2011 09:26:09 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 Apr 2011 00:23:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,194,1301900400"; d="scan'208";a="627220262"
Received: from kyu3-desk.ccr.corp.intel.com (HELO [10.238.154.142])
	([10.238.154.142])
	by orsmga002.jf.intel.com with ESMTP; 12 Apr 2011 00:23:54 -0700
Message-ID: <4DA3FE09.5060508@intel.com>
Date: Tue, 12 Apr 2011 15:23:53 +0800
From: Yu Ke <ke.yu@intel.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1302485033.git.ke.yu@intel.com>	<b5e34c499be6bf4ac13d59e98c1e61585d1d9a84.1302485033.git.ke.yu@intel.com>
	<4DA344D1.6080206@intel.com>
In-Reply-To: <4DA344D1.6080206@intel.com>
Cc: poky@yoctoproject.org, Saul Wold <saul.wold@intel.com>
Subject: Re: [poky] [PATCH 5/9] evieext: upgrade from 1.1.0 to	1.1.1
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
X-List-Received-Date: Tue, 12 Apr 2011 07:26:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

on 2011-4-12 2:13, Saul Wold wrote:
> On 04/10/2011 06:28 PM, Yu Ke wrote:
>> From: Yu Ke<ke.yu@intel.com>
>>
>> - also change license checksum, the license is still MIT-X, but corp name
>> is changed from SUN to Oracle
>>
>> Signed-off-by: Yu Ke<ke.yu@intel.com>
>> ---
>> .../distro/include/preferred-xorg-versions.inc | 2 +-
>> .../{evieext_1.1.0.bb => evieext_1.1.1.bb} | 8 ++++----
>> 2 files changed, 5 insertions(+), 5 deletions(-)
>> rename meta/recipes-graphics/xorg-proto/{evieext_1.1.0.bb =>
>> evieext_1.1.1.bb} (54%)
>>
>> diff --git a/meta/conf/distro/include/preferred-xorg-versions.inc
>> b/meta/conf/distro/include/preferred-xorg-versions.inc
>> index 5fd2040..fabc0da 100644
>> --- a/meta/conf/distro/include/preferred-xorg-versions.inc
>> +++ b/meta/conf/distro/include/preferred-xorg-versions.inc
>> @@ -9,7 +9,7 @@ PREFERRED_VERSION_bigreqsproto-nativesdk ?= "1.1.1"
>> PREFERRED_VERSION_compositeproto ?= "0.4.2"
>> PREFERRED_VERSION_damageproto ?= "1.2.1"
>> PREFERRED_VERSION_dmxproto ?= "2.3.1"
>> -PREFERRED_VERSION_evieext ?= "1.1.0"
>> +PREFERRED_VERSION_evieext ?= "1.1.1"
>> PREFERRED_VERSION_fixesproto ?= "4.1.2"
>> PREFERRED_VERSION_fontcacheproto ?= "0.1.3"
>> PREFERRED_VERSION_fontcacheproto-native ?= "0.1.3"
>> diff --git a/meta/recipes-graphics/xorg-proto/evieext_1.1.0.bb
>> b/meta/recipes-graphics/xorg-proto/evieext_1.1.1.bb
>> similarity index 54%
>> rename from meta/recipes-graphics/xorg-proto/evieext_1.1.0.bb
>> rename to meta/recipes-graphics/xorg-proto/evieext_1.1.1.bb
>> index 5800af1..271398d 100644
>> --- a/meta/recipes-graphics/xorg-proto/evieext_1.1.0.bb
>> +++ b/meta/recipes-graphics/xorg-proto/evieext_1.1.1.bb
>> @@ -6,10 +6,10 @@ DESCRIPTION = "This package provides the wire
>> protocol for the X Event \
>> Interception Extension. This extension allows the interception of \
>> keyboard and mouse events."
>>
>> -PR = "r1"
>> +PR = "r0"
>> PE = "1"
>>
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=6cf85dc8217152304ac976db1e240ebe"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=4db9fc6a58e873c6392eec53082d89b5"
>>
> Was there a change in the type of license? Why did COPYING change?
>
> Sau!

the license type is unchanged (MIT-X), and the COPYING changes because 
the corp name changes from Sun to Oracle. The commit description has all 
the info.

Regards
Ke

>> -SRC_URI[md5sum] = "5c74f61d6f77b2e6a083b2b31000be42"
>> -SRC_URI[sha256sum] =
>> "47881a52a8d9da1e41e4f028ed32a8b44f738afbead819c0a07253fdc1641885"
>> +SRC_URI[md5sum] = "98bd86a13686f65f0873070fdee6efc7"
>> +SRC_URI[sha256sum] =
>> "1cf74114436d99f56577a90b6438a32ba31b8128c9e63842bb179aba592733fe"
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



