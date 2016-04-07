Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5F2C47705D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 14:22:07 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id k135so27407977qke.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Apr 2016 07:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9pHpC9IV0h+aw2lxNKlypk4brGaYYkcdNCuQErBKQtA=;
	b=YjJpbNao39pl3iN5l/7xTBsYMKctsExGF4AtmiQMfGa8jrID/6NbbcDCoM1IW/6eqb
	4imt/fBbltknHD22wjfMDy7qRR/N4aAmhWedEi59P1d1azf/UV+qIyaXSvjXzMp0cO2i
	4xGdYlYrFO9rok6jsWjegZrCZp5NnIBBTt3RU2+fZxOzssvauCaH3921UoIWVThT6xwW
	i5qjF54KTFtWePAnwgbtOO+O/hJ9nblPlhOfeLTa4K7DePLqUUHZmFnT/RSoSxDnJ8D3
	BT6jHTCfQtL9DSNu7g4O0JGOlYxpDYW31WS+5a86QDtI/BXt3qMdr6rJDBIySnrt7HXp
	XBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9pHpC9IV0h+aw2lxNKlypk4brGaYYkcdNCuQErBKQtA=;
	b=iy4aBRcuM4PKsPcd44MwO1y7D9LpZ9qtn0vZHuj8oClF/5UdnmSFU+6E3xqWSQ0y7U
	vcxN8t7nzOZaLI2/XTtkEF0R/3G706qi7FnAgxFY9DKwW1rpz50jmo/6MxJnjxz8R4tS
	74yrz9cr0V4cAhUWSsQqC47p2prM8dhvqOWQmOUYKoGbqJy/2nNwro4/iEc+xzPAcp0h
	X+X2yTlAtovCUVqpuhaKDt4h4c4hTa5p3cWnVXvecgDebP6W7jB/rhBlLzDsxXEXoTXh
	wYMT/VS8dGuB6mDzK0rIlnuZdJ0EpI4uQvkVoyHkn5FdwmIZ6ONsXRmi6ITyEUGrVsmm
	58Zg==
X-Gm-Message-State: AD7BkJLvkM5LbXWYJuVd4aM2oQv1lIAuMB3IAY1o0QWvjGT36ExGqjOzGVDJdxz5G1ciG6MgN5A3Ct/zx8w3Dg==
X-Received: by 10.55.75.203 with SMTP id y194mr4125615qka.2.1460038928650;
	Thu, 07 Apr 2016 07:22:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Thu, 7 Apr 2016 07:21:39 -0700 (PDT)
In-Reply-To: <CAJTo0LbNiJNmDdFXPwGbF-AD8fzgtj9YiYX9-7jrVGugytgBNQ@mail.gmail.com>
References: <1460012563-18898-1-git-send-email-raj.khem@gmail.com>
	<CAJTo0LbNiJNmDdFXPwGbF-AD8fzgtj9YiYX9-7jrVGugytgBNQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Apr 2016 07:21:39 -0700
Message-ID: <CAMKF1sq0wd6JKQQyGuTvy=YsgE8iFOUtDu_ocFg08F_kHSufUw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox/mdev: Ensure /sys is mounted before using it
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
X-List-Received-Date: Thu, 07 Apr 2016 14:22:08 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 7, 2016 at 2:50 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 7 April 2016 at 08:02, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> +#sysctl -w kernel.hotplug=/sbin/mdev
>
>
> Why add a commented line?

this is an alternative way to insert mdev to be hotplug when sysfs is
not mounted.

>
> Ross

