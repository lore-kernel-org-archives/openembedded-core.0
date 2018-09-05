Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
	[209.85.222.66])
	by mail.openembedded.org (Postfix) with ESMTP id A6255747FF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 01:59:52 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id m26-v6so4553972uap.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2018 18:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=/pCsdTD0VVINkVo8icAAhOm11HL3IxaisECLWlnIg0U=;
	b=UnKg61lLZNEi2ImvBwfgXrUDMgmRpxo1Lv4ItQk4wZkFMAcvthAd8MhDEMVkiaqGOK
	BHTIcGileDvvbQ7PZIiWc0twT5EpBpe1wPk3c/wT+b6vxIK89+ZT3XCF07jr6hk8/Y6+
	HlpabzTZm26h+DVc9kkcD2ks9m5iyscRAcgql4RRu9l2YKrmkmaqhrKJKaCArbXpE6yc
	46++eUraIJx/AWTwD8K2YXYLrviBYDotkGuqOQpifkkMxmeCTkh7lIJIYsHN5dqoDPST
	0z6ej3aYi+cPste23NCjzGAUtZG/uSUZELeR1r32n4PLK4/Hr/6ZGj1kBU4MwUQSTXc6
	L2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=/pCsdTD0VVINkVo8icAAhOm11HL3IxaisECLWlnIg0U=;
	b=Bc9UtvyZA1cfuRf/fD4YC+dpoWZfwZE2NZ1MpsgU0IVwYMN3+aOrs58/6ORYz20/IP
	nDGnUJurm+WTvPjbh+vp89UIVWt6K2lkFV8kM6Kwy10usjgkcqmrE2pBLBm5L1m967Yu
	F3UeWUYvQKG8QIHs4qm9F/iEonRqRlOGKwOxZgqDd/rZeaK97dafe90DUIB076/JG6H0
	7J0HGuTya7y6w/CnFMkBhiFbRQvQvHL7kJSiAa3pfFA3OIivXzEqdSBIDSIo6MPDhhLp
	Z7AHtDMW7IO+m5N3L7HF2rHP+qzLGEey07/XHVnl8r1C+WW2lcTvgE+CVgcB4Ekg2Bcv
	AZkg==
X-Gm-Message-State: APzg51A0JA0ku+gHRIyKfI/GrDMoNlgX1ZynqDCbcxM2nX4aeocySLmt
	wzIPy2OCId9wSosroPjW8l5eH6JvT8Ll9AFwQik=
X-Google-Smtp-Source: ANB0VdbIes28KEBHG4iGbfiS0iDa+/ZJg2+s4nvIDTpKo45HVFfOf4vnsYUDSftGp7jRGdqVfgInChRkr0pD2YK3760=
X-Received: by 2002:ab0:59ae:: with SMTP id
	g43-v6mr19400929uad.182.1536112793510; 
	Tue, 04 Sep 2018 18:59:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2904:0:0:0:0:0 with HTTP;
	Tue, 4 Sep 2018 18:59:52 -0700 (PDT)
In-Reply-To: <76e69943-5fe5-b629-08ab-852745136e95@windriver.com>
References: <1535100844-4514-1-git-send-email-hongxu.jia@windriver.com>
	<83f1c6c3-195c-b6c6-979c-3d58db4f9cb9@xilinx.com>
	<591d25eb-bb99-746f-37ac-6769db4228b8@windriver.com>
	<217b44d6-0d44-8f9f-80c6-7262324d751f@xilinx.com>
	<CAJ86T=WdMgTuGVRCZHhNrGSL8YkVswP8JNXHdM2ryF7wJMxL5Q@mail.gmail.com>
	<76e69943-5fe5-b629-08ab-852745136e95@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 4 Sep 2018 18:59:52 -0700
Message-ID: <CAJ86T=VKYgJEg9M81r3+0U6N1XgfRMM48O8DAd_R5vf207Q-ZQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 05 Sep 2018 01:59:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 4, 2018 at 6:02 PM, Hongxu Jia <hongxu.jia@windriver.com> wrote=
:
> On 2018=E5=B9=B409=E6=9C=8805=E6=97=A5 03:14, Andre McCurdy wrote:
>>
>> Maybe I'm missing something, but what's the advantage of using SHELL
>> to run this little wrapper script rather than hardcoding /bin/sh ?
>>
>> Task shell scripts created by bitbake use hardcoded /bin/sh (see
>> bitbake/lib/bb/build.py -> shell_trap_code())
>
> Keep align with the devshell as the comments mentioned above

Yeah, I've read the comments. I still don't really understand why.

> The devshell.bbclass set var-SHELL to var-DEVSHELL, and terminal.bbclass
> initial var-SHELL with `bash'. Keep sync with it, use var-SHELL rather
> than hardcoded `/bin/sh' as the shebang of wrapper script.
>
> On Ubuntu host, default shell is dash (/bin/sh -> dash), even though
> we assign var-SHELL with `/bin/bash', the wrapper script is still
> dashism.

What exactly is a dashism?

