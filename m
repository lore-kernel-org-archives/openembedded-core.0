Return-Path: <trini@konsulko.com>
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
	[209.85.219.67])
	by mail.openembedded.org (Postfix) with ESMTP id 03DD37F88D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2020 17:02:50 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id u1so9355922qvk.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2020 09:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=VZjc4XcqvPfkUGWGX4PaIhx1zKQKw7frI9Ej5yW/ieY=;
	b=WML/ocSKkj5M+AhTa48eWu7zbm0jM3F1JYpUqM0bAESbdb6GQixiWbSOC/5GTSLhKe
	gZNEYpMH3QPognG27GxNfP43cSBCwwz7gcuJh0LMwNqgKgcDp5ELlXYUndT7HjSQpRao
	Hbd2hS0lBumUFcANNotEhwx/ncp13R4OUmYcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=VZjc4XcqvPfkUGWGX4PaIhx1zKQKw7frI9Ej5yW/ieY=;
	b=uP8FvZ977FT0f9XsRwFSh7I5TJiTUGzyiGG8QFdOxm9ar1PgTEfEl9QxE2TMZrl47z
	xCxcRewLF5jamKriHTj74vV5SK4zdyhLBuW5XbSeUKtM/qRpT8jCoJOcopQCGcVYZS8N
	/r2XaxEwi69T+1sMy6Vevicwh3XKqesWqQNBKPJL0bxbMZsNhFkvTmSjZgxm2UXm7tK1
	TILeu70xEkWthQvBHAjcDMyIr2Zsv7qISmOdFPCWmqcKXix7Mv7k58ko6JfxeWk2GfIK
	JUkAVja0dbaJh7tZsX+tyvdp9SxAlMD2M31/mHMRkE0eh5u8sEIKw7vzj2uB6+GNdkFe
	h1SQ==
X-Gm-Message-State: APjAAAUav+5D8l1d6xIoRzMUcoIYCsdQuRfiYUB+mNSpmal9fV1q7awg
	hywQnk1LEuu0GlVq6FdQk33+SQ==
X-Google-Smtp-Source: APXvYqw7H7cG1/u2S6VMTnIRdPwHEkXYbRHSmxeleahneBYlSY+8mFrLM+Zk+F8cngzFUl7RDR4vSQ==
X-Received: by 2002:a0c:cdc7:: with SMTP id a7mr3476263qvn.75.1579194171768;
	Thu, 16 Jan 2020 09:02:51 -0800 (PST)
Received: from bill-the-cat
	(2606-a000-1401-86dd-28f6-45e7-c5cf-fecd.inf6.spectrum.com.
	[2606:a000:1401:86dd:28f6:45e7:c5cf:fecd])
	by smtp.gmail.com with ESMTPSA id
	11sm10361139qko.76.2020.01.16.09.02.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Jan 2020 09:02:50 -0800 (PST)
Date: Thu, 16 Jan 2020 12:02:48 -0500
From: Tom Rini <trini@konsulko.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20200116170248.GI8732@bill-the-cat>
References: <20200114193010.92629-1-Oleg.Polyakov@windriver.com>
	<13AD08C4-930D-479F-81E7-3B6405C3BD94@gmail.com>
	<e0a7cf43-7d0b-5318-22de-9009d702061f@windriver.com>
	<CANNYZj83UugdN=aNFncqFRF304YxBtYLgd6b4bP-Na_bLvMvwA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj83UugdN=aNFncqFRF304YxBtYLgd6b4bP-Na_bLvMvwA@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] vim: update from 8.1.1518 to 8.2.0110
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
X-List-Received-Date: Thu, 16 Jan 2020 17:02:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 14, 2020 at 11:18:44PM +0100, Alexander Kanavin wrote:
> On Tue, 14 Jan 2020 at 21:10, Randy MacLeod <randy.macleod@windriver.com>
> wrote:
> 
> > Oleg is getting started using Yocto so I'll reply on his behalf since
> > I asked him to update vim as his first commit.
> >
> > I'm not sure what you mean by 8.2. Are you talking about calling the
> > recipe:
> >     vim_8.2.bb
> > instead of vim_8.2.0110.bb?
> >
> > Vim tags on a daily or more frequent basis. Are you saying that we
> > should keep the
> > same SRCREV for 8.2.0110 but use a different name?
> >
> > I looked at:
> >     git log v8.2.0000..v8.2.0118
> > and all the commits seem to fix bugs so I prefer to take this tested
> > v8.2.0110
> > update and update vim every month or two so that we get the latest fixes.
> >
> 
> Vim adds a tag for every single commit they make, fixes or not, so this
> approach would in effect be updating to random development snapshots. I
> would rather have a more conservative update strategy, and update to the
> original 8.2 release. If you look at the homepage, 8.2 is the version they
> announced as the new release: https://www.vim.org/
> 
> That's also what 'devtool latest-version vim' should currently report and
> 'devtool upgrade' upgrade to: I purposely cut off the point releases and
> left only the major.minor part there.

What we had talked about before was trying to follow (more or less)
updating to versions that one of the desktop distros had chosen, to
avoid the fact that yes, every commit to vim is a new version number
thus making it hard to know what's an important/good release but also
still getting bug fixes and so forth.

-- 
Tom

