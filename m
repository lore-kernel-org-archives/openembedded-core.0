Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A5D107E796
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 12:36:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5DCZSkh018928
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 13 Jun 2019 05:35:38 -0700
Received: from [128.224.162.157] (128.224.162.157) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 13 Jun 2019 05:35:17 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1560413184-99289-1-git-send-email-hongxu.jia@windriver.com>
	<CAJTo0Lbkn3Lty9JV14KDmAvdY0eWiPqqGVAxo+ByP=DA6jsEwQ@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <6d6a6865-52fc-647e-e1a8-b412d9a80bc0@windriver.com>
Date: Thu, 13 Jun 2019 20:35:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lbkn3Lty9JV14KDmAvdY0eWiPqqGVAxo+ByP=DA6jsEwQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] diffutils/run-ptest: support to run at arbitrary path
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
X-List-Received-Date: Thu, 13 Jun 2019 12:36:05 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 6/13/19 6:07 PM, Burton, Ross wrote:
> Are you going to fix all of the other recipes?  Very few recipes let
> you run the tests from an arbitrary directory, and assume that you're
> in the test directory already.

Only focus on this recipe, my original task is to resolve 2. Fix 
large-subopt.in1 not found,

and 1 is my deeper improvement. I know most of ptest require to run in 
specific dir

//Hongxu


> Ross
>
> On Thu, 13 Jun 2019 at 09:08, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> 1. Run run-ptest at arbitrary path
>>
>> 2. Fix large-subopt.in1 not found
>> ...
>> |diff: /lib32-diffutils/3.7-r0/build/../diffutils-3.7/tests/large-subopt.in1:
>> No such file or directory
>> |diff: /lib32-diffutils/3.7-r0/build/../diffutils-3.7/tests/large-subopt.in2:
>> No such file or directory
>> ...
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/recipes-extended/diffutils/diffutils/run-ptest | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-extended/diffutils/diffutils/run-ptest b/meta/recipes-extended/diffutils/diffutils/run-ptest
>> index 695c5e8a7b..ad467d9bd0 100644
>> --- a/meta/recipes-extended/diffutils/diffutils/run-ptest
>> +++ b/meta/recipes-extended/diffutils/diffutils/run-ptest
>> @@ -1,3 +1,4 @@
>>   #!/bin/sh
>>
>> -make -C tests check-TESTS
>> +abs_ptestdir=`echo "$(cd "$(dirname "$0")"; pwd)"`
>> +make -C $abs_ptestdir/tests check-TESTS abs_top_srcdir="$abs_ptestdir"
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core



