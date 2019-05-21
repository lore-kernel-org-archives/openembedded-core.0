Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id D21A87E271
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 17:26:16 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id y22so21404834qtn.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 10:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OwbCU52rfmPWKVA9ss1UJS06vD90uYcq2HK2wCmzl4c=;
	b=qNkXTSCuaha/A4W2H0be22Rk1LSB+etrNj3MDfO4z8UVchCK5zbOVvyZOEfGsSw2gZ
	QsEZ4VRh6jBL72+XiQKu35QJIldRJpXB6Jfz7R4cAxfwQWEtvWKStAP5oMEDOU8VRCAl
	3oWf2Lc6NCFLwo34GybRTTD+PFIAgoP8/w8TV+GTQkCHi0FbJE+06pKeuCc1TO55NrhZ
	mJbFSPTD85Kib4m6L7lfAf432XUzZQ+Jib4PwDzwxRonIdbscV5lFtRTjKLu34LatVBy
	vPBy74/g+dZQo4mVa4wpCL9qcIjxL+jtUqzNnJmLMB3u2DO6T4Fv9GV2Ypvs7vx1nUhJ
	6org==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OwbCU52rfmPWKVA9ss1UJS06vD90uYcq2HK2wCmzl4c=;
	b=X4U4rIaR/cjPGOYCbhmG1bmYxM/PXSQ0WJKB0Web0a0nWRsU0RsiAnppj4CU7BZu1g
	rtaWS0lxrmyklEXB2idkwlj1FGKMF1vqJ0AueAXPjNtK96c5ZHUOaG+9sSHj0oouJ79z
	y91/TNeSy/qceOreCqGkZG0/FJutAjDhCMzFRqyW/aOjo4pNiX7uNF5S9da3whtpiph9
	k3DB+xdnGYGBRxZr3fyuWXruuN0iJvL0z2/lqnistn6U2e4atKz++nSk6HkwmWt5CpFy
	LbxxSvSWqj7vypj7rukqGZA7WK4NDQQgSyI1LCaelj1ElfoUPBpironv80s1YMBSAFMk
	xAnA==
X-Gm-Message-State: APjAAAXvt9qm0LXo6beWI2dSbM/vBaN3tk5+8LxwhhhevBGTZ58GWVm7
	SThKqwYafq8wI4+ZiJLUQyIHyGnx0NydpJOqR1Q=
X-Google-Smtp-Source: APXvYqxlAlxMZE0mig2pLt9bL1pS2ptByOOotWvfSNsMADaVisb1FEZSPo8Xrg2+w0Cm66gsVKuHKr7oabXTdjPX6hY=
X-Received: by 2002:a0c:b09a:: with SMTP id o26mr66154837qvc.68.1558459577354; 
	Tue, 21 May 2019 10:26:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190516114914.12427-1-richard.purdie@linuxfoundation.org>
	<20190516114914.12427-2-richard.purdie@linuxfoundation.org>
	<4744125d-7cce-3325-414b-f05c5fe01a52@gmail.com>
	<8fdfdc3ba62711c9c3e6e391c8444e18d22e93b0.camel@linuxfoundation.org>
In-Reply-To: <8fdfdc3ba62711c9c3e6e391c8444e18d22e93b0.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 May 2019 10:25:51 -0700
Message-ID: <CAMKF1sqPXU0V=+t0-kfcoF6uLPDm8tDOgRd2xSc6a3wbvjt4PA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] apr/apr-util: Add ptest dependency on libgcc
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
X-List-Received-Date: Tue, 21 May 2019 17:26:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 21, 2019 at 5:29 AM <richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2019-05-20 at 11:43 -0700, Khem Raj wrote:
> >
> > On 5/16/19 4:49 AM, Richard Purdie wrote:
> > > Avoid:
> > >
> > > libgcc_s.so.1 must be installed for pthread_cancel to work
> > >
> > > when running the ptest without libgcc.
> > >
> >
> > this is interesting, do we get this error explicitly from running
> > some
> > tests ?
> >
> > I wonder why libgcc is not detected during rdep calculation time.
>
> pthread_cancel doesn't directly link to anything in libgcc so there
> isn't a dependency for the rdep calculations to find.
>
> Ross has a work in progress where we'd notice binaries using
> pthread_cancel and automatically add a libgcc dependency but its not
> ready yet.
>

are we running into this case
https://bugs.launchpad.net/ubuntu/+source/gcc-3.3/+bug/40285/comments/30

> Cheers,
>
> Richard
>

