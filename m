Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8BC6E7C90C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 10:43:58 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id y6so1072939ioq.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 02:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Tk6tPeqhJxs2r5yAcFLG3dT4YaL4pXQNJYKVswkfWG0=;
	b=PpMjp1hkfezAzJ6v2poMwsRxVD7b3/8we1ouT98HZPhobXThT5w0Tp1VSJ2TUcFWRp
	0LyaiqY3SUGG5NBVSQzGv4pGH/7pvQc28tjarwsO5dxUlkDQ2LC+3BZfSldm97Vh+mfE
	f2zfnkGYEyaQjWYsKT8Rsxmf1LPhJ/hWHplkjKWICRoh/1q3Ou7WxYp5PaeDSmFaFLJ7
	j+NvlLp7zj8lFdi8y53K6asIJ2QXqyDL2niYT/lGvuLQt509oQxEECU4FfqS/5gGqqEh
	2E2sn9u4m5fufbweeRYHBfRk/ds/H4KwiIsRxvUbXY4OdKKIMNX90T/SmCjN/w1GDVIj
	dCVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Tk6tPeqhJxs2r5yAcFLG3dT4YaL4pXQNJYKVswkfWG0=;
	b=ruLRCF7/XIO4ynhN8WAK/iuHeXkhCjQrV/DLbQ9+VOGUNPgsotuh9tyDd4aycJv7fo
	V84BOYxaHPjM4iKYi2JVZOrQzAfF/rnRrjDyzSudbrhzdNv3EGDIuXuRUTO+Jeo19ysV
	8QvFuXtNpUTsVSVHeoJhHu+LHCp1/pLjisAEU7Z/5zPlh3x39FGFtEEcuOGKBru40ea5
	MnUY+Y2exPnUFa88+qfkTHvRpp5/u14at0GzepqYR/9On0HQEv7yhPLR1aUTnhzgZ3XL
	H8gmonjjZsdRWNiJ0JMWaCQ4TstkQxgG8B0bazKrdWg6DCxNYVsB/HH1Uy9BIMaXtLN3
	0Fpw==
X-Gm-Message-State: AHQUAub2r4Y0oP4OR2dz4iuRxp8hrxf5WiEmmNiAhUGwPfJeNl4HLye6
	Y8gpvRkKb3/fieSdCVfkp2iIF44T5fOjlWJhf6YY3g==
X-Google-Smtp-Source: AHgI3Ia/WESFJzksN8kolSahZRhuTpLYORtfdNl0ONfHRoy6O0QkTbL8SUDkE+tvMB7shVPO0DZoH3W60YheFnK7x5Q=
X-Received: by 2002:a5d:818d:: with SMTP id u13mr21597829ion.20.1550745839497; 
	Thu, 21 Feb 2019 02:43:59 -0800 (PST)
MIME-Version: 1.0
References: <83ec17fa-88b0-04fa-adab-b402b10c6339@topic.nl>
	<CAMjhiJjO0+0=_6HOmVM67U0nnbW=iu-FiMTzJBe4ZCvceuguuA@mail.gmail.com>
	<CAJ86T=Vy6AMbJ0J23V_9K+GJxwCFjD-Gq7NQwZ7AeJSW5Lum_A@mail.gmail.com>
	<CAMjhiJgFxSH3Rz+ot6qAZN1LPF=WmZ1ySt0Y4TSCg0S0m7YsxQ@mail.gmail.com>
	<7ff71b82-b17b-99c1-407c-82692094054a@topic.nl>
In-Reply-To: <7ff71b82-b17b-99c1-407c-82692094054a@topic.nl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Feb 2019 10:43:47 +0000
Message-ID: <CAJTo0Lb=q5asA++zoq-MHCP7wE7gs=iGB1f2qJ5XS3EgdG6NXQ@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: wic creates ext4 images that read really slow in u-boot
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
X-List-Received-Date: Thu, 21 Feb 2019 10:43:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Feb 2019 at 10:17, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> That'd be best. One would expect that creating a filesystem "offline" would
> yield something optimal in terms of the way files are allocated, since
> everything about all files is already known when it's written.

But because we don't run image generation as root in a loopback mount,
we're limited to how clever e2fsprogs's debugfs is, *not* the kernel
driver.

Just a few weeks ago I fixed a bug in debugfs where it was only
writing the first 2^31 bits of a file...

Ross

