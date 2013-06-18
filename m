Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f174.google.com (mail-ve0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id C316F605F3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 12:55:14 +0000 (UTC)
Received: by mail-ve0-f174.google.com with SMTP id oz10so3024573veb.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 05:55:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=52RbCo7A/FTMb8JfRB7Lk5UADyUdNeHEuNG1BE969Ek=;
	b=Mf2PhWjCBvzJWFtXc1ULXKH3mDSis0mhfRxwioS5qHz+SxZa4dSUVvjwcWM9v7vT75
	wR2ffbu875idWVN8ggSS3B3WQvIgaccmqTAuxnATQjG+EKmqZ7ZjUbd0mQHup3NaLTN3
	3y8l7GGkudOm231Jr91aPHwj7GejV5XzZ8o8wcf/bEkgsjdf4tnGGdNj2T9XtgsohPaM
	p9w++duVKUD0K7phGddGSTaE9yO+4GIuxYrwe1BgTP2omPk9AkyKQHzFbOKwOEGaOHHr
	5+DDP8lkUnwexyojpEzcSnFh3Iawe1qdqSBFNZuFRyabUmvap459LRqBm13e5XhDDNt4
	B99w==
X-Received: by 10.52.29.106 with SMTP id j10mr1454528vdh.77.1371560115186;
	Tue, 18 Jun 2013 05:55:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Tue, 18 Jun 2013 05:54:55 -0700 (PDT)
In-Reply-To: <eac0003697c78bfc0dfe8f6ae322dad37f802b75.1371557553.git.hongxu.jia@windriver.com>
References: <cover.1371557553.git.hongxu.jia@windriver.com>
	<eac0003697c78bfc0dfe8f6ae322dad37f802b75.1371557553.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Jun 2013 13:54:55 +0100
Message-ID: <CAJTo0LaqxRRNhZujVPJUVLYddRCt0DK=K_-QBh1SQYjbzrZD+g@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
X-Gm-Message-State: ALoCoQn2F7VZlNh5/P/003WN8RU5fHICVmaRvi9hOYBS8ovI46p+gooAMXMerSYZBcwK7rah1MRM
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] systemd-udevd: fix invoking init script failed
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
X-List-Received-Date: Tue, 18 Jun 2013 12:55:15 -0000
Content-Type: text/plain; charset=UTF-8

On 18 June 2013 13:25, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> root@emenlow-noemgd:~# /etc/init.d/systemd-udevd restart
> Stopping udevd
> Starting udev
> corrupt queue file
> root@emenlow-noemgd:~# /etc/init.d/systemd-udevd status
> udevd is stopped
> root@emenlow-noemgd:~# ps
> 3805 root      8728 S    /lib/systemd/systemd-udevd
>
> The process name is systemd-udevd rather than udev which is
> used in systemd-udevd's init script.
>
> [YOCTO #4746]

Signed-off-by: Ross Burton <ross.burton@intel.com>

Ross

