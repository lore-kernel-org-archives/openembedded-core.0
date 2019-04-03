Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id AB6DB7D35B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 20:48:15 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id n14so3900vsp.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2019 13:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4WWLz28l8qhKZU7l/kbhU+m+YApNBOZ7u5+YG4S1aFM=;
	b=knzjqBimPCIZlAIwMf+iCV0gpwqrR+VOVBd9gjE2DZrq9afRB1jzZbC5niunocwBEc
	9KIYM1G4DAwCperNfVBr6QcMDjJqJC3FTau3woZVvQ1i0+NeUkTS6dpERku7bpBAp8F0
	xGKEwA3QWIPXjyJ1i36Xlz0FdW0lO8AqPxt6EzuLcCCXhl0kM01rZ6peuo6SNLq3Jx+A
	shMUIeHZ4lWGoCLfkGzI6zc+RwlrB3PfNIWS5KO8aPj9Lj9YcY+Rl+KGhPfOWzuncJTR
	wsz6F6nJXq1fMRzRpoJv97HFQfADpBti67zN1GihK4iMe7fGEhl8DbAOnZBTcJeMYboU
	eR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4WWLz28l8qhKZU7l/kbhU+m+YApNBOZ7u5+YG4S1aFM=;
	b=ZMoyYsefpeur2H3NXC0wehC8Uc7PBr0DxuB77UkzpKKIxPcVi3482EiQQuVdwuA58z
	m34eCcjuPPrlbt+Uo7mXBJEfFWbbwDNuBkLBSxn55UdqgyofWsugiHJjm+ZdYlw2yjaC
	6SCsd1xQTM6QEMqXPIbXsbhkNQ7XQWkSGdYcpZPheMwbGt10JUydh5P3esmtcJj29htm
	QswU5MqQzN1wl71dDeyaVblIQW4Q6F2LDxHm/TV6zY+rQmNpuCZJeGrJxnFoCz4FQcxr
	95kmwoSlx2dCzjkbxLSTUP0b8fzeE8b/HQCJTm34XgaiUpXQhruGD3zt4oUeN+BTvP6E
	tu+w==
X-Gm-Message-State: APjAAAW81qjBKbMHh9h30jmrLG8RaX71OVTdxKpe2P3cX9UJNz78TyVQ
	3DyUi713+G2KExITWB/K8MiprGI7DZJs/Km2WHo=
X-Google-Smtp-Source: APXvYqzNzSL9tfwc5/mqtACAEp0aYDxYQE3wihBFQ5maFgkJEgPxuLi4gMGZJLuBlOqoJpJf6uE08dZwzNsuh8uTNCM=
X-Received: by 2002:a67:7c8f:: with SMTP id x137mr1791243vsc.62.1554324496301; 
	Wed, 03 Apr 2019 13:48:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1554233389.git.pkj@axis.com>
	<8694f4c6a289db1fe45c24bc1ee9139458e09521.camel@linuxfoundation.org>
	<20190403062249.GB1281@localhost>
	<CAJ86T=Wfp+1mrgWZCOG5VrhONADi08yZXd4Fm3L2Txb1euyUuA@mail.gmail.com>
	<20190403202448.GA7131@localhost>
In-Reply-To: <20190403202448.GA7131@localhost>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 3 Apr 2019 13:48:04 -0700
Message-ID: <CAJ86T=Xs2z7yTeF20NWT31KGGyzEtibxj3zJWKTBWUE_18btow@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6] Correct and improve the ARM tunings
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
X-List-Received-Date: Wed, 03 Apr 2019 20:48:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 3, 2019 at 1:24 PM Adrian Bunk <bunk@stusta.de> wrote:
> On Wed, Apr 03, 2019 at 12:29:29PM -0700, Andre McCurdy wrote:
> > On Tue, Apr 2, 2019 at 11:23 PM Adrian Bunk <bunk@stusta.de> wrote:
> > > On Tue, Apr 02, 2019 at 09:26:46PM +0100, Richard Purdie wrote:
> > > >...
> > > > "armv4t" is defined in the arm tune files to mean "add -march=armv4t"
> > > > which is the convention used throughout all the tune files.
> > > >...
> > >
> > > Unfortunately this is not true.
> > >
> > > OE has both armv7a and armv7at tunes.
> > >
> > > There is no armv7a without Thumb support,
> > > so no -march=armv7-at exists in gcc.
> > >
> > > Both armv7a and armv7at tunes pass the same march to gcc,
> > > but [1] is not true:
> > >   Default to using the Thumb-2 instruction set for armv7a and above.
> > >
> > > The hardware supports Thumb-2 in any case, the actual difference between
> > > the armv7a and armv7at OE tunes is whether OE tells the compiler to
> > > generate ARM or Thumb-2 code.
> > >
> > > OE has both armv6 and armv6t tunes.
> > >
> > > There is no armv6 without Thumb support
> > > so no -march=armv6t exists in gcc.
> > >
> > > Some v6 support only Thumb-1 and some v6 support also Thumb-2,
> > > so what gcc does have is an -march=armv6t2.
> > > But OE lacks tunes for that.
> > >
> > > For matching the gcc options it would be correct to remove all
> > > armv6t and armv7at tunes that have no coresponding gcc options,
> > > and add armv6t2 tunes.
> >
> > Aligning the tuning options exposed via the machine config files to
> > those supported by gcc seems like a worthy goal... but would be a big
> > upheaval at this point.
> >
> > Note that the problem isn't specific to ARM. There are similar issues
> > for x86, but there we seem happy to provide a very minimal abstraction
> > with no attempt to track gcc. e.g. "corei7" hasn't been a documented
> > -march option since gcc 4.8 and we (somewhat arbitrarily) map it to
> > -march=nehalem to hide that fact from end users.
> >
> > So the high level question seems to be: should DEFAULTTUNE even
> > attempt to provide a full featured mapping to the options provided by
> > gcc? Are we happy to expose a limited subset without a 1:1 mapping for
> > the options we do expose (current ARM approach) or is it better for
> > DEFAULTTUNE to hide away all the complexity of the options provided by
> > gcc (current x86 approach).
>
> The current 32bit ARM[1] approach seems to be an attempt
> of a 1:1 mapping.
>
> For ARMv8 it is already obvious that DEFAULTTUNE is not long-term
> maintainable, and duplicating all the gcc rules regarding feature
> flags[2] also sounds like a pointless exercise.
>
> What are actually the benefits of DEFAULTTUNE with all the tune files,
> compared to just let the user provide a string that is passed to -march?

Restricting the user to a certain set of DEFAULTTUNE options means
there will always be a valid mapping from DEFAULTTUNE to
PACKAGE_EXTRA_ARCHS.

If we let the user pass an arbitrary string to -march then we lose the
ability to determine that (for example) it's safe for a
"armv7athf-vfpv3" machine to pull from a "armv7athf-vfpv3d16" package
feed.

Whether or not anyone in the real world actually maintains a generic
package feed and pulls from it from multiple machine specific builds
(verses setting up separate package feeds for each DEFAULTTUNE they
care about) would be an interesting question...

> cu
> Adrian
>
> [1] ARM <= v7, not the differing 32bit ABI of ARMv8
> [2] example:
> 'fp16fml'
>      Enable FP16 fmla extension.  This also enables FP16 extensions and
>      floating-point instructions.  This option is enabled by default for
>      '-march=armv8.4-a'.  Use of this option with architectures prior to
>      Armv8.2-A is not supported.
>
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>

