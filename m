Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 930827839E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 03:04:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7E346if003707
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 13 Aug 2017 20:04:06 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Sun, 13 Aug 2017 20:04:06 -0700
To: Khem Raj <raj.khem@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <1502421401-112341-1-git-send-email-zhixiong.chi@windriver.com>
	<1502613383.18633.287.camel@linuxfoundation.org>
	<CAMKF1sqWL=M367APQ5-L1rw_41Ear+JjXJjVdudcY6uNexXEbQ@mail.gmail.com>
From: Zhixiong Chi <zhixiong.chi@windriver.com>
Message-ID: <59911324.9070808@windriver.com>
Date: Mon, 14 Aug 2017 11:04:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqWL=M367APQ5-L1rw_41Ear+JjXJjVdudcY6uNexXEbQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: add ld.so locks in _libc_fork
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
X-List-Received-Date: Mon, 14 Aug 2017 03:04:07 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2017年08月14日 00:35, Khem Raj wrote:
> On Sun, Aug 13, 2017 at 1:36 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Fri, 2017-08-11 at 11:16 +0800, Zhixiong Chi wrote:
>>> The patch in this Bugzilla entry was requested by a customer:
>>>    https://sourceware.org/bugzilla/show_bug.cgi?id=4578
>>>    https://www.sourceware.org/bugzilla/show_bug.cgi?id=19282
>> I'm a little nervous about accepting a patch which has been sitting in
>> the glibc bugzilla for around 10 years. Any idea why upstream haven't
>> taken this?
>>
> patches look sane to me. I would like to see if we can reproduce the
> issue on x86 using the
> testcases from bugzilla

I don't know why the upstream don't take care of it. I guess the reason
may be that the testcases is out of scope and we usually don't use the
unasync-signal-safe function after the forking.

Yes, the testcases from bugzilla can be reproduced easily on every
qemu bsp. At the same time we have done the glibc regression testing,
The patches works well.

Thanks.
>> Cheers,
>>
>> Richard
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
---------------------
Thanks,
Zhixiong Chi
Tel: +86-10-8477-7036


