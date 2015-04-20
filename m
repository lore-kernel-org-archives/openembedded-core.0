Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id AE6146E268
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 13:41:36 +0000 (UTC)
Received: by pabtp1 with SMTP id tp1so207177158pab.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 06:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=YGuApzcUtroU3ByazVkG47FIGnSLugW+ZDATqUSIE74=;
	b=UsQci/h+IfgBo9Kr0UpEV4X0mjlPUbhnSlbOfbcMLntIujxfhtqCPLhR6tzqq0kh8L
	BwWELBVns7Qmvl/td4Ydkom3H7dAMOPUPoxd6JtNv96uTYkGBo9kU+R2Vevq+g1AWsJg
	TjjksVK2rdXrdleTt80wg6/z5QbGDq38x6F9ys2LnOTkMPv1OOTgxCJrz5aOrHEneyNi
	7LtSx09j1/xKjmO1On+xE74FIxbn5OTeZeHbAVpN7PCloudCuU51c7XH9n7SW91IhMoy
	U5xt8EFMldSK4wNtePslg9q88pPw/cJk7su40s9EPKcVCauJO19t7N0bl/dkVbFDbxuw
	frmA==
X-Received: by 10.68.221.41 with SMTP id qb9mr28394543pbc.77.1429537297569;
	Mon, 20 Apr 2015 06:41:37 -0700 (PDT)
Received: from ?IPv6:2601:c:a700:3ba7:45ea:eda0:965e:15ae?
	([2601:c:a700:3ba7:45ea:eda0:965e:15ae])
	by mx.google.com with ESMTPSA id
	ux6sm18400267pab.24.2015.04.20.06.41.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Apr 2015 06:41:36 -0700 (PDT)
Message-ID: <5535020C.5070503@gmail.com>
Date: Mon, 20 Apr 2015 06:41:32 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
References: <1429479956-27143-1-git-send-email-akuster808@gmail.com>
	<CAHiDW_F1HTv9As6rd=Y82ttPaeRnj99rTgtkeQtO7L0VtywGsg@mail.gmail.com>
In-Reply-To: <CAHiDW_F1HTv9As6rd=Y82ttPaeRnj99rTgtkeQtO7L0VtywGsg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lz4: fix QA issue
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
X-List-Received-Date: Mon, 20 Apr 2015 13:41:38 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Jussi,

Thanks for the information. I will update the recipe this week.

- armin

On 04/20/2015 01:21 AM, Jussi Kukkonen wrote:
> On 20 April 2015 at 00:45, Armin Kuster <akuster808@gmail.com> wrote:
>> WARNING: Could not copy license file
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>   meta/recipes-support/lz4/lz4.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-support/lz4/lz4.bb b/meta/recipes-support/lz4/lz4.bb
>> index ee5de0a..0b0c632 100644
>> --- a/meta/recipes-support/lz4/lz4.bb
>> +++ b/meta/recipes-support/lz4/lz4.bb
>> @@ -2,7 +2,7 @@ SUMMARY = "Extremely Fast Compression algorithm"
>>   DESCRIPTION = "LZ4 is a very fast lossless compression algorithm, providing compression speed at 400 MB/s per core, scalable with multi-cores CPU. It also features an extremely fast decoder, with speed in multiple GB/s per core, typically reaching RAM speed limits on multi-core systems."
>>
>>   LICENSE = "BSD"
>
> This is not directly related to your patch but I happened to take a
> look at the source and the license seems wrong: The library is indeed
> BSD but all the binaries are actually GPLv2 (see programs/COPYING and
> the individual source files).
>
>> -LIC_FILES_CHKSUM = "file://LICENSE;md5=0b0d063f37a4477b54af2459477dcafd"
>> +LIC_FILES_CHKSUM = "file://lib/LICENSE;md5=0b0d063f37a4477b54af2459477dcafd"
>>
>>   SRCREV = "5780864c0ce08622238a267c46fb489d7066cad4"
>>
>> --
>> 2.3.5
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

