Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3FF516A9E1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 02:54:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7Q2s6bl019559
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 25 Aug 2013 19:54:06 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Sun, 25 Aug 2013 19:54:06 -0700
Message-ID: <521AC34E.3060701@windriver.com>
Date: Mon, 26 Aug 2013 10:54:06 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Kang Kai <Kai.Kang@windriver.com>
References: <cover.1376965065.git.kai.kang@windriver.com>
	<5a0310813a9df4c60eaf5ba31e2de12bf3d08ccf.1376965065.git.kai.kang@windriver.com>
	<760CDDA0-416D-4E16-8FC2-6205ED265506@gmail.com>
	<5215B4A7.8070604@windriver.com>
	<9A96060F-4FEA-4785-A90F-B71A615976D3@gmail.com>
	<5215BCD0.7080902@windriver.com>
In-Reply-To: <5215BCD0.7080902@windriver.com>
X-Originating-IP: [128.224.162.231]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] bc: fix segmentation fault
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
X-List-Received-Date: Mon, 26 Aug 2013 02:54:07 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2013年08月22日 15:25, Kang Kai wrote:
> On 2013年08月22日 15:15, Khem Raj wrote:
>> Kai
>>
>> On Aug 21, 2013, at 11:50 PM, Kang Kai <Kai.Kang@windriver.com> wrote:
>>
>>>> what does adding this include file fix ?
>>> To be honest, I am not sure why add this include. After build it is 
>>> harmless, so I didn't want to modify it because I think LFS is 
>>> trustable.
>>>

Hi Raj,

>> Its matter of understanding the change and may be explaining a bit 
>> better what it fixes and make the patch better for upstream too so 
>> try to build it without this include added and see if you get some 
>> warnings/errors that it fixes and then add that information to patch 
>> header.

It is no warning shows without the include patch. But the patch is merged.

Sorry again.
Kai

>
> Thanks.
> I'll check it and be more careful next time.
>
> Regards,
> Kai
>
>>
>>> Regards,
>>> Kai
>>
>>
>
>


-- 
Regards,
Neil | Kai Kang


