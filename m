Return-Path: <jpewhacker@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id AF71A7CE26
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 02:53:18 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id p13so4579597wru.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 19:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wxCPTbaZeth1YtKwNTIGFuU+0px/HD5hv04ZBTtQSSo=;
	b=Z92SOlJjakAn5nCOnW+r7rYfhoU6RHtASsgXwufj3Mevg2Q6w1z2WqLbgvdmlHczmc
	pfnbKyhcPyTdqJPU8M5ruk3Tsb7spQqborf5v8jvwodvpZhR+/XV6gWj+8+A8focTC1G
	BfScGOUme6CwSwnJLLmRnYjoS9liWfRpEMNCmPEDFa4Xmi7CmQ9UeHDTjDmbll3hQrm0
	OSAtjTBTzoZ374thDp3J+pz3GBRwFIhDiAuiP9SdLyH2p1JQxNqwAfu8Kt7CeUCxmgxa
	q6UOW1NOiQezaqQvW2IBsFetsRFMUbGFnQm3Ko59nRsDYWTbXFHCau9TZW7WenhIVrsq
	jGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wxCPTbaZeth1YtKwNTIGFuU+0px/HD5hv04ZBTtQSSo=;
	b=uLI1BLz5evDH3prqIDs8wKP0JSZ/mfb7zwnU7k9KTraOQjrNkujL/8ObkOUTkI9yYJ
	St2d/wr9sEtVkSe4AhzirCIeCejFumlqdZ+q7z9Hox6BfJHVwhSKeUFFeJL5zoL+P1XO
	oezKoSMT+zW/wmWe/FmaROVoGyzuWkepZ6zmwoO44a45JcqJds2nkD31Ui5nj5k7ThDX
	IX0o88HFlWS9OqxH2ElUDJaq6AX3xweSwlGkCrUvugvUSlcbmECYb8zIfXfKizWZS1UK
	6QrHcW0+4yo0ESFcDeUnb6AnRaVi0X9McAD4oOk/avR3hjib+q3slHNnWPnYzdnlkm9x
	LSWA==
X-Gm-Message-State: APjAAAXHTq+AM5cViFxyVdby1eVzE5twWbDyIgHmUPM95Xfap5sFvZsG
	CaSIMiE2RfPk9BTHNrNuqIZrwtb3BW/TDhSNQkU=
X-Google-Smtp-Source: APXvYqyNAls8940vrLy0T/hbMj4sZBUOEgQC6nlCinjTxPlJLCP9TvVEc5PCwFjs2TW8HsdELQPLTbS5MA+WEPPCls4=
X-Received: by 2002:adf:f544:: with SMTP id j4mr5725225wrp.150.1561690399382; 
	Thu, 27 Jun 2019 19:53:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190627135359.15689-1-JPEWhacker@gmail.com>
	<CAJTo0LZkb4kEXm91+Zghy8PWParVTBvDQRZqmbVK-ATK4GfMUA@mail.gmail.com>
In-Reply-To: <CAJTo0LZkb4kEXm91+Zghy8PWParVTBvDQRZqmbVK-ATK4GfMUA@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 27 Jun 2019 21:53:08 -0500
Message-ID: <CAJdd5GYcyqpVoR6L1YzCjr=LvtE84jMbAogJ2+pks7d72ShY1w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] opkg-util: Fix documentation DEPENDS
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
X-List-Received-Date: Fri, 28 Jun 2019 02:53:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 27, 2019 at 11:24 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> Actually looked at this.  The makefile is using pod2man, which is in
> HOSTTOOLS, so how is this a problem?

OK, sorry the commit message here is misleading. I went back and
rebuilt to try and remember, and the problem is not that the
documentation isn't generated, its that pod2man coming from the host
tools might not match the one from perl-native, which makes the build
non-deterministic (that is, it appears that the first time opkg-utils
gets built it will get pod2man from HOSTTOOLS, but subsequent rebuilds
might get it from perl-native, depending on what has changed).

Even so, there might be a bigger issue with having pod2man in
HOSTTOOLS and having reproducible builds; If our end goal is
reproducible builds across different hosts, some of the HOSTTOOLS are
going to be problematic since they could vary between hosts. I'm not
currently attempting cross host reproducibility, but in some regard it
might be inevitable if any part of the build is restored from an
sstate object built by another host.

I suppose the easy answer there is "Your OE build is only as
reproducible as your build host.... and all the hosts that contribute
to sstate", but that's a little sad because it probably means you'll
only have reproducible builds if you disable sstate.

>
> Ross
>
> On Thu, 27 Jun 2019 at 14:54, Joshua Watt <jpewhacker@gmail.com> wrote:
> >
> > opkg-utils requires perl to generate documentation in do_compile. If not
> > present, the documentation will be skipped, which is not reproducible.
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  meta/recipes-devtools/opkg-utils/opkg-utils_0.4.1.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.1.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.1.bb
> > index 4be7b16d8a2..2f1bf0d21ba 100644
> > --- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.1.bb
> > +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.1.bb
> > @@ -12,6 +12,8 @@ SRC_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/${BPN}/snapshot/${BPN}-${PV
> >  "
> >  UPSTREAM_CHECK_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/refs/"
> >
> > +# Perl is required to generate documentation
> > +DEPENDS_class-target = "perl-native"
> >
> >  SRC_URI[md5sum] = "8c140f835b694a0c27cfb23d2426a02b"
> >  SRC_URI[sha256sum] = "9ea9efdd9fe13661ad251e3a2860c1c93045adcfaa6659c3e86d9748ecda3b6e"
> > --
> > 2.21.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

