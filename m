Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id CEDB77FEE0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 22:59:17 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id k24so9032391ioc.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 14:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GbHI4QTDpMKp6G4g6fQwYF91MPDWzLet4HNkiNoI/Ss=;
	b=OvNYkdl7vF7XGC3Fvgfkgx/C2Ivm6+BU+mM6Vr226RqchO9tWjPfCQEO515BGBYROa
	Ai5kRKUumv3uhSZb/KP3Du3E+hQTj0MywEBS5z5sPVqeLaBV5CcOCxTAVpA79yugcqKr
	QZdP6zNFfltPZLtTRlh1rI/3mcOf+HWlJ5a+W+ftw3n6ihIRoUIZvKfraHI3+c/OAf6j
	Yaah/ihchaivgiNopevx6fiGzG3o0udQ34e34iF8Xqb0vHaH6Vm5iYl53QWyaDRHQqO0
	K5jyBVSx4KxRoEof4phf6Elp7yP7tOEDYGCYYl4emp8WFkl6R42CGzK9N52eCGyX6YNn
	g29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GbHI4QTDpMKp6G4g6fQwYF91MPDWzLet4HNkiNoI/Ss=;
	b=F+MC+bem8EuFeXyZyyCEXE2cED65Kes4XiRo5bcUMe9BzfeyYj9/0o0YMH79CGndqF
	ls2tubAWTUWxHsI77TDK2uN0xmOQak1lf1QKeJMYTl10MAbInc5+Udd/QLT4+mDEjs0k
	BDadNxAPgB1H+shcTdHQSxC1mzaksQsD+DZDrmU1ueHZak23drD2MsUU/ZuTWF7O/0dW
	PnBgqqjAl92crZJ7AIGtOr/5V40aQZ4WYNQ/SU7Wy556wRcTbrVqOX3LgWr3s/76vzft
	4JOZegQJ1ECqnsg2TSbF9kuXdL/XjGLQHPTLOqjuZRHXLEXYZJ9UxT8AeaLutdhPgx4I
	cohQ==
X-Gm-Message-State: APjAAAWq9w/hJhg+zel+o/0ON3zyRZ2/wp2cHu6RydmsjKaLJSW1JGdK
	0ohdGoARXV3+3JzxXSvHb4Bx5vz3NotCYTzVN2c=
X-Google-Smtp-Source: APXvYqw75mKzR/Mg5DBMZ1aobPYRF0yFNXtq87gMYGEhAjxtMBAJB1Mn3AgoVKdb84H38Trl289dowf1Ti/JOInwwT8=
X-Received: by 2002:a05:6638:41d:: with SMTP id
	q29mr76744jap.128.1578610758825; 
	Thu, 09 Jan 2020 14:59:18 -0800 (PST)
MIME-Version: 1.0
References: <20200109202623.28936-1-schnitzeltony@gmail.com>
	<20200109202623.28936-5-schnitzeltony@gmail.com>
	<083170de5cdb826ab20f4384270b1f9553692e62.camel@linuxfoundation.org>
	<CALbNGRRcKK-Y-xjqnV1ESxOnEa=vM+-1x4uH2JiMvxKOqnTVng@mail.gmail.com>
	<9fe9f49a204728b0ad9168a45d357fc941ad63e0.camel@linuxfoundation.org>
In-Reply-To: <9fe9f49a204728b0ad9168a45d357fc941ad63e0.camel@linuxfoundation.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 9 Jan 2020 23:59:07 +0100
Message-ID: <CALbNGRRwHYxsQo_xrCFUhMM_Pa_=2w+9_RypDQ38QyYMF7eSJA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/11] bitbake.conf: add variables 'mimedir' and 'desktopdir'
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
X-List-Received-Date: Thu, 09 Jan 2020 22:59:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 9, 2020 at 11:27 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > >
> > > Do these really need to be exported to the environment for
> > > everything?
> >
> > It is not mandatory. It is just that I wanted to avoid redundancies
> > in insane.bbclass / mime*.bbclass. If adding exports is a problem I
> > can remove that. Let me know
>
> There are two issues here. One is that:
>
> export mimedir = "${datadir}/mime"
>
> and:
>
> mimedir = "${datadir}/mime"
>
> are quite different. The first one will place it in the environment of
> every shell task. For makefiles, this is necessary for some variables
> but in general its not and I'd prefer to clean up the shell environment
> where we can rather than make it worse. I suspect you don't need the
> export.
Yes this was part of my thoughts because export is a shell thing but I
thought there is some magic I am not aware of.
>
> If we could move the setting of mimedir to mine.bbclass, that would
> also be better since variables have an effect on parsing time. I can
> see how wanting to share it between the two classes makes this trickier
> though and I'm torn on that, I can see the problem.
>
There are two directories that are turning into 'shared' by this series:

1. ${datadir}/mime: insane.bbclass / mime.bbclass
2. ${datadir}/applications: insane.bbclass / mime-xdg.bbclass

How about some mime-dir.bbclass or desktop-dir.bbclass or
common-dir.bbclass or..  setting these dirs for bitbake without export
but still at one place?

Or just set them in mime.bbclass / mime-xdg.bbclass / insane.bbclass.
I have no strong opinion on that - it is just that I don't like
redundancies (and am interested getting the base of this series
applied because it bugged me for soo long)

Andreas

