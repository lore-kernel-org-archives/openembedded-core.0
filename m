Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 44BEA7F102
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 01:45:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6J1jWEn020579
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Jul 2019 18:45:32 -0700 (PDT)
Received: from [128.224.162.188] (128.224.162.188) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Thu, 18 Jul 2019 18:45:31 -0700
To: Petr Vorel <petr.vorel@gmail.com>
References: <20190717095039.121044-1-hongzhi.song@windriver.com>
	<20190718215132.GD26895@dell5510>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <5eada992-c0d9-b167-ab9a-aa03a1a3f5ce@windriver.com>
Date: Fri, 19 Jul 2019 09:45:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190718215132.GD26895@dell5510>
X-Originating-IP: [128.224.162.188]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ltp: getrlimit03: adjust-a-bit-of-code-to-compatiable-with mips32
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
X-List-Received-Date: Fri, 19 Jul 2019 01:45:32 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 7/19/19 5:51 AM, Petr Vorel wrote:
> Hi Hongzhi,
>
> ...
>> --- /dev/null
>> +++ b/meta/recipes-extended/ltp/ltp/0001-getrlimit03-adjust-a-bit-of-code-to-compatiable-with.patch
>> @@ -0,0 +1,62 @@
>> +From e79652a3839869b1983d65999e5d5dcb50bc9cd7 Mon Sep 17 00:00:00 2001
>> +From: "Hongzhi.Song" <hongzhi.song@windriver.com>
>> +Date: Mon, 15 Jul 2019 03:39:06 -0400
>> +Subject: [PATCH] getrlimit03: adjust a bit of code to compatiable with mips32
> ...
>> +Signed-off-by: Jan Stancek <jstancek@redhat.com>
>> +Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
>> +
>> +Upstream-Status: Backport
>> +Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
>> +---
>> + testcases/kernel/syscalls/getrlimit/getrlimit03.c | 8 +++++++-
>> + 1 file changed, 7 insertions(+), 1 deletion(-)
> I have to say I prefer policy when only build fixes are backported / added.
> (approach which e.g. buildroot has). Having many patches (25 atm) makes updating
> a bit difficult (ok, not that much, 'Upstream-Status: Backport' shows what has
> been merged since last release) and sometimes brings users patches which weren't
> accepted by upstream (your mips patch [1] was not accepted [2]

Thanks for your kindly remind.

Agree with you. It's time to uprev ltp recipe.


 From now, if the "Submitting or Backport" is appropriate,

I will make sure the patch was merged by ltp before it was sent to oe-core.


> ).
>
> But I understand that LTP 3 months release cycle can be to
> slow for some LTP users.
>
> Kind regards,
> Petr
>
> PS: I'm slowly working on fixing all musl issues in LTP upstream. It's a long
> term run but were moving towards that goal.
> Patch "build: Add option to select libc implementation" [3] is a not a good
> approach.  Instead it's needed to find for each failure why it's not presented
> in musl.  Mostly because it uses non POSIX features or deprecated API, which
> needs to be avoided or used kernel headers where it's available.
>
> [1] http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-extended/ltp/ltp/0001-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch

I am working on this patch.


> [2] https://patchwork.ozlabs.org/patch/982194/#2012168

This patch has been merge by ltp finally.

--Hongzhi

> [3] http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-extended/ltp/ltp/0004-build-Add-option-to-select-libc-implementation.patch
>

