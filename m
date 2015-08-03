Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E9DD574245
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Aug 2015 01:40:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t731ePTZ024692
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 2 Aug 2015 18:40:25 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Sun, 2 Aug 2015 18:40:25 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1438450455.git.kai.kang@windriver.com>
	<16ac455da1ad4ded87a80e00ea08241d761186de.1438450455.git.kai.kang@windriver.com>
	<1438459940.25455.35.camel@linuxfoundation.org>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <55BEC68D.5040009@windriver.com>
Date: Mon, 3 Aug 2015 09:40:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1438459940.25455.35.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] qemu: add ptest sub-package
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
X-List-Received-Date: Mon, 03 Aug 2015 01:40:29 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年08月02日 04:12, Richard Purdie wrote:
> On Sun, 2015-08-02 at 01:35 +0800, Kai Kang wrote:
>> Add sub-package ptest for qemu.
>>
> [...]
>> diff --git a/meta/recipes-devtools/qemu/qemu/add-ptest-in-makefile.patch b/meta/recipes-devtools/qemu/qemu/add-ptest-in-makefile.patch
>> new file mode 100644
>> index 0000000..2e79356
>> --- /dev/null
>> +++ b/meta/recipes-devtools/qemu/qemu/add-ptest-in-makefile.patch
>> @@ -0,0 +1,29 @@
>> +From 9b25fbc38c2c57c93ab53bf48a759bd2bd4c209d Mon Sep 17 00:00:00 2001
>> +From: HYANG2 <hyang2@pek-hyang2-d1.(none)>
>> +Date: Tue, 15 Jul 2014 10:13:22 +0800
>> +Subject: [PATCH] fix for ptest
> No Upstream-Status?

Sorry, forgot it. V2 will be sent.

Thanks,
Kai


>
> Cheers,
>
> Richard
>
>
>


-- 
Regards,
Neil | Kai Kang


