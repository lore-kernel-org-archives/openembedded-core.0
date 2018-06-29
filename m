Return-Path: <alex.kiernan@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3D0C574D41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2018 12:13:57 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id b134-v6so5177281vke.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2018 05:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Mie7TkJTCNgP+wTd7vc5HVodtHRLW4HUPV5OZUf/hFc=;
	b=tc4WQbXmRFKexsY1njz7/8ZZOkoVSDmM6N5Caxr6K6RVYKkJUfBF8MlOR37UYitmWU
	kNCxYl6bt/sDcY1O1G3YTTjKi0VOzodcv5pKtUoHTK44RANVP5fOiWU60cipODI9Tk0C
	N1nEqOLuw/B9Lii06zf9UyJbfUrUrrdAGsDTEhcFQXa4oI84F9Ul81yjYRJ46l8alnCe
	icAmKnEALDzpsa9NrmZesJnfnhvA3COUBfO0BLRW6crpMf+D3GTrvFQdH7RLzsg6cKSG
	AR6fPLffVvpqxXpD1bkH9sonTViw0AOTcr0WOQjhW4EtR/Iv/bB+I/F8jT23HZ6h/uoT
	5hhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Mie7TkJTCNgP+wTd7vc5HVodtHRLW4HUPV5OZUf/hFc=;
	b=Cb2igkdtVSB3YKEnuaQrvEDr8E5h6o1aof+BkyaK4zUbLSUyTLWS2fUTi0qbSsfxA7
	dPHJWM6tUL3z1XdfH/NwHvHKOaVWc53Zl0z9ytj5lQs69VM9R4NMQ0oll7vthCHmpquY
	253H6h1zyJ0pYMDB61YgB8+iwV+UNHIQ/aDFe25ccMgnlT8OGNSdPXVdHfkcfvWt8xJU
	CMacPdWNJEnlsx2Y0tdQrf76LDRCDzp2TBrSsCtIKxhv3SeXmEuvl6uv+gDAVjbYoNSQ
	9lcMoTzAZipD2QGImL4Ry2jt0tDdbFJzizy+ZVV9g4PDHfbq/GlyhEFcjeKop6cLNfjH
	h4SA==
X-Gm-Message-State: APt69E0tNjlgAdNzhbKR0fsZliteGmnJcWSTOQRGrOjeeWMP84nEAqfE
	8x6mdcsNB3ljjzu0vzCLKv/soAtKvRy+WukwEJQ=
X-Google-Smtp-Source: AAOMgpeulu4veVkXLpYLpZTzMsP0OBh8Ycowyeip17nBbRQHeZk9xzTMhxLpM+klY+W3ErvMsn+8iGEJsn3IvYjizwI=
X-Received: by 2002:a1f:b593:: with SMTP id
	e141-v6mr9295914vkf.171.1530274437929; 
	Fri, 29 Jun 2018 05:13:57 -0700 (PDT)
MIME-Version: 1.0
References: <1530014936-10858-1-git-send-email-alex.kiernan@gmail.com>
	<4ef21051d1ee4c72a7fe24722ec2b31a@XBOX02.axis.com>
	<257c6bc25cc803109799796700bae278d3803d33.camel@linuxfoundation.org>
	<CABcZANkB3nH2VGMAGxtTYZu2XZfsfLc0Ch55GkpmY7peN+cdSw@mail.gmail.com>
	<CAO5Uq5RCb_b=VmdWky+6Cen5509i23mR24G3xx-RMZFoeH6wbw@mail.gmail.com>
	<5847dcfcc2cd4024befae98b7d245c45@XBOX02.axis.com>
In-Reply-To: <5847dcfcc2cd4024befae98b7d245c45@XBOX02.axis.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 29 Jun 2018 13:13:46 +0100
Message-ID: <CAO5Uq5RZDB8EunTrvD6mr8VCfb4TLySc81mJNHXYMG5seeqT=A@mail.gmail.com>
To: peter.kjellerstedt@axis.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] image: Set COREBASE as the git directory for timestamp
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
X-List-Received-Date: Fri, 29 Jun 2018 12:13:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 28, 2018 at 7:34 PM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: Alex Kiernan [mailto:alex.kiernan@gmail.com]
> > Sent: den 28 juni 2018 17:57
> > To: kergoth@gmail.com
> > Cc: richard.purdie@linuxfoundation.org; Peter Kjellerstedt
> > <peter.kjellerstedt@axis.com>; openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [OE-Core][PATCH 1/2] image: Set COREBASE as the
> > git directory for timestamp
> >
> > On Thu, Jun 28, 2018 at 4:31 PM Christopher Larson <kergoth@gmail.com>
> > wrote:
> > >
> > > On Thu, Jun 28, 2018 at 8:29 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >>
> > >> On Thu, 2018-06-28 at 15:18 +0000, Peter Kjellerstedt wrote:
> > >> > There is no guarantee that ${COREBASE} refers to a path that is
> > >> > under Git control. E.g., in our case it refers to a directory that
> > >> > is under repo control. "${COREBASE}/meta" is probably a better
> > >> > option.
> > >>
> > >> You could make that argument about /meta too.
> > >>
> > >> I'd suggest the code checks for ${COREBASE}/.git and if that doesn't
> >
> > In a poky checkout from repo (which is what I'm also using),
> > ${COREBASE}/meta/.git doesn't exist, but ${COREBASE}/.git does, but
> > that all works because it's climbing the directory tree to find the
> > .git directory.
> >
> > >> exist, fall back to the timestamp of the
> > >> ${COREBASE}/meta/conf/bitbake.conf file.
> > >
> > > That's a good idea, but I'd suggest using bb.utils.which() to locate
> > > conf/bibake.conf rather than hardcoding that path.
> >
> > How about (totally untested):
> >
> > if git -C "${COREBASE}/meta" rev-parse --show-toplevel; then
> >   REPRODUCIBLE_TIMESTAMP_ROOTFS=`git -C "${COREBASE}/meta" log -1 --pretty=%ct`
> > else
> >   REPRODUCIBLE_TIMESTAMP_ROOTFS=`stat -c%Y ${@bb.utils.which(bbpath, "conf/bitbake.conf")}`
> > fi
> >
> > ?
>
> You do not really need the first git call above:
>
> REPRODUCIBLE_TIMESTAMP_ROOTFS=$(git -C "${COREBASE}/meta" log -1 --pretty=%ct 2>/dev/null)
> if [ -z "$REPRODUCIBLE_TIMESTAMP_ROOTFS" ]; then
>         REPRODUCIBLE_TIMESTAMP_ROOTFS=$(stat -c%Y ${@bb.utils.which(bbpath, "conf/bitbake.conf")})
> fi
>

That's true... I'll post an update

--
Alex Kiernan

