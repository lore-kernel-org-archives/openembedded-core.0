Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 609AE79B39
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 02:12:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9C2B7o3014836
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 11 Oct 2018 19:11:18 -0700
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Thu, 11 Oct 2018 19:10:36 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1539252978-415942-1-git-send-email-changqing.li@windriver.com>
	<3e9d30caac8e6139484154abf783bbc38dd2289b.camel@linuxfoundation.org>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <588816e9-df4c-6978-3728-8973f3a7b7b0@windriver.com>
Date: Fri, 12 Oct 2018 10:10:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <3e9d30caac8e6139484154abf783bbc38dd2289b.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.228]
Subject: Re: [PATCH V2] e2fsprogs: fix test f_detect_junk print error msg
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
X-List-Received-Date: Fri, 12 Oct 2018 02:12:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 10/12/2018 06:15 AM, Richard Purdie wrote:
> On Thu, 2018-10-11 at 18:16 +0800, changqing.li@windriver.com wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> 1. This test need to check config.h, so install it
>>
>> 2. Test script have problem when the file want to grep
>> don't exist, change the check command to fix this problem
>>
>> even we install the config.h,  but the script use relative path,
>> and will find the config.h decide by in which folder you run
>> the test scirpt. like below 2 cases, if without the fix of
>> check command, it will also met error msg in case (b). But, with
>> the fix, the problem can be fixed
>>
>> a) root@qemux86-64:/usr/lib/e2fsprogs/ptest/test# ./test_one
>> ./f_detect_junk
>> f_detect_junk: detect non-fs file data: ok
>>
>> b) root@qemux86-64:/usr/lib/e2fsprogs/ptest# ./test/test_one
>> ./test/f_detect_junk
>> grep: ../lib/config.h: No such file or directory
>> ./test/f_detect_junk/script: line 3: [: : integer expression expected
>> f_detect_junk: detect non-fs file data: ok
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> If you've fixed 1) then we don't need to carry the patch for 2)?
I agree with you. we can first do like this, I will resend a patch.
case b) is rare and not critial.
>
> Perhaps it should be sent upstream as an improvement to their code? I'm
> not sure I agree with the Upstream-Status.
>
> Regardless, I don't want to add a patch which we don't really need
> though...
I will report the patch as improvement to upstream.  Anyway,  the check 
command
change only can see as workaround,  the correct way should  not use 
relative path
, but use like top_builddir/lib/config.h.


//Sandy

> Cheers,
>
> Richard
>
>

-- 
BRs

Sandy(Li Changqing)
Wind River Linux


