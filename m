Return-Path: <alistair23@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id A6EF365CF3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 17:40:52 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id g21-v6so15783673lfb.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 10:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nV3uOQHktPf0QUrqMPmvEcUjxEKHubJTcPF1lx3KOMo=;
	b=XPuzaMrrsTXuNLdJnHmAmyS+I9KBO8gBce1oaZ6f59rKgpdJWq1NlXBAfb5zQqC1Cp
	0VGXjZgwR2Ma5TBKenqDJVfOEeTGea+aEbv/UK0U+9Veaob1uG/1gmk450wpHPTBnkGD
	CXWJ4b8AyZI+UynfVnuTvrTiUg5Q5GRU3GLH1qMDqDc6dO5lsrCojQC/lX9Fwni6Blzw
	7ojux/xPh7vfAbYc50mazHEPa9GuUsAQNzNB77Mctxi7H/6V3lQM3WhH+JgNy6WxaA2R
	c2Isi4PBt+33EsMnDGISYop1IJB/449F1czXnf/b0G0ua0p23wW/G5TgCIsduJMUqs5S
	ZXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nV3uOQHktPf0QUrqMPmvEcUjxEKHubJTcPF1lx3KOMo=;
	b=TlMb1hA4AkvtN40rI2/QucxVb0w37cxUZ/1ZYjzFNpuIvMOVE7WIbKzK6TnU2pW0Am
	Qm4jjRlZaYWILqlS4qXu5ptCuIjj4lCPfzd8FOajbrsBaNzz3VPQFDD2BjA+rXrQr9EU
	lhWATvxWaCpSBkWYIw+94b6R4LBJt99X29hwbOWjJ4aLWSh1hHxh4LLMHDmLoO0p1QyF
	P6jzN7qdPvAlOjis/dhX6xrpUXNJLEol2NJqFCXhKe0Mnp4Zh69GiJ4RqxHvoS13YWet
	ahx7oYjgZ//weOSMbzhl1ZAtMKbkEcPAmAhuKNqjbOaLUwTmVLlHf1aS8MNytpCmK5md
	aD8A==
X-Gm-Message-State: APt69E1YDnHmUCSikD3i5w1nNnBMxylSmYSIebJSRChKbj56nkjkjhGe
	+8PXyEqTVWAc5BZbSj1eTn2xgBGvxftGRAf7ZEI=
X-Google-Smtp-Source: ADUXVKLUvmda3s9hibmP1psUJRLz2M0KvrIBd1pEwyd9rv+xTvAL8geGlMYYwC7RSle9WQ1P6LOzElygt0Kkr2QH0GI=
X-Received: by 2002:a19:5011:: with SMTP id
	e17-v6mr1725935lfb.71.1529084453028; 
	Fri, 15 Jun 2018 10:40:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:7407:0:0:0:0:0 with HTTP; Fri, 15 Jun 2018 10:40:22
	-0700 (PDT)
In-Reply-To: <CAJTo0LboMpfRu6rOzXAP+5yzd5yokYp52Cai+cvWDKr_aMkkhg@mail.gmail.com>
References: <20180601221436.27162-1-alistair.francis@wdc.com>
	<20180601221436.27162-2-alistair.francis@wdc.com>
	<CAJTo0Laocxug2iUZjAD8bLqDN4ho7GPO=_c2ZOQQmvSErOXyyQ@mail.gmail.com>
	<CAKmqyKN=5JzrFhK0aLvzuxHJFO4PmK_Km2JnynrqKjfovQAokw@mail.gmail.com>
	<19c52d27-6206-5b80-a41b-f3a106d8d7fd@linux.intel.com>
	<CAKmqyKO4STCUPJJE7+ZPwSMwGyoUAkcbTckSiByEipGMBDE-RQ@mail.gmail.com>
	<CAJTo0LboMpfRu6rOzXAP+5yzd5yokYp52Cai+cvWDKr_aMkkhg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 15 Jun 2018 10:40:22 -0700
Message-ID: <CAKmqyKPEM707Y1aE6+1LUTJorB5o5f9e92y618gowu4ZN8B2Fg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
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
X-List-Received-Date: Fri, 15 Jun 2018 17:40:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 4, 2018 at 4:18 PM, Burton, Ross <ross.burton@intel.com> wrote:
> That implies that INHIBIT_DEFAULT_DEPS is also evaluating to true,
> which it shouldn't be in ATK.
>
> I'd definitely be checking if that is the case, and if you can
> replicate the failure with e.g. qemuarm.

I can't replicate it with qemuarm and checking with bitbake -e I can't
see anywhere that the variable is set. Any ideas on what to try to
figure out how it is set?

Alistair

>
> Ross
>
> On 4 June 2018 at 19:46, Alistair Francis <alistair23@gmail.com> wrote:
>> On Mon, Jun 4, 2018 at 10:20 AM, Alexander Kanavin
>> <alexander.kanavin@linux.intel.com> wrote:
>>> On 06/04/2018 08:17 PM, Alistair Francis wrote:
>>>>
>>>> On Mon, Jun 4, 2018 at 3:06 AM, Burton, Ross <ross.burton@intel.com>
>>>> wrote:
>>>>>
>>>>> So why isn't the inherit gettext sufficient?
>>>>
>>>>
>>>> I'm not sure. Here is the error I see when compiling for RISC-V before
>>>> this patch:
>>>
>>>
>>> So is the error specific to risc-v? You should dig deeper in that direction
>>> then.
>>
>> Ok, it looks like the line: if d.getVar('INHIBIT_DEFAULT_DEPS') and
>> not oe.utils.inherits(d, 'cross-canadian'): is evaluating as true in
>> gettext.bbclass so we don't depend on gettext-native.
>>
>> Do I need to ensure cross-canadian is set for RISC-V builds then?
>>
>> Alistair
>>
>>>
>>> Alex

