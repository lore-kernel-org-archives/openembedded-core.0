Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 184E07F2AE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 18:24:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x85INSfC004976
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 5 Sep 2019 11:23:38 -0700
Received: from [128.224.56.214] (128.224.56.214) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 5 Sep 2019 11:23:17 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Peiran Hong
	<peiran.hong@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <20190905153846.11226-1-peiran.hong@windriver.com>
	<e492d6be1e469026e7132b3a6c78c2775c2eeca6.camel@linuxfoundation.org>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <8b46625d-8e49-4e41-c153-a7fd8f544bd1@windriver.com>
Date: Thu, 5 Sep 2019 14:23:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e492d6be1e469026e7132b3a6c78c2775c2eeca6.camel@linuxfoundation.org>
X-Originating-IP: [128.224.56.214]
Subject: Re: [PATCH] diffutils: Add valgrind to support ptest
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
X-List-Received-Date: Thu, 05 Sep 2019 18:24:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 9/5/19 12:57 PM, Richard Purdie wrote:
> On Thu, 2019-09-05 at 11:38 -0400, Peiran Hong wrote:
>> From: Peiran Hong <Peiran.Hong@windriver.com>
>>
>> The test "strip-trailing-cr" for diffutils package is skipped since
>> it requires
>> valgrind to run. This commit adds valgrind to the run-time dependency
>> of
>> the recipe for diffutils.
>>
>> Signed-off-by: Peiran Hong <Peiran.Hong@windriver.com>
>> ---
>>   meta/recipes-extended/diffutils/diffutils_3.7.bb | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-extended/diffutils/diffutils_3.7.bb
>> b/meta/recipes-extended/diffutils/diffutils_3.7.bb
>> index 7daeee3513..2d763633b6 100644
>> --- a/meta/recipes-extended/diffutils/diffutils_3.7.bb
>> +++ b/meta/recipes-extended/diffutils/diffutils_3.7.bb
>> @@ -17,7 +17,9 @@ acpaths = "-I ./m4"
>>   
>>   inherit ptest
>>   
>> -RDEPENDS_${PN}-ptest += "make"
>> +# Include valgrind since the test "strip-trailing-cr" requires it to
>> run, although
>> +# valgrind is a heavy package for diffutils
>> +RDEPENDS_${PN}-ptest += "make valgrind"
> 
> This effectively means "bitbake diffutils" now requires valgrind to
> build before it. I'm not sure its worth doing that for a single test?

I was on the fence as well but I thought we'd ask devs on the list by
sending the patch.

Peiran,

Please send a v2 that SKIPs the test.

../Randy

> 
> Cheers,
> 
> Richard
> 


-- 
# Randy MacLeod
# Wind River Linux

