Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1CA876E667
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 06:44:03 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id q62so2438631qkf.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 23:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=N5No8+Iird+/mwAVdcaveUqd0pyqloRk48ESHHeu0zs=;
	b=BNAcBhgf/6DrYu2xObnWFP9rhk0ZP0Bm+ErEYW0renLDukUkXb0YmJeLbq6CDxMFhS
	0qPbEJitGM7bFoTaUHcYPNjhwJK7lFjud/qKdtLit/3GymZyKK5SMVmAHM9EzqCstAVY
	hmnry73j+m1qfgNhh1eWII/vJ5LfAdJ5e8/lyhUbGMCtVBmYGkQNDdZourvnN0gMJ4OE
	tZgt7ednK3OdLEF2Y9qw5RQWvHU1U+rXIj7MEBLfVVvkXpNQWiEwRU6HzXMPmf0NMsbK
	8Hd9KFX1YeXrDwxYdc2TwrUkA5udDwyeolbf65T8seGTryiZzfdX0bypIUCSo/wd2dXQ
	BOlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=N5No8+Iird+/mwAVdcaveUqd0pyqloRk48ESHHeu0zs=;
	b=S09MJfU8LTNp+3J3swPSMYEcnrzC7FrTCJOzPAaeT1hGP3k2/Kb8a6uVxg32n7LDC8
	YvHPf8DWFrRZqEwS/cx8asqUB1pyh5rGvvVlk4R+ImYOxPmcNclXC0YmBUCBIZAKRVEX
	SlTGbLvqYdKt7ACSWbWuvgtCFfxrtZ4oLsDvc5CtNcpM8/cw3/Yt2Q+2Yc1LAE4QvYYi
	LkVY7axH5/gH1rDt1gEslg1Xwdsc2EVzUq7NUdq1Qcw6MtzaHnGC7lYkyQyZt5hAOtEv
	GjJxe1Mq4nd7H6pycj+Q2khttfzqHtxgGod5f2H8TqWtBzijQnAmFiwgommzfYp/bDeX
	lBfA==
X-Gm-Message-State: ALyK8tLFhSFgtuszj27WtdyRl+b/lliS2DbckkK9580JqJESuZHD2Vx03p+sKZozjE9kmO5VlYWAQSxTaKZOLg==
X-Received: by 10.55.187.4 with SMTP id l4mr8548867qkf.152.1468392244525; Tue,
	12 Jul 2016 23:44:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Tue, 12 Jul 2016 23:43:35 -0700 (PDT)
In-Reply-To: <5785B842.9030804@mlbassoc.com>
References: <5785B842.9030804@mlbassoc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Jul 2016 23:43:35 -0700
Message-ID: <CAMKF1sqSmz5GCVK_MGaz9YWrwVEZr-uFK-PB8ZUhXkXDZSbKsA@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: GCC recipe using git?
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
X-List-Received-Date: Wed, 13 Jul 2016 06:44:06 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 12, 2016 at 8:40 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> I see that the gcc-6.x recipe is using git instead of a tarball.
> Is there any way to go back to using tar?  I ship mirrored sources
> to my customers (many are behind corporate firewalls and have limited
> network access).  The file sizes are so vastly different and it's
> quite the burden to have to carry around a 2.5GB file...
>
> -rw-rw-r-- 1 gthomas gthomas   95661481 Jun  3 15:54
> sources/gcc-5.4.0.tar.bz2
> -rw-rw-r-- 1 gthomas gthomas 2525826872 Jul 12 16:42
> sources/git2_github.com.gcc-mirror.gcc.tar.gz
>

I know this issue, however, I am counting on 6.2 point release coming
soon hopefully by next month at that time we will roll forward with
tarball. At this point
we are ahead of 6.1 with several patches and would be a pain to revert to using
tar + patch, I would like to avoid that

> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

