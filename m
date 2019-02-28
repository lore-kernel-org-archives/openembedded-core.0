Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id D3AB27CCED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 14:16:39 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id g1so17720196otj.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 06:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9iPOcT0WabrcMBQ1Nmnm8KGucbti8Bl/ZFQ2DKzZzYI=;
	b=JUw2jgdrtUwgHMOFPuEEOBrEHw2PO8SQtXjGslTX+9eF5rRrA70d4xGDnNRe0Z/Nt8
	R+CGgXnRgyeg2BipYrSCjXWBpRNbFdXCXgoy27JDmjzDVNi+OKyJl+V8aAmwiUxqIjtZ
	kzf/WTiBBY6cGu0Z1srt/XJ5D4Gn0OwF7+Z5CPMXn+RppbPm/2jIWdUt9jblefTfQ0mw
	CUkNvmv/ybkXh9tOdlCDM2TuC4Hzn3TJaoaA8ivfG692D6mmSCD9EWQbrTbDSVLSsEq+
	u6Bo8SOBU2o4PzVcSf+G0cGna5chT4XwaoHNyVV/4g4oCPzYlhyeD9xwATFZuAWRNp3k
	ucNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9iPOcT0WabrcMBQ1Nmnm8KGucbti8Bl/ZFQ2DKzZzYI=;
	b=OhZPQsZ78y8jMg9e3onB/DCt7i+Q7L/9rVsb6Kxl/RhKkFgUKfKpLjIb3704KBSXXW
	v1fMcQXwCdnINH5DxCGKOXiGiATdoWlhxqRoAmFtl+Wu4woEmM7xV2WGAZg08AuXqpny
	e5aZ94SwdXtYrhOhQujKYpA/n+TGSTmcnlyxqa5e9q8m5OZbRnwZoWzywa12Dc3P1SOn
	5ISEjnHBrtOHY95fMZyG1cym0NBiT+pvMZgBc6z4wUCCgG7KNDoWUQhW2+f2CSevnaby
	OkgJI9+1/0VLq+RELplhsWHXU63l7mTkZx74NXJEBQjUWtBVRePnFyoIsnmwnrNAjhOx
	n7gg==
X-Gm-Message-State: AHQUAuaL5+y0jVdjWrtnsMiS1wgZ0yEdJG20E+fDvqDTPI9EWChrpbok
	yxnouzQcxfHp+/eYJ7gwerkslVzBWYu9BhbzyJw=
X-Google-Smtp-Source: AHgI3IaPDeTo1lQaP6IN555zg9nEsz5VVx/bZ6T45nwRXF8w2QZjcLgchTvdPa/P8MnoQICA/NKUyGSdYzYwoQz8lis=
X-Received: by 2002:a9d:4ca:: with SMTP id 68mr6275616otm.96.1551363400731;
	Thu, 28 Feb 2019 06:16:40 -0800 (PST)
MIME-Version: 1.0
References: <20190228131510.43557-1-alex.kanavin@gmail.com>
	<20190228131510.43557-7-alex.kanavin@gmail.com>
	<20190228141447.GB1503@jama>
In-Reply-To: <20190228141447.GB1503@jama>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 28 Feb 2019 15:16:29 +0100
Message-ID: <CANNYZj9QMCVx+zeV8kdAYmCCSjSQTBBOY_ZQV0Z8DZFvLQWwcQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/8] runqemu: add an option to choose the SDL frontend instead of Gtk+ default
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
X-List-Received-Date: Thu, 28 Feb 2019 14:16:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Feb 2019 at 15:14, Martin Jansa <martin.jansa@gmail.com> wrote:
> > When Gtk+ and SDL are both enabled, qemu defaults to Gtk+.
> > This option allows to revert to the 'classic' frontend.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  scripts/runqemu | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/scripts/runqemu b/scripts/runqemu
> > index ec6188ba4a2..bbf539a8e67 100755
> > --- a/scripts/runqemu
> > +++ b/scripts/runqemu
> > @@ -74,6 +74,7 @@ of the following environment variables (in any order):
> >    MACHINE - the machine name (optional, autodetected from KERNEL filename if unspecified)
> >    Simplified QEMU command-line options can be passed with:
> >      nographic - disable video console
> > +    sdl - choose the SDL frontend instead of the Gtk+ default
> >      gl - enable virgl-based GL acceleration
>
> can we call this gtk-gl
>
> >      gl-es - enable virgl-based GL acceleration, using OpenGL ES
>
> and gtk-gl-es
>
> to make it easier to add sdl-gl?

Sure. I'll add a patch.

Alex

