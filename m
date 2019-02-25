Return-Path: <daniel.diaz@linaro.org>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 25BBA7CA98
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 14:00:40 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id l5so7498220lje.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 06:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=tFmsjRGy43086dgpxyUTf71PE16ulPbLuKnGGSTbOsE=;
	b=Sic6HyU7MgLfccElGwNsavnuB4nClqq/HWJZmtNXRrQqpCXkL1z3xBdsZvrs69KN6t
	60r+dBDbX03K+PWl0RzbFZEIMSQFHjTmWXsNI9xqBRsvRhVgSxcIKCMDwLfvqsF9+IZX
	0bgelDQMEPI2klOlaPx5lcvRpEFKg3NVMLHHaxAGcfEFnfdboK2M4jiZ9/Gow1SGPh67
	RGDq+Kr2Yy+gM6cBSKvW0I9EjHstNF1PliFxiSvJ4HwmiL5DDleCXTohcXCvp6PaCTgs
	enZ8GCfebE4chMC3LiEbl9o2+xjDMrjixm8PzOOcIwGJOa1uRFTCzlUY0Q8md87fCFvu
	A5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=tFmsjRGy43086dgpxyUTf71PE16ulPbLuKnGGSTbOsE=;
	b=pLIWJx1UkvPxwQI8Z8HzOfkmZn9jtljaiOzNA25AEihRJ//Yrmy8PF3abetDlQONe6
	1wkT7EMfcA9FxD+DEt/BPU64pUOE4qoaEVen5m2e6b388uuvCcaT6tZIx03GPBqRGngD
	WSNLEEybQ1u1Azg5jdt60KRYALt4ocwNJof9dbx6tDaCsdN3eUQc0ylaTrhEPHl6oIt8
	yTogShhzHQR0Y0mYI8iN1OBC4lDROB+nw1c3ogw7NBZopRGYmgqlUnmtfYXU2l6tehPJ
	x042MiEX43jjZEdlFo9FXMQm2gzhzDPiN+or6p13egVVDON52dodVwQkyf5fpyN5u1NI
	psGw==
X-Gm-Message-State: AHQUAubckAfmK1OeaVsqW8STNwR5ERbOEKSC0CJ87LnvzCoQguY/j4hq
	k0G0zCy8GcTbrDVtle/VHpHWuyjON4lrGD/EEme4IQ==
X-Google-Smtp-Source: AHgI3IajtwfZtVo/5vzqrqPWZnMDpfuTjdAwyejeAjDnKuSR3rbT4GPzKjB3XjKyFhRoSUrESjLRC0i8z/TYrUgbP30=
X-Received: by 2002:a2e:21d2:: with SMTP id h79mr5867050lji.39.1551103241385; 
	Mon, 25 Feb 2019 06:00:41 -0800 (PST)
MIME-Version: 1.0
References: <20190221182103.13174-1-daniel.diaz@linaro.org>
	<57b7d2afe13b3038edf9c34f9106f7ea7fcf88f2.camel@linuxfoundation.org>
In-Reply-To: <57b7d2afe13b3038edf9c34f9106f7ea7fcf88f2.camel@linuxfoundation.org>
From: =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
Date: Mon, 25 Feb 2019 08:00:29 -0600
Message-ID: <CAEUSe7_En46Ji=GjU3EmRBvocfiZz5YQO9XcOeK9+9Hf+9SCug@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ltp: Bump to 20190115
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
X-List-Received-Date: Mon, 25 Feb 2019 14:00:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!
On Sat, 23 Feb 2019 at 10:07, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2019-02-21 at 12:21 -0600, Daniel D=C3=ADaz wrote:
> > This patch has been refreshed:
> > * 0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
> >
> > These patches have been dropped as they have been merged:
> > * 0001-netns_helper.sh-use-ping-6-when-ping6-is-not-avaliab.patch
> > * 0001-setrlimit05-Use-another-method-to-get-bad-address.patch
> > * 0001-sigwaitinfo01-recent-glibc-calls-syscall-directly.patch
> > * 0001-statx-fix-compile-errors.patch
> > * 0001-syscalls-fcntl-make-OFD-command-use-fcntl64-syscall-.patch
> > * 0001-getcpu01-Rename-getcpu-to-avoid-conflict-with-glibc-.patch
> >
> > This patch has been added:
> > * define-sigrtmin-and-sigrtmax-for-musl.patch
> >
> > Added these rdependencies:
> > * file: for ld01, file01 and logrotate
> > * quota: for quota_remount_test01
> >
> > Signed-off-by: Daniel D=C3=ADaz <daniel.diaz@linaro.org>
>
> I think there was already a previous version of this upgrade which also
> didn't work:
>
> http://errors.yoctoproject.org/Errors/Latest/?filter=3D480efd388db578106a=
8a2129c0382b7e56a1ee36&type=3Dcommit&limit=3D150
> From the -Wformat-security -Werror=3Dformat-security security flags.

I thought the problems were with MUSL and Glibc 2.29 (for which I
built). Let me look at these problems, then.

Thanks and greetings!

Daniel D=C3=ADaz
daniel.diaz@linaro.org

