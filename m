Return-Path: <Li.Zhou@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C7A3C731C4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 09:45:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u249jSr9013027
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 4 Mar 2016 01:45:28 -0800 (PST)
Received: from [128.224.162.243] (128.224.162.243) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 4 Mar 2016 01:45:27 -0800
Message-ID: <56D95932.8000609@windriver.com>
Date: Fri, 4 Mar 2016 17:45:22 +0800
From: "Zhou, Li" <li.zhou@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj
	<raj.khem@gmail.com>
References: <1456798957-22223-1-git-send-email-li.zhou@windriver.com>	
	<CAMKF1so9u_czYvBO_mhk6tf8-SCw2jSh4dd7rMvFJJF6VqT1BA@mail.gmail.com>	
	<56D54A81.8000704@windriver.com>
	<1456831651.25131.1.camel@linuxfoundation.org>
In-Reply-To: <1456831651.25131.1.camel@linuxfoundation.org>
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
X-List-Received-Date: Fri, 04 Mar 2016 09:45:32 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Richard:
           Could you please give me some information about how to do 
"selftests for sstate sigs"? Thank you.

On 03/01/2016 07:27 PM, Richard Purdie wrote:
> On Tue, 2016-03-01 at 15:53 +0800, Zhou, Li wrote:
>> Please refer to Peter Seebach's patch earlier:
>> http://lists.openembedded.org/pipermail/openembedded-core/2016-Januar
>> y/115472.html
>> My patch should be based on that.
>> I think the change is not only for canadian build. Thanks.
>>
>> On 03/01/2016 02:12 PM, Khem Raj wrote:
>>> On Mon, Feb 29, 2016 at 6:22 PM, Li Zhou <li.zhou@windriver.com>
>>> wrote:
>>>> Add TUNE_CCARGS for CFLAGS_FOR_TARGET of gcc-cross-canadian to
>>>> solve
>>>> below errors when compiling gcc-cross-canadian-powerpc64 within a
>>>> debug
>>>> build:
>>>>
>>>> configure:3655: checking for suffix of object files
>>>> configure:3677:  powerpc64-wrs-linux-gcc -
>>>> -sysroot=......bitbake_build/
>>>> tmp/sysroots/fsl-t2xxx -isystem=/usr/include --sysroot=....../
>>>> bitbake_build/tmp/sysroots/fsl-t2xxx   -c -O0 -fno-omit-frame
>>>> -pointer -g
>>>> -pipe -g -Os  conftest.c >&5
>>>> {standard input}: Assembler messages:
>>>> {standard input}:23: Error: register save offset not a multiple
>>>> of 8
>>>> {standard input}:24: Error: register save offset not a multiple
>>>> of 8
>>>>
>>>> Signed-off-by: Li Zhou <li.zhou@windriver.com>
>>>> ---
>>>>    meta/recipes-devtools/gcc/gcc-cross-canadian.inc |    2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
>>>> b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
>>>> index ec1d281..04ae981 100644
>>>> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
>>>> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
>>>> @@ -51,7 +51,7 @@ do_configure () {
>>>>           export CPPFLAGS_FOR_BUILD="${BUILD_CPPFLAGS}"
>>>>           export CXXFLAGS_FOR_BUILD="${BUILD_CXXFLAGS}"
>>>>           export LDFLAGS_FOR_BUILD="${BUILD_LDFLAGS}"
>>>> -       export CFLAGS_FOR_TARGET="${TARGET_CFLAGS}"
>>>> +       export CFLAGS_FOR_TARGET="${TARGET_CFLAGS}
>>>> ${TUNE_CCARGS}"
>>> Will this cause canadian builds to become too specific instead of
>>> generic common arch
> I agree with Khem, I think there are potential problems this
> introduces. Did you try running the selftests for sstate sigs with this
> change? I suspect it breaks :(
>
> Cheers,
>
> Richard

-- 
Best Regards!
Zhou Li
Phone number: 86-10-84778511


