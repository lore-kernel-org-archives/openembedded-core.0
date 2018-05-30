Return-Path: <alistair23@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1A36B60401
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 16:35:44 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id n3-v6so5293829lfe.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 09:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tDaJx8u0FZrq86oAOhI7v7FOd6kvYclb5Pm1bL6fzcE=;
	b=dp+gAKKIOUAc4XnE5R7zAKJKsAcs59NkTqn5LPHNBfiFmiJlLnBrKP9GAjgHxb7QVF
	a+ifUqrqmm1HdAO6iWfGGbE6U3N35SmkjMlVz68Up5SZuZN077zMwBerD2PFldraCDeT
	wtVrriF68KDcL8WNvT0CGeuF7VVstGorXjc/VwM3BaV0Uuxuv22DScLuXDFWHrj5Epu7
	PbYj5Kdm6mO00eGzN844EB7f2pacWxkb1lmsGwv1wbW5Gs8EUjjSP+mAaoNpcORsAyJf
	BbOkvgx30Y88YdUlBVfYil4SXU6yKoZx2c2gvxIMVDobGGJ1Vp3/4hTHyavQKVpsBJ3Z
	f89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tDaJx8u0FZrq86oAOhI7v7FOd6kvYclb5Pm1bL6fzcE=;
	b=sict7clP2hiabofTwbGNtJl0kU+a1dAF4JBPqHSF4NrhSPfaPcalGGN6S1yveHDkSo
	n2HpiDfDOZuLZim0qb4RWVdgWsmgVkUnYxdSBbYa82qk3hPfXKyxR3ybrNcwx6/83+7U
	QbxFxsyTfCQzdpkb461kljVzhCXPa2hnCsZiNBBjgKlBvYMPMUPjNIvZWTgkmQiyPIKZ
	7Earv+W6egzBVe0UXOU7Ycqye+ckbmPdAmv+P5K9RLJ25pfHP7i9Di5k0/7bJ8WeaAsk
	w9c0HgZaIEel+mS2TEzkn2Vb4z7vb0/aZiOpA8dIljQoxJ1Cp6CxmpaveyMz0TrFHlZ8
	DLlw==
X-Gm-Message-State: ALKqPwfgDgSgfZNIG8jdjqR3h1DoCp7aiFA/ieI79BmDI922y9SQZRUx
	oYLuMWJ7G9m81N4zeODEjynrJa0Po/6MusOhaY8=
X-Google-Smtp-Source: ADUXVKK292rM4lN/kR5pqQ+LAvXc6JrVncPq2pgzq0BpZr1yX0uueUbqIkmjna8GDmsB6AorJxpyk45Gfo5dJ7f4P6k=
X-Received: by 2002:a19:b2c2:: with SMTP id
	t63-v6mr2256468lfk.27.1527698145168; 
	Wed, 30 May 2018 09:35:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:3c12:0:0:0:0:0 with HTTP; Wed, 30 May 2018 09:35:14
	-0700 (PDT)
In-Reply-To: <CAMKF1spNGtWNhSbavgxALEW+Jtnzr8GcxqUNJofqqO==uJUWoA@mail.gmail.com>
References: <20180502143733.6303-1-Martin.Jansa@gmail.com>
	<20180502143733.6303-2-Martin.Jansa@gmail.com>
	<CAJTo0LYvdpORbNFs4-gOn0QyPSZ3W8nQkZbX7w=C9t_WvTgCRw@mail.gmail.com>
	<CA+chaQcHdrPsQCJ94t+ifiiKfguuRirNQxY9c-KLfBeXEZqxrw@mail.gmail.com>
	<CA+chaQcRewrss+RQhhY2PEKJ_VHLyGBHrEOMR7gdFk346a2zQA@mail.gmail.com>
	<CA+chaQcq+7-XCNOqWcPNaMkXE-u-BhY0A=79ouHFRPh9NzCm8g@mail.gmail.com>
	<CAKmqyKP5HK0F8O74DtVh_=EWDmKW-A9mFVugkv5XvNUB=oh0Mw@mail.gmail.com>
	<CAMKF1spNGtWNhSbavgxALEW+Jtnzr8GcxqUNJofqqO==uJUWoA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 30 May 2018 09:35:14 -0700
Message-ID: <CAKmqyKP9o0Wanb24LisjaYx-J8y5LNtWAn01H-NgmokkQnz0-g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] qemu: upgrade to 2.12.0
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
X-List-Received-Date: Wed, 30 May 2018 16:35:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 29, 2018 at 7:16 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, May 29, 2018 at 4:14 PM, Alistair Francis <alistair23@gmail.com> wrote:
>> On Tue, May 29, 2018 at 1:40 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>> After removing ld-is-gold I was able to reproduce the issue.
>>>
>>> Unfortunately removing the
>>> meta/recipes-devtools/qemu/qemu/linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch
>>> doesn't help with the hang, then I've tried to upgrade to latest SRCREV in
>>> qemu master (currently 5a5c383b1373aeb6c87a0d6060f6c3dc7c53082b)
>>>
>>> Will try to bisect where it started to hang between 2.11.0 and 2.12.0, but
>>> it might be faster if Alistair Francis can chime in as the author of this
>>> patch, he might have better idea why it stopped working.
>>
>> I'm not sure why it would stop working between the two releases.
>>
>> I can't reproduce the hang, I just see this compilation error when
>> buidling webkitgtk with musl:
>>
>> /scratch/alistair/yocto/oe-master/build/tmp-musl/work/core2-64-oe-linux-musl/webkitgtk/2.20.2-r0/webkitgtk-2.20.2/Source/WebCore/platform/graphics/OpenGLShims.h:23:10:
>> fatal error: GL/gl.h: No such file or directory
>>  #include <GL/gl.h>
>>
> do you have opengl x11 in distro features ? these headers should come
> from mesa-dev

Yep, after adding opengl it builds. I can't reproduce any hangs with
QEMU 2.12 on top of master. Are there other patches as well that are
contributing?

Alistair

