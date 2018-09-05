Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
	[209.85.222.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0369C74D73
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 03:36:46 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id g18-v6so4687162uam.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2018 20:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=UMRTRthJGyfpJ8FxVTC92Sy+BDdUEeSDV5Z3RM+v2CE=;
	b=eCexIkgwkcLaiidaBhjC2O866VhaMiCSygyds2e+17+ZYM64qqT0XTN6VaNOytlzAX
	Y8VY8LRBzi5rLE82pwZMn1qIn62F67KxtRGsR62bxF08ISt1yI0ecv6vuAkNvaPJfluI
	V8naob0Dt3jWGk0xseS6U9fbTuzFAIC2GoY3pAoCd7KtKfk95Fny1VbWcAY0fjb1Xzzk
	uaxcMj4kDlVHXTrTXBReDCziCWiBGoTfXrYWv0tJaAWHefw/cDQFd1yX0eSQWJ9w06UZ
	Vw6tXrNQmOwRIjV+d42Bbm7vdyYT55zDqaBCUFQ+LxRrD8yMfXKlYL8od0AsZr6myNfn
	ohQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=UMRTRthJGyfpJ8FxVTC92Sy+BDdUEeSDV5Z3RM+v2CE=;
	b=I3RRiNL+KHH0Dy6nmJhejGuGNjuRQR/BEV+kM3dP5GHAAZnbyHex9lDzwLNBnSCCEQ
	mY7lbD4HcSgNPuiLVVOZIkD0vNkNfxSq8m4w7xYwRcXSc6VB2D4bVrLCwnd6z0Pka8kO
	9cYX330pAXGDA6ZnvuQoFpFHpV9VS4v4AXS+dEbyraJgA1YPiuY3VKP+9HfC8gZKCm73
	2QlOecw3w+g95UE4TLYv5CtqTJtx+ibYUob3Y+W+In0hIE+AObRTiOe0ixthMmqj/JyQ
	+AcYml3hfQis2zVlUOjqVmKEUX0qsqR9m0S1EK9N/1JeDZI5th/J1DpghAr8YWdiMDFJ
	/ArQ==
X-Gm-Message-State: APzg51AExM/rhO5ZdK+/hqsPjh6ljunlQI/OSdZ//tNrGZtDRMt40cBk
	SGhponr2WSVvJZDwalnk2bAtqO2VU6NMcyDh6Gs=
X-Google-Smtp-Source: ANB0VdZ4SEY/z12lMzrhwdsBf0ZskyONk+zOIUt6YZRDR86cUue2OToHg6qM3ikICKjyNcmjCEHJpVnS5MR59q/IVnA=
X-Received: by 2002:a67:4991:: with SMTP id
	d17-v6mr11974324vsg.41.1536118607751; 
	Tue, 04 Sep 2018 20:36:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2904:0:0:0:0:0 with HTTP;
	Tue, 4 Sep 2018 20:36:47 -0700 (PDT)
In-Reply-To: <689ddde0-d3a1-59a4-a20d-6d5ebd5bd7d0@windriver.com>
References: <1535100844-4514-1-git-send-email-hongxu.jia@windriver.com>
	<83f1c6c3-195c-b6c6-979c-3d58db4f9cb9@xilinx.com>
	<591d25eb-bb99-746f-37ac-6769db4228b8@windriver.com>
	<217b44d6-0d44-8f9f-80c6-7262324d751f@xilinx.com>
	<CAJ86T=WdMgTuGVRCZHhNrGSL8YkVswP8JNXHdM2ryF7wJMxL5Q@mail.gmail.com>
	<76e69943-5fe5-b629-08ab-852745136e95@windriver.com>
	<CAJ86T=VKYgJEg9M81r3+0U6N1XgfRMM48O8DAd_R5vf207Q-ZQ@mail.gmail.com>
	<52da2a71-147d-4431-b196-911d66e04b4e@windriver.com>
	<CAJ86T=XV4GgPYHXnNEw5cO4Y1rq_5OtqHCVnw8nVc2cmwNg6nA@mail.gmail.com>
	<689ddde0-d3a1-59a4-a20d-6d5ebd5bd7d0@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 4 Sep 2018 20:36:47 -0700
Message-ID: <CAJ86T=WBCxtuTF+0x0qg22jtGtnxmr=0zQjraVOg2yXGB3qiJQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] terminal.bbclass: use var-SHELL as the shebang of wrapper script
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
X-List-Received-Date: Wed, 05 Sep 2018 03:36:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 4, 2018 at 8:18 PM, Hongxu Jia <hongxu.jia@windriver.com> wrote=
:
> On 2018=E5=B9=B409=E6=9C=8805=E6=97=A5 10:41, Andre McCurdy wrote:
>>
>> On Tue, Sep 4, 2018 at 7:16 PM, Hongxu Jia <hongxu.jia@windriver.com>
>> wrote:
>>>
>>> On 2018=E5=B9=B409=E6=9C=8805=E6=97=A5 09:59, Andre McCurdy wrote:
>>>>
>>>> On Tue, Sep 4, 2018 at 6:02 PM, Hongxu Jia <hongxu.jia@windriver.com>
>>>> wrote:
>>>>>
>>>>> On 2018=E5=B9=B409=E6=9C=8805=E6=97=A5 03:14, Andre McCurdy wrote:
>>>>>>
>>>>>> Maybe I'm missing something, but what's the advantage of using SHELL
>>>>>> to run this little wrapper script rather than hardcoding /bin/sh ?
>>>>>>
>>>>>> Task shell scripts created by bitbake use hardcoded /bin/sh (see
>>>>>> bitbake/lib/bb/build.py -> shell_trap_code())
>>>>>
>>>>> Keep align with the devshell as the comments mentioned above
>>>>
>>>> Yeah, I've read the comments. I still don't really understand why.
>>>>
>>>>> The devshell.bbclass set var-SHELL to var-DEVSHELL, and
>>>>> terminal.bbclass
>>>>> initial var-SHELL with `bash'. Keep sync with it, use var-SHELL rathe=
r
>>>>> than hardcoded `/bin/sh' as the shebang of wrapper script.
>>>>>
>>>>> On Ubuntu host, default shell is dash (/bin/sh -> dash), even though
>>>>> we assign var-SHELL with `/bin/bash', the wrapper script is still
>>>>> dashism.
>>>>
>>>> What exactly is a dashism?
>>>
>>>
>>> In another word, it does not support bashism.
>>>
>>> Here is a case which `export -f' is bashism although
>>>
>>> devshell using bash, but /bin/sh -> dash
>>>
>>> [case]
>>>
>>> function foobar { echo foobar; };
>>>   export -f foobar
>>> bitbake -c devshell virtual/kernel
>>>
>>> [case]
>>>
>>>
>>> BTW, I've sent anther patch to fix it `[OE-core] [PATCH]
>>> devshell.bbclass/terminal.bbclass: add a shell check at devshell'
>>
>> OK, but run.do_terminal.xxx is a trivial wrapper which (apart from
>> exporting environment variables) just contains something like:
>>
>>    do_terminal() {
>>    exec pseudo /bin/bash
>>    }
>>
>>    do_terminal
>>
>> I'm not sure what the problem is running that with /bin/sh, regardless
>> of whether /bin/sh points to bash or dash?
>
>
> Isn't clear? In above case, even though `exec pseudo /bin/bash',
>
> since /bin/sh points to dash, the devshell started failed
>
> [snip]
>
> bitbake -c devshell virtual/kernel
> Trying to run: screen -r devshell_23640
> Cannot open your terminal '/dev/pts/39' - please check.
>
> [snip]
>
> Since `export -f' is bashism, use dash to load wrapper script failed

I understand that dash can not run bash specific syntax. What I don't
understand is where does the bash specific syntax in the terminal
wrapper script come from?

