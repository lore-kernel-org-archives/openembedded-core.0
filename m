Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193])
	by mail.openembedded.org (Postfix) with ESMTP id 220FC7CF8D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 16:30:19 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id k6so1066230oic.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 09:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FJeVeAIdth9LZ42APoOGN1ESTpkVRNC6k5nbiZ6JFF4=;
	b=BDWElPcMWsJ2996AnM0CRuBsfsZDSi6UxhKb6QxfhGYvbJdYiqb+TJA9kjPvDp9/65
	iq3Jg5vv+g7Y7VHfo9MHHCSBScLWxmWZ05rrdGONKCSLU1NweTFAvix6lOf+GMahF8QZ
	5nBgWpE0xJ+5rGhSms5DJvN4NyewMbw790fpXpZrRzXKwpKn436Qw0aJngdVN2buKNxN
	zRhJB3scWYV0lnzvAHibAxLK++ecWc54SHW1e3paNhdjTBZ3KNGJeFxCt+77+7rGBXFF
	JPQNlvxS3VS+NQfij3JfkWOS9jPfrwb47rSvfHvo1Nlrfgq7BkibHy6h97F0mm54sSdv
	LG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FJeVeAIdth9LZ42APoOGN1ESTpkVRNC6k5nbiZ6JFF4=;
	b=VXxQyj6+kSsZCfV4ouyxSiEjP64svwisIU2O9QAI+IB2gwFse1JbV+lref7bSgG3Xh
	6mHyIuNaLyyOZH8jJKvT+ZIP5V9MW0kFlIondGU3K+7QjJkti5SnyPgSWOLk+04ygy9h
	s48YMdN/8tgEiF/KT6xv09786A570egbyYKlVVU1lJ4XFyppFvEmRDq7mN/xOdNfIOSe
	+06cnz+07xuWnExgaEZKU29Npz1lFp1lMsllH5QjeELLGE2dY3e1V//81mm16Y+IaunV
	G/jO3qi7zwcazP3EBURm56jgG5eDknh0uThGsOtklfNcTjm9JJV9excK2i8wzuNM2tzl
	zAxA==
X-Gm-Message-State: APjAAAU76sa/SnDuCM6YiyRtI3k3Ix9UpRnulWqRv9Jp2zCqSgRUQS4x
	GiwfccJNwStVJdpRYQpHgNHIb4zn7jAzz5MXV8toPRrtlBc=
X-Google-Smtp-Source: APXvYqxLynMiBK9lnB28wex2ftvArV5P2rGgEA5z9zi34GojTLH4/eVMqTP9cc9DODUxtGJb1ytocJPW3St6ZM9r0c8=
X-Received: by 2002:aca:e689:: with SMTP id d131mr6451791oih.132.1556123420952;
	Wed, 24 Apr 2019 09:30:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190423161916.25572-1-alex.kanavin@gmail.com>
	<20190423161916.25572-9-alex.kanavin@gmail.com>
	<47f9247c144f591b4527e1af2c6b7bb80cd1bfbd.camel@linuxfoundation.org>
In-Reply-To: <47f9247c144f591b4527e1af2c6b7bb80cd1bfbd.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Apr 2019 18:30:09 +0200
Message-ID: <CANNYZj8ZyU5Nhu_edVeRAg9BX7ZBF1g=RW+6gKpY5Ec9=9Q8rg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 9/9] python3-pycairo: update to 1.18.1
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
X-List-Received-Date: Wed, 24 Apr 2019 16:30:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Apr 2019 at 17:49, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2019-04-23 at 18:19 +0200, Alexander Kanavin wrote:
> > Switch over to meson build, as it does not attempt to install
> > headers into /usr/share and pkg-config files into /usr/share/$libdir.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  ...3-pycairo_1.15.6.bb => python3-pycairo_1.18.1.bb} | 12 ++++----
> > ----
> >  1 file changed, 4 insertions(+), 8 deletions(-)
> >  rename meta/recipes-devtools/python/{python3-pycairo_1.15.6.bb =>
> > python3-pycairo_1.18.1.bb} (65%)
>
> Fails on no-x11:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/531
> qemuarm-oecore:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/543
>

This one I could not reproduce :( The issue seems to be meson complaining:

| meson.build:14:0: ERROR: <ExternalProgram 'python3' ->
['/home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/python3-pycairo/1.18.1-r0/recipe-sysroot-native/usr/bin/python3-native/python3']>
is not a valid python
|
| A full log can be found at
/home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/python3-pycairo/1.18.1-r0/build/meson-logs/meson-log.txt

which does not seem to be caused by lack of x11 - maybe a host issue?

Alex

