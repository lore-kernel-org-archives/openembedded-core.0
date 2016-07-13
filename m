Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 16C6D6067C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 20:05:06 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 13 Jul 2016 13:05:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,359,1464678000"; d="scan'208";a="138671919"
Received: from mlopezva-mobl2.zpn.intel.com (HELO [10.219.5.49])
	([10.219.5.49])
	by fmsmga004.fm.intel.com with ESMTP; 13 Jul 2016 13:05:07 -0700
To: benjamin.esquivel@intel.com, openembedded-core@lists.openembedded.org
References: <cover.1468328858.git.mariano.lopez@linux.intel.com>
	<54304422afaa3f1b3c8504f9bf2e8e74b9f15837.1468328858.git.mariano.lopez@linux.intel.com>
	<008101d1dd10$397e5190$ac7af4b0$@linux.intel.com>
From: Mariano Lopez <mariano.lopez@linux.intel.com>
Message-ID: <57869F02.6070105@linux.intel.com>
Date: Wed, 13 Jul 2016 15:05:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <008101d1dd10$397e5190$ac7af4b0$@linux.intel.com>
Subject: Re: [PATCH 1/1] selftest/seltest.py: Add test to check imports from other layers
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
X-List-Received-Date: Wed, 13 Jul 2016 20:05:08 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 07/13/2016 09:09 AM, Benjamin Esquivel wrote:
> Comments below
>
> The test looks good.
>
>> --- /dev/null
>> +++ b/meta-selftest/lib/oeqa/selftest/imported.py
>> @@ -0,0 +1,14 @@
>> +from oeqa.selftest.base import oeSelfTest from oeqa.utils.decorators
>> +import testcase
>> +
>> +class ImportedTests(oeSelfTest):
>> +
>> +    def test_import_dummy(self):
> There is a bug where I am proposing some changes to the naming of the tests.
> I'll take this test name as an example:
> imported.ImportedTests.test_import_dummy. With my proposal I'd name this
> test something more along these lines:
> external_layer.ImportedTests.test_inconditional_pass.

I'll send v2 with the revised name

Mariano Lopez

