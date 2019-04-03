Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
	[209.85.166.45])
	by mail.openembedded.org (Postfix) with ESMTP id 6C4A26BCDC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 10:55:18 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id x7so1618742ioh.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2019 03:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DAuXZfiQgy6r9ITUUYs0Jsvh9anKfCrLoEPVWMN32Ck=;
	b=HLr12530/iP75JyyZtnGEaRrLxphUR6fmR+dTFJYY/jhK8rE9FPuVhGqW+x/YL4sKN
	OLyl0RMkmORWwIwgYOKPx5fYXMMs0FzP0wna/G3W/Rng9ebYH4Lb/7Llh8FTi+hOpiLe
	sUtMd/b5aWKbrd47E/FZiOKQmqbIf7z4l6Nx51bDfLNnqR0IriXZCGM08vxjGlQWWDpz
	Sw6CkcSFKITWySenb86CEf+QjMTYmu2WKS2hm4cg5QQY36Rk++oTYrDLXK0ryA6nf92I
	n/ShgId6Pncr+yKGwlVC+u5D3l5+dBk4BnykmtGvSTduY7aU1H3FFIubMChrlNIksUcG
	Ctuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DAuXZfiQgy6r9ITUUYs0Jsvh9anKfCrLoEPVWMN32Ck=;
	b=Ht2YZJnEm3NLZNOFtwlLe4/ZRWQPq55lNmRSFPBWPAgGBgoU+D6IotKjP0F417R187
	aQAUsG04wx8neCcqw7RwlQ+5gZbHi9JXIRZxGZ1uaX0qA0hHxNIBdmCpVMCZ9hq1IDew
	dErJVSQjWosqTNjhn/R3m4c6yd0agDBBw8UGRPYjhx+lXMDaJOzfn6jwCUvl6NGGFN54
	9rXcmxt2qNnprz8Tdn+elmmrXNof5nwIQjxtL0p3Pn4zKPUEXl9rH/uoXGkGlUbFaNPW
	OEPfGQwMsUDL46eIPR3CEeLolT5NPyQb7ccEiq4KxVRRXo5uCtddHoAzUmL8fpbPNoAB
	Mr9Q==
X-Gm-Message-State: APjAAAUHzZJsPMg+KkGC4qoHABu8K+1Hyz7JzQBMP6kqM1zJqksyYadT
	oefRybwTdMV7Zk7IuMYOFU0H86vQtD74Y8N1cUY=
X-Google-Smtp-Source: APXvYqyqjhZ59iDH+I3S9u0nDFIxvtPEx7xVLzBFZikXsgYX+coBIo5lN2PFFYdBu+BlXEJ3d8kGKMJHoR6gJ6YFE0k=
X-Received: by 2002:a6b:e50d:: with SMTP id y13mr1623442ioc.142.1554288919328; 
	Wed, 03 Apr 2019 03:55:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190401160106.22928-1-schnitzeltony@gmail.com>
	<CANNYZj80ZqNn_6i9_Z0_HYJErcKrymQZmpiVGn_B56Jw3c7acw@mail.gmail.com>
	<CANNYZj8cJV07jb5k=KxyLpfyR3WTt=EDDe4gVPUaQDc1O=y-Ww@mail.gmail.com>
In-Reply-To: <CANNYZj8cJV07jb5k=KxyLpfyR3WTt=EDDe4gVPUaQDc1O=y-Ww@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 3 Apr 2019 12:55:03 +0200
Message-ID: <CALbNGRSnNrNdTiM3rUGq5nXZ-G96B=AfXk2fXS2Ysz0Zj4n5Pw@mail.gmail.com>
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
X-List-Received-Date: Wed, 03 Apr 2019 10:55:18 -0000
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
Some intermediate info:

* adjusted gobject-introspection.bbclass to make flags (true/false or
yes/no ...) overridable and removed configure option whitelisting
* changed the recipes above
* update glib-networking to get gnutls option back

With test builds I get:
* gstreamer1.0-plugins-good complains for unrecognised
'enable-introspection' and 'disable-introspection'. This is odd for
two reasons: Both options enable/disable? gstreamer1.0-plugins-good
complains but has introspection.m4 what is the problem?
* Some recipes in meta-gnome complain for unrecognised options now

To be continued...

Andreas

