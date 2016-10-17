Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 17EB6607A2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 15:58:39 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP; 17 Oct 2016 08:58:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,357,1473145200"; d="scan'208";a="890830233"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.5.38])
	([10.219.5.38])
	by orsmga003.jf.intel.com with ESMTP; 17 Oct 2016 08:58:40 -0700
To: Joshua Lock <joshua.g.lock@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<770d29435af19aed00bd15d8b95504218ad600ec.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<1476688143.2604.9.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <edfa40f8-d933-9851-5536-4cd63bcf52ba@linux.intel.com>
Date: Mon, 17 Oct 2016 11:02:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1476688143.2604.9.camel@linux.intel.com>
Subject: Re: [PATCH 7/9] selftest: skip runtime-test's test_testimage_install on poky-tiny distro
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
X-List-Received-Date: Mon, 17 Oct 2016 15:58:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/17/2016 02:09 AM, Joshua Lock wrote:
> On Fri, 2016-10-14 at 11:40 -0500,
> leonardo.sandoval.gonzalez@linux.intel.com wrote:
>> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>>
>> Distro poky-tiny cannot build the core-image-full-cmdline image, so
>> skip the
>> test if this is the case.
>>
>> [YOCTO #8525]
> Wouldn't it be better to use a different image, most likely with extra
> packages installed, and maybe a different list of TEST_SUITES for poky-
> tiny so that we're still testing this functionality on poky-tiny?

Yes, that is a good idea. Which image and the accompanied tests do you 
suggest?


> Thanks,
>
> Joshua
>
>> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.in
>> tel.com>
>> ---
>>   meta/lib/oeqa/selftest/runtime-test.py | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/lib/oeqa/selftest/runtime-test.py
>> b/meta/lib/oeqa/selftest/runtime-test.py
>> index c2d5b45..e17c261 100644
>> --- a/meta/lib/oeqa/selftest/runtime-test.py
>> +++ b/meta/lib/oeqa/selftest/runtime-test.py
>> @@ -94,6 +94,8 @@ class TestImage(oeSelfTest):
>>           Product: oe-core
>>           Author: Mariano Lopez <mariano.lopez@intel.com>
>>           """
>> +        if self.distro == 'poky-tiny':
>> +            self.skipTest('core-image-full-cmdline not buildable for
>> poky-tiny')
>>   
>>           features = 'INHERIT += "testimage"\n'
>>           features += 'TEST_SUITES = "ping ssh selftest"\n'
>> -- 
>> 2.1.4
>>


