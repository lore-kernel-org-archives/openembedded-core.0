Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EC0BA7E35D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 05:58:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4U5wllr018787
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 29 May 2019 22:58:48 -0700 (PDT)
Received: from [128.224.162.170] (128.224.162.170) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Wed, 29 May 2019 22:58:47 -0700
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <5a62beea5ad46e24bc1e59c5cf9938799c0e3d12.camel@linuxfoundation.org>
	<1559120138-3450-1-git-send-email-mingli.yu@windriver.com>
	<db641393dee9ad005cc693a8dc623afa6bdcd19f.camel@linuxfoundation.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5CEF7277.8000303@windriver.com>
Date: Thu, 30 May 2019 14:04:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <db641393dee9ad005cc693a8dc623afa6bdcd19f.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.170]
Subject: Re: [PATCH v3] elfutils: fix ptest failures
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
X-List-Received-Date: Thu, 30 May 2019 05:58:48 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2019年05月30日 02:40, richard.purdie@linuxfoundation.org wrote:
> On Wed, 2019-05-29 at 16:55 +0800, mingli.yu@windriver.com wrote:
>> From: Mingli Yu <Mingli.Yu@windriver.com>
>>
>> * Add missing -ptest package dependency (needs
>>    ${PN}-dev)
>>
>> * Add missing files which needed by ptest test
>>    to fix the ptest failures such as:
>>    | sh: ../src/elflint: No such file or directory
>>    | FAIL: asm-tst4
>>
>> * Rework 0001-skip-the-test-when-gcc-not-deployed.patch
>>    to skip the tests which depend on gcc
>>
>> * Define INHIBIT_PACKAGE_STRIP_FILES for elfutils to
>>    avoid stripping some generated binaries otherwise
>>    some of the tests such as test-nlist, run-strip-reloc.sh,
>>    run-strip-strmerge.sh and so on will fail
>>
>> Before:
>> --------------------------------------------
>> Recipe   | Passed    | Failed   | Skipped
>> --------------------------------------------
>> elfutils | 176       | 23       | 4
>> --------------------------------------------
>>
>> After:
>> --------------------------------------------
>> Recipe   | Passed    | Failed   | Skipped
>> --------------------------------------------
>> elfutils | 199       | 0       | 4
>> --------------------------------------------
>>
>> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
>
> I tested this without the libdir strip lines and it fails on musl:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/645

Will send out v4 to fix it.

Thanks,

>
> Cheers,
>
> Richard
>
>

