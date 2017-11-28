Return-Path: <danismostlikely@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 02A8B6011C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 16:54:53 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id r143so534898lfe.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 08:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=97WWvX2EwJIwcVJMY/MTAcW1+LfkFTZ0Z+mJFvHj+5o=;
	b=YUwPKsn5JldXucksTX0CVcBal802eWLKcvNg8uHFJHQmlK14xoJP7wV8wAG7lsG/aW
	dt03v1UIbJhp2mYorry0DQrRfVzemhZXuZIG8T5U8Qd7ZrkU5F6AXL/16H28tRGeR/9e
	SQruAyzk+JIil6IyrdK7L3OZMEtu2Wpb4mo7alFkJ0I+bEBXVrZJDw3Yb/8y3zGa/mnz
	IzGhuhHgzQUdT/u3pYzsUwlpzr7kZiZ38k4WADgnxnyn3L0UJH3F0Ncs5yCpmiLiz1RP
	7PcJudkxXMFyRtGwBYAz8BzY0kLZ8whHMrBuh2Qo0IoRVtxMfN8ai9ie8UAroAP5EN7h
	W+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=97WWvX2EwJIwcVJMY/MTAcW1+LfkFTZ0Z+mJFvHj+5o=;
	b=NXv7k1Vtk6fNqUfR9YtSTm1mZYyqiOsZMRqRG2FaZ8XyTQWACBLJIFvuSGgCQelJjA
	WubuJH2bDTohEPwGZGf92Qfo4GFLN/sbxEihPxoVYIzTnwsloDs5ag/YPjYNbSuggLQf
	lwvk48jk2rSAGduyG3NKek6rQn5m7ZspEuUam/pUNICSAN4onG4vVeZji03QGUo930z3
	MRObaQsbCy/q11MViewiL5eGr0b/Nah2iz04lOkP2Wj0o+NySaq0XmygKaQiJa4fgDPN
	iQ1fvwCFxZl5YKcOLiNcLbV6FsxsTigOafmPm17aoY+0xrvEvwoSNAVbzlJId+s4XFXz
	8iVg==
X-Gm-Message-State: AJaThX5UYPyX+O1yYAe7ZZ0fPkKVsV/p5RkjCoePhCq5jEXGjPUmwGSF
	f/80aE/gjWp7ORSLbANWdeosuY+AOdu1ZiKdc9c=
X-Google-Smtp-Source: AGs4zMY12Tlv8PZgYjYMyoz0n1YyHyt9x7KHE+7bP2yHKpMwoSNuqqJAsqu8zg9e0Ke+EPKpD7QsdXPW/snlGZ1aWbs=
X-Received: by 10.46.74.26 with SMTP id x26mr13505417lja.83.1511888094408;
	Tue, 28 Nov 2017 08:54:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.59.196 with HTTP; Tue, 28 Nov 2017 08:54:53 -0800 (PST)
In-Reply-To: <955afb0f-78b2-2de8-db0a-f301b62bc8ab@linux.intel.com>
References: <20171127183538.68275-1-danismostlikely@gmail.com>
	<b5ec6830-3185-054f-7354-d9caa66e692b@linux.intel.com>
	<CACS+7ZT=pyM3uD-LbBy437NT=nHAS7ONarmMp0E3TA-b40LFaQ@mail.gmail.com>
	<955afb0f-78b2-2de8-db0a-f301b62bc8ab@linux.intel.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Tue, 28 Nov 2017 10:54:53 -0600
Message-ID: <CACS+7ZRKCjqB7Hp39Wv5GCLEV_qZsA=kh-okjLaGty0s8Cr96g@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bind: fix python3 dependencies
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
X-List-Received-Date: Tue, 28 Nov 2017 16:54:54 -0000
Content-Type: text/plain; charset="UTF-8"

On 28 November 2017 at 00:30, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 11/27/2017 10:24 PM, Dan McGregor wrote:
>>>
>>> 2) why is native python3 needed, and host python3 is not enough.
>>
>>
>> Host python3 gives me the error above. Possibly my host's python3 is
>> broken, but it's a Poky build appliance with multilib enabled.
>>
>> I'll make it more explicit in my commit message.
>
>
> Note that bind is built by yocto autobuilder many times a day, in multiple
> configurations (including multilib). And no one else has reported the issue.
> It does seem to me that the patch is working around a problem that is
> somehow specific to your setup, and is not a common issue.
>

Oh I'm sure it's specific to my organisation now. The issue is in
distutils on the host, it doesn't like being installed in /usr/lib64,
so I'll make a patch for that soon. I still don't like relying on host
tools for the python stuff, though.

> Can you dig a bit deeper and find out the root cause of the error message
> you are getting without this patch please? Try also with a plain poky
> checkout, and see if the issue disappears there.

Yeah, as I said above python3 distutils seems to be broken when
multilib is enabled. I'll fix that and send a patch later today or
tomorrow.

>
>
> Alex

