Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f170.google.com (mail-it1-f170.google.com
	[209.85.166.170])
	by mail.openembedded.org (Postfix) with ESMTP id 10D8B7D031
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 16:36:40 +0000 (UTC)
Received: by mail-it1-f170.google.com with SMTP id w15so110932itc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 09:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+IFnbx78xjmbE7E4VAicguf/3gqS30fEgQDlagqbdm0=;
	b=Y0tPeLeMQWz0sPTD/RqQcZm9bdJQIb3Np7tGq+RJfWdbeg8O3I3lZbiwwCtTNm5xfb
	EhxbY/lEgYvuPtwvEQ2cCrHMY0cYKmPM7csSFv2DcRtf8suhYkQ1TWg5tKObB2FRSlnx
	j/xfzGcPXChPj4aVUTKlAiRcE0TsU6+ENk64aUrKBEFPueTFz1FO0l5eMJ1q0Zq7sFTS
	vVejLWNHTmUV884XQL4R3c+KPnOG366/oQSpJUGe2uu+aY96UBiYs5l0kpN5V/L+wgA2
	SDs8M00flB31Gxmla+KVsyCEr4s/GPRRgDm7q+GHgINIsjQuJ1zywMqCAnQ2jiYTRVh+
	QRtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+IFnbx78xjmbE7E4VAicguf/3gqS30fEgQDlagqbdm0=;
	b=jj0gw0zcTF/zLCHoDAbTEbQECEkggScpYm3yYrRWPZ2m3LEg0VqXDYffcvehEzwMCf
	d5dEl+FEtbh0rTEMDufnvyGH97zPjmu90tObU/uquEE3ukPVHaElkyGFlHJ/YHkF7JKy
	pTsGROLHo1kUy+EJdk9qUB3WEAaUI0tZna1fvjdSg8QFBOYfuEqxE2KtQ2uVX6gKXLzX
	kg+wvsGIXvCGeEPSj2Y6+O5VPFuiWu7H0kc32JOG8i2Z5wyqAxdv6W7AphEj/dFjORXW
	B4YlQ7B0z9KhuF/KBlQ1GQmKfUxnki4k1h8QjfSodzSRu0gBmwPaeG08nmFEXEpbVXmL
	HtSg==
X-Gm-Message-State: APjAAAXKfKXxwVsIucnBSTE+SVv0fAZy6ftcfe/7KG7CL/fS8Tep7GJF
	uZgscImev50q9Q7q5IpG/KvmxmrbzpSBHVV/5r8=
X-Google-Smtp-Source: APXvYqz435HNnwaaiHLjFNa2fbSxGkF7GiTrcEJWUpNWle29t6Ds5kIr3QNBciZ9bgjmF1qcRc4+EyvMZyW4gjDco9g=
X-Received: by 2002:a24:fc06:: with SMTP id b6mr260791ith.130.1554136602164;
	Mon, 01 Apr 2019 09:36:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190401160106.22928-1-schnitzeltony@gmail.com>
	<CANNYZj80ZqNn_6i9_Z0_HYJErcKrymQZmpiVGn_B56Jw3c7acw@mail.gmail.com>
	<CANNYZj8cJV07jb5k=KxyLpfyR3WTt=EDDe4gVPUaQDc1O=y-Ww@mail.gmail.com>
In-Reply-To: <CANNYZj8cJV07jb5k=KxyLpfyR3WTt=EDDe4gVPUaQDc1O=y-Ww@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 1 Apr 2019 18:36:30 +0200
Message-ID: <CALbNGRRT_5wAHtD4Nr3BtNysc1k3Sg=Nm67ObO6qx=JS4JLvGQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2 V2] gobject-introspection: auto-enable/-disable gobject-introspection for meson
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
X-List-Received-Date: Mon, 01 Apr 2019 16:36:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 1, 2019 at 6:21 PM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Mon, 1 Apr 2019 at 18:10, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> > Thanks, may I also ask that you go over the recipes in oe-core that
> > inherit meson, and tweak them to use this option? (there is not a lot,
> > and some don't use g-i at all).
>
> The exact list is:
>
> at-spi2-core
> libsoup-2.4
> gdk-pixbuf
> libmodulemd
> atk
> pango
> libdazzle
> json-glib
> clutter-gtk-1.0.inc
>
> Alex

Thanks :)

I cannot promise when but will take care because I consider it an enhancement.

Problem is that I am sitting on growing loads of meta-gnome patches
and they need review for this either.

As collector of DEs I'd love to see gnome again - that should have
been next step in [1]

[1] https://github.com/schnitzeltony/meta-openembedded/tree/work-2019-03

Andreas

