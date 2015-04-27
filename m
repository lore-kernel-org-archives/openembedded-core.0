Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4949665CAC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 13:51:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3RDpGfK005963
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 27 Apr 2015 06:51:16 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 27 Apr 2015 06:51:16 -0700
Message-ID: <553E3ED4.8010609@windriver.com>
Date: Mon, 27 Apr 2015 09:51:16 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1429891826.git.bruce.ashfield@windriver.com>	
	<5d547cf241f2c8bdc7438362729aaec27b0aa494.1429891826.git.bruce.ashfield@windriver.com>
	<1430126328.13022.93.camel@linuxfoundation.org>
In-Reply-To: <1430126328.13022.93.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] kern-tools: unify meta directory detection
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
X-List-Received-Date: Mon, 27 Apr 2015 13:51:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-04-27 05:18 AM, Richard Purdie wrote:
> On Fri, 2015-04-24 at 12:13 -0400, Bruce Ashfield wrote:
>> It is possible that recipe specific tasks, or build processes drop
>> files into the kernel source directory. These files can cause problems
>> with the meta data detection in the kern-tools.
>>
>> With this change, we have a single unified meta data detection routine,
>> that logs the result in a new file ".metadir", which subsequent scripts
>> can find, and use, thereby avoid repeating the same check many times.
>>
>> We also enhance the check to look for a sentinel file in a proper meta
>> directory, to avoid false positives when an unexpected kernel process
>> leaves an uncommitted directory in the kernel dir.
>>
>> [YOCTO: #7441]
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>   meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>> index a1ec198fde7f..e83f195a5393 100644
>> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=d8d1d729a70c
>>
>>   DEPENDS = "git-native"
>>
>> -SRCREV = "83e5493ea46067152609008ade131971eaebbb27"
>> +SRCREV = "79bc82453c26d426d3d8fd05d5da37cf5fc4068c"
>>   PR = "r12"
>>   PV = "0.2+git${SRCPV}"
>
> There is no such revision in the repo? The test builds all failed...

what ? I made that change ages ago .. I wonder if I squirreled
it away on a branch.

I should just remember to never send changes on Friday.

Fixed now.

Bruce

>
> Cheers,
>
> Richard
>
>
>


