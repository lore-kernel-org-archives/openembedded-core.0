Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id A86D37C6F7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2019 05:43:20 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id s1so8860440qte.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2019 22:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qqQfrSGwm7Mb3S/tPOF2lEhe8V9CchOXu7+mqww3d1A=;
	b=eKpx5svoxkPqga6LghwZNDnxnPrr/AWUpWBnA8rk5rLXbllIkVSPjpgCbp2ptuRECi
	79WIFC2TNpjDqHgatoPGIlbyLGFa0ydYam7qN58DIqCI/35HGG+uWYwYwP8RiOz3T6VK
	o8USqsdn50hHK5lXVwB4hGHmhUtZdLhQ9njMnGIMNnjU1DGO2bhP5Flk3Eo6/A8bM0f1
	emMbz5elmb5OUCfDv8yQsFehyw6Xcmwjp9Yl5XDXN7r7WWEgekfzzN1yW+fIF9kNMPxe
	gCM7+yF4BaaIW2WkC2A1Y8Yb7HH6DbN4UYb9ZYVJX5ZWHk3U9zNc/luWec7V90L/rE6U
	wURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qqQfrSGwm7Mb3S/tPOF2lEhe8V9CchOXu7+mqww3d1A=;
	b=n9X7NhCxEaEN3BBZCoH5NiCf2bosCCvRfigleOWwfMhyxt0YDh2BS9fLO5cWzXjV/s
	UkPNtL5vaVHVhIomUMUcdqXZgyxwALzt37smESBmZC8oE2feN3J8yDZAcXWR7gTiU/Ur
	h5TdW5g7R0csXdW35/4gUZGeixMwYc3/xWa1HMotZvdILd2/+zpG4LIHQy0Y/IBO7QBq
	A3999zyzlgjW/NtDTfTSuW/sC4EX76We3ooxoLkTgZz16tTaEgzt+d63esRNgOqakX1O
	d7lgxQWYov/GSOhLYcaC+FDlgGFSiK7pulpRl3hIJaVwG9CWkZhsupTlSfYlwCZL/TiD
	mWyg==
X-Gm-Message-State: APjAAAXz+6/c41XcgSH36V+lAK2ifQ/qpjLn9bam1IWL2mwJgzeNLAYY
	cIaxjDvBto3xj3FOOv50T6lEQjcBKVZO0/cGiyU=
X-Google-Smtp-Source: APXvYqwviTTvYlcf7hLQiYYWFbwOawSfNMn4KBCPOPxfdJvA1Yp+grIyBXtN05BqrfFPq2TZlJRBRAaX/9syD/ezDgE=
X-Received: by 2002:aed:3a09:: with SMTP id n9mr1395803qte.196.1552628601398; 
	Thu, 14 Mar 2019 22:43:21 -0700 (PDT)
MIME-Version: 1.0
References: <1552499826-26884-1-git-send-email-mark.asselstine@windriver.com>
	<1552499826-26884-2-git-send-email-mark.asselstine@windriver.com>
	<CAJ86T=U2oLy-10Y-OGVHC5r8bzEQBh_M1mAaZNK5SznQcLJqSQ@mail.gmail.com>
	<1756056.MITzs3jtI9@yow-masselst-lx1>
In-Reply-To: <1756056.MITzs3jtI9@yow-masselst-lx1>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Mar 2019 22:42:55 -0700
Message-ID: <CAMKF1sox3QV+OzT9kKmrpF7pt-fa4yBGUhCeAkBXdAY8a8AKFg@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] goarch.bbclass: set TARGET_GOARM as '7' for cortexa7
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
X-List-Received-Date: Fri, 15 Mar 2019 05:43:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 13, 2019 at 1:04 PM Mark Asselstine
<mark.asselstine@windriver.com> wrote:
>
> On Wednesday, March 13, 2019 3:56:10 PM EDT Andre McCurdy wrote:
> > On Wed, Mar 13, 2019 at 10:57 AM Mark Asselstine
> >
> > <mark.asselstine@windriver.com> wrote:
> > > The cortexa7 tunings use 'cortexa7' in their tunings and do not
> > > include 'arm7' so we need to look for both when setting TARGET_GOARM.
> >
> > Is cortexa7 a special case? Or will the same issue be there for
> > cortexa5, cortexa9, cortexa15, etc?
>
> Damn, was too fucused on the 1/2 patch of this RR I had my blinders on. Yes I
> should be looking for cortexa* as I believe they all fall in to the "7"

keep in mind we might have cortex-a53 etc which are v8

> bucket. I will redo this and after we sort out 1/2 I will send a v2.
>
> MarkA
>
> >
> > > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > > ---
> > >
> > >  meta/classes/goarch.bbclass | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
> > > index 39fea5e..077c967 100644
> > > --- a/meta/classes/goarch.bbclass
> > > +++ b/meta/classes/goarch.bbclass
> > >
> > > @@ -74,7 +74,7 @@ def go_map_arch(a, d):
> > >  def go_map_arm(a, f, d):
> > >      import re
> > >
> > >      if re.match('arm.*', a):
> > > -        if 'armv7' in f:
> > >
> > > +        if 'armv7' or 'cortexa7' in f:
> > >              return '7'
> > >
> > >          elif 'armv6' in f:
> > >              return '6'
> > >
> > > --
> > > 2.7.4
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

