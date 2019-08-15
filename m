Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0BDA97F260
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 00:31:11 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id f9so739251ljc.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 17:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=A67Bey7GXwDGdPDv6TLWDy9PSOPEL/C0VS10iwxzKXw=;
	b=UD1YR4httb5WbLqArb/j6uDvguE8i2wfQbleirCtdhdySJpqWsWC/PX49BdiKSnyUU
	x/ApVFhu//RtPeWgakChcbX3zOSa+r8OBkEsvg68NFdt4z66gs4GUz+G7Hz/vU7n/Utq
	lnqH22ncUyd389QDO5QSRZN5V5WvspSqBOAWoL6nBOQFtgbYPNkse7F/cPI/8B4bdD37
	3Nv0fRGYCHcyi7NQv2IXWat4R2At+5E+E3m1OOaRxRIhqfyMuC0MYumk/wDYrTC3+RFA
	Y24y376sRXyWklqrLwdSDokMO+V5IcUo3ZRm09+qtFb43eq7nNJozzBLzCzxzAFXAAdW
	Gc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=A67Bey7GXwDGdPDv6TLWDy9PSOPEL/C0VS10iwxzKXw=;
	b=Psea6QBjqj3X1c88Un+85tlwcf/ZeczFE+dQNiOhCvNoWX4HH2bR9bAmjNh6dvXIGG
	rpNFT27DQnpsPzvgFBR6vc/ZRj7cALSRPGgCDTZr4ppoBhsoJ2qsz60LfgIYzkFNQ65M
	aWfzC3OB4kPcJ+aIzdtPg1QsfHAl2EV/Rxl5fe3w5O6SoaIlM0VNNfHQNJ5b3aEagEA6
	wUZH7YbEXUzTiFgcjtawimfLbdvmmxW8IHsMyUPB2iTEx187+JmYrEsorWxEQKod1VKx
	FpWPNDrJ1PRn9QGCdc65O1cQmAVvh8YzRpzeHT0X3HmE/6GVXHE17LIiTh0MJAOSEfqw
	y9jQ==
X-Gm-Message-State: APjAAAV7MeUxYD2+AIjjXv4+zOkqksH9ze/i69CbfsSFMDkCEdZcUVvM
	WhOf1g7HlY7MTAdQPTSS/Qiu5bMO6wVe9ikrI5A=
X-Google-Smtp-Source: APXvYqyQqpSf+ir9A2EYAalO+nGRoLWsqShUgn2N+cE7bp49gFu5UO+3mmEhf13cCt3f/lyUE4TLEMmat9lXtHXIFQQ=
X-Received: by 2002:a2e:3807:: with SMTP id f7mr1166006lja.87.1565829072389;
	Wed, 14 Aug 2019 17:31:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190814152613.46996-1-alex.kanavin@gmail.com>
	<83c8625d33058ccf085ebd2a646aa41519c73625.camel@linuxfoundation.org>
In-Reply-To: <83c8625d33058ccf085ebd2a646aa41519c73625.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 14 Aug 2019 20:31:01 -0400
Message-ID: <CADkTA4OV2rb2pCbh+NBniFsGbSS50iruerKp7Phq_W92b=Pwpw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] linux-yocto: add drm-bochs support
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
X-List-Received-Date: Thu, 15 Aug 2019 00:31:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 14, 2019 at 6:21 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2019-08-14 at 17:26 +0200, Alexander Kanavin wrote:
> > This allows better modesetting support for the '-vga std'
> > emulated hardware provided by Qemu, which we want to
> > standardize on.
> >
> > See here for background:
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=13466
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/recipes-kernel/linux/linux-yocto-dev.bb     | 2 +-
> >  meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb | 2 +-
> >  meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb  | 2 +-
> >  meta/recipes-kernel/linux/linux-yocto_4.19.bb    | 2 +-
> >  meta/recipes-kernel/linux/linux-yocto_5.0.bb     | 2 +-
> >  5 files changed, 5 insertions(+), 5 deletions(-)
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/41/builds/929

4.19 didn't have the drm-bochs fragment. I just cherry picked it to
the branch and pushed it to the repo. I'll send a SRCREV bump for the
4.19 meta data shortly that should fix it, and this patch can stay
as-is.

Bruce

>
> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

