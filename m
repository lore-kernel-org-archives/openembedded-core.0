Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TwBZ4-0004T4-8N
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 14:01:04 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 18 Jan 2013 04:45:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,492,1355126400"; d="scan'208";a="192615244"
Received: from costin-desktop (HELO [10.237.105.152]) ([10.237.105.152])
	by AZSMGA002.ch.intel.com with ESMTP; 18 Jan 2013 04:45:31 -0800
Message-ID: <50F9441C.9020908@intel.com>
Date: Fri, 18 Jan 2013 14:46:20 +0200
From: Constantin Musca <constantinx.musca@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121016 Thunderbird/16.0.1
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1358509450.git.constantinx.musca@intel.com>
	<3e9e32d745fa7a228acfcc04aac62e084e0540cd.1358509450.git.constantinx.musca@intel.com>
	<20130118122314.GA23233@jama.palm1.palmone.com>
In-Reply-To: <20130118122314.GA23233@jama.palm1.palmone.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] packagegroup-core-gtk-directfb: rename to packagegroup-core-directfb
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
X-List-Received-Date: Fri, 18 Jan 2013 13:01:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/18/2013 02:23 PM, Martin Jansa wrote:
> On Fri, Jan 18, 2013 at 01:48:29PM +0200, Constantin Musca wrote:
>> - DirectFB is not supported by gtk versions >= 2.18
>> - remove the backwards compatibility statements (packagegroup-core-directfb
>> is an independent packagegroup)
> And what will happen with task-core-gtk-directfb-base/
> packagegroup-core-gtk-directfb packages already installed on targets?
>
> It's also possible that someone still with task-core-gtk-directfb-base
> will decide that now it's right time to do upgrade..
>
> Cheers,
We decided to remove the backwards compatibility statements because the 
patch adds basically a new
packagegroup (different from 
task-core-gtk-directfb-base/packagegroup-core-gtk-directfb).

Cheers,
Constantin
>> - remove all gtk dependencies
>>
>> [YOCTO #3642]
>>
>> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
>> ---
>>   ...oup-core-gtk-directfb.bb => packagegroup-core-directfb.bb} | 11 ++---------
>>   1 file changed, 2 insertions(+), 9 deletions(-)
>>   rename meta/recipes-graphics/packagegroups/{packagegroup-core-gtk-directfb.bb => packagegroup-core-directfb.bb} (49%)
>>
>> diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-gtk-directfb.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb
>> similarity index 49%
>> rename from meta/recipes-graphics/packagegroups/packagegroup-core-gtk-directfb.bb
>> rename to meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb
>> index 55b0b9d..aca3a67 100644
>> --- a/meta/recipes-graphics/packagegroups/packagegroup-core-gtk-directfb.bb
>> +++ b/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb
>> @@ -1,14 +1,9 @@
>> -SUMMARY = "GTK+ over DirectFB without X11"
>> -PR = "r1"
>> +SUMMARY = "DirectFB without X11"
>> +PR = "r0"
>>   LICENSE = "MIT"
>>   
>>   inherit packagegroup
>>   
>> -# For backwards compatibility after rename
>> -RPROVIDES_${PN} = "task-core-gtk-directfb-base"
>> -RREPLACES_${PN} = "task-core-gtk-directfb-base"
>> -RCONFLICTS_${PN} = "task-core-gtk-directfb-base"
>> -
>>   TOUCH = ' ${@base_contains("MACHINE_FEATURES", "touchscreen", "tslib tslib-calibrate tslib-tests", "",d)}'
>>   
>>   RDEPENDS_${PN} = " \
>> @@ -17,7 +12,5 @@ RDEPENDS_${PN} = " \
>>   		pango \
>>   		pango-modules \
>>   		fontconfig \
>> -		gtk+ \
>> -		gtk-demo \
>>   		${TOUCH} \
>>   "
>> -- 
>> 1.7.11.7
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



