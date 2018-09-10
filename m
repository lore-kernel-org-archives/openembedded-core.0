Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id EE6C1797B6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 16:38:59 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id b15-v6so41363994oib.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 09:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HhaiJBWUgIHouSYc7zrd/zqdyOaw3LuikVvcxvJS2zQ=;
	b=FK//8JBIKnUKRP7njtciJwZhTuunh0L0OIvHnb0BkU8fY5zlu9RuikOoyhp1h1t5Co
	c9TWKYc8OxWgGBmvdmtWQSA5MZ3jvblkHEq9VqScM6cUIOKemzpgthypJu9sb3y87cxF
	hq13uv943OR7jV8Qk2MckCJvDtpD+wim5Esb9ewANJ9S9dtwaFjrvTJQzH+KZ3di/DMi
	SQGXE84LOGoKflUjwCmtuW0ubZ21gelRG4eJVrY1a/81yZdMlEtIzWIu8Fio95afnFJ6
	gPUHpsozSddWnBWn8o8ZQzdnLFgALwxIkWMleTtbpTNvNMPsOXkFGiiL0ha2h8ebQZNY
	ax3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HhaiJBWUgIHouSYc7zrd/zqdyOaw3LuikVvcxvJS2zQ=;
	b=KtIvavztTTJUUyV2EF3P4GPT5ufljrbqzbnvr9ldzIXeG1xZIJx/D3XIOsBb10T4LD
	yhqix4u6hVeFPkQ8b0dDSM8kqZ2KR9y1eYb2x2ViKzuNDuWFazYyAXpMhDc9jfEVdktX
	hkAXm6UUlkgsz+nVgoYNSp7FhsWTVTI5q5wAXRiKXyrb6A5fN06ithGQAe4+bO0WHyMi
	5RtaWuSgaNttS+Gi7G6gCObB2AxQV1D8G8GTMPJ1gR6ezwvdklP382ztkUHamcUDT0mF
	1p7w4pxxRxLkU+OFMTmf4R20WNtkSuhOqOLjVpvrphdb6WQ1RiYuiP7i674ATy0P8rPJ
	HWPQ==
X-Gm-Message-State: APzg51DivvhBmcw6GzMTj42MQ+64OCQWfw/i3ELDCga7f6rV8MwsqNZQ
	qYjqYOBonRPannBOZoknqkHwtFtdedjkH0GmwXNzpg==
X-Google-Smtp-Source: ANB0VdZQ1fuc9Cr+dOdBdd38BItJFi5JqIkdXmPed1ci1TQVqOSjht/0lKuP7e/Uir31PcQVa2IiMwsxF5gtOCpbRVs=
X-Received: by 2002:aca:6cd5:: with SMTP id
	h204-v6mr21976074oic.140.1536597540764; 
	Mon, 10 Sep 2018 09:39:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:7ac:0:0:0:0:0 with HTTP;
	Mon, 10 Sep 2018 09:38:40 -0700 (PDT)
In-Reply-To: <6FC71ED0-1800-46FD-9A0D-1664CE908975@netbsd.org>
References: <20180907145533.31088-1-sno@netbsd.org>
	<10772E09-62BB-4CFC-A99A-F4816FAE87C1@netbsd.org>
	<CANx9H-BfgTfmNs+oGxC-Cm=Tp464=fpZnMb17vbTWsRg2LTZdg@mail.gmail.com>
	<CANNYZj8dyfuOnHxqE7V5n3sz=3XjqPS98E2n=t2uJbPkvczKyw@mail.gmail.com>
	<6FC71ED0-1800-46FD-9A0D-1664CE908975@netbsd.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 10 Sep 2018 17:38:40 +0100
Message-ID: <CAJTo0LYHhteuX2y0cvW9DWOw1ey31EpWDB1Q8mHHCN2qaxUung@mail.gmail.com>
To: Jens Rehsack <sno@netbsd.org>
Cc: =?UTF-8?Q?Sven_H=C3=A4drich?= <svenha@external.miltenyibiotec.de>,
	Igor Kreps <igork@miltenyibiotec.de>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] python3{,-native}: update to 3.7.0
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
X-List-Received-Date: Mon, 10 Sep 2018 16:39:00 -0000
Content-Type: text/plain; charset="UTF-8"

One thing to be aware of is that I've been fixing up Python's PGO
support and there's a slew of patches in master-next and more just
posted that this needs to be rebased on top of.  Good news is that my
patches remove two of the patches we've been carrying!

Ross

On 10 September 2018 at 17:36, Jens Rehsack <sno@netbsd.org> wrote:
>
>
> Am 10.09.2018 um 11:35 schrieb Alexander Kanavin <alex.kanavin@gmail.com>:
>
> Large parts of dnf and friends have been rewritten in c++. I have not
> yet updated and reviewed that, that will happen in the next cycle.
>
>
> If I can prepare something for you - drop me a note.
> Otherwise - the perl-5.28 update ("." in @INC, regex buffer overflow, ...)
> is also
> awaiting some progress (I can keep "myself" busy).
>
> There's already enough disruption to deal with (postinsts errors,
> openssl 1.1, both caused by me :)
>
>
> You know, corner, ash, ... things happen. But there is progress! Great!
>
> Good that we got all the way to do_rootfs though with 3.7.
>
>
> Yeah, but than came postinst (coreutils :P) :D
>
> Cheers
>
> Alex
>
> 2018-09-10 0:38 GMT+02:00 Tim Orling <ticotimo@gmail.com>:
>
> I did not review the patches closely, but I did try to build
> core-image-full-cmdline with the tip of poky and these patches applied.
> Everything was fine until do_rootfs... I've attached the log.
>
> Essentially, there are some bits of dnf and so on which are not ready for
> Python 3.7. We have dnf version 2.7.5, but the latest upstream release is
> 3.4.0 (with a 3.5.0 just 3 days ago). Not sure yet if that would have
> helped.
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
> --
> Jens Rehsack - rehsack@gmail.com
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

