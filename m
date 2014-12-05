Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f50.google.com (mail-yh0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id D6DC372383
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Dec 2014 14:13:59 +0000 (UTC)
Received: by mail-yh0-f50.google.com with SMTP id 29so371056yhl.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Dec 2014 06:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=513OKcVzvQ+bKpBUZ/AriH4fDB5IKDxMMcBrH0Lkyow=;
	b=Zw/rPF1sh/k4zrTVpkV/hpONB+4l59EAp4H2SqV+k6uHFf6309X4GBD0w5WyXWm10F
	8K0uJm3f+m+jAdjDWtfu6GhTgaYL2hnx8VtL8Ddn2zx/Idp8fmZoPzcBXe1XhAL3lPrZ
	cMiqaoLlrusyps1rkZ0Yr2cqzthnDbClUaKwRSAXzeJms1+d1NMxmRA5StYYPj2W4GEK
	coonL7C3CQhrlTr9UjOIOrR3o5X5AmVJXVZ6m2aEUUR7ti3kTIYfc0HFwsZaTajJb4l9
	mLvTycrtR93H+LGUhJ1/LdarktQY+JmN5BVxx+Ryq0LQDFUjS8zmjGHSoKKIOhLsLwRI
	RA4w==
MIME-Version: 1.0
X-Received: by 10.170.70.193 with SMTP id m184mr22527675ykm.50.1417788839939; 
	Fri, 05 Dec 2014 06:13:59 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.142.132 with HTTP; Fri, 5 Dec 2014 06:13:59 -0800 (PST)
In-Reply-To: <5481ABC1.7060208@topic.nl>
References: <1417688866-8329-1-git-send-email-mike.looijmans@topic.nl>
	<CAP9ODKrh_p=yv7x2hWg7QcV_4vG2xvF+7WgcckMqf=FU457ovg@mail.gmail.com>
	<54814E43.3080602@topic.nl>
	<CAP9ODKq1LXe0PPsgcYepf5uRmbVkHdHHDQfL32eFgUZNUUKW2w@mail.gmail.com>
	<5481ABC1.7060208@topic.nl>
Date: Fri, 5 Dec 2014 12:13:59 -0200
X-Google-Sender-Auth: 4L6odBM_49fJKHH2zXZpMLoEOEI
Message-ID: <CAP9ODKqomC1dDRBFbY-YkSwOSJ3LmDFaFwr8440JEi5si4=b4g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Busybox mdev improvements
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
X-List-Received-Date: Fri, 05 Dec 2014 14:14:05 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 5, 2014 at 10:57 AM, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> On 12/05/2014 12:27 PM, Otavio Salvador wrote:
>>
>> On Fri, Dec 5, 2014 at 4:18 AM, Mike Looijmans <mike.looijmans@topic.nl>
>> wrote:
> (PS:)
> From the current state of busybox-mdev in OE-core, my perception is that
> there are only a handful of projects in the world that use it, and I'm a
> member of two of those...

I also use it :)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

