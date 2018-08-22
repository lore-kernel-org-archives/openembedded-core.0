Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 12D087929E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:00:54 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id y139-v6so1938102wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 06:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=VgO/J9eLgw/IMgim0nO4rUBaZstLaUlvT1X+mhmqCLU=;
	b=W6lpChWAF7xesjmVQgYEMEkBNqndyeSxecTBK9zRZRvoWPvRJxETrHD15xg/LVaIQK
	u5tW2QdU8V6q0YLioqgKM464A/+hRiZ5yz6dbL+GvDe5ORrC2RjEXSznL4PPIuNgfNn1
	BQS2AmqhFL+eyl3f+vSMQ+ZAmb1nVdIXn1XBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VgO/J9eLgw/IMgim0nO4rUBaZstLaUlvT1X+mhmqCLU=;
	b=V7lk+nAVpdw8r66CUcE0L8BxuS7j3kWeUC6wjPHMWx4OgwLIMqjv1g0Rrz1GYZITOg
	G5dUyzQtjQtmNLitIxxCVDGKWDwRjmNhhDAM/91dnJLJ6IoOnSvGbR9spwZu8V1R4l5E
	vCcfBn6aojCEL+QDEtKH+h3J1jbr/vHP3eeuM9Y17KjhawMWxYiwBr7peaMK6QaOldK4
	VX13fae+IVc5ZOdOkhF8wAjzY3/BcUzY/Yc8N8AeE+ZVnslIvwREb3fGP6k3Z4Si8KmT
	O7VT8wfM+IJh3e5knBPjnpTlF4gmQ8S1B0gV34b6uTs3hTFMgYTz1bExvMLboCqPUL73
	mmLw==
X-Gm-Message-State: APzg51AgDXxHNv72AO7UXDUbIwy9iSBPyKJvCztpE0rAqpx1cLSFvrCB
	iqho6D+7oviCm7xVXvjDtfV5gw==
X-Google-Smtp-Source: ANB0VdYTobx05T3C0Rldzgc7cyxBRZFiDDUTkEDn2bV+YL/fvHv+RLQcP9+JLg2lkb37FqolxJahoA==
X-Received: by 2002:a1c:e189:: with SMTP id
	y131-v6mr2313379wmg.44.1534942855715; 
	Wed, 22 Aug 2018 06:00:55 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b144-v6sm2623855wmd.23.2018.08.22.06.00.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 Aug 2018 06:00:54 -0700 (PDT)
Message-ID: <83a93f3542ad88b01b073b7875839dd2e2c1bf44.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 22 Aug 2018 14:00:47 +0100
In-Reply-To: <CAPybu_3tUu0LKA1gdSj-MFYfhxiHz62wXrP2ivETSMNiWdWyDg@mail.gmail.com>
References: <20180821145858.18459-1-ricardo.ribalda@gmail.com>
	<10e5ea973727e06604a83299fdd5a8d4cfa2633a.camel@linuxfoundation.org>
	<CAPybu_3tUu0LKA1gdSj-MFYfhxiHz62wXrP2ivETSMNiWdWyDg@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: Fix ldd bug: not a dynamic executable error
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
X-List-Received-Date: Wed, 22 Aug 2018 13:00:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-08-22 at 14:48 +0200, Ricardo Ribalda Delgado wrote:
> On Wed, Aug 22, 2018 at 2:45 PM <richard.purdie@linuxfoundation.org>
> wrote:
> > 
> > On Tue, 2018-08-21 at 16:58 +0200, Ricardo Ribalda Delgado wrote:
> > > RTLDLIST table does not include /lib/ld-linux-x86-64.so.2,
> > > resulting
> > > on the following error:
> > > 
> > > root@qt5122:~# ldd ./qtec_webcam
> > > not a dynamic executable
> > > 
> > > Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com
> > > >
> > > ---
> > >  .../glibc/glibc/0031-ldd-rewrite.patch        | 22
> > > +++++++++++++++++++
> > >  meta/recipes-core/glibc/glibc_2.28.bb         |  1 +
> > >  2 files changed, 23 insertions(+)
> > >  create mode 100644 meta/recipes-core/glibc/glibc/0031-ldd-
> > > rewrite.patch
> > 
> > I'm a bit confused as with MACHINE=qemux86-64, building core-image-
> > sato
> > with ldd added to IMAGE_INSTALL, ldd works correctly even though it
> > has
> > /lib/ld-linux-x86-64.so.2 (which is listed in RTLDLIST).
> > 
> > We have an automated QA test checking this too:
> > 
> > http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/lib/oeqa/runtim
> > e/cases/ldd.py
> > 
> > Which version of the project are you using? How would we reproduce
> > the
> > issue?
> 
> I am using yocto-sumo

I'm not aware of any fixes since sumo in this area...

> Maybe your tests are run agains an image that has the package lsb
> installed. Which creates symbolic links to the standard locations

There is no /lib64 in the image and I'm not using or installing lsb...

There is significant rewriting done as part of:

http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/recipes-core/glibc/glibc-ld.inc

What value of RTLDLIST is your build showing?

Cheers,

Richard


