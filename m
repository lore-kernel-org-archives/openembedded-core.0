Return-Path: <Li.Zhou@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D62A0731A4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 07:53:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u217rkpK006260
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 29 Feb 2016 23:53:47 -0800
Received: from [128.224.162.243] (128.224.162.243) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 29 Feb 2016 23:53:45 -0800
Message-ID: <56D54A81.8000704@windriver.com>
Date: Tue, 1 Mar 2016 15:53:37 +0800
From: "Zhou, Li" <li.zhou@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1456798957-22223-1-git-send-email-li.zhou@windriver.com>
	<CAMKF1so9u_czYvBO_mhk6tf8-SCw2jSh4dd7rMvFJJF6VqT1BA@mail.gmail.com>
In-Reply-To: <CAMKF1so9u_czYvBO_mhk6tf8-SCw2jSh4dd7rMvFJJF6VqT1BA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: add TUNE_CCARGS for CFLAGS_FOR_TARGET of gcc-cross-canadian
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
X-List-Received-Date: Tue, 01 Mar 2016 07:53:51 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Please refer to Peter Seebach's patch earlier:
http://lists.openembedded.org/pipermail/openembedded-core/2016-January/115472.html
My patch should be based on that.
I think the change is not only for canadian build. Thanks.

On 03/01/2016 02:12 PM, Khem Raj wrote:
> On Mon, Feb 29, 2016 at 6:22 PM, Li Zhou <li.zhou@windriver.com> wrote:
>> Add TUNE_CCARGS for CFLAGS_FOR_TARGET of gcc-cross-canadian to solve
>> below errors when compiling gcc-cross-canadian-powerpc64 within a debug
>> build:
>>
>> configure:3655: checking for suffix of object files
>> configure:3677:  powerpc64-wrs-linux-gcc --sysroot=......bitbake_build/
>> tmp/sysroots/fsl-t2xxx -isystem=/usr/include --sysroot=....../
>> bitbake_build/tmp/sysroots/fsl-t2xxx   -c -O0 -fno-omit-frame-pointer -g
>> -pipe -g -Os  conftest.c >&5
>> {standard input}: Assembler messages:
>> {standard input}:23: Error: register save offset not a multiple of 8
>> {standard input}:24: Error: register save offset not a multiple of 8
>>
>> Signed-off-by: Li Zhou <li.zhou@windriver.com>
>> ---
>>   meta/recipes-devtools/gcc/gcc-cross-canadian.inc |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
>> index ec1d281..04ae981 100644
>> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
>> @@ -51,7 +51,7 @@ do_configure () {
>>          export CPPFLAGS_FOR_BUILD="${BUILD_CPPFLAGS}"
>>          export CXXFLAGS_FOR_BUILD="${BUILD_CXXFLAGS}"
>>          export LDFLAGS_FOR_BUILD="${BUILD_LDFLAGS}"
>> -       export CFLAGS_FOR_TARGET="${TARGET_CFLAGS}"
>> +       export CFLAGS_FOR_TARGET="${TARGET_CFLAGS} ${TUNE_CCARGS}"
> Will this cause canadian builds to become too specific instead of
> generic common arch
>
>>          export CPPFLAGS_FOR_TARGET="${TARGET_CPPFLAGS}"
>>          export CXXFLAGS_FOR_TARGET="${TARGET_CXXFLAGS}"
>>          export LDFLAGS_FOR_TARGET="${TARGET_LDFLAGS}"
>> --
>> 1.7.9.5
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
Best Regards!
Zhou Li
Phone number: 86-10-84778511


