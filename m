Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
	[209.85.222.67])
	by mail.openembedded.org (Postfix) with ESMTP id AA29674F09
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 19:14:17 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id u11-v6so3780998uan.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2018 12:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=5mD6eMc5R331itylZ9EqCBmBAJnnmp0DjRfyIgiNu8s=;
	b=DSYnmseXedNyWPonYhBKcF+Tbn5gqFcBHQo/1x0kt8QV+wwgFka4WkGhN5gFZvfJDT
	2Wu4lmVJvhyYQ44DgGfnLYxwbybwimH4/45DZn4DJUZWG3TUTPVztBgSWvVnLJNNzRCZ
	sgQPn6RXb3LIb8dhsrar+bggA8oDuAwWqlm7yDMlUj92jkN0wG9mkwofyMDOTkp47W7e
	7SvRSripYtw4HQIf95cca6HdBfW55I3+HJNzckQnMP6MTSm8AuoFmDPHWBzdImT9Jgnq
	IkVrM4dufi7d1fBr7BhtmRct/oiozEUItCpFTgS9U2fCYEsM0oilpMhby8tns1dxBqwh
	glXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=5mD6eMc5R331itylZ9EqCBmBAJnnmp0DjRfyIgiNu8s=;
	b=CxaqUNwT5QB+3bJPWYVF7zL1g8ZzhrZlwkw3jtBHGwJ4dEqxtA04gSEYTLZrbYtjWS
	Ev0BqVVkv+HXqWUw/fXN/DXQGgII9wkH+mTQpATE2Qv25GN+MiQSFjmR2z3aq8adWUMI
	Ui1AgUK2K6iQRyd/0PRd8geWRWJ03woPKXw4XF3eZMejjQaIt+J0h+mTh6aU57r/ZpFk
	wjKpjprE0OgsWSVdwFqFYYeFmQL977VZ/cf3NWT/+lTHn5BKwKfMFMXPJHFAT/L9vzuf
	lJidET8Ad1NRYZ5d3w5V25zo6LhxxN9SlPym8saSvuaAbAue9Mz6Vfr6igSKFuyGuEjT
	rAiQ==
X-Gm-Message-State: APzg51C0Mq6mLvWtucJH4Q2q68chTZMQ+GNB/5HQLRJPwyLj+mNWt+Sd
	Gv7/qKt13T+LNPXV6jS4bWvINKL1M0FdkXNcjw4=
X-Google-Smtp-Source: ANB0VdYOR21thjB1N5A+4Ran6F4+2/Exys58944Z9u8b8bfMTnOJv5x3koaTtAvoSAZIzf889okxjuGSS6DvIPOmQW4=
X-Received: by 2002:ab0:1950:: with SMTP id
	u16-v6mr18532913uag.179.1536088458528; 
	Tue, 04 Sep 2018 12:14:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9f:2b46:0:0:0:0:0 with HTTP;
	Tue, 4 Sep 2018 12:14:18 -0700 (PDT)
In-Reply-To: <217b44d6-0d44-8f9f-80c6-7262324d751f@xilinx.com>
References: <1535100844-4514-1-git-send-email-hongxu.jia@windriver.com>
	<83f1c6c3-195c-b6c6-979c-3d58db4f9cb9@xilinx.com>
	<591d25eb-bb99-746f-37ac-6769db4228b8@windriver.com>
	<217b44d6-0d44-8f9f-80c6-7262324d751f@xilinx.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 4 Sep 2018 12:14:18 -0700
Message-ID: <CAJ86T=WdMgTuGVRCZHhNrGSL8YkVswP8JNXHdM2ryF7wJMxL5Q@mail.gmail.com>
To: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 04 Sep 2018 19:14:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 4, 2018 at 9:36 AM, Alejandro Enedino Hernandez Samaniego
<alejandro.enedino.hernandez-samaniego@xilinx.com> wrote:
> Hey Hongxu,
>
>
>
> On 09/02/2018 10:52 PM, Hongxu Jia wrote:
>>
>> On 2018=E5=B9=B409=E6=9C=8801=E6=97=A5 08:14, Alejandro Enedino Hernande=
z Samaniego wrote:
>>>
>>> Hey Hongxu,
>>>
>>>
>>> On 08/24/2018 01:54 AM, Hongxu Jia wrote:
>>>>
>>>> The devshell.bbclass set var-SHELL to var-DEVSHELL, and terminal.bbcla=
ss
>>>> initial var-SHELL with `bash'. Keep sync with it, use var-SHELL rather
>>>> than hardcoded `/bin/sh' as the shebang of wrapper script.
>>>>
>>>> On Ubuntu host, default shell is dash (/bin/sh -> dash), even though
>>>> we assign var-SHELL with `/bin/bash', the wrapper script is still
>>>> dashism.
>>>>
>>>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>>> ---
>>>>   meta/classes/terminal.bbclass | 3 ++-
>>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/classes/terminal.bbclass
>>>> b/meta/classes/terminal.bbclass
>>>> index a27e10c..73e765d 100644
>>>> --- a/meta/classes/terminal.bbclass
>>>> +++ b/meta/classes/terminal.bbclass
>>>> @@ -25,7 +25,8 @@ def emit_terminal_func(command, envdata, d):
>>>>       bb.utils.mkdirhier(os.path.dirname(runfile))
>>>>         with open(runfile, 'w') as script:
>>>> -        script.write('#!/bin/sh -e\n')
>>>> +        script.write('#!/usr/bin/env %s\n' % d.getVar('SHELL'))
>>>> +        script.write('set -e\n')
>>>
>>> This is causing a bug on several systems, I believe that it is because
>>> the way our systems are set up,
>>> basically, our running shell isn't necessarily $SHELL, so it is causing
>>> the process to exit immediately,
>>> anything thats using this class is affected, devshell, menuconfig, etc.
>>>
>>>
>>> $ echo $SHELL
>>> /bin/csh
>>>
>>> $ echo $0
>>> /bin/bash
>>>
>>
>> The csh does not support `export', in you case, you should correct
>> var-SHELL to align with $0,
>>
>> Such as:
>> $ usermod <username> -s $0
>
>
> I absolutely agree, but as I was saying, because the way the system is se=
t
> up, it does not allow me to do so.

Maybe I'm missing something, but what's the advantage of using SHELL
to run this little wrapper script rather than hardcoding /bin/sh ?

Task shell scripts created by bitbake use hardcoded /bin/sh (see
bitbake/lib/bb/build.py -> shell_trap_code())

