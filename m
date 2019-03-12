Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id AFB7E7C118
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2019 19:43:12 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id e81so2377109vsd.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2019 12:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yczsOCqvGfhz3M/4UUhdWCJNgqQZysEm/DWNSBcn//U=;
	b=Eav8LN/kKMLeMo9ofVlk0+5gNbpuyXBwJdNM0ziLA2N05kEtkFm27SF9SojWpDJecD
	41qc7lXYd1v2ePBbMqMUY//o/HrHHf5fgzuPO15k1+sTn5ErQU/l/WKemu7RHj+tjYKE
	CzuBiS1Brja6bZ7G4l9edRFhdB0NVExtiJsVvCLnFjXT9urwKuyk9GbELSw0zgzIuL6f
	cD1rxEox1dZ6e/R6SH1rDV0XXw5x7DzWphgBDcsrMP9usRGGg5ogydBvaqkriZfV9RPW
	Ij4KQsINPC1eOGUGKSJ0ghSZ7VM5elSYObqfZypNfdccZLNuHqvQIgAYlT02vVGBrC0u
	uckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yczsOCqvGfhz3M/4UUhdWCJNgqQZysEm/DWNSBcn//U=;
	b=m0OcqT+Tr9PUsPT2SEwDjw+Pb2d+/fzv2HBxS8neR1OlOp3WXl3fz2UNc5HRXrq9JW
	idt3QgmR+1OUZiFio97P5lFmlUNzzydt4f8RQiS2n5humRGH4QQN97Zs8Z8Vw95+BNmP
	k6tjn0dN1FK9LdefcYvdNxsFPT4PPzoQS1pC1/GJ60di4WvBAob7p0wBsm03eDP/wUEy
	vWJ7AgQw3ChScKyOYQ3KGnh0Mf8WYZvdBb73NAshMTDlprlbvAhzuwxjxJ2oKvGeKZLx
	qTV/j5PVJbsNdX3Xa5vN1QIsMh6iPdq8ZIx2xMfe6uUWDt33p6iCpLziiWkjNU+jBn4Q
	CLbQ==
X-Gm-Message-State: APjAAAUnEAhoDQ/dDbI7tyIpxi/rdZd9JaWnKySE6ypFjDvi+vgnNvFq
	69QnnF3oyfWNkJnnicWH1QWmxDg9J675TNzAToI=
X-Google-Smtp-Source: APXvYqxxcUCtBwZtHTT6c7hEZLcZ2wR9JVGAeOB7ygbxFYlJJBgHHtZUb7gdZkBYI2wx8w8KKRpj8nNKunlDnE3eYhY=
X-Received: by 2002:a67:c301:: with SMTP id r1mr20500789vsj.137.1552419793377; 
	Tue, 12 Mar 2019 12:43:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190312012245.25551-1-kai.kang@windriver.com>
	<CAJTo0LbfKpABuhzzEdfpYQ_UEHSV7cV4ffMQeUj6ZhtFZu-hmw@mail.gmail.com>
In-Reply-To: <CAJTo0LbfKpABuhzzEdfpYQ_UEHSV7cV4ffMQeUj6ZhtFZu-hmw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 12 Mar 2019 12:43:01 -0700
Message-ID: <CAJ86T=VCYyEbqy0NKNCifZSLFtZ2jpi0Te1LoX0ENHWGxOHn_Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] virglrenderer: requires distro feature opengl
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
X-List-Received-Date: Tue, 12 Mar 2019 19:43:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 12, 2019 at 3:34 AM Burton, Ross <ross.burton@intel.com> wrote:
> On Tue, 12 Mar 2019 at 01:23, <kai.kang@windriver.com> wrote:
> > +REQUIRED_DISTRO_FEATURES = "opengl"
> > +REQUIRED_DISTRO_FEATURES_class-native = ""
> > +REQUIRED_DISTRO_FEATURES_class-nativesdk = ""
>
> I suspect you can drop the native/nativesdk overrides here, as
> DISTRO_FEATURES is overridden in those builds.

If so then some potential clean-up opportunities elsewhere:

  meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb:REQUIRED_DISTRO_FEATURES_class-native
= ""
  meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb:REQUIRED_DISTRO_FEATURES_class-nativesdk
= ""
  meta/recipes-graphics/xorg-lib/libxcb_1.13.1.bb:REQUIRED_DISTRO_FEATURES_class-native
= ""
  meta/recipes-graphics/xorg-lib/xorg-lib-common.inc:REQUIRED_DISTRO_FEATURES_class-native
= ""

