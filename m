Return-Path: <cazfi74@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 49E01744E4
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Jul 2018 18:03:00 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id s198-v6so8878815oih.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Jul 2018 11:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NUyHm0zx93T3AOemR7cRiXmntcHYFTbCS9jywPVTgLw=;
	b=fLZPlqOt4OPD05f6PuEWjzq78WpBCFN6IqGEOc+bexBCW3vCELdhAshjWwnrFw2u8D
	E6gkZkrNZ7g6zIclH3cBpJxy5t8NkT5DZAfJjmroJjzZLKIE6AzV6YMUWHBn0BylkHBE
	EZFrI5ETAygB9u+gsg5GOqz1FpJPGS+TsGUr0n863+uZfk8Nvt0pF9oYxMdAFFupUVeY
	SXW9lnTdxgdMXhrd5zRRWtXDqRvYvjxmutR8xAoacwLVWjpiEwCYFhHEqFoxtBtFqZ5i
	hXZMou9I9api4VIYDbacnYiKdIEQV+wKaxs6owB/mIzq6btUC5J7UIdRVddLMa09O4Pi
	qdwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NUyHm0zx93T3AOemR7cRiXmntcHYFTbCS9jywPVTgLw=;
	b=cMQJqjEQK7m73Es3oS+WC97x+QHv7gXv0RiOOzdIBzISEjTZQiTAdYM6e7vp3ZqZMJ
	HRTiMGNxpjdp1iwxYGnNdIMllVSVwinH4yEvLFypjq23rE9jmP6t57sVah36F1baquCU
	6rFd/ONfzhDiN899PtwuYjDrJ+eERK55VAU8Re0sznvkoZ8f/NbgUk4PB2JeMvGd4Bs8
	bQumuHHtqR4htZiTmgUGFbM93QTWRq4F3HRWZiTjZY9wFxuDF/5GpBHUAVsBywm4RzQr
	Mrra7c5cnH3M8lP6j/RE6YW942jaWz37hkF6BuaKVHg0KsXsxTdnrrKZBWG/QoT9HiDA
	GHUg==
X-Gm-Message-State: APt69E1/ujt//4M0oYSImuGPp21ZQhApSkP2Zykt83hOesVo5yhTHmZl
	eu+gRLldsoj/a1AlixipMur/8hWyiDoBLmTzPxw=
X-Google-Smtp-Source: AAOMgpeALyRURTaEbprxO/I64DI4hoChPmwR1zPd5f5xLNd0hWe88hL0pjkRZqe7qe1iRhfqr1V12Z8OOyZ4ePsl8D4=
X-Received: by 2002:aca:42c3:: with SMTP id
	p186-v6mr11758052oia.265.1530468181267; 
	Sun, 01 Jul 2018 11:03:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:3574:0:0:0:0:0 with HTTP;
	Sun, 1 Jul 2018 11:03:00 -0700 (PDT)
In-Reply-To: <CAF6bG8fqn0pgfU18pWWayb4LhZA=dZjwMqGPysPNXCaM8OOr2Q@mail.gmail.com>
References: <20180601221436.27162-1-alistair.francis@wdc.com>
	<20180601221436.27162-2-alistair.francis@wdc.com>
	<CAJTo0Laocxug2iUZjAD8bLqDN4ho7GPO=_c2ZOQQmvSErOXyyQ@mail.gmail.com>
	<CAKmqyKN=5JzrFhK0aLvzuxHJFO4PmK_Km2JnynrqKjfovQAokw@mail.gmail.com>
	<19c52d27-6206-5b80-a41b-f3a106d8d7fd@linux.intel.com>
	<CAKmqyKO4STCUPJJE7+ZPwSMwGyoUAkcbTckSiByEipGMBDE-RQ@mail.gmail.com>
	<CAJTo0LboMpfRu6rOzXAP+5yzd5yokYp52Cai+cvWDKr_aMkkhg@mail.gmail.com>
	<CAKmqyKPEM707Y1aE6+1LUTJorB5o5f9e92y618gowu4ZN8B2Fg@mail.gmail.com>
	<CAF6bG8fqn0pgfU18pWWayb4LhZA=dZjwMqGPysPNXCaM8OOr2Q@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
Date: Sun, 1 Jul 2018 21:03:00 +0300
Message-ID: <CAF6bG8dJCN47J3Hw7RDJP6iWTA-wpB+Qd3EywJbqi1w8qZPuvw@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] [meta] atk: Specify gettext-native dependency
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
X-List-Received-Date: Sun, 01 Jul 2018 18:03:00 -0000
Content-Type: text/plain; charset="UTF-8"

 I think the problem is not with INHIBIT_DEFAULT_DEPS, but with
USE_NLS on the next couple of lines. With USE_NLS disabled, the
automatic dependency is gettext-minimal-native (not providing
xgettext, I think), and not gettext-native.

 1) tmp-glibc/work/aarch64-oe-linux/atk/2.28.1-r0/recipe-sysroot-native/sysroot-providers/gettext-minimal-native
is there
 2) Adding gettext-minimal-native as atk dependency does not fix the
issue like adding gettext-native dependency does


 - ML


On 30 June 2018 at 21:43, Marko Lindqvist <cazfi74@gmail.com> wrote:
>  This error happens to me with both qemux86 and qemuarm64. Haven't
> tested any others yet.
>
>
>  - ML
>
> On 15 June 2018 at 20:40, Alistair Francis <alistair23@gmail.com> wrote:
>> On Mon, Jun 4, 2018 at 4:18 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>> That implies that INHIBIT_DEFAULT_DEPS is also evaluating to true,
>>> which it shouldn't be in ATK.
>>>
>>> I'd definitely be checking if that is the case, and if you can
>>> replicate the failure with e.g. qemuarm.
>>
>> I can't replicate it with qemuarm and checking with bitbake -e I can't
>> see anywhere that the variable is set. Any ideas on what to try to
>> figure out how it is set?
>>
>> Alistair
>>
>>>
>>> Ross
>>>
>>> On 4 June 2018 at 19:46, Alistair Francis <alistair23@gmail.com> wrote:
>>>> On Mon, Jun 4, 2018 at 10:20 AM, Alexander Kanavin
>>>> <alexander.kanavin@linux.intel.com> wrote:
>>>>> On 06/04/2018 08:17 PM, Alistair Francis wrote:
>>>>>>
>>>>>> On Mon, Jun 4, 2018 at 3:06 AM, Burton, Ross <ross.burton@intel.com>
>>>>>> wrote:
>>>>>>>
>>>>>>> So why isn't the inherit gettext sufficient?
>>>>>>
>>>>>>
>>>>>> I'm not sure. Here is the error I see when compiling for RISC-V before
>>>>>> this patch:
>>>>>
>>>>>
>>>>> So is the error specific to risc-v? You should dig deeper in that direction
>>>>> then.
>>>>
>>>> Ok, it looks like the line: if d.getVar('INHIBIT_DEFAULT_DEPS') and
>>>> not oe.utils.inherits(d, 'cross-canadian'): is evaluating as true in
>>>> gettext.bbclass so we don't depend on gettext-native.
>>>>
>>>> Do I need to ensure cross-canadian is set for RISC-V builds then?
>>>>
>>>> Alistair
>>>>
>>>>>
>>>>> Alex
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

