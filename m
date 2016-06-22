Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 30C9062134
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 04:54:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u5M4slx4016932
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 21 Jun 2016 21:54:47 -0700
Received: from [128.224.162.229] (128.224.162.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Tue, 21 Jun 2016 21:54:46 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1464595294.git.Qi.Chen@windriver.com>
	<9697a509e56ad274d52f6d82866adfddd0a3d484.1464595294.git.Qi.Chen@windriver.com>
	<574C1A78.3090706@linux.intel.com> <574CF026.6060203@windriver.com>
	<CAMKF1sqpVyOMaEY7jay_Gvv-JR_p344pH5cF5VV4BoatV=h8oA@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <576A1A1D.5080606@windriver.com>
Date: Wed, 22 Jun 2016 12:54:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqpVyOMaEY7jay_Gvv-JR_p344pH5cF5VV4BoatV=h8oA@mail.gmail.com>
X-Originating-IP: [128.224.162.229]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] webkitgtk: disable gobject-introspection on mips64
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
X-List-Received-Date: Wed, 22 Jun 2016 04:54:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 06/22/2016 06:36 AM, Khem Raj wrote:
> does this still happen with Qemu 2.6 ?

Yes.
I just did some testing and the problem was still there with qemu2.6.

Regards,
Chen Qi

>
> On Mon, May 30, 2016 at 7:00 PM, ChenQi <Qi.Chen@windriver.com> wrote:
>> On 05/30/2016 06:48 PM, Alexander Kanavin wrote:
>>> On 05/30/2016 11:02 AM, Chen Qi wrote:
>>>> Disable gobject-introspection on mips64 to avoid do_compile failure.
>>>> +
>>>> +# qemu: uncaught target signal 6 (Aborted) - core dumped
>>>
>>> Please add the actual error before the above line:
>>>
>>> | WebKit2-4.0: ../../libgpg-error-1.21/src/posix-lock.c:119:
>>> get_lock_object: Assertion `!"sizeof lock obj"' failed.
>>>
>>> I just checked that updating libgpg-error to 1.22 does not help.
>>>
>>> Alex
>>
>> Hi Alex,
>>
>> I've added the comment and updated the remote branch.
>>
>> Best Regards,
>> Chen Qi
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


