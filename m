Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by mail.openembedded.org (Postfix) with ESMTP id 276C6731B9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 21:52:53 +0000 (UTC)
Received: by mail-yw0-f196.google.com with SMTP id y6so7522461ywe.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 14:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-transfer-encoding;
	bh=/Jt13cIndVm5lenUWJvtYG8U16kPPf1+5xN0kii9I7w=;
	b=TR+e1fzZ44WklZTMKdfnU7HSSlA9fPg3cgBhGxvR4z1lVG9Dn6kYS4S7hevZc1V9s9
	w1dSX6/vm6Jq1eqpG/FfDJ3AxlofrunsWHsBADEVg3E75UpK9dwaMqtQ9vdaiTKw5XR1
	OqebLOe+ryS1aTZNCWzwun5mUn7ATHf8SFGOVplBu8yd8J0xOd4kdOlcULHGCuHKrLDG
	UeUthAoNkMxRo+D6R2xqplezoiDmRJypHV+7QgHS3czWDoK/zCzlJk0ykuckbkjzQTvZ
	X/BBfKppIShIwImVirXBxDULn/tGHYXfjzgk/lwhrbIZDrhQ8+04K/1pjr2pRyedJERW
	0FDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-transfer-encoding;
	bh=/Jt13cIndVm5lenUWJvtYG8U16kPPf1+5xN0kii9I7w=;
	b=iIf+pjyP4Wu5yePvATCVKtRFeb1GDqVbGoLICb0EXHAZAcafWou4bpskfNtEUfmfTR
	ZzyeT5haI7DneXPr3YwOXQB5rr42nsV5S4yEQazr0eCUR177h76FhQgNW4zG6pZ1xsHm
	G6JPKgPB+25hZt+TA/jTOPl8qbPIxQiZQUBj9AG5sSLxVXrcQ6FpgAUYtv9AMm2lkHIX
	/k2l8E2Pz2Ymy09XFMarJR3ZhINIxMjDkLUlEBM6UxtdtDp360IlrupiIzQJlQEyJzVT
	ZR8zFswZnKgt4YsrKvEhAwNHEnRpY+uGr4bWajkU0Fg5RCME6tVFsLHAVJfRgL8TFhtz
	IQ4g==
X-Gm-Message-State: AOPr4FVYwTcIuCxZCTEvwv1k3TbVZkZGX1OaRFY3jh3gyY/vZYG7uG+Gb0wgfnrowoa/CTiKK5X35IG2QGkqlw==
MIME-Version: 1.0
X-Received: by 10.159.36.15 with SMTP id 15mr9145540uaq.48.1461879665392; Thu,
	28 Apr 2016 14:41:05 -0700 (PDT)
Received: by 10.176.2.141 with HTTP; Thu, 28 Apr 2016 14:41:05 -0700 (PDT)
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
Date: Thu, 28 Apr 2016 23:41:05 +0200
Message-ID: <CALbNGRSrNnrheF5QbmC2PrjROM+xvavU8gc0M=7PHbfFCtGVhA@mail.gmail.com>
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
X-List-Received-Date: Thu, 28 Apr 2016 21:52:57 -0000
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
Would like to come back to this. Would something like:

addtask do_stage_sources after do_package do_populate_sysroot

in a class enabled by local.conf do the job? I wouldn't have expected
this to be possible until I found something similar in insane.bbclass.

Andreas

