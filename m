Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BF7E974F33
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 01:44:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w511hAjL002199
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 31 May 2018 18:43:25 -0700
Received: from [128.224.162.173] (128.224.162.173) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 31 May 2018 18:42:59 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <20180531062031.40334-1-mingli.yu@windriver.com>
	<1527772404.16911.155.camel@linuxfoundation.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5B10A3D7.20309@windriver.com>
Date: Fri, 1 Jun 2018 09:39:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1527772404.16911.155.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.173]
Subject: Re: [PATCH] boost: Improve reproducibility
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
X-List-Received-Date: Fri, 01 Jun 2018 01:44:12 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2018年05月31日 21:13, Richard Purdie wrote:
> On Wed, 2018-05-30 at 23:20 -0700, mingli.yu@windriver.com wrote:
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> boost_context includes some assembly source
>> files and will export the assembly object file
>> make_x86_64_sysv_elf_gas.o which contains host
>> path as below:
>> $ readelf --wide --symbols /my-build/boost/1.67.0-
>> r0/boost_1_67_0/x86_64-poky-
>> linux/boost/bin.v2/libs/context/build/aca09349fdb84d131321425f6c3a38e
>> d/libboost_context.so.1.67
>> 42: 0000000000000000 0 FILE LOCAL DEFAULT ABS /my-build/boost/1.67.0-
>> r0/boost_1_67_0/x86_64-poky-
>> linux/boost/bin.v2/libs/context/build/aca09349fdb84d131321425f6c3a38e
>> d/asm/make_x86_64_sysv_elf_gas.o
>>
>> Enable stirp for boost_context to hidden the
>> symbols
>>
>> [YOCTO #12708]
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>
> This looks very unlikely to ever make it upstream. Rather than carrying
> a patch to boost forever would we want to just strip the file in
> question with a custom command?

Thanks very much Richard for your respond!
I did try to strip only file which in question, but not find out the 
solution and then turn to strip the context library.

Alex,
Do you have any suggestion?

Thanks,

>
> Alternatively, can we stop this path being injected into the binary in
> the first place?
>
> Cheers,
>
> Richard
>

