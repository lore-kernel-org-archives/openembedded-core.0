Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by mail.openembedded.org (Postfix) with ESMTP id D3D467CB00
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 18:09:54 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id u128so2148566oie.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 10:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iU81dH6isWwmBx3dWUhYshNgpFFpPYZcbvFGzFJwVTo=;
	b=pFust7wTEaxSSnEf6Jphwm7TwCMMQSC76zD1sGW++s06UJFp+a3HQKypTxUZFPtCqL
	wDTUHDZ24f6IObClCiqJF0TPGe4EXN9Cn7FOhpfarPQcoMtqx00R3muEEZq2pjR1Ts79
	q/wjjAG3r8wi94TzqFgzcg40D+B2LIuX88qg3DRoy/b1js1dreloq3q78LUaKcJfuLn1
	nQ20yU9nPjihP5hpu1Qwe/8ihgu97j2i+udVZ+U6lvy3XnBeDUp67QEiOkIYJXvhZUNE
	WzVf2QlfOpmqkUo9NPcoyNFpL+G5U5rc8WgAXSD4MjAFWvebVCRRQ085ayk0cffZG750
	elZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iU81dH6isWwmBx3dWUhYshNgpFFpPYZcbvFGzFJwVTo=;
	b=kyIGglsLRgHIV2qZXPKLdBw87LY8FsZhSS67pKACYYf1SEKxM6B165vCX9KUtuxeEo
	JuJmmMiusDymCghTrKiEIYodUVRVRjUOLjhI0YehCDM7pV5LbwSUD6mbems4AqQNyqAR
	eKc2YqMnt1xBFrql1tyYV3q7YaDqJO1D4m4mK9Q/+YbdiMBZmH+pvZ4XLzFUIeCL7Lk4
	gJdaP+jcFcDHfSaRWuiaeL9+rn+SQaFAcvJQi6vgYdXp3Wqlybc/f/HFriHngDNK1fnE
	J806TFk6oLaSIo1yk3jM0fyc9RhvQKTJFjyF8Db3v8i1FoZWbRDCBWjDh4QX0wGUgg4v
	uEGg==
X-Gm-Message-State: AHQUAuZkOKvIV45X2V4yRBju0n7DNtWbekx88IwomC4mLaBy13hljomQ
	BGTVpKlcxn7vkyHWW6k1dseN7qU0ilcxRv7ecFI=
X-Google-Smtp-Source: AHgI3IYtRNETWfAMpFpZsQNq6FHS5+kTgrcweUx3Wn+4RqTAd5UBG/nya4DH/Im8FHDVoS4hGSDsPHFLgK7nyvuqtgE=
X-Received: by 2002:aca:4c58:: with SMTP id z85mr9866880oia.140.1550772595707; 
	Thu, 21 Feb 2019 10:09:55 -0800 (PST)
MIME-Version: 1.0
References: <cover.1550755109.git.tanuk@iki.fi>
	<CANNYZj8f0SMDZd3wryCZ0A2=RjLfOAR6q5=bLsV+QgWDakJ_7g@mail.gmail.com>
	<CANNYZj-8euMhvqpAwHoZfofAm=FdCtJSb9i7QOMiTGMhv=322w@mail.gmail.com>
	<236c2e06d12bde612ffa2399cedb9bbfce7dd5dc.camel@iki.fi>
In-Reply-To: <236c2e06d12bde612ffa2399cedb9bbfce7dd5dc.camel@iki.fi>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 21 Feb 2019 19:09:44 +0100
Message-ID: <CANNYZj-PdeoHukCN7_i8RgZDYRCS3dc3xWDhKXvuienyNzUFVA@mail.gmail.com>
To: Tanu Kaskinen <tanuk@iki.fi>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] alsa recipe updates
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
X-List-Received-Date: Thu, 21 Feb 2019 18:09:55 -0000
Content-Type: text/plain; charset="UTF-8"

Bah, and I often point out to people that they should read *my* cover letters :)
Thanks!

Alex

On Thu, 21 Feb 2019 at 17:41, Tanu Kaskinen <tanuk@iki.fi> wrote:
>
> Richard already sent the update for sbc, so I left it out. As for alsa-
> tools, if you read the cover letter in more detail, you'll find the
> answer there :) (Spoiler: I'll send it, but it's not ready yet.)
>
> -- Tanu
>
> On Thu, 2019-02-21 at 15:57 +0100, Alexander Kanavin wrote:
> > (Also sbc needs an update, I think)
> >
> > Alex
> >
> >
> > On Thu, 21 Feb 2019 at 15:56, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> > > Thanks! Will you be also sending an update to alsa-tools?
> > >
> > > Alex
> > >
> > > On Thu, 21 Feb 2019 at 14:34, Tanu Kaskinen <tanuk@iki.fi> wrote:
> > > > The following changes since commit f15ceac287c094abdeda64b03628455d92e0ce74:
> > > >
> > > >   libdrm: Upgrade 2.4.96 -> 2.4.97 (2019-02-20 21:22:28 +0000)
> > > >
> > > > are available in the Git repository at:
> > > >
> > > >   git://git.openembedded.org/openembedded-core-contrib tanuk/updates
> > > >   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=tanuk/updates
> > > >
> > > >
> > > > The alsa-tools update is missing, because the recipe upgrade deadline is
> > > > near and the changes in alsa-tools look like a potential rabbit hole.
> > > > I'll send the alsa-tools update separately when it's ready. The main
> > > > change in alsa-tools is that the hwmixvolume program got ported from
> > > > PyGTK to gobject-introspection, and from GTK2 to GTK3. I doubt anyone
> > > > actually is using that program, it's not even built by default.
> > > >
> > > >
> > > > Tanu Kaskinen (3):
> > > >   alsa-lib: 1.1.6 -> 1.1.8
> > > >   alsa-plugins: 1.1.6 -> 1.1.8
> > > >   alsa-utils: 1.1.6 -> 1.1.8
> > > >
> > > >  .../{alsa-lib_1.1.6.bb => alsa-lib_1.1.8.bb}  |  4 +-
> > > >  ...plugins_1.1.6.bb => alsa-plugins_1.1.8.bb} | 84 +++++++++++++++++--
> > > >  ...s_1.1.6.bb => alsa-utils-scripts_1.1.8.bb} |  0
> > > >  ...lsa-utils_1.1.6.bb => alsa-utils_1.1.8.bb} | 10 +--
> > > >  .../recipes-multimedia/ffmpeg/ffmpeg_4.1.1.bb |  2 +-
> > > >  5 files changed, 85 insertions(+), 15 deletions(-)
> > > >  rename meta/recipes-multimedia/alsa/{alsa-lib_1.1.6.bb => alsa-lib_1.1.8.bb} (88%)
> > > >  rename meta/recipes-multimedia/alsa/{alsa-plugins_1.1.6.bb => alsa-plugins_1.1.8.bb} (51%)
> > > >  rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.1.6.bb => alsa-utils-scripts_1.1.8.bb} (100%)
> > > >  rename meta/recipes-multimedia/alsa/{alsa-utils_1.1.6.bb => alsa-utils_1.1.8.bb} (92%)
> > > >
> > > > --
> > > > 2.20.1
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-core mailing list
> > > > Openembedded-core@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> Tanu
>
> https://www.patreon.com/tanuk
> https://liberapay.com/tanuk
>

