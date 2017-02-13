Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f45.google.com (mail-vk0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id 0E16971DCF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 15:15:30 +0000 (UTC)
Received: by mail-vk0-f45.google.com with SMTP id x75so62224087vke.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 07:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=h/Ut3rAzHRNZtTHe8plQ48k+xaXoYHmapZWilMNvh0Y=;
	b=d5UtlayC65vfGjvOfJXJr9GD95vSAwgCGAiKxu/gKjjohXNT9KsPtKIkoVxUtaj1kp
	Tl4IhULoxalJ2PDqFnHn7+V/AM3Tju81gJJ5XkskvC0RuMYKMa/aZeRlSoQ2ec02Ro8Z
	d0ySWY7qluq51F2KOIoSx9limUXzxQThIhBBVbNTDe8TGECFd5zznAZFk75fX6osuFiu
	s/LI02eiJ4/O/mmn6Ql+PcgVYDNqpt1aGJFRfPqLf51/f87vVSaiTkVNuQSTanJonZKg
	RgwgLz2NNA2O3g0LTZlDZ8xbMsvOIn6nydx301IzMQQxtE51u4QlYVAtEqtzwnxld/av
	QZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=h/Ut3rAzHRNZtTHe8plQ48k+xaXoYHmapZWilMNvh0Y=;
	b=Ctrm+It/SejoyaroZxH9AyzDofrwSymYopVQ3KNlktDsBA76oQgleuwXM1kvgyLfEZ
	VDjJxbYBm/CdscZivtQ22dHhFBLg6ZJfGTb93os160hVPDoQnk6fP/y2lSIz93aaGQC1
	brO/tBTJHwcVwJrz/OSDSypzVkE23G3L/8IN8aiRnFuuNk8VpToDTuneXuHv7Du/n9QO
	l/C5shxr4DVxlmMtpPHkZwvZ58nRvMS3E5ceDg9PW52LaAAA0OvpynIjWIb5aCvyz3+N
	l/Bq1lPHVlzTufsrAB26s3nO4rrD+QArVJPrGqlfEF2d+KF0VJjS9A9vJBS/s5M8mnrm
	tkqA==
X-Gm-Message-State: AMke39lVEjMteRNJ46SVhpP5W61I+1akluBR1NdsJPcji+4D9q/TFfbR29RhEMB9xfMtXldWYZbeksF1bdCwPA==
X-Received: by 10.31.8.147 with SMTP id 141mr11564587vki.111.1486998930851;
	Mon, 13 Feb 2017 07:15:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.91.68 with HTTP; Mon, 13 Feb 2017 07:15:30 -0800 (PST)
In-Reply-To: <CA+chaQcHBzDJ4UbW1NCex70T56PL02+agOZBMoK4=Q1WWSm2EA@mail.gmail.com>
References: <CALbNGRSgxbz1F2YLzQ-F2Fn+01hiA4LAoDgQuQ-qLg9KMVTHAw@mail.gmail.com>
	<CALbNGRR1+yVyMC1O1G1mCYp8e87Q2kucGEgs-dL0P3KHxi8WCQ@mail.gmail.com>
	<CA+chaQcHBzDJ4UbW1NCex70T56PL02+agOZBMoK4=Q1WWSm2EA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Mon, 13 Feb 2017 16:15:30 +0100
Message-ID: <CALbNGRQ2jOAmYt-jum5QTnpk_ggOKGxoqQsEKpFuHddorTta3Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Does recipe specific sysrooot (or whatelse in current oe) break native dependencies?
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
X-List-Received-Date: Mon, 13 Feb 2017 15:15:31 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 13, 2017 at 3:36 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Hi Andreas,
>
> I think it's feature which was already there, but almost never triggered
> (even in test-dependencies.sh tests), but with RSS it fails reliably.
>
> See:
> http://lists.openembedded.org/pipermail/openembedded-core/2016-July/124435.html
>
Yeah now I remember failing on this too - thanks for the pointer.

Andreas

