Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9961478293
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 07:48:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v8C7mpVX009148
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 Sep 2017 00:48:51 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 12 Sep 2017 00:48:50 -0700
To: Patrick Ohly <patrick.ohly@intel.com>, <ross.burton@intel.com>
References: <cover.1505178922.git.dengke.du@windriver.com>
	<c82454e88d60d4fdcea4fb4eddd8622df7a40caa.1505178922.git.dengke.du@windriver.com>
	<1505202393.9633.44.camel@intel.com>
From: Dengke Du <dengke.du@windriver.com>
Message-ID: <595c548d-e578-1012-a5d4-f8e0facd6822@windriver.com>
Date: Tue, 12 Sep 2017 15:48:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1505202393.9633.44.camel@intel.com>
X-Originating-IP: [128.224.162.194]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 1/1] ovmf: fix do_compile error when len(tmp)=410
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
X-List-Received-Date: Tue, 12 Sep 2017 07:48:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 2017年09月12日 15:46, Patrick Ohly wrote:
> On Mon, 2017-09-11 at 21:20 -0400, Dengke Du wrote:
>> diff --git a/meta/recipes-core/ovmf/ovmf/0004-ovmf-enable-long-path-
>> file.patch b/meta/recipes-core/ovmf/ovmf/0004-ovmf-enable-long-path-
>> file.patch
>> new file mode 100644
>> index 0000000..9cc85ad
>> --- /dev/null
>> +++ b/meta/recipes-core/ovmf/ovmf/0004-ovmf-enable-long-path-
>> file.patch
>> @@ -0,0 +1,28 @@
>> +From 032fc6b1f7691bd537fd2a6bd13821fcf3c45e64 Mon Sep 17 00:00:00
>> 2001
>> +From: Dengke Du <dengke.du@windriver.com>
>> +Date: Mon, 11 Sep 2017 02:21:55 -0400
>> +Subject: [PATCH] ovmf: enable long path file
>> +
>> +Upstream-Status: Pending
> Pending which action? I.e. what's the next step?
>
> To me this patch looks more like local customization to fit into path
> lengths used by the OE build system, so "Inappropriate" might be more
> reasonable.
>
Yes, you are right, it just fit for OE build system.

