Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9B81D7BFB3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 15:29:25 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id d125so49135ith.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 07:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=vrSYekxo7eL0zXMgCQcIbOpc99V/zL/wf50U3TqP63M=;
	b=Fm9rN+Wf212vc7jem+mVz+7Yt8sMx+IStzRy9a68DH2Y9NHXdXxcADHyvaMk9Pzukp
	Cw8NNkMni5hI1UZkVgbF/V5hJH3Bq0UMEasAnpCqu5qrzOFjvPXPjWF3sqe3SX3lpI2H
	7/VPYCFUP467Xb2nk0ogqYhc+qZaR06QaPnhlk3P2t2Et4hIVsS4JcdYMadh2OWyOSIX
	/guoke7ZyqgXzAiHrChryv1FP0pJOrc8UKPRNg5RMRwfH1rE6hTNyV0gBJ3oZdda/THV
	xKXEvUa0XQNWDLJUIcRbgk6fu6TGI+fPUyR+GMfEisVHsOzcKXxOvAUPMqvQupmYYXK4
	oYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=vrSYekxo7eL0zXMgCQcIbOpc99V/zL/wf50U3TqP63M=;
	b=bgEGSDzFfN0mY34l3up4YM+lu2wbOrnIzFEHxi0CzDeG5U5A1/m+lREZabeJuLXLyt
	zqwiJ8mtUi4ttvqzlZyqtcCh/jukBt8CJzrr4yyI+kiTUBZEPKyy/KJz/SnzvZNmGHVN
	7y5++4DrpKW9t6IGzCDINbcpGSJrmrcLRQsmk/GxC9exkDzHr58Qipv0gMUdUWoIt36H
	LRZKHeiu7JbxB6dejVpU4ZkryWeK+YzMx+bOojq3hJBPHaMZcKYUGM1nmoOgwEi68KT8
	FNG+6rs5v8CrhmNCgWVOOQ/xrzyjmD2V7pKkk7YeAglLPBhZ9R+EAwLuZOflgZsDqjxD
	Y7JA==
X-Gm-Message-State: AHQUAubAw1j0OPr10M5CAoEumMSNx0CAqbbuOEolqAxpwEKUsIO30JdC
	zAUqHtFx6SwkFWlXu7/Vy6o=
X-Google-Smtp-Source: AHgI3IaaCdUArvA1WMPHBtJJ43RWx+WkjqP8HbmBSv++mqiA5TfJfU1XP4XNm0AWwADMp0Z1eRMrQg==
X-Received: by 2002:a05:660c:78a:: with SMTP id
	h10mr8919818itk.152.1551108566417; 
	Mon, 25 Feb 2019 07:29:26 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	202sm5768950itl.1.2019.02.25.07.29.25
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 25 Feb 2019 07:29:25 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <01e0cbf362ad949ea1ccac98d31e44d1c601dc6f.camel@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Date: Mon, 25 Feb 2019 09:29:24 -0600
In-Reply-To: <CANNYZj-egKt=s0SYG2NN3kV2LnPqg9Jb9UQ25LOGrLjhfZVQUg@mail.gmail.com>
References: <cover.1550845989.git.alex.kanavin@gmail.com>
	<296658f75576781b5e8f36c95bec204a65482af7.1550845989.git.alex.kanavin@gmail.com>
	<3cab827a44a031abbffa58de513230d100d5ebe4.camel@linuxfoundation.org>
	<CANNYZj-egKt=s0SYG2NN3kV2LnPqg9Jb9UQ25LOGrLjhfZVQUg@mail.gmail.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/12] qemu: enable virglrenderer and glx options for native/nativesdk builds
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
X-List-Received-Date: Mon, 25 Feb 2019 15:29:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-02-25 at 13:52 +0100, Alexander Kanavin wrote:
> On Mon, 25 Feb 2019 at 12:02, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Fri, 2019-02-22 at 15:33 +0100, Alexander Kanavin wrote:
> > > Except for ming32/darwin, which do not support them.
> > > 
> > > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > ---
> > >  meta/recipes-devtools/qemu/qemu.inc | 10 +++++-----
> > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-
> > > devtools/qemu/qemu.inc
> > > index c127434b020..95e9e0ede77 100644
> > > --- a/meta/recipes-devtools/qemu/qemu.inc
> > > +++ b/meta/recipes-devtools/qemu/qemu.inc
> > > @@ -74,15 +74,15 @@ PACKAGECONFIG ??= " \
> > >      fdt sdl kvm \
> > >      ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
> > >  "
> > > -PACKAGECONFIG_class-native ??= "fdt alsa kvm"
> > > -PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm"
> > > +PACKAGECONFIG_class-native ??= "fdt alsa kvm virglrenderer glx"
> > > +PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm virglrenderer
> > > glx"
> > > 
> > >  # Handle distros such as CentOS 5 32-bit that do not have kvm
> > > support
> > >  PACKAGECONFIG_class-native_remove = "${@'kvm' if not
> > > os.path.exists('/usr/include/linux/kvm.h') else ''}"
> > > 
> > > -# Disable kvm on targets that do not support it
> > > -PACKAGECONFIG_remove_darwin = "kvm"
> > > -PACKAGECONFIG_remove_mingw32 = "kvm"
> > > +# Disable kvm/virgl/mesa on targets that do not support it
> > > +PACKAGECONFIG_remove_darwin = "kvm virglrenderer glx gtk+"
> > > +PACKAGECONFIG_remove_mingw32 = "kvm virglrenderer glx gtk+"
> > 
> > Sorry, I just spotted this. Please don't use _remove in OE-Core.
> > Can we
> > rearrange this so we don't need to use remove?
> > 
> > I appreciate there are other users that have crept in but I'd like
> > to
> > see them gone too...
> 
> I'm actually unsure how to override the
> PACKAGECONFIG_append_pn-qemu-native = " gtk+"
> set in local.conf without using _remove.

I don't think I quite follow why this is an issue, mingw is not a
supported build host AFAIK, so the "-native" means it shouldn't be a
problem (e.g. "native" should never mean "mingw")? Not sure about
darwin though.

> 
> (we do not support gtk+ on mingw, and I guess darwin too).
> 
> We can rearrange this, enable/not enable gtk+ directly in the recipe,
> and drop the qemu related lines from local.conf altogether, if you're
> okay with that.
> 
> Alex
-- 
Joshua Watt <JPEWhacker@gmail.com>


