Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 461FE74CB4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 02:03:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Oct 2018 19:03:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,342,1534834800"; d="scan'208";a="97568726"
Received: from nadiahmx-mobl.gar.corp.intel.com (HELO [10.255.170.29])
	([10.255.170.29])
	by orsmga002.jf.intel.com with ESMTP; 04 Oct 2018 18:59:21 -0700
To: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	openembedded-core@lists.openembedded.org
References: <20181004050917.16006-1-anuj.mittal@intel.com>
	<20181004050917.16006-2-anuj.mittal@intel.com>
	<ce9fd909-e46b-202c-cde8-5628ca87df9f@xilinx.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <82a20bf4-6fd9-7a87-b5e0-540daa8ce912@intel.com>
Date: Fri, 5 Oct 2018 09:59:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <ce9fd909-e46b-202c-cde8-5628ca87df9f@xilinx.com>
Subject: Re: [PATCH 2/2] python: consolidate common patches
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
X-List-Received-Date: Fri, 05 Oct 2018 02:03:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/05/2018 03:54 AM, Alejandro Enedino Hernandez Samaniego wrote:
> Hey Anuj,
> 
> 
> On 10/03/2018 10:09 PM, Anuj Mittal wrote:
>> Move inclusion of common patches to .inc to simplify things a bit.
>>
>> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
>> ---
>>   meta/recipes-devtools/python/python-native_2.7.15.bb | 3 ---
>>   meta/recipes-devtools/python/python.inc              | 3 +++
>>   meta/recipes-devtools/python/python_2.7.15.bb        | 3 ---
>>   3 files changed, 3 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/python/python-native_2.7.15.bb b/meta/recipes-devtools/python/python-native_2.7.15.bb
>> index 7c491fa3e0..ee2ec1082a 100644
>> --- a/meta/recipes-devtools/python/python-native_2.7.15.bb
>> +++ b/meta/recipes-devtools/python/python-native_2.7.15.bb
>> @@ -11,10 +11,7 @@ SRC_URI += "\
>>               file://debug.patch \
>>               file://unixccompiler.patch \
>>               file://nohostlibs.patch \
>> -            file://multilib.patch \
>> -            file://add-md5module-support.patch \
>>               file://builddir.patch \
>> -            file://parallel-makeinst-create-bindir.patch \
>>               file://revert_use_of_sysconfigdata.patch \
>>              "
>>   
>> diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
>> index 66923678b1..38cc79cb41 100644
>> --- a/meta/recipes-devtools/python/python.inc
>> +++ b/meta/recipes-devtools/python/python.inc
>> @@ -13,6 +13,9 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>>              file://0003-bpo-34834-Fix-test_ssl.test_options-to-account-for-O.patch \
>>              file://0004-bpo-34836-fix-test_default_ecdh_curve-needs-no-tlsv1.patch \
>>              file://0001-bpo-33354-Fix-test_ssl-when-a-filename-cannot-be-enc.patch \
> 
> The multilib.patch is actually a different file for the native and 
> target packages, I suggest we rename it and keep it on each recipe 
> separately.
> 

Thanks Alejandro for checking. You're right. Both patches look like they
are doing the exact same thing though and perhaps one of them should be
removed. But, this patch was supposed to be a trivial cleanup.

So, can this (2/2 only) be ignored please? I will take a look at it
later after the release.

Thanks,

Anuj

