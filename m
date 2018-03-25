Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yw0-f172.google.com (mail-yw0-f172.google.com
	[209.85.161.172])
	by mail.openembedded.org (Postfix) with ESMTP id 24CF571AD1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Mar 2018 21:18:20 +0000 (UTC)
Received: by mail-yw0-f172.google.com with SMTP id z82so5559528ywd.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Mar 2018 14:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=03Ppi135m1s9bXlBEg7In5/g0dLE3cDGf6dgV8BAAqY=;
	b=rdQ46V3dCNmE4phFVNhG1go3YFiWZTS7rVK6Yt6Wjy5Ww8wSobThJSyFDgDn8D44uX
	SmwF50Mfd4bAngICKYtt63k8b+vkqh1qCR7goLZB6XXAN+548caW6IoT1Eun35a5+xuJ
	FWPDfV/wMrqn5dkk82irJy8dZSZynFKspaHEljXEdQ7XWS6r0jstwhOt9CG56CwsTLxJ
	160MmoRV+EbCycGrGrXigiSqPZmfkSGJAPExBsr+j+DeyIqAoMUJZGv7tT8IZVxT4iPp
	Ba8QmcIQjm/MGN47UEJQ8UAm1GGxArYzcLp4NWpDEN3akWJcJMdjzIoTixNdci3bXayj
	ojAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=03Ppi135m1s9bXlBEg7In5/g0dLE3cDGf6dgV8BAAqY=;
	b=FMxYbwShkwpRwpwul6LtLgiQdE9U8LeklDn/YSvsJ9MS1RktdmYmz936danJ5khiDT
	RcT03e0HFnaVCMI9EWY2z5djisKen4XPI3TL6uKNux92FkS20t73fq1r4aNlThd0oCkX
	8rEkqz92vyhQrVRusomfCQmNiHHM/94hXWpffCH6j/2W3L3W/m5vJEkR4UjzORBNLBor
	Lg2d+sHNN0RdNFPEqTII2M1HEv5AkBcjwm0O9rpt8bLbXOtyqHNkcp63gTORFkMiwohz
	J4qHbG76XDnk8Q7KLRN+dQnwwR8uUfUoiJFqiTuWu/ToYkx5oplaFq7bQgSQyP99BJEk
	Osxw==
X-Gm-Message-State: AElRT7GHx26U9G7FD17t8HGhMiv31HFEcPaYiYTJfPsN3hJ4WlnLUQzu
	HBsyA+6Jnhev50h1pWoBtvgEh9gidfTWVHGaGb8=
X-Google-Smtp-Source: AG47ELszb2+kDxOPoRu5HXyxotCzzo2jkk+VrBsCO5zRAumuQxkudO+JibtYz2DK2zoG3zE7OuOTmA/BzrmRxd5pYdo=
X-Received: by 10.13.249.197 with SMTP id j188mr21941351ywf.318.1522012702007; 
	Sun, 25 Mar 2018 14:18:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d105:0:0:0:0:0 with HTTP; Sun, 25 Mar 2018 14:18:21
	-0700 (PDT)
In-Reply-To: <CAPGMVzE+kKb7OwafERjT6J+iSwWU-4R1gvx0tD5uBTabQ1B-5g@mail.gmail.com>
References: <CAPGMVzHQwth9b6MxA79OEwCVPMCwJTZ+j-WKwz-uemgXoPZy7g@mail.gmail.com>
	<CAJTo0LbL6BA5sNeOi+sH8VCdDBDhvdkztFxbQSkAsau2FRuNUQ@mail.gmail.com>
	<CAPGMVzEA52STvoMh=cAHqxsYc++pmxmhywVM082thHuB_OJ_0w@mail.gmail.com>
	<CAPGMVzE+kKb7OwafERjT6J+iSwWU-4R1gvx0tD5uBTabQ1B-5g@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sun, 25 Mar 2018 23:18:21 +0200
Message-ID: <CALbNGRQn-1vmg_pa8VeKM4UwgHyMq82zSJHZ--gaxCiDesgqKw@mail.gmail.com>
To: Rajath C S <rajathcs.1996@gmail.com>
Cc: kazuhiro3.hayashi@toshiba.co.jp, yoshitake.kobayashi@toshiba.co.jp,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-debian] build error
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
X-List-Received-Date: Sun, 25 Mar 2018 21:18:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 25, 2018 at 9:58 PM, Rajath C S <rajathcs.1996@gmail.com> wrote:
> Error while building opencv
>
> ERROR:
> opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0
> do_compile: Function failed: do_compile (log file is located at
> /home/jarvis/poky/build/tmp/work/i586-poky-linux/opencv/3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0/temp/log.do_compile.7688)
> ERROR: Logfile of failure stored in:
> /home/jarvis/poky/build/tmp/work/i586-poky-linux/opencv/3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0/temp/log.do_compile.7688
>
> may i know what this error is precisely referring to  i dint have this error
> when i was trying to build opencv yesterday
>
> Thanks
>
My opinion: meta-debian is by far the worst layer I've ever seen. It
overwrites many (and tries to move from many to all) recipes with own
ones [1].

My suggestion: Remove meta-debian from bblayers.conf and try again.

* If you are fine - open an issue at meta-debian/github (error was
caused by meta-debian)
* If build failure persists, it would help to attach the log files the
error message referrers to.

[1] https://layers.openembedded.org/layerindex/branch/master/layer/meta-debian/

Andreas

