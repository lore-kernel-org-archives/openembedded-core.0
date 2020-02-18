Return-Path: <jupiter.hce@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id E410360661
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 09:43:00 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id z1so20979442iom.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 01:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DUNtuYhE1lyh5LrdUMC7rcDlYnBTRBnL0Fw6GKYhMUU=;
	b=kIbe1DJQSJsk/xWzX6P5ZzNDnscvKVmFwivlm418TaEw9+i97LpEauOn1kMhdm/J5B
	8d/qBQvcd44d64xATTJ94hEAlNWV7pMI6t0x3c1oRXmgrLJ2wQ8StKDcNaQRTP+FA1d7
	Bt10B1RQjs3C84g5+5C6Dqj+u/avoBKcQtLK239ash2NEY0Xz1Khj59oO+zOJewjUeal
	BpeFTVqmStbCrdz9r769MJVi6SGTr6B/hNWh5UK7CID3qOf9FkELL1lDGrlrQE4oYOM3
	9gEK7GlZTibAH7+VTuYXC9Wpdey+bHuXb+rFMLMw1IgmbRIV/IuhWDPsOFZq/jLy60Tm
	A/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DUNtuYhE1lyh5LrdUMC7rcDlYnBTRBnL0Fw6GKYhMUU=;
	b=rtwtmGU+lpT5bEryzEaNWZj+RQcTH/Mqp+4xsBYb1s2u48GCOFqK76ZR7ccXfo26qE
	RKX6rwu5st5lgv9TvEGlw2Oe4Q9AGJW9b5s5PY9wc5gcCunFL6hLonJKrhdQiKenETSQ
	Uazzzoiyvn3T38V3Sraez0FzxixWFR06mcT28b5ws3tF/62wQw2qQJb190c7Du48xjJT
	fOiIot0wEs9Z2vLy4ZhVNHxGfl0Mw/EWYA43wG2UGGyGchx6tlChM+rVT3Yj0yaZ2nhw
	xSeowPO63MpBksWfJGrQZQZUmL7IfFCWcTjDn05i2bq9EPApBVreNm39fOvoUspFB2P1
	XccA==
X-Gm-Message-State: APjAAAXQhQHH0oMD6nCM1+EvOfI8brZFY0ZdwtsHu6BDa/tMjvy5q+km
	AIyU2eD4U5jT5ClknPYyvXyxZKSWELnS3azVKzY=
X-Google-Smtp-Source: APXvYqyzNe87lfIvVYg9LjM/VQB76lAGQHpsCz3nCwlj3JTKSplcu0HFiX4SgbDbfPO0+5OBJWpXK/gPv/8i5ye1JsU=
X-Received: by 2002:a6b:d912:: with SMTP id r18mr14485661ioc.306.1582018981687;
	Tue, 18 Feb 2020 01:43:01 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP; Tue, 18 Feb 2020 01:43:01
	-0800 (PST)
In-Reply-To: <20200218085848.GA104502@korppu>
References: <CAA=hcWTDqhJEE7MXFY9rvN93nf8=nWvshLoXKF3EMXYGLmZGbA@mail.gmail.com>
	<CAAfyv34yO7bSR9GBod1bXpD0sFnsSETsJQAzcmSgyY0orGtfcg@mail.gmail.com>
	<CAA=hcWQFcdUJKGTOitOAx1URD7r=9PPxsdd=hQO-Yb77=QHTDg@mail.gmail.com>
	<20200218085848.GA104502@korppu>
From: JH <jupiter.hce@gmail.com>
Date: Tue, 18 Feb 2020 20:43:01 +1100
Message-ID: <CAA=hcWREdVeYqnOs-3aSFOhobaQWvLoaEU8Rdku_RM=Q5q2Ruw@mail.gmail.com>
To: Mikko.Rapeli@bmw.de
Cc: openembedded-core@lists.openembedded.org, yocto@yoctoproject.org
Subject: Re: [yocto] Change RO rootfs failed RF Kill Switch Status and Failed to start Run pending postinsts
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
X-List-Received-Date: Tue, 18 Feb 2020 09:43:01 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Mikko,

On 2/18/20, Mikko.Rapeli@bmw.de <Mikko.Rapeli@bmw.de> wrote:
> I think you may be missing volatile-binds package and service from your
> image.
> See poky/meta/recipes-core/volatile-binds/volatile-binds.bb

I got the source in my build system, it is zeus:

oe-core/meta/recipes-core/volatile-binds/volatile-binds.bb

./all-oe-linux/volatile-binds
./all-oe-linux/volatile-binds/1.0-r0/packages-split/volatile-binds
./all-oe-linux/volatile-binds/1.0-r0/sysroot-destdir/sysroot-providers/volatile-binds
./all-oe-linux/volatile-binds/1.0-r0/pkgdata-pdata-input/runtime/volatile-binds
./all-oe-linux/volatile-binds/1.0-r0/pkgdata-pdata-input/runtime-reverse/volatile-binds
./all-oe-linux/volatile-binds/1.0-r0/pkgdata-pdata-input/volatile-binds
./all-oe-linux/volatile-binds/1.0-r0/pkgdata/runtime/volatile-binds
./all-oe-linux/volatile-binds/1.0-r0/pkgdata/runtime-reverse/volatile-binds
./all-oe-linux/volatile-binds/1.0-r0/pkgdata/volatile-binds
./all-oe-linux/volatile-binds/1.0-r0/license-destdir/volatile-binds

Are there correct?

> It may be missing /var/log but with systemd there should not be needs to
> write
> to that location after image builds...

The volatile did not have the log, so /var/log -> volatile/log was an
invalid link, should I manually create it?

Thanks Mikko,

- jh

