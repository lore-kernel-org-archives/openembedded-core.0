Return-Path: <Zhe.He@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 66BAE7ED48
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 06:23:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7S6NI2K027605
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Aug 2019 23:23:18 -0700 (PDT)
Received: from [128.224.162.221] (128.224.162.221) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 27 Aug 2019 23:23:18 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1566880686-191373-1-git-send-email-zhe.he@windriver.com>
	<e8a4362684b1f664344132261b6458396c711842.camel@linuxfoundation.org>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <9a138601-38f7-25cd-ea9c-12f28cdd11bc@windriver.com>
Date: Wed, 28 Aug 2019 14:23:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e8a4362684b1f664344132261b6458396c711842.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.221]
Subject: Re: [PATCH] ltp: cve/meltdown.c: Fix kernel symbol finding
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
X-List-Received-Date: Wed, 28 Aug 2019 06:23:19 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 8/27/19 11:56 PM, Richard Purdie wrote:
> On Tue, 2019-08-27 at 12:38 +0800, zhe.he@windriver.com wrote:
>> From: He Zhe <zhe.he@windriver.com>
>>
>> Backport a patch to fix the following error.
>> safe_file_ops.c:219: BROK: Expected 3 conversions got 2 at
>> meltdown.c:272
>>
>> Signed-off-by: He Zhe <zhe.he@windriver.com>
>> ---
>>  ...-cve-meltdown.c-Fix-kernel-symbol-finding.patch | 83
>> ++++++++++++++++++++++
>>  meta/recipes-extended/ltp/ltp_20190517.bb          |  1 +
>>  2 files changed, 84 insertions(+)
>>  create mode 100644 meta/recipes-extended/ltp/ltp/0001-cve-
>> meltdown.c-Fix-kernel-symbol-finding.patch
> Patch doesn't apply, how was this tested?

Sorry, my test environment messed up with upstream ltp.
v2 will be sent.

Zhe

>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/981/steps/8/logs/step1b
>
> Cheers,
>
> Richard
>
>


