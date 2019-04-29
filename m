Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f171.google.com (mail-it1-f171.google.com
	[209.85.166.171])
	by mail.openembedded.org (Postfix) with ESMTP id ECF247D912
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 20:53:12 +0000 (UTC)
Received: by mail-it1-f171.google.com with SMTP id t200so1278607itf.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 13:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=1qJrHY4V3zurAUzpkL/nFIN/L3hF3nkIDCrtKvZhdU8=;
	b=N0M1G1ais49LXqVzwWaZNYqoqEayOxZtkUcbyhnw049NNo4aC9s/T40wdEGVy2M1Bg
	S0hHmV0jwtluNGdes/EY3eTtx03dSkmsu65ttHTwGRlyZl4JX1qdVieSrQbiCGkTS20l
	IMOqkl9W0SEMBnsfxHRMQFkFst/DLencctCZFbz1YvDWPkj7uSqwJd5N6LE58zXYdj+8
	Xvd/KI8lYABln6/m97CaSzUF18uleBCKfHUCutZ5EBf2UcOr06bX87WYIIC9LBbaSWb/
	5adQ5ZEODECktXRiMfmQ8ATVd1+lc2Gkl6twUoXb2rgCj+//5a5bzj8NW4X2Xd1IGKFH
	G4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=1qJrHY4V3zurAUzpkL/nFIN/L3hF3nkIDCrtKvZhdU8=;
	b=M+hGziaJYrfN6kkdu7U1UtfAy1UilOoUhBhF6vsAwGFd6UB4D1761fkLwxz5qMoOrz
	qtCR9rH+0zIv+X5DEu+KrhWpU1pr/JrDN+SW2CAnjYI3rcHPRjPeGdThm3KqIYNi/Vl3
	4leV+9oV7ObW4A8v3l5ja0WmXheIPcWm2cgOm+nuxSQ5Dp8nx0SLPzC/KO4Qivw2VIoV
	gGidWYraI3iR91XiGrgEG855KBkkfFqVz955++T2AOwDNc2nx6dXFdsDTNebEQXHGErU
	DoCRVQLm9RqflDcjH6mlTuUW264Q8wffxcq9Elqq3BeD87AO+Z8eM1DO4nM6QaE/FjK+
	8NCA==
X-Gm-Message-State: APjAAAWfUzDyYwTCIKbe2JpBCl1OmkP6zYyCelJ+HdRsuuQJhNfoSZYq
	mRMtwv9awR+1gADtqN7EDyMzBz2EMTTua8BFz8A=
X-Google-Smtp-Source: APXvYqzpdxfMIgpd4KacqNtxM/CYPHUqHPiKrJhDV1dwQ88xU0nrtJRsYUBo/q6dcybtZV4dW2aRWV1dodwXdzrlNQ0=
X-Received: by 2002:a24:5c10:: with SMTP id q16mr865993itb.81.1556571193948;
	Mon, 29 Apr 2019 13:53:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190429140730.2899-1-schnitzeltony@gmail.com>
	<20190429140730.2899-2-schnitzeltony@gmail.com>
	<323098102d47a837b953a3c399f8db65b1c43349.camel@linuxfoundation.org>
In-Reply-To: <323098102d47a837b953a3c399f8db65b1c43349.camel@linuxfoundation.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 29 Apr 2019 22:53:02 +0200
Message-ID: <CALbNGRRuLKUfornkTS6e2PBskpyxuWo-XnLrd=boHYPJMkDhhQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] vte-native: reduce c++ requirements from c++17 -> c++14
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
X-List-Received-Date: Mon, 29 Apr 2019 20:53:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 29, 2019 at 10:26 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2019-04-29 at 16:07 +0200, Andreas M=C3=BCller wrote:
> > This should fix build on ancient hosts
> >
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>
> This fixed debian9 but didn't fix centos7 :(
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/150
>
> | checking for a sed that does not truncate output... (cached) sed
> | checking whether g++  supports C++14 features by default... no
> | checking whether g++  supports C++14 features with -std=3Dgnu++14... no
> | checking whether g++  supports C++14 features with -std=3Dgnu++1y... no
> | checking whether g++  supports C++14 features with -std=3Dc++14... no
> | checking whether g++  supports C++14 features with +std=3Dc++14... no
> | checking whether g++  supports C++14 features with -h std=3Dc++14... no
> | checking whether g++  supports C++14 features with -std=3Dc++1y... no
> | checking whether g++  supports C++14 features with +std=3Dc++1y... no
> | checking whether g++  supports C++14 features with -h std=3Dc++1y... no
> | configure: error: *** A compiler with support for C++14 language
> features is required.
>
I expected that - turns nightmarish..

> So we may have to look at reverting, or perhaps just adding a vte-
> native recipe with an older version of vte?
I have no problem with this but is it a good idea to run self test
with a different version as the target one?

What about Ross' suggestion:
> 3. Don't use vte in qemu when building under virgl.  The gtk
> PACKAGECONFIG turns on vte support unconditionally but from glancing
> at the qemu code that isn't a requirement.
Question: If this is accepted and works properly - could we get rid of
vte-native then?

Let's decide some option: I really would like to close this and I have
no problem with either way - gnome-terminal can wait. Gnome stuff just
hobby to me and for test I can add recent vte in my personal
meta-verse.

Andreas

