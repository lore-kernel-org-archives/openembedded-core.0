Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
	[209.85.222.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2B5F77C31B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 19:48:08 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id d19so234304uaq.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 11:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iueksH5uXMaHeecObwSKHOqVCrkq4TAN4PCJEsK6fQ0=;
	b=e7Mb3ym1loxLUveVx37hy0AOpV1pYQRcjMtyowu/i+cUo61YttVbz6HAZNO2V2U/dV
	h4+ELunk00Sm8rV031RjMBqjPouHWZcYg1Sxyc7X39JDWN3JFqqiy0SqcCwNarFfY0Wc
	WSd5dQQiaYCjv07xn08ZljJo2reJrjyzZBV00lHqiGmno3lfAz/oK0B/6ffz+Y2hyl5B
	cs4yu/q+0bO1keDt4n6bJRgg1pkMIkDN2v+s4q/h6MIig2st19D/YmwOlhgx7JZtZXBo
	BO4ZHNny7o3xY/3VG3kq726YO0JIeXimP7BAzUmq1IV5mi5T1o4mI0h72D2k8xmv04nS
	ZIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iueksH5uXMaHeecObwSKHOqVCrkq4TAN4PCJEsK6fQ0=;
	b=CqsoMP7hm65qXs9bS2E36z5I8PeCO/iuvuTsoa+yOPXm+8iydBpk9bdQTpsLKJV21P
	JzFDYkUws3royj7eCgG1ZNeA3CEWO+M2QJFqAVidF6k5VObjjJU34bOOf4YIXDr6z3hL
	EoP8HroKdPrTrS3e58UZt9zq9Vvlmn6JY7fqOjVr/UwhBFG8RYVWR1Sv8Dc9QCk2xVo7
	LKBWRvuhP60xPN+m+oRg1sEOqvkEjz3qgHnHMVfkl8wGMIo7kG0UyCuYRLBhHhJruEZI
	xvC3kNmbr7eAXOJsx1Jzz1xJZ7wCZ1dNnzDaz7HuViOwFxHog+R/wHaAYVKiU0lI05sf
	NLMA==
X-Gm-Message-State: AJcUukeYgJsNSFt42w6BQcsp+NHbO6GSUqyyL38fzsmI6kI2d3iuO1DZ
	FGdjC2lPBRMJt7W/q/oydH1fleWxzKcOdJcK9Fw=
X-Google-Smtp-Source: ALg8bN5oFn8jYmoKT101Q3nXCJcV8RoqxDdsbJsWUkhN6zds/S8LSqpsbXFfqMUizfwOj53exJN2euMcR4gjhU6bOFA=
X-Received: by 2002:a9f:3f41:: with SMTP id i1mr12193191uaj.42.1548877688869; 
	Wed, 30 Jan 2019 11:48:08 -0800 (PST)
MIME-Version: 1.0
References: <20190130093406.10391-1-bunk@stusta.de>
	<CAMKF1soqAE8aco2OAHiQgfpV_5_OccnH=piXBtVii3f6TVwXGg@mail.gmail.com>
In-Reply-To: <CAMKF1soqAE8aco2OAHiQgfpV_5_OccnH=piXBtVii3f6TVwXGg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 30 Jan 2019 11:47:56 -0800
Message-ID: <CAJ86T=XUqY8+ZAgRpXfd=OXULoOvMb57we6R2Df_b8N7q2csCA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: add devmem
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
X-List-Received-Date: Wed, 30 Jan 2019 19:48:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 30, 2019 at 8:50 AM Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Jan 30, 2019 at 1:34 AM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > This is a tiny but pretty useful tool.
>
> question is, do we need this enabled in default config, or could be add it via
> some DISTRO_FEATURE meant for validation etc. May be if you explain your
> usecase then we might be able to make a better assessment.

It's not just a validation tool. I've seen production code which sets
up GPIOs etc using calls to devmem from an init script.

Of course it's not needed by everyone, but it's a useful tool for some
and it's so small it doesn't really deserve it's own conditional logic
in the recipe.

> > Signed-off-by: Adrian Bunk <bunk@stusta.de>> > ---
> >  meta/recipes-core/busybox/busybox/defconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
> > index d11707abc3..1519159a49 100644
> > --- a/meta/recipes-core/busybox/busybox/defconfig
> > +++ b/meta/recipes-core/busybox/busybox/defconfig
> > @@ -791,7 +791,7 @@ CONFIG_DC=y
> >  # CONFIG_DEVFSD_FG_NP is not set
> >  # CONFIG_DEVFSD_VERBOSE is not set
> >  # CONFIG_FEATURE_DEVFS is not set
> > -# CONFIG_DEVMEM is not set
> > +CONFIG_DEVMEM=y
> >  # CONFIG_EJECT is not set
> >  # CONFIG_FEATURE_EJECT_SCSI is not set
> >  # CONFIG_FBSPLASH is not set
> > --
> > 2.11.0

