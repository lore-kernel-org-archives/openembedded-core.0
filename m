Return-Path: <vomegaz@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id D9DF86AC95
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 15:21:37 +0000 (UTC)
Received: by wizk4 with SMTP id k4so51021823wiz.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 08:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=KiHX5mSUqrAuViNusC5S6eUdi/P6mIuo5vzk0/sg2cc=;
	b=OYumHvh1Ab4sJmNhMHIk5ymeg2A+fksUnPwVBcnZGI1qOS4bMgBkzlO0R5yDpbtBjV
	evs/PnN92q8gnz5knUQscLPuO6uD7zPicjNwoazTPrJwbj+EAZztOrS5pV1yNVqvvgaA
	0BGIO5KaxhNrf0HzoHAwLoDcrAZlJxLk3jUCMVslzZmNf6IjAaZJyDLl2qyArTjWoH/a
	B/aSoGCqHznO1TP3sm/t1024y0q/cmr/WLJLucOJMzyowk8Vocb/zoPVSB+xIa6dxYhV
	grlP7mTDnQw2Xm6rk1vKdUJ/lDD1gr4ZIb0ZpwU3NdSQ6iC6kGdMVFvQJed4T3CmYwJe
	V0/g==
X-Received: by 10.180.88.72 with SMTP id be8mr8775990wib.42.1432308098415;
	Fri, 22 May 2015 08:21:38 -0700 (PDT)
MIME-Version: 1.0
Sender: vomegaz@gmail.com
Received: by 10.28.9.73 with HTTP; Fri, 22 May 2015 08:20:57 -0700 (PDT)
In-Reply-To: <8187173.h5mEVg1DiL@peggleto-mobl.ger.corp.intel.com>
References: <1432289348-5624-1-git-send-email-thomas.perrot@tupi.fr>
	<4841436.ZzPOYoFhDl@peggleto-mobl.ger.corp.intel.com>
	<CAGXeWgn1jDsCLAA-F8zvPCZ+qyGyfQtmbwe-AvF5kAuir6Z-8w@mail.gmail.com>
	<8187173.h5mEVg1DiL@peggleto-mobl.ger.corp.intel.com>
From: Thomas PERROT <thomas.perrot@tupi.fr>
Date: Fri, 22 May 2015 17:20:57 +0200
X-Google-Sender-Auth: 3BgrEq0b3kH4Rx84MmM_Au4vf-Q
Message-ID: <CAGXeWgnekY_9WYPkFoiAgmFtvsTj7FOct9FQErFSbT6xEj3tcQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd-serialgetty: Remove SERIAL_CONSOLE definition, because it depends of machine definition. Set it, here, can be make the value is not good.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: thomas.perrot@tupi.fr
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 May 2015 15:21:39 -0000
Content-Type: text/plain; charset=UTF-8

Ok, thank you for your help, so I should be a problem elsewhere.

I thought that it was the problem because, I just replaced sysvinit by
systemd on this build and serial console still terribly empty. I have
checked if the serial device was well mounted and kernel cmdline was
well formated. So I thought at an incompatibility between systemd and
rpi recipes.

On Fri, May 22, 2015 at 4:32 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Friday 22 May 2015 16:27:05 Thomas PERROT wrote:
>> On Fri, May 22, 2015 at 4:06 PM, Paul Eggleton <
>> paul.eggleton@linux.intel.com> wrote:
>> > On Friday 22 May 2015 15:58:58 Thomas PERROT wrote:
>> > > Sorry, I meant systemd-serialgetty.bb from meta instead of meta-systemd.
>> > > So replace "?=" by "??=" should be a better solution.
>> >
>> > You still haven't described the actual problem, because what you did
>> > describe (the machine config being overridden by this) shouldn't be
>> > possible. Again, did  you check bitbake -e systemd-serialgetty | less ?
>>
>> Attached the result of the command bitbake -e systemd-serialgetty
>
> So from what you've just sent, the final value is "115200 ttyAMA0" which is the
> value set by the machine config - so it seems like it's working as it should.
> How are you determining that there is a problem?
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre

