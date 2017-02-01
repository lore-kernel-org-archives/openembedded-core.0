Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0566877316
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 14:55:02 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 01 Feb 2017 06:55:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,320,1477983600"; d="scan'208";a="928979436"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.128.141])
	([10.219.128.141])
	by orsmga003.jf.intel.com with ESMTP; 01 Feb 2017 06:55:02 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <cover.1485902097.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<6e39192de91d20d920b9f4982e669874aa659625.1485902097.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<1485904618.14144.19.camel@linuxfoundation.org>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <c3a990d7-237d-e433-ae02-8bfe7214c162@linux.intel.com>
Date: Wed, 1 Feb 2017 09:02:13 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <1485904618.14144.19.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/4] selftest/buildoptions: use a thinner image to test 'read-only-rootfs' feature
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
X-List-Received-Date: Wed, 01 Feb 2017 14:55:04 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01/31/2017 05:16 PM, Richard Purdie wrote:
> On Tue, 2017-01-31 at 16:50 -0600,
> leonardo.sandoval.gonzalez@linux.intel.com wrote:
>> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>>
>> The minimal is much faster to build that sato, so use the former to
>> test
>> read-only feature.
>>
>> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.in
>> tel.com>
>> ---
>>   meta/lib/oeqa/selftest/buildoptions.py | 5 +----
>>   1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/meta/lib/oeqa/selftest/buildoptions.py
>> b/meta/lib/oeqa/selftest/buildoptions.py
>> index d40eb00..004b2dd 100644
>> --- a/meta/lib/oeqa/selftest/buildoptions.py
>> +++ b/meta/lib/oeqa/selftest/buildoptions.py
>> @@ -44,11 +44,8 @@ class ImageOptionsTests(oeSelfTest):
>>   
>>       @testcase(1435)
>>       def test_read_only_image(self):
>> -        distro_features = get_bb_var('DISTRO_FEATURES')
>> -        if not ('x11' in distro_features and 'opengl' in
>> distro_features):
>> -            self.skipTest('core-image-sato requires x11 and opengl
>> in distro features')
>>           self.write_config('IMAGE_FEATURES += "read-only-rootfs"')
>> -        bitbake("core-image-sato")
>> +        bitbake("core-image-minimal")
>>           # do_image will fail if there are any pending postinsts
> Whilst this is certainly going to be a touch faster, I believe we do
> want to test read only rootfs with a larger image like sato to make
> sure the postinsts really do work with a read only system?

I don't get it. What would make the test different using a larger image?
>
> Cheers,
>
> Richard
>


