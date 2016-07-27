Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0C70D606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 08:02:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6R82icD004422
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 27 Jul 2016 01:02:44 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 27 Jul 2016 01:02:43 -0700
To: "Mittal, AnujX" <anujx.mittal@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <cover.1467700975.git.liezhi.yang@windriver.com>
	<DFCB2C9E62139C41B3FDE8F2B4659331D3778A@PGSMSX101.gar.corp.intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <57986AA2.9070509@windriver.com>
Date: Wed, 27 Jul 2016 16:02:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <DFCB2C9E62139C41B3FDE8F2B4659331D3778A@PGSMSX101.gar.corp.intel.com>
Subject: Re: [PATCH 0/6] [jethro] Consolidated pull
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
X-List-Received-Date: Wed, 27 Jul 2016 08:02:47 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Mittal,

They are merged into jethro now.

// Robert

On 07/21/2016 11:52 AM, Mittal, AnujX wrote:
> Just wanted to check - when will these changes be merged in Jethro?
>
> Thanks,
>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Robert Yang
>> Sent: Tuesday, July 05, 2016 2:44 PM
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [PATCH 0/6] [jethro] Consolidated pull
>>
>> The following changes since commit
>> 1f4bfa33073584c25396d74f3929f263f3df188b:
>>
>>    toasterconf.json: exclude releases Toaster can't build (2016-06-03 13:36:19
>> +0100)
>>
>> are available in the git repository at:
>>
>>    git://git.openembedded.org/openembedded-core-contrib rbt/jethro-next
>>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-
>> contrib/log/?h=rbt/jethro-next
>>
>> Anuj Mittal (1):
>>    gcc: make sure header path is set correctly
>>
>> Armin Kuster (2):
>>    tzcode: update to 2016e
>>    tzdata: update to 2016e
>>
>> Enrico Jorns (1):
>>    perl-ptest.inc: fix tar call to prevent objcopy failure
>>
>> George McCollister (1):
>>    wic: fix path parsing, use last occurrence
>>
>> Nicolas Dechesne (1):
>>    bluez5: move btmgmt to common READLINE section
>>
>>   meta/recipes-connectivity/bluez5/bluez5_5.33.bb                  | 2 +-
>>   meta/recipes-devtools/gcc/gcc-target.inc                         | 1 -
>>   meta/recipes-devtools/perl/perl-ptest.inc                        | 4 ++--
>>   .../tzcode/{tzcode-native_2016d.bb => tzcode-native_2016e.bb}    | 9 +++++----
>>   .../recipes-extended/tzdata/{tzdata_2016d.bb => tzdata_2016e.bb} | 4 ++--
>>   scripts/lib/wic/plugin.py                                        | 2 +-
>>   6 files changed, 11 insertions(+), 11 deletions(-)
>>   rename meta/recipes-extended/tzcode/{tzcode-native_2016d.bb => tzcode-
>> native_2016e.bb} (67%)
>>   rename meta/recipes-extended/tzdata/{tzdata_2016d.bb => tzdata_2016e.bb}
>> (98%)
>>
>> --
>> 2.8.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

