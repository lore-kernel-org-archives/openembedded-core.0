Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by mail.openembedded.org (Postfix) with ESMTP id C09ED6F2D4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 14:13:54 +0000 (UTC)
Received: by mail-oa0-f48.google.com with SMTP id g12so463869oah.35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 06:13:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=FpC/uzEwsvfIdBshU8cYfQb+gyGV3yW/7hYo039+EOY=;
	b=ThOFiCVlStohjDn0LHuT6ZUYMKOPYouw5VSfhv8O/ENZ55GhGvIm5sp/OArcSNMk2X
	EZYiTvdeojxJpTViQJtz15Q6KZA4MOqvuzMgmiY5/+zgbG4ZS3wd/OPx4E4O5tvhq3Uh
	YDqhwlJGojp9sVOa8q/lhjeEZIcwxasU0Jy1FMnsHNhzbE/z4wb0eyaw2dQUEZH2TMRV
	xi71Igpup0A8jbY9Jh7soZgSbkpOyA6byMTl/81hbsePVkj1ffbzxLTGib0BXXvOJ95X
	pLElscUQIVUeoP+oQfijFqxHiqJZHNYXCORwsGhn4f2pgjL7STHFEpNoQN2hjm3/tjQx
	cEZA==
X-Gm-Message-State: ALoCoQmSlkht4uQMvSX8xmmb0AqhabtIvpNam6eYP+aObZelyyqQ9em1Chpqsd80R0CQkx3KoTQx
X-Received: by 10.60.130.234 with SMTP id oh10mr21620130oeb.60.1393251235164; 
	Mon, 24 Feb 2014 06:13:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.182.99 with HTTP; Mon, 24 Feb 2014 06:13:35 -0800 (PST)
In-Reply-To: <CAOMwXhPiWGre5UiVtyVvVc2L7G3yf79LKF55VKwuLtTd6ZRBiw@mail.gmail.com>
References: <CAOMwXhNMs7top-CBCDf8Hgsxxz7=oBocF6YjbC_PhH1PDgYG0Q@mail.gmail.com>
	<CAP71Wjy4kX15uoz=_42+zRKS7i91TYnGM=2u35+tNXf7CFoaww@mail.gmail.com>
	<CAOMwXhMxcr_EVZx4uVnnpGvcq2MrMchHVUL5ApBdC+4bH7q_Yg@mail.gmail.com>
	<CAP71WjwR9Lrb1QeHPEXLGnPe+vcEnYtgMDoQZW-eNayOMubbKQ@mail.gmail.com>
	<CAOMwXhMz+_KcMzY1Stwi2g8EyFg+8BVajqrrvAX7Xd02qVNG9g@mail.gmail.com>
	<CAP71WjxHc6+9DDGeQsuAc3Cv7qN+bfPgNT-ju01z6pje3Q2qEg@mail.gmail.com>
	<530B4609.7070307@mlbassoc.com>
	<CAP71Wjx=6Ux7CWmr4FJcLPyp0xah3jFO=7v6izNi2dfNNcWWYQ@mail.gmail.com>
	<CAOMwXhPiWGre5UiVtyVvVc2L7G3yf79LKF55VKwuLtTd6ZRBiw@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 24 Feb 2014 15:13:35 +0100
Message-ID: <CAP71WjyOcDowMb_nv9+-pHsnMYhXoYmRi1tJOveZJ7V30otQOA@mail.gmail.com>
To: Laszlo Papp <lpapp@kde.org>
Cc: Gary Thomas <gary@mlbassoc.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Conf notes
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
X-List-Received-Date: Mon, 24 Feb 2014 14:13:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 24, 2014 at 3:09 PM, Laszlo Papp <lpapp@kde.org> wrote:
> It works with dylan, too?

yep. same output using:

commit e2bb4a70a99a057d45316bbac65d6044ea54c484
Author: Chen Qi <Qi.Chen@windriver.com>
Date:   Sat Nov 16 03:19:55 2013 +0000

    subversion: fix build problem when sysroot contains '-D' or '-I'

