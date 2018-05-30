Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3122F74D03
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 02:16:56 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id c2-v6so21373995qtn.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 19:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Y7efNwDWVlIf+yHLBNQZ22VU+yX7o4S7oWtOLr4K+cE=;
	b=LKF9Kj9j6P3pXpV+2pcMEvJTNLAleIfOCU0QQ8YIG2J4TY9v4rx2DT/sskgcr2bbzF
	QRPuONsKnCxOYygMdARrLQJJK0vt1S+eWjVJKXK6g7aIY0BL7QVGdsKaqEc7DIUo18PE
	Z4IX2YyPehHFYuqPTroNmAi0m9FYcunduwkV6nZtnEuOAAHQl6OPyvoU51tsUntyDYAj
	KA3V/nqL22MEcDnUcUCsDJMwwTLgjqADFu7zkv6g2eaNiJCodqXoM2Ju7JCkzE/3XTez
	nZKXq/o4E5IEknlCRC6+W4mnvOUZihtLdic4RbEbvMyXU3RIGJRZr9/pVke7tqyLEhjn
	g+aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Y7efNwDWVlIf+yHLBNQZ22VU+yX7o4S7oWtOLr4K+cE=;
	b=jUvF0pvAxue1opQd7IlGIJ3oTocJ/89sEGpCRofn9NgHp2xM6sIuMq/0IEH/0Yc1Uk
	LM3ssxhCWWsIfSi/FhmjzLKozyHftFy1tsCQwyZ+Q1tgVJKmDBLnTDd1zY+VpYFSHwk1
	J9XEeKpRTYNtJVBrIgG4qvn7CMMQVrkKQ6G79OFIQjQNJnhLsFWIYdS5lJs7uIVlK8nH
	zP6sOmJiJiIg4ZxKs4FRiLKB2u8cMZl56TOLUZcOk+jSA8HXDEJgPVrimlgzghkKOFjn
	LnD+UOjPFL3IVL5FXxIS/1m4pwIlRcy5g/3/9gkjYJDt6zVGdsjXCraDei7OjKXEh8Tq
	CZVA==
X-Gm-Message-State: APt69E2M9206chVCo6lLT1s1ntgf8zL90oItGQrlPf3uDLsjcAoeT3Jc
	+kxlrjF7RVLUEijHojVt9NLDtRBDiSwSOqxWw4o=
X-Google-Smtp-Source: ADUXVKLY78RaVU2k+jMYR9a6eFmfDUuRGx2cpWmeW++KqMqPtTLNyPqOfmVWm0z8Rr7XaIw6vKmq/UX5kjNPXk6p3ME=
X-Received: by 2002:a0c:e485:: with SMTP id n5-v6mr816014qvl.74.1527646617761; 
	Tue, 29 May 2018 19:16:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:e486:0:0:0:0:0 with HTTP; Tue, 29 May 2018 19:16:27
	-0700 (PDT)
In-Reply-To: <CAKmqyKP5HK0F8O74DtVh_=EWDmKW-A9mFVugkv5XvNUB=oh0Mw@mail.gmail.com>
References: <20180502143733.6303-1-Martin.Jansa@gmail.com>
	<20180502143733.6303-2-Martin.Jansa@gmail.com>
	<CAJTo0LYvdpORbNFs4-gOn0QyPSZ3W8nQkZbX7w=C9t_WvTgCRw@mail.gmail.com>
	<CA+chaQcHdrPsQCJ94t+ifiiKfguuRirNQxY9c-KLfBeXEZqxrw@mail.gmail.com>
	<CA+chaQcRewrss+RQhhY2PEKJ_VHLyGBHrEOMR7gdFk346a2zQA@mail.gmail.com>
	<CA+chaQcq+7-XCNOqWcPNaMkXE-u-BhY0A=79ouHFRPh9NzCm8g@mail.gmail.com>
	<CAKmqyKP5HK0F8O74DtVh_=EWDmKW-A9mFVugkv5XvNUB=oh0Mw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 May 2018 19:16:27 -0700
Message-ID: <CAMKF1spNGtWNhSbavgxALEW+Jtnzr8GcxqUNJofqqO==uJUWoA@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
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
X-List-Received-Date: Wed, 30 May 2018 02:16:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 29, 2018 at 4:14 PM, Alistair Francis <alistair23@gmail.com> wrote:
> On Tue, May 29, 2018 at 1:40 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> After removing ld-is-gold I was able to reproduce the issue.
>>
>> Unfortunately removing the
>> meta/recipes-devtools/qemu/qemu/linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch
>> doesn't help with the hang, then I've tried to upgrade to latest SRCREV in
>> qemu master (currently 5a5c383b1373aeb6c87a0d6060f6c3dc7c53082b)
>>
>> Will try to bisect where it started to hang between 2.11.0 and 2.12.0, but
>> it might be faster if Alistair Francis can chime in as the author of this
>> patch, he might have better idea why it stopped working.
>
> I'm not sure why it would stop working between the two releases.
>
> I can't reproduce the hang, I just see this compilation error when
> buidling webkitgtk with musl:
>
> /scratch/alistair/yocto/oe-master/build/tmp-musl/work/core2-64-oe-linux-musl/webkitgtk/2.20.2-r0/webkitgtk-2.20.2/Source/WebCore/platform/graphics/OpenGLShims.h:23:10:
> fatal error: GL/gl.h: No such file or directory
>  #include <GL/gl.h>
>
do you have opengl x11 in distro features ? these headers should come
from mesa-dev

