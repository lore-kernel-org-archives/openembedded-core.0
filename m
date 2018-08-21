Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D568079234
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 20:25:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7LKPHSX017514
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 Aug 2018 13:25:17 -0700 (PDT)
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Tue, 21 Aug 2018 13:25:17 -0700
To: Andre McCurdy <armccurdy@gmail.com>
References: <20180821062333.21393-1-hongzhi.song@windriver.com>
	<84bd9292-69b4-bf25-6385-2c92df108651@windriver.com>
	<CAJ86T=UP_i1_dyk3PDy+x4FyMzphg-Xpy1SgeXErqn8RKDykaQ@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <f431e85e-3536-b339-0cea-d53fc95bb371@windriver.com>
Date: Tue, 21 Aug 2018 16:25:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAJ86T=UP_i1_dyk3PDy+x4FyMzphg-Xpy1SgeXErqn8RKDykaQ@mail.gmail.com>
X-Originating-IP: [172.25.44.4]
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runtime selftest: hw breakpoint case correct syntax
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
X-List-Received-Date: Tue, 21 Aug 2018 20:25:18 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 08/21/2018 03:02 PM, Andre McCurdy wrote:
> On Tue, Aug 21, 2018 at 8:30 AM, Randy MacLeod
> <randy.macleod@windriver.com> wrote:
>> On 08/21/2018 02:23 AM, Hongzhi.Song wrote:
>>>
>>> 1. There is a wrong syntax.
>>
>> Usually the word syntax refers to code and grammar refers
>> to English phrasing (but it's a weird language and the
>> rules are sometimes ignored).
>>
>>> 2. Since last commit has exclude the arm64, so remove arm64.
>>
>> What last commit? Please write the log help people who
>> have not been working on the patch.
>>
>> See:
>>     https://chris.beams.io/posts/git-commit/
>> for guidelines.
>>
>> Something like:
>>
>> Subject:
>>     runtime selftest: hw breakpoint drop arm64, correct grammar
>>
>> Improve grammar in skip test output.
> 
> I don't see any grammar fixes in the original patch? Just a syntax fix
> (adding a missing % to the format string).

Oops, you're right; my mistake.
Thanks,
../Randy

> 
>> Do not run the test for arm64 because commit XXXXXX did YYYYY.
>>
>>
>>
>> Thanks!
>>
>> ../Randy
>>>
>>>
>>> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
>>> ---
>>>    meta/lib/oeqa/runtime/cases/ksample.py | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/lib/oeqa/runtime/cases/ksample.py
>>> b/meta/lib/oeqa/runtime/cases/ksample.py
>>> index eb8713351a..0e00cdeeb6 100644
>>> --- a/meta/lib/oeqa/runtime/cases/ksample.py
>>> +++ b/meta/lib/oeqa/runtime/cases/ksample.py
>>> @@ -166,9 +166,9 @@ class KSampleTest(KSample):
>>>        def test_hw_breakpoint_example(self):
>>>            # check arch
>>>            status, output = self.target.run("uname -m")
>>> -        result = ("x86" in output) or ("aarch64" in output)
>>> +        result = "x86" in output
>>>            if not result:
>>> -            self.skipTest("the arch doesn't support hw breakpoint" %
>>> output)
>>> +            self.skipTest("the arch %s doesn't support hw breakpoint" %
>>> output)
>>>            # check config
>>>            self.check_config("CONFIG_KALLSYMS_ALL")
>>>            # make sure if module exists
>>>
>>
>>
>> --
>> # Randy MacLeod
>> # Wind River Linux
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


-- 
# Randy MacLeod
# Wind River Linux

