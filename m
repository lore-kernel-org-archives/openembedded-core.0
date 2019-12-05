Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
	[209.85.167.49])
	by mail.openembedded.org (Postfix) with ESMTP id 348437F816
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 06:48:21 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id y19so1580469lfl.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2019 22:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jMVK8jr3AwRgk8GV5FdT0B/H7SuWgGagkt0QX0aSudc=;
	b=YzkdxRy2RXwrYjJdoWZpDNfRtTB2H0fUfOODHL2ltepUvpFfdq3tcS4KnZRhmoSQde
	YjRhRyh2MdPdVZ98uD+WWuzp9uSJeXyJ1899/wsUwfE+BFw0xhyriWm66JVLPvrLIllT
	WmKLaxW74YGQ/nUXC3onnryv/DoQymGYXenDkI2dcaPyjrqPFI0WXNl/w4ViygzF1WJY
	cu79ZTm8pNwR2UKHNsqWLbz3wBFpTnLkp8sUT35M2c3LjAi1rQQZDrGB5Ne5BrmmLieJ
	53w4PfwfNi3h9vA0gXxdp6Bo3zGcRK/ASttnPk4PKpsP7Ggj/Rs/czGzH1RjskSX8TQg
	/rPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jMVK8jr3AwRgk8GV5FdT0B/H7SuWgGagkt0QX0aSudc=;
	b=ZyEZt4MGmcFpCOm4B+pTHOkY/AmV6veuP/OQ+tY5jkFWrbAQcB9WKQeGM5EetNeaLz
	OCooIeauHUnuyPrv+aM7Ew/sPVa+jvwqipqXYOvyiNPlrZ+TODxH6tefmCQNWjl3d+B0
	4xw4Mjk9wvxGXzd/vSB/oO7OGny1mOoP3MyIsEIowC3FOCMh/OJnKDCgGqXvvS/5Pbwb
	ISx5zntlbTeqohLLXqaM2oW7p5QVgD1cvnqjsXmd3FJh+XeLHdtrx/+vqm6WzxQVvQMY
	XQb3uVZ5oxy1PhZ8VGJOru2HUdv05FXWaca1CACodco9HWltp848uz+irmnCVPY6fD6H
	Q4BA==
X-Gm-Message-State: APjAAAVvFj+IRfwexxFVhWEkJ/U4AZu9Cy5GzbPo+2qPD7THFJF3yNiW
	VIOwX+SZEs4kEYWVq4kKMmE/tiR7LzK7BuW4Jx6/fQ==
X-Google-Smtp-Source: APXvYqyxEkimEKlIAaoBzNUB4/uIgNPJqAmeKyb4B0Uoz5kgQIzjARP5y2Yud8AimDOucbfdBAzCZnrDTmsziybIrNQ=
X-Received: by 2002:a05:6512:c7:: with SMTP id
	c7mr4450788lfp.120.1575528502320; 
	Wed, 04 Dec 2019 22:48:22 -0800 (PST)
MIME-Version: 1.0
References: <216e9c7062d44b98a54b6fd572128266383e83ad.camel@linuxfoundation.org>
	<9058755.I6fkynWszP@shodan>
In-Reply-To: <9058755.I6fkynWszP@shodan>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 5 Dec 2019 07:48:11 +0100
Message-ID: <CAP71WjybqtUNXJWnOv52QQYevR99_tVyEPpHjx_rwVZfjU02nA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] OE-Core python minimum version requirement
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
X-List-Received-Date: Thu, 05 Dec 2019 06:48:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 5, 2019 at 3:08 AM Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
>
> On Thursday, 5 December 2019 6:45:03 AM NZDT Richard Purdie wrote:
> > I just enabled hashequiv's server in local mode by default in poky.
> >
> > This causes an unintended side effect of requiring python 3.5 as the
> > minimum version.
> >
> > We had thought that the servers would be 'rare' and a 3.5 version
> > requirement for that was fine. It turns out a local server is also
> > extremely useful.
> >
> > The code needed the python 3.5 async support and trying to write it any
> > other way is a nightmare, we need that performance for the server.
> >
> > At this point I think we just give in and require python 3.5 as a
> > minimum. Any objections?
>
> Seems reasonable to me. Theoretically this should allow us to complete the
> subprocess cleanups as well (time permitting of course).
>
> FYI I came across repology.org which tells you the version of various packages
> in each distro, though it's not ideal:
>
>   https://repology.org/project/python/versions

Nice! How do we get OE plugged into that? Have you looked at that?

>
> That seems to be missing a few distros, here's another entry:
>
>   https://repology.org/project/python3-defaults/versions
>
> For Ubuntu you have to go back to 14.04 to have 3.4; any others other than
> CentOS 7 that are as old we don't really support.
>
> There is also pkgs.org that I could have sworn used to support comparing
> package versions across distros but it doesn't seem to want to do it anymore.
> Distrowatch also tracks this per distro but only allows side-by-side
> comparisons across versions within a distro or only between two distros. I
> think in this instance we have the information we need though.
>
> Cheers,
> Paul
>
>
> --
>
> Paul Eggleton
> Intel System Software Products
>
>
> _______________________________________________
> Openembedded-architecture mailing list
> Openembedded-architecture@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-architecture

