Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AA21B75481
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 01:45:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8K1jimP015288
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Sep 2018 18:45:44 -0700 (PDT)
Received: from [128.224.162.202] (128.224.162.202) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 19 Sep 2018 18:45:43 -0700
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1537358370-3557-1-git-send-email-hongxu.jia@windriver.com>
	<78fad439cd03f6e9be71a0a917667bcf94ebea51.camel@linuxfoundation.org>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <526c8d02-733b-0345-f68a-52004c62817e@windriver.com>
Date: Thu, 20 Sep 2018 09:45:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <78fad439cd03f6e9be71a0a917667bcf94ebea51.camel@linuxfoundation.org>
Subject: Re: [PATCH V2 1/2] openssh: upgrade 7.8p1 -> 7.8p1+git to support openssl 1.1.x
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
X-List-Received-Date: Thu, 20 Sep 2018 01:45:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年09月20日 09:07, richard.purdie@linuxfoundation.org wrote:
> On Wed, 2018-09-19 at 19:59 +0800, Hongxu Jia wrote:
>> - Convert from tarball to git repository which support
>>    openssl 1.1.x
>>
>> - There is no specific minor version that contains the
>>    openssl fix (it was merged to master a few days agao),
>>    rename recipe version to `7.8p1+git'
>>
>> - Fix regression test binaries missing
>>    In commit `1f7aaf7 openssh: build regression test binaries', it
>> build
>>    regression test binaries, since upstream add two binaries in
>> commits
>>    `c59aca8 Create control sockets in clean temp directories' and
>>    `1acc058 Disable tests where fs perms are incorrect', we should
>> update
>>    do_compile_ptest.
> Thanks for this. Unfortunately I think we still have some kind of a
> problem on qemuarm64 since with this patch, we cannot log into core-
> image-sato-sdk over ssh. Other images like core-image-sato work but
> they use dropbear which suggests this is an openssh or openssl problem.
Hi RP,

I will fix it as my top priority today.

Reproduce steps:

- Build core-image-sato-sdk on qemuarm64
- Run qemu
- Log over ssh (openssh) failed

//Hongxu

> We're going to have to start to narrow down where the issue is. This
> unfortunately means 2.6M3 continues to be blocked :(.
>
> Cheers,
>
> Richard



