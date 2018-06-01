Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D1B9874F97
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 05:43:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w515gHKh008264
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 31 May 2018 22:42:32 -0700
Received: from [128.224.162.173] (128.224.162.173) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 31 May 2018 22:42:06 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20180531062031.40334-1-mingli.yu@windriver.com>
	<1527772404.16911.155.camel@linuxfoundation.org>
	<5B10A3D7.20309@windriver.com>
	<CANNYZj_3y_uP4a188SREALPvpBL=xnu=QZAW9s7V9iSG2a-t9Q@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5B10DBE5.5050603@windriver.com>
Date: Fri, 1 Jun 2018 13:38:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj_3y_uP4a188SREALPvpBL=xnu=QZAW9s7V9iSG2a-t9Q@mail.gmail.com>
X-Originating-IP: [128.224.162.173]
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Fri, 01 Jun 2018 05:43:45 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2018年06月01日 13:08, Alexander Kanavin wrote:
> 2018-06-01 4:39 GMT+03:00 Yu, Mingli <mingli.yu@windriver.com>:
>
>>> This looks very unlikely to ever make it upstream. Rather than carrying
>>> a patch to boost forever would we want to just strip the file in
>>> question with a custom command?
>>
>>
>> Thanks very much Richard for your respond!
>> I did try to strip only file which in question, but not find out the
>> solution and then turn to strip the context library.
>>
>> Alex,
>> Do you have any suggestion?
>
> Yes - as RP said, please investigate how the path gets into this
> specific file (but not other files) in the first place, and whether we
> can disable or make it not happen, rather than strip the path after
> the fact.

Hi Alex,

Thanks for your respond!
I did investigate the path a lot before send out the patch, but didn't 
figure out why it introduce the path for make_x86_64_sysv_elf_gas.o 
whose source file is make_x86_64_sysv_elf_gas.S.

Anyway, I will try to dig more.

If you have any ideas, welcome to help provide some hint.

Thanks,


>
> Alex
>

