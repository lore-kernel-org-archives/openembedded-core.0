Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1EDD67F8C1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2019 20:18:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xASKIoDD010578
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 28 Nov 2019 12:18:50 -0800 (PST)
Received: from [128.224.20.39] (128.224.20.39) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Thu, 28 Nov 2019 12:18:49 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <20191123221854.1656-1-Trevor.Gamblin@windriver.com>
	<19c01871bece378f73254ead8953c24f9f3b3180.camel@linuxfoundation.org>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <053ac557-f519-d6df-8233-ef396e73e3ab@windriver.com>
Date: Thu, 28 Nov 2019 15:18:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <19c01871bece378f73254ead8953c24f9f3b3180.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/2 v2] add coreutils ptest to oe-core
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
X-List-Received-Date: Thu, 28 Nov 2019 20:18:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 11/28/19 1:09 PM, Richard Purdie wrote:
> On Sat, 2019-11-23 at 17:18 -0500, Trevor Gamblin wrote:
>> From: Trevor Gamblin <trevor.gamblin@windriver.com>
>>
>> Sample test results:
>>
>> core-image-minimal:
>> MACHINE    | PASS | FAIL | SKIP | TOTAL | TIME (m) |
>> qemux86-64 |  483 |    0 |  132 |   615 |      3.8 |
>> qemuarm64  |  483 |    0 |  132 |   615 |       70 |
>>
>> core-image-sato:
>> MACHINE    | PASS | FAIL | SKIP | TOTAL | Time (m) |
>> qemux86-64 |  484 |    0 |  131 |   615 |      3.9 |
>> qemuarm64  |  484 |    0 |  131 |   615 |       70 |
> I do like this patch but I think this is causing the reproducibile
> builds selftest to fail:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/515
>
> as coreutils ptest is in the list.
>
> I think there are other patches in master-next contributing to this too
> but this one is an issue.
>
> Its also causing a size overflow for genericx86-64:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/1298
>
> but I believe Anuj and Ross are working through changes which would
> address this issue.
Right. I've made some modifications to a v3 that should also help. I 
still need to work on reproducibility though, so I'll hold off on 
sending it again for a while.
>
> Cheers,
>
> Richard
>

