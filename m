Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
	[209.85.222.67])
	by mail.openembedded.org (Postfix) with ESMTP id 594EE746B2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 02:41:39 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id m26-v6so4612932uap.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2018 19:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Gga/AON31GSLwruNlQTUuz0S3HSNXUvN47DOU5iklv8=;
	b=S5fAi2vekbzt9q7J+LYxW7qKwshF9VCIx5gQrzaqml/Z/zCBeTfiG0qGWBT4IZoHI0
	oGkQYloYaD23u/n8KFbjNr/k/9gM+jKk3Ohw/Ck6QffoUTyeRnnE7mwah9wkRqh7nE97
	iC2oqzhZdqWiW7z4QVFCsPeL/dkGaUjNbePvCIyNJypPVi/+qD3uDaJjMPfXyHuroZwO
	l84vNfB+ATGS6v1hyw/SpBdQuJiVIWMkxubvyg+VY8n4qaLDOxO7nmqUbwIk4jUoknQi
	2TpmdwPos/tjTdyYakBmGp6Q6FsTqt4c7Pcbf+GqNaHulTlXr0WTfDbWkohbvw8dXLTV
	8Mzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Gga/AON31GSLwruNlQTUuz0S3HSNXUvN47DOU5iklv8=;
	b=BpZ3kyfqG6xvOexFht7evnL+WmUL3skfA8vvmS7ZWUem0VkjPeLiyoQlH5dGppU4vv
	XW7IGhvCHqK3bmAvjRKKq0lrxwZVegyYnKeVOBpoJsFgrWtpPOGTfKQycEHaY1HMTTy1
	i4TKX1K6iuNyELcCaISAGd2dNmDEr7uvgE1BMO9WyhIKElmV39KNXASaW3CjDjUQmspf
	t0K39kFA9Z2ukUxmsh2VUpi/LVkaFaqaoYwn8B2W6i2gB2ZcXzdqgzGXmDA9728aQDN9
	WFVm3n7oZJcb7LiBdZuPzj2fN5YnfHBt6h+IWXPyvVJGq/onw3ddbQOZQpHGaff8n5BZ
	v9Ig==
X-Gm-Message-State: APzg51AGuqqoYmX/R2Omyqs7Ka83FfFdeNoypMiLyX3cE7ZDaJAMx6Jg
	jAB3/QQKok0bNUQcyOvIk1V69B+odeduBB4960rG0fAY
X-Google-Smtp-Source: ANB0VdZKEgLfGXIoWdHmFD9r0Iyy92f8IFD84qXi6qR7YVCbGjb7g6UBlyK5LtV27xmyeHuIyNj/eDw5jyHHGVTKBRo=
X-Received: by 2002:ab0:5594:: with SMTP id
	v20-v6mr19034026uaa.146.1536115300233; 
	Tue, 04 Sep 2018 19:41:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2904:0:0:0:0:0 with HTTP;
	Tue, 4 Sep 2018 19:41:39 -0700 (PDT)
In-Reply-To: <52da2a71-147d-4431-b196-911d66e04b4e@windriver.com>
References: <1535100844-4514-1-git-send-email-hongxu.jia@windriver.com>
	<83f1c6c3-195c-b6c6-979c-3d58db4f9cb9@xilinx.com>
	<591d25eb-bb99-746f-37ac-6769db4228b8@windriver.com>
	<217b44d6-0d44-8f9f-80c6-7262324d751f@xilinx.com>
	<CAJ86T=WdMgTuGVRCZHhNrGSL8YkVswP8JNXHdM2ryF7wJMxL5Q@mail.gmail.com>
	<76e69943-5fe5-b629-08ab-852745136e95@windriver.com>
	<CAJ86T=VKYgJEg9M81r3+0U6N1XgfRMM48O8DAd_R5vf207Q-ZQ@mail.gmail.com>
	<52da2a71-147d-4431-b196-911d66e04b4e@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 4 Sep 2018 19:41:39 -0700
Message-ID: <CAJ86T=XV4GgPYHXnNEw5cO4Y1rq_5OtqHCVnw8nVc2cmwNg6nA@mail.gmail.com>
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
X-List-Received-Date: Wed, 05 Sep 2018 02:41:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 4, 2018 at 7:16 PM, Hongxu Jia <hongxu.jia@windriver.com> wrote=
:
> On 2018=E5=B9=B409=E6=9C=8805=E6=97=A5 09:59, Andre McCurdy wrote:
>>
>> On Tue, Sep 4, 2018 at 6:02 PM, Hongxu Jia <hongxu.jia@windriver.com>
>> wrote:
>>>
>>> On 2018=E5=B9=B409=E6=9C=8805=E6=97=A5 03:14, Andre McCurdy wrote:
>>>>
>>>> Maybe I'm missing something, but what's the advantage of using SHELL
>>>> to run this little wrapper script rather than hardcoding /bin/sh ?
>>>>
>>>> Task shell scripts created by bitbake use hardcoded /bin/sh (see
>>>> bitbake/lib/bb/build.py -> shell_trap_code())
>>>
>>> Keep align with the devshell as the comments mentioned above
>>
>> Yeah, I've read the comments. I still don't really understand why.
>>
>>> The devshell.bbclass set var-SHELL to var-DEVSHELL, and terminal.bbclas=
s
>>> initial var-SHELL with `bash'. Keep sync with it, use var-SHELL rather
>>> than hardcoded `/bin/sh' as the shebang of wrapper script.
>>>
>>> On Ubuntu host, default shell is dash (/bin/sh -> dash), even though
>>> we assign var-SHELL with `/bin/bash', the wrapper script is still
>>> dashism.
>>
>> What exactly is a dashism?
>
>
> In another word, it does not support bashism.
>
> Here is a case which `export -f' is bashism although
>
> devshell using bash, but /bin/sh -> dash
>
> [case]
>
> function foobar { echo foobar; };
>  export -f foobar
> bitbake -c devshell virtual/kernel
>
> [case]
>
>
> BTW, I've sent anther patch to fix it `[OE-core] [PATCH]
> devshell.bbclass/terminal.bbclass: add a shell check at devshell'

OK, but run.do_terminal.xxx is a trivial wrapper which (apart from
exporting environment variables) just contains something like:

  do_terminal() {
  exec pseudo /bin/bash
  }

  do_terminal

I'm not sure what the problem is running that with /bin/sh, regardless
of whether /bin/sh points to bash or dash?

