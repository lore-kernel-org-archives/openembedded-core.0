Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2B6A4601D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 21:50:45 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id x190so4127001vka.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 14:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-transfer-encoding;
	bh=9DsjpkiUea+cuUlqYJJrzjl0wMpuTeGYZzcMNyuC1gQ=;
	b=Ttyy+2oaXLOmgIKeaLfjlErOfc8LBC+TbATjLNK+I2k/ZxlaBfYr7d2pUd6ImVgDQu
	614xUTKeE4eQsPV00yGvQjMKefSoqC+JzMFw/G15BGiDDnBDBUF4MLKT/ZxBMWbNPZZ9
	CyW+wNIz5ijqC8vfL9UtMBFHuCj+qkCRFmVHpVmR61T3CKim4PCR+tl4COHqYSF3RGNO
	z1oGnNj8mo9z3SmwUY+OP1TWmBEKZA/+Tj6hr5ihlLr89HaQC5jIA2+a+1/dGt8cIyxA
	HZBoMam+kgpSW+l+jXmhTv3DkqFBTHwXTiL7TzI6R9ogbI6CxYJKKADKXqUuzX2E/4h9
	dHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-transfer-encoding;
	bh=9DsjpkiUea+cuUlqYJJrzjl0wMpuTeGYZzcMNyuC1gQ=;
	b=A8jlCR53q36AHQ7hH767qQSsbRWDM38Y70BXfLX4Y8aaZsWNCf/y1PRK8bxFRLYnj1
	oiu57WdDg5n1SvWrWTzBGq0j9LXn+bpBW1+SeQ2iWTle2nhX1u6PplsabverR1rL2LcK
	yTda9jfu9n3iWsvYDWh9IlNed2hIzHUS43zJgm6kkjyRfU3A5D1b1JK2VnWEDeOKzNas
	mZwEz2mbGm7AlZMjZ7lJIq14qktCj6wLJxj2bJhJWSFntEvKrfW0dEYPBhpsG3To/IaS
	9Ifpzlqu9AYDwDotm0DiL0fl2xLskJd2OCyZh7tksuWDdfP+CZQHtTHQwNPY3S31J1rU
	ioow==
X-Gm-Message-State: AOPr4FVRp/nBuX5zTMMZ9pinb2MAdaAyDd5v/coWIE+2iEej0VyQ2dEbVHlOFZ5oOtDRLdo0Nz5VgCD5vhTIZQ==
MIME-Version: 1.0
X-Received: by 10.31.1.67 with SMTP id 64mr2558351vkb.130.1461102646377; Tue,
	19 Apr 2016 14:50:46 -0700 (PDT)
Received: by 10.176.2.141 with HTTP; Tue, 19 Apr 2016 14:50:46 -0700 (PDT)
In-Reply-To: <1461077648.31320.15.camel@linuxfoundation.org>
References: <cover.1459147231.git.hongxu.jia@windriver.com>
	<62a9bef209d903048c1095d90387384115eb6fd5.1459147231.git.hongxu.jia@windriver.com>
	<CALbNGRRL0O+j6axaHL3W2bKZLLyYEe1kxsiguZGL0=a1Lz8ryg@mail.gmail.com>
	<571496CC.8010607@windriver.com>
	<CALbNGRQwKQJxC+17UAoLBhhN9ZfXrYF4Ysur68NCD8v24Uavcw@mail.gmail.com>
	<57149B89.2090607@windriver.com>
	<CALbNGRTgnNYhN68zcDBKrhQ==fxP9wJ7wjj8pQ5jvMEgF=DF4g@mail.gmail.com>
	<5714A30A.9000204@windriver.com>
	<CALbNGRSBJSR4xMqCOUvu2yQcG38E=1UZBehkjmFZLdrtRyfamw@mail.gmail.com>
	<5714AA1E.9020505@windriver.com>
	<CALbNGRSe6B9-QRftL54DEEKrmCjxTt91K7FXk+CUzuGxjTvf5A@mail.gmail.com>
	<5714DC35.7040206@windriver.com>
	<CAJTo0LYTcA-c99-T_Z6q9Kn=X2C9Y1kBX+D6rzHrn+eLMUcSdA@mail.gmail.com>
	<CALbNGRR0ySfXHZFgTAPGCi5sZXehjG3_vUzGobawrTW6-DOOVg@mail.gmail.com>
	<5715DF5B.5030406@windriver.com>
	<CALbNGRQB-BUVH6qcQxey9CYOji-z8ydVA==qi5bx-ouBVpGaWw@mail.gmail.com>
	<1461077648.31320.15.camel@linuxfoundation.org>
Date: Tue, 19 Apr 2016 23:50:46 +0200
Message-ID: <CALbNGRStWoHwOy+HvgJ7-Nu4BEfZSY1pxjhPfV7ymDsVX++kig@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/17] conf/bitbake.conf package.bbclass: fix dbg package not contain sources while -fdebug-prefix-map used
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
X-List-Received-Date: Tue, 19 Apr 2016 21:50:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 19, 2016 at 4:54 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2016-04-19 at 16:11 +0200, Andreas M=C3=BCller wrote:
>> thanks a lot for your efforts. Do I understand this right: You
>> suggest
>> to use build sysroot (on my own risk - as I did before) and make gdb
>> happy by linking sources?
>>
>> Problem I see is that we have multiple package archs e.g
>> ARM/ARMThumb/Machine so ${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}
>> expands to multiple paths. But a script symlinking all together + set
>> substitute-path might help here...
>>
>> I will play around with this in the later...
>
> I was thinking about this a bit more and there is another option
> available to you which would be to pass all the debug sources into the
> sysroot as hardlinks to the files in workdir, in much the same way as
> we do the other sysroot files (which you don't strip).
>
> Since those files are collected by do_package you'd probably have to
> force do_populate_sysroot after do_package but such an additional class
> to make these tweaks probably wouldn't be that large and would just
> affect performance a bit (with the benefit of the debugging you want).
>
> Just thinking out loud really. My big worry is all the different
> codepaths we have people using, equally, you can't get performance
> (disk footprint and speed) and functionality in some cases and people
> do want to choose different compromises.
>
> Cheers,
>
> Richard
Yes such an option would make both possible and is worth spending
efforts: Releasable and properly linked debug sysroot/-dbg packs and
'quick' debugging on top of current build-sysroot.

I can't promise when (daily coding for food eats up my time) but I'll
try to get something to work on this matter. If this will lead to
something (and even if not), the chapter for remote debugging in docs
needs love. The IMAGE_GEN_DEBUGFS / IMAGE_FSTYPES_DEBUGFS can be taken
from this thread :).

I would like to append some notes how to remote debug with qt-creator
- it is really easy to set up and does so much - not only when
debugging qt applications...

Andreas

