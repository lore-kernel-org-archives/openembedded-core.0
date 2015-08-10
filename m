Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7EECD76728
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 01:27:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t7A1RCdZ010526
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 9 Aug 2015 18:27:12 -0700 (PDT)
Received: from [128.224.162.158] (128.224.162.158) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Sun, 9 Aug 2015 18:27:10 -0700
Message-ID: <55C7FDEC.3080200@windriver.com>
Date: Mon, 10 Aug 2015 09:27:08 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1438838323-25159-1-git-send-email-rongqing.li@windriver.com>
	<1438945513.30467.35.camel@linuxfoundation.org>
In-Reply-To: <1438945513.30467.35.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][v2] attr: drop sstate fix and narrow relative-libdir.patch to target
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
X-List-Received-Date: Mon, 10 Aug 2015 01:27:17 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年08月07日 19:05, Richard Purdie wrote:
> On Thu, 2015-08-06 at 13:18 +0800, rongqing.li@windriver.com wrote:
>> From: Roy Li <rongqing.li@windriver.com>
>>
>> The relative-libdir.patch is no longer needed for native since fix_symlink
>> for native has been added to revert what it done, Also this patch and
>> fix_symlink add a race condition since both libacl.so and libattr.so were
>> created, then removed, and then recreated.
>>
>> So Only keep relative-libdir.patch for the target.
>>
>> Signed-off-by: Roy Li <rongqing.li@windriver.com>
>> ---
>>   meta/recipes-support/attr/ea-acl.inc | 23 ++---------------------
>>   1 file changed, 2 insertions(+), 21 deletions(-)
>
> Failed on the autobuilder with:
> http://errors.yoctoproject.org/Errors/Details/14224/
>
> Cheers,
>
> Richard
>

sorry, I test the target and native, and did not test nativesdk,
I will fix it and send to v3.

-Roy

>
>

-- 
Best Reagrds,
Roy | RongQing Li

