Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2987374EB2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 03:04:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5433WD6003689
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 3 Jun 2018 20:03:58 -0700
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Sun, 3 Jun 2018 20:03:48 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1527829099.git.Qi.Chen@windriver.com>
	<2135721ef52b1d348383d5f3007f3a946e1be4a5.1527829100.git.Qi.Chen@windriver.com>
	<08b7132659ca0fa714a0db2683e0cfce3be5576c.camel@linuxfoundation.org>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <c6ce5cf2-fb16-0dbf-cc33-28f3b74b9ddd@windriver.com>
Date: Mon, 4 Jun 2018 11:06:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <08b7132659ca0fa714a0db2683e0cfce3be5576c.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.218]
Subject: Re: [PATCH 06/14] oeqa/runtime/cases/selftest.py: rename to _selftest.py
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
X-List-Received-Date: Mon, 04 Jun 2018 03:04:24 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 06/04/2018 06:42 AM, Richard Purdie wrote:
> On Fri, 2018-06-01 at 13:03 +0800, Chen Qi wrote:
>> This test modules is designed to be invoked only by selftest. It's
>> not meant to be tested by normal runtime test. So it should be
>> renamed
>> with '_' prefix, so that it will not be automatically loaded by
>> normal
>> runtime tests when 'auto' is in TEST_SUITES.
>>
>> The failure message is as below.
>>
>>    RESULTS - selftest.Selftest.test_install_package - Testcase -1:
>> FAILED
>>
>> Also, change selftest/cases/runtime_test.py to use '_selftest'
>> accordingly.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> This seems to cause the second failure in
>
> https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/1096/steps/Running%20oe-selftest/logs/stdio
>
> Cheers,
>
> Richard
>
Hi Richard,

I've fixed this issue and updated the remote branch.
I'll send out V3 soon.

Best Regards,
Chen Qi

