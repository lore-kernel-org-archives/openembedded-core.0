Return-Path: <mike.looijmans@topic.nl>
X-Greylist: delayed 335 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 02 Mar 2015 17:36:44 UTC
Received: from smtp07.online.nl (smtp07.online.nl [194.134.42.52])
	by mail.openembedded.org (Postfix) with ESMTP id 15AE47381F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 17:36:44 +0000 (UTC)
Received: from smtp07.online.nl (localhost [127.0.0.1])
	by smtp07.online.nl (Postfix) with ESMTP id 9A2D79844E;
	Mon,  2 Mar 2015 18:31:08 +0100 (CET)
Received: from [192.168.1.4] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp07.online.nl (Postfix) with ESMTP;
	Mon,  2 Mar 2015 18:31:08 +0100 (CET)
Message-ID: <54F49E5C.7020408@topic.nl>
Date: Mon, 02 Mar 2015 18:31:08 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <54F4798C.8070402@topic.nl>
	<5774096.IiVkEzFHVb@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <5774096.IiVkEzFHVb@peggleto-mobl5.ger.corp.intel.com>
X-Online-Scanned: by Cloudmark authority (on smtp07.online.nl)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Building with OpenMP support in OE fails on #include <omp.h>
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
X-List-Received-Date: Mon, 02 Mar 2015 17:36:48 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 02-03-15 16:45, Paul Eggleton wrote:
> Hi Mike,
>
> On Monday 02 March 2015 15:54:04 Mike Looijmans wrote:
>> Here's the problem, running in a devshell:
>>
>> # echo '#include <omp.h>' > /tmp/compileme.c
>> # $CC -c -fopenmp /tmp/compileme.c
>> /tmp/compileme.c:1:17: fatal error: omp.h: No such file or directory
>>    #include <omp.h>
>>                    ^
>> compilation terminated.
>>
>>
>> The #pragma's and linking of OpenMP work just fine, it's just the inclusion
>> of omp.h that appears to fail.
>>
>> What I was actually trying to do is to activate OpenMP in OpenCV to get
>> decent performance on a multicore ARM system. But this is holding me back
>> now.
>>
>> Looking in the sysroots reveals that the include file is actually there:
>>
>> $ find tmp-glibc/sysroots/topic-miami-florida-med-xc7z030 -name omp.h
>> tmp-glibc/sysroots/topic-miami-florida-med-xc7z030/usr/lib/gcc/arm-oe-linux-
>> gnueabi/4.9.1/include/omp.h
>
> Funnily enough this is an issue I fixed a few weeks ago - here's the bug which
> contains a link to the fix:
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=7141

Ah okay, I'll upgrade to current master and retest.

If it works, I'll post the patch to make opencv build with openmp.


-- 
Mike Looijmans

