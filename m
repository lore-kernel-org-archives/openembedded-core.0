Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f175.google.com (mail-it1-f175.google.com
	[209.85.166.175])
	by mail.openembedded.org (Postfix) with ESMTP id D02B67D413
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Apr 2019 09:52:13 +0000 (UTC)
Received: by mail-it1-f175.google.com with SMTP id s3so9663706itk.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Apr 2019 02:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=n1LDOVH/aHpO8/Pk5LpZKkiu90ifI7ZRnARCkAI85hI=;
	b=OjJmTTL4D0zLXCamrn0SN6BtNZ3Q6ZZukzPMsbw6fFLXwXwNAfUW6Yt6pvk23/u71F
	TyyiUv+b/KGQQnHcaWkIbpdvUTKtwJz3cnaO1Rx5w4udxMVpu9hrsfpOoHDcgnY0NEor
	nSNxyKGAWB3W20TH/br1oz4IWWe06hLMepY+CcHlTXvVU6XQKaeHUD2ZOf25RU2xXRcG
	NDE/Ppx3gNVtoa6XC8r1hXQqYYt1Of9BcoZc00w6NcXYvm8wlfyKQG66PR3+agCYgl1J
	jMUZ1aa3byUKxz5e9zUCojFPiMK6tqzwe+m599SHZBsS4Vv1WozC5yZUQxBEI2UEgWsU
	F3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=n1LDOVH/aHpO8/Pk5LpZKkiu90ifI7ZRnARCkAI85hI=;
	b=FcsAXFgLhGTdSj89VyCOT9GTYG9iZbqo+1DojhZDI63m7ljZOxVeMb8LIQZmdoETXe
	tWhbIgHWBajyPVTrLnbe/iqR1Yw0xGyUy2ACD9DT6yqjgoGSLKwXatf2V1nsKBKcG/ia
	tdGgi7UjUQvepi40eGp/v+Rn8LYF2OyWnZQe8xWM0DKfGszZ5pq6H0X2RgXydkV7oyVT
	GjFLsJ5fTaR+eIhPHROI4SYKmxXwiO8Blbumd625YsVZ/OuUFETs3cgQUK1ZWtK4gh4R
	0iMuIvKG9p1LpNMNtkBy4edIxMuVZRE5svtP4EBmYwPN6YHNHVFVvUndOwu8C5ofReL/
	Yx0g==
X-Gm-Message-State: APjAAAW89dUkRkF75HzWx01BF4x063qYkk4dYNHF/GgFJ8Y4ZImFTQmR
	BAAVKc5TwmZt7qaFC+I55WZedJ+c5FCtryb3yvk=
X-Google-Smtp-Source: APXvYqz03zCIauAn6DC7yO+bUgzgXCfktFf+Wzc5q2rbV4oNLbFNvlu/0qR8XlSutdpl7aa7BmEO5uv6a46eltS/TUk=
X-Received: by 2002:a24:78c8:: with SMTP id p191mr11897077itc.58.1556358734874;
	Sat, 27 Apr 2019 02:52:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190424091318.18154-1-schnitzeltony@gmail.com>
	<e290569afc4a08a1489cf033195e32d58ba78e19.camel@linuxfoundation.org>
	<CALbNGRTMzeWHgAO6MdLs1HmiCrMWfmpd3=OLUrJdSDBbbT44Gg@mail.gmail.com>
In-Reply-To: <CALbNGRTMzeWHgAO6MdLs1HmiCrMWfmpd3=OLUrJdSDBbbT44Gg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 27 Apr 2019 11:52:03 +0200
Message-ID: <CALbNGRSjZ1mDoDNT7SXyKfFad4r7Yn8pLdL8ddMhKE-nctFBtw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] vte: upgrade 0.52.2 -> 0.56.1
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
X-List-Received-Date: Sat, 27 Apr 2019 09:52:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2019 at 11:26 PM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> On Fri, Apr 26, 2019 at 10:34 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > Hi,
> >
> > On Wed, 2019-04-24 at 11:13 +0200, Andreas M=C3=BCller wrote:
> > > * license: COPYING was replaced by
> > > COPYING.LGPL2/COPYING.LGPL3/COPYING.GPL3
> > > * prettify recipe a bit
> > >
> > > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > > ---
> > >
> > > V1 -> V2: Fix build with musl
> >
> > I think something with vte-native is not working quite right with one
> > of these patches and is causing oe-selftest to fail:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/433
> >
> > (oe-selftest -r runtime_test.TestImage.test_testimage_virgl_gtk)
> Will try to reproduce...
>
Hi,

Alex - you just wrote in mesa-meson thread, that vte-native fails due
to ancient gcc on host. May I ask where you found this information?

Andreas

