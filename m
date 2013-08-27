Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8D1C76BA1B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 06:52:45 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 26 Aug 2013 23:52:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,966,1367996400"; d="scan'208";a="392524403"
Received: from unknown (HELO [10.255.14.139]) ([10.255.14.139])
	by fmsmga002.fm.intel.com with ESMTP; 26 Aug 2013 23:52:45 -0700
Message-ID: <521C4CBD.3070506@linux.intel.com>
Date: Mon, 26 Aug 2013 23:52:45 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Li Zhijian <lizhijian@cn.fujitsu.com>
References: <1377596639-26980-1-git-send-email-lizhijian@cn.fujitsu.com>
	<521BFA2A.4090508@linux.intel.com>
	<521C2BDB.3020503@cn.fujitsu.com>
In-Reply-To: <521C2BDB.3020503@cn.fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] grep-2.5.1a: fix grep for LSB compliance
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
X-List-Received-Date: Tue, 27 Aug 2013 06:52:46 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08/26/2013 09:32 PM, Li Zhijian wrote:
> ...skip... at 2013-8-27 9:00, Saul Wold wrote:
>>> diff --git a/meta/recipes-extended/grep/grep_2.5.1a.bb
>>> b/meta/recipes-extended/grep/grep_2.5.1a.bb index
>>> 088959c..d964d84 100644 ---
>>> a/meta/recipes-extended/grep/grep_2.5.1a.bb +++
>>> b/meta/recipes-extended/grep/grep_2.5.1a.bb @@ -5,7 +5,7 @@
>>> SECTION = "console/utils" LICENSE = "GPLv2" LIC_FILES_CHKSUM =
>>> "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
>>>
>>> -PR = "r2" +PR = "r3"
>>>
>>> SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.bz2 \
>>> file://uclibc-fix.patch \ @@ -13,8 +13,25 @@ SRC_URI =
>>> "${GNU_MIRROR}/grep/grep-${PV}.tar.bz2 \ file://gettext.patch \
>>> file://fix64-int-to-pointer.patch \ file://Makevars \ -
>>> file://grep-CVE-2012-5667.patch \
>>
>> Why are you removing this patch?
>>
>> Will an update to 2.5.3 accomplish the same thing as these
>> patches?
>>
>> Also all of your patches above are missing Upstream-Status and
>> Signed-off-by:
>>
>> See the Patch Guildlines on OE-Core:
>> http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
>>
>> Thanks
>>
>> Sau!
>>
>>
> ...skip...
>>> + file://grep-CVE-2012-5667.patch \
> ...skip...
>
> Thank a lots for your comments.
>
> This patch is not removed ,it is here ↑
>
> I don't know what's fixed bettwen 2.5.1a an 2.5.3, but grep-2.5.3
> LICENSE is GPLv3+ differed from 2.5.1a(GPLv2)
>
> The Guildlines is very helpful for me. But those patch is come from
> grep-2.5.1-55.el5.src.rpm and I have not research this patch's
> Upstream-Status and Signed-off-by So I am sorry about that
>

Please review the recipes and licenesing, since it seems the we might
have multiple versions and the license fields are incorrect for both.

If there are both v2 and v3 versions, we need to ensure which is correct.

Thanks
	Sau!

> Thanks Li,
>
>
>

