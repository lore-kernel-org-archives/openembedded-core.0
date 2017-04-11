Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2277E607A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 02:21:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v3B2LoKC000929
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 10 Apr 2017 19:21:50 -0700 (PDT)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 10 Apr 2017 19:21:49 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1491557671.git.liezhi.yang@windriver.com>
	<9f6d9252c6eb66b5f2c01ba34366424591d032bb.1491557671.git.liezhi.yang@windriver.com>
	<1491661489.17200.111.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <23f0a192-08a1-fdc5-ffea-e78602757cc0@windriver.com>
Date: Tue, 11 Apr 2017 10:21:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1491661489.17200.111.camel@linuxfoundation.org>
Cc: "Bartosh, Eduard" <eduard.bartosh@intel.com>
Subject: Re: [PATCH 6/8] runqemu: do not rely on grepping images
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
X-List-Received-Date: Tue, 11 Apr 2017 02:21:51 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/08/2017 10:24 PM, Richard Purdie wrote:
> On Fri, 2017-04-07 at 02:47 -0700, Robert Yang wrote:
>> Fixed when the image is large and not enough memory:
>>   grep: memory exhausted
>>   Aborted
>>
>> [YOCTO #11073]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>  meta/classes/qemuboot.bbclass |  3 +++
>>  scripts/runqemu               | 19 +++++++++++--------
>>  2 files changed, 14 insertions(+), 8 deletions(-)
>
> This breaks oe-selftest:
>
> https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/248/steps/Running%20oe-selftest/logs/stdio
>
> Perhaps not all the failures but certainly:
> wic.Wic.test_rawcopy_plugin_qemu
> wic.Wic.test_qemu_efi
> wic.Wic.test_qemu
>
> We see intermittent failures on these tests anyway and I think you're
> onto the right track with a potential fix though.


Sorry, I was on sick leave yesterday, I will work on it today.

// Robert

>
> Cheers,
>
> Richard
>
>
>

