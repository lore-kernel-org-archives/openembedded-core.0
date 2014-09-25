Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CB4CB6FE64
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 03:35:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8P3ZdGo021392
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Sep 2014 20:35:40 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Wed, 24 Sep 2014 20:35:38 -0700
Message-ID: <54238D89.7090709@windriver.com>
Date: Thu, 25 Sep 2014 11:35:37 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1411503122-6202-1-git-send-email-fathi.boudra@linaro.org>
	<54237A49.9060406@windriver.com>
	<CAMKF1sr63NHXEKma7kPKJSiPShJmiw8=v2xXCCtOBC6a8u4KwA@mail.gmail.com>
In-Reply-To: <CAMKF1sr63NHXEKma7kPKJSiPShJmiw8=v2xXCCtOBC6a8u4KwA@mail.gmail.com>
X-Originating-IP: [128.224.162.231]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libunwind: add aarch64 support
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
X-List-Received-Date: Thu, 25 Sep 2014 03:35:47 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年09月25日 10:35, Khem Raj wrote:
> On Wed, Sep 24, 2014 at 7:13 PM, Kang Kai <Kai.Kang@windriver.com> wrote:
>> It doesn't work and fail to do link:
>>
>> | ../src/.libs/libunwind-aarch64.so: undefined reference to `unreachable'
>> | collect2: error: ld returned 1 exit status
>> | make[1]: *** [test-coredump-unwind] Error 1
>>
>> Is 'unreachable'  an debug function?
>>
> this should come from libunwind_i.h apply this patch
> https://launchpadlibrarian.net/138280994/0001-Support-building-with-older-compilers.patch
>
> I wonder why its not upstream

Thanks. It works.

I checked the git repo that this patch was merged after 1.1 release.

I will update and stage this commit in poky-contrib:kangkai/qemuarm64.

-- 
Regards,
Neil | Kai Kang


