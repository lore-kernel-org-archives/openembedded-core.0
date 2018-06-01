Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A250D74F99
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 04:39:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w514dqeY013031
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 31 May 2018 21:39:52 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 31 May 2018 21:39:51 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <cover.1527755434.git.Qi.Chen@windriver.com>
	<23d9ef25030216df5bcfeccfe6dcf12defc53648.1527755434.git.Qi.Chen@windriver.com>
	<CANNYZj_M2f=R+mro8oUnVV+dWuz42o8T9GpYjhBeujPF=ic=ow@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <4de3e30e-48da-24ad-55e9-9b6a3664e67c@windriver.com>
Date: Fri, 1 Jun 2018 12:42:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj_M2f=R+mro8oUnVV+dWuz42o8T9GpYjhBeujPF=ic=ow@mail.gmail.com>
X-Originating-IP: [128.224.162.218]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/14] oeqa/core/loader.py: support the 'auto' keyword
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
X-List-Received-Date: Fri, 01 Jun 2018 04:39:52 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/31/2018 09:57 PM, Alexander Kanavin wrote:
> 2018-05-31 11:32 GMT+03:00 Chen Qi <Qi.Chen@windriver.com>:
>> In previous OEQA, having 'auto' in TEST_SUITES results in executing
>> as many test cases as possible.
>>
>> This behaviour is broken for now. From the codes in core/loader.py,
>> I can see that it tries to use another keyword 'all'. But in fact,
>> it does not work.
>>
>> I've checked the current manual. The manual says using 'auto'.
>> Below is the current information in manual.
>>
>>    """
>>    Alternatively, you can provide the "auto" option to have all applicable
>>    tests run against the image.
>>
>>    TEST_SUITES_append = " auto"
>>    """
>>
>> So we should restore this behaviour. This patch does so.
> Nice! Can we also try to simplify the setting of DEFAULT_TEST_SUITES
> in testimage.bbclass using this keyword? Right now it's basically
> manually created lists, which tend to go out of date.
>
> Alex
>

Hi Alex,

I agree with you that we need to re-evaluate the settings of 
DEFAULT_TEST_SUITES.

I plan to do this work from next week. And I plan to put such changes in 
another patchset.

Looking at the codes, I can see that the DEFAULT_TEST_SUITES are set 
with consideration of qemu machines and libc.
e.g.
# aarch64 has no graphics
DEFAULT_TEST_SUITES_remove_aarch64 = "xorg"
# musl doesn't support systemtap
DEFAULT_TEST_SUITES_remove_libc-musl = "stap"

And I guess this work would take some time.

Back to this patchset, I'll sent out V2 soon.

Best Regards,
Chen Qi

