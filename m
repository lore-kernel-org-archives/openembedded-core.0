Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0A19B7CB85
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 12:41:51 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id g16so3900342oib.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 04:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=O493FZn2cLfbgmMY65yczjiOarPybkA53a8eIqyAuV0=;
	b=o0sWhukC33fypiQNLeI3yVm2KnWfAWfNJw8lkfNNA9WC4b//LTiXrQ+Tvb6pJY6LYv
	AWLEHimQM+IQo2e7cy0H2bRNvja3GpmkwX2O2V4OqNsgSAFDmKPAMnzDvCfbYMnGpCsn
	ZiN3nMTIW7XSHPl6apq+Vukcbqr2XYMvnXu5c+6dBcXnRtEEXTLQbYIS02Azh3bMyUri
	OWgTkWj4Iaxe8k90SADGM/da4+abNmRjo4y0thJZRcIeBfRcSH1iHv+6HCQJ8eQvGR8t
	sV8Sp4ZOQdmDDD0J2S0A6gHTocRVQoZDRT08Hd8FvOQ6wfVg5K//6OuHDwg/rONzDwr9
	nNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=O493FZn2cLfbgmMY65yczjiOarPybkA53a8eIqyAuV0=;
	b=fMTPVEN3anbJIi+Mdf10/CTRAWvtz+Kh8tjz92VarFEvo8pKUw1WwCdzgWLCmf0RkW
	mTzB4MyiTUnnEEu4H9qYqVPji62oYSf2yT3xVjVjVHG15ZzBF3DIghT28mFW14gRB8m/
	vduIb9pwp2QQSnpcMAx9oilfsNjixGrXkf45pkxH3SfUNv3582oEjGJWhEzrUmt1xiQn
	SxbMIUFeUKDT8poOpf8ifwbWktetobtfiHP8dxEI7QBZHL5+M/RC2TVN8hHw+UPR2krB
	WqBpV2Mb+3o33glw0vIwqwjxxFJVyx71a3Qpwro2l3GwQMf6dnDDQQMW3O4eqXvPN07i
	6Dlw==
X-Gm-Message-State: AHQUAuYL4pfmheaJ1lL9E8JDJ+Zj2/GgRVFbVBYPRfCLslFxL2BXKire
	SQwzQHs4V1tD4upWX1UaVXFcHwL3KZGYBPzSaCY=
X-Google-Smtp-Source: AHgI3IbMsRKAEoCdIRfpn30oZ9ehvfLXv4tJAwzdMHoK0JnD6Q9sS1kFSHFy7/wDfO5KDY8qid+HI6rw4M8PMoWi3f0=
X-Received: by 2002:aca:30c2:: with SMTP id w185mr5604560oiw.163.1550925712642;
	Sat, 23 Feb 2019 04:41:52 -0800 (PST)
MIME-Version: 1.0
References: <20190220201026.70803-1-alex.kanavin@gmail.com>
	<20190220201026.70803-3-alex.kanavin@gmail.com>
	<6378eef56d799e4b91da708cc8fff92c0e4bc13e.camel@linuxfoundation.org>
In-Reply-To: <6378eef56d799e4b91da708cc8fff92c0e4bc13e.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 23 Feb 2019 13:41:40 +0100
Message-ID: <CANNYZj_n-nsGvR-E7h2yyN-gbYji6Q59u_7wK8Vg9W=8MrBnkw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] gdk-pixbuf: convert from autotools to meson
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
X-List-Received-Date: Sat, 23 Feb 2019 12:41:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, 23 Feb 2019 at 13:29, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > Drop autotools-specific patches.
> >
> > Rework jku's thumbnailer patch into meson configuration.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>
> We've seen it before but its happened again:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/326
>
> I went into the failed build directory and ran "bitbake core-image-sato
> -c testsdkext" and it succeeded so I'm not sure sure how we're going to
> debug this one...

:-(
We can debug by making a tarball snapshot of the failed build dir, and
statically inspecting it, I guess. It has to be some kind of race
during SDK extraction.

Alex

