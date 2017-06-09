Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym03.jp.fujitsu.com (mgwym03.jp.fujitsu.com [211.128.242.42])
	by mail.openembedded.org (Postfix) with ESMTP id D83657199E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 04:56:42 +0000 (UTC)
Received: from yt-mxq.gw.nic.fujitsu.com (unknown [192.168.229.66]) by
	mgwym03.jp.fujitsu.com with smtp
	id 1fea_56ba_ab6fafed_c43e_416d_b1be_ebf08ff080f5;
	Fri, 09 Jun 2017 13:56:36 +0900
Received: from m3051.s.css.fujitsu.com (m3051.s.css.fujitsu.com
	[10.134.21.209])
	by yt-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id 8D280AC0125
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 13:56:36 +0900 (JST)
Received: from omame (omame.fct.css.fujitsu.com [10.24.14.171])
	by m3051.s.css.fujitsu.com (Postfix) with ESMTP id 79D37286;
	Fri,  9 Jun 2017 13:56:36 +0900 (JST)
Received: from [10.24.19.99] (fan1.utsfd.cs.fujitsu.co.jp [10.24.19.99])
	by omame (Postfix) with ESMTPSA id 636471E0074;
	Fri,  9 Jun 2017 13:56:36 +0900 (JST)
To: Khem Raj <raj.khem@gmail.com>
References: <1496972359-6459-1-git-send-email-fan.xin@jp.fujitsu.com>
	<CAMKF1sqtRLkSFJMJ1zBHnMhX_4Sxa-sXUexL=tYJLwsL3m4Jaw@mail.gmail.com>
From: Fan Xin <fan.xin@jp.fujitsu.com>
Message-ID: <2518bbbd-5ed7-99ae-6cda-58d7a300a359@jp.fujitsu.com>
Date: Fri, 9 Jun 2017 13:57:58 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqtRLkSFJMJ1zBHnMhX_4Sxa-sXUexL=tYJLwsL3m4Jaw@mail.gmail.com>
X-TM-AS-MML: disable
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] flex: Upgrade to 2.6.4
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
X-List-Received-Date: Fri, 09 Jun 2017 04:56:47 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

OK, send this to meta-oe for test.

Fan Xin

On 2017年06月09日 10:42, Khem Raj wrote:
> On Thu, Jun 8, 2017 at 6:39 PM, Fan Xin <fan.xin@jp.fujitsu.com> wrote:
>> 1. Upgrade flex from 2.6.0 to 2.6.4
>>
>> 2. Change the SRC_URI
>>     Change SRC_URI from sourceforge to github due to the flex on sourceforge has not been updated more than one year.
>>
> 
> how has it been tested ?
> I think it needs to be tested with meta-oe before it gets into OE-core.
> 
>> Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
>> ---
>>   meta/recipes-devtools/flex/{flex_2.6.0.bb => flex_2.6.4.bb} | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>   rename meta/recipes-devtools/flex/{flex_2.6.0.bb => flex_2.6.4.bb} (90%)
>>
>> diff --git a/meta/recipes-devtools/flex/flex_2.6.0.bb b/meta/recipes-devtools/flex/flex_2.6.4.bb
>> similarity index 90%
>> rename from meta/recipes-devtools/flex/flex_2.6.0.bb
>> rename to meta/recipes-devtools/flex/flex_2.6.4.bb
>> index ab35b09..038aa37 100644
>> --- a/meta/recipes-devtools/flex/flex_2.6.0.bb
>> +++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
>> @@ -10,7 +10,7 @@ BBCLASSEXTEND = "native nativesdk"
>>
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=e4742cf92e89040b39486a6219b68067"
>>
>> -SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 \
>> +SRC_URI = "https://github.com/westes/flex/files/981163/${PN}-${PV}.tar.gz \
>>              file://run-ptest \
>>              file://do_not_create_pdf_doc.patch \
>>              file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
>> @@ -19,8 +19,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 \
>>              ${@bb.utils.contains('PTEST_ENABLED', '1', '', 'file://disable-tests.patch', d)} \
>>              "
>>
>> -SRC_URI[md5sum] = "266270f13c48ed043d95648075084d59"
>> -SRC_URI[sha256sum] = "24e611ef5a4703a191012f80c1027dc9d12555183ce0ecd46f3636e587e9b8e9"
>> +SRC_URI[md5sum] = "2882e3179748cc9f9c23ec593d6adc8d"
>> +SRC_URI[sha256sum] = "e87aae032bf07c26f85ac0ed3250998c37621d95f8bd748b31f15b33c45ee995"
>>
>>   # Flex has moved to github from 2.6.1 onwards
>>   UPSTREAM_CHECK_URI = "https://github.com/westes/flex/releases"
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
=====================================================
株式会社富士通コンピュータテクノロジーズ
組込みシステム技術統括部　第一ファームウェア技術部
樊　昕 Fan Xin
fan.xin@jp.fujitsu.com

┏┓ ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
┗■ 【ubinux V15】のリリースを開始しました！
「SDN(Open vSwitch)」や「クラウド管理(OpenStack Heat）」などに対応
---------------------------------------------------------------------
詳細＞＞http://elsc.utsfd.cs.fujitsu.co.jp/location_elsc.php?id=0024
※"ubinux"は組込み装置向け当社独自のLinuxディストリビューションです
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

