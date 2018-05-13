Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id E0BA174D54
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 May 2018 20:05:35 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id f21-v6so12801594iob.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 May 2018 13:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0HYH+KJ8/oysEZC5/X2fwqxPJI9HiC7tKIOHRtS9hX0=;
	b=PRVB8aC8ilvwS0hkOjNMLcrPYgEjPPxMRpqWZkF/UROBV15HYF5hVHrmjeZgW/G2iY
	a9u2JkxpXAjFvfm723LgOe+PA+wzYObvjTElhA21SJdO50hK1sgRDSByemGEEXi9rwkP
	JtnuJrR0YMoeEJYSovKcVWPj6YfakCxOgGfY6smUrY5LDd4+FyfK2n0aXxbmYxXuOI1c
	u91octWlntjzIsSMORKew4CwwOSXmC3VBG3t7j15HnkbUyP1HPzQ8vyx22j4LeIJuiNG
	hCoshYXvVbmLywGJzevCDZWr8x47hE8XuG9yg4o1C4nPNXomypSiLuX0ghJdyMz6BeGF
	Qgjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0HYH+KJ8/oysEZC5/X2fwqxPJI9HiC7tKIOHRtS9hX0=;
	b=iRXGGjBJlpYHBvK8MQ3uti9ejwvi6Nw8a3H7n1C5cTqU+9Cz2NVk+bNrprftk2Swmw
	FpLochjkYJC5GI0jjaDXRDdg8t2nHk2wchnCLzJbSk1a0OvEIYireB/0sTifcFpMHc7+
	tiMmG9LjANNwRzYcxIhETmjFgu4V7nQlFuNBHCZTSugtw+LJ2B9nZ3qYdMPEvPcfCBSx
	ftvx4BVSORO4v2Sm17gfjx25wS2lm1eSUmtL0HGr9IdoKcsj1dMw0BZnLlUEMrnlcGlD
	NXQuqQHiJnu/+bDeR9qsYE8jmYon5AcjznATuPbbBXe0fRiABiKmx9eElNoOV3NZ5Y4g
	zOvA==
X-Gm-Message-State: ALKqPwevnRqpvD4aUYO5/x1hztssEZ9w/8TgkHKEQpuhQNQzsTlw3Cqb
	iR0rSDTgCiHX2g8pKUYm1qPvArmqSDBMAXY24/oLBA==
X-Google-Smtp-Source: AB8JxZodjXTPC2b7h2DbDnWy5AgxhKxeh4jKXqnlXqJ5KRqAauj9tZY8gdb2cw/1kZDrFUcCcVsX6IArVGk1WNWDJOY=
X-Received: by 2002:a6b:6b16:: with SMTP id
	g22-v6mr7574751ioc.20.1526241936708; 
	Sun, 13 May 2018 13:05:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.239.11 with HTTP; Sun, 13 May 2018 13:05:16 -0700 (PDT)
In-Reply-To: <20180511192103.7581-4-Martin.Jansa@gmail.com>
References: <CAJTo0LaJNCzWjNEsJw42_io2mC3iyDMoZ33SVj8huJLQQ7urhQ@mail.gmail.com>
	<20180511192103.7581-1-Martin.Jansa@gmail.com>
	<20180511192103.7581-4-Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 13 May 2018 21:05:16 +0100
Message-ID: <CAJTo0LYxyM-sMx6_UdOoeQykuKXTZyXyuhUfUR2KWzf86MEOGA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 4/5] qemu: add PACKAGECONFIG for virglrenderer, sdl2, usb-redir and spice
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
X-List-Received-Date: Sun, 13 May 2018 20:05:36 -0000
Content-Type: text/plain; charset="UTF-8"

On 11 May 2018 at 20:21, Martin Jansa <martin.jansa@gmail.com> wrote:
> * sdl2 when selected needs sdl as well and will depend on both libsdl
>   and libsdl

Is that a limitation of the qemu build, or just how the configure
options work?  Doesn't seem great to need both!

Ross

