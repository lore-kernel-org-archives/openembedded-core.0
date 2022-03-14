Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <76692ee072570c7187bacc8751343475baba74b6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] meson.bbclass: add exe_wrapper helper
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Mon, 14 Mar 2022 23:23:56 +0000
In-Reply-To: <CANPvuRkcqN9XiQRmO=tYh4B_XFgecwU4SQvotOTaAvA+9DzLVg@mail.gmail.com>
References: <20220312154011.499012-1-quaresma.jose@gmail.com>
	 <c2bf5b0dc76b78ce72d54b8d0a7bee40c0512f4f.camel@linuxfoundation.org>
	 <CANPvuRkcqN9XiQRmO=tYh4B_XFgecwU4SQvotOTaAvA+9DzLVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>

On Mon, 2022-03-14 at 23:14 +0000, Jose Quaresma wrote:
> 
> 
> Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia sábado,
> 12/03/2022 à(s) 17:11:
> > On Sat, 2022-03-12 at 15:40 +0000, Jose Quaresma wrote:
> > > 
> > > +do_write_config:class-target[vardeps] += "MESON_QEMU_WRAPPER_HELPER"
> > 
> > You can't use overrides with flags like that, I'm surprised that even
> > parses!
> > 
> 
> 
> I will drop this line because my intention is to rerun the do_write_config
> when
> the content of the file changes, which is not possible at all.
> 
> I will take the opportunity to ask if the following would work?
> do_write_config[vardeps]:class-target += "MESON_QEMU_WRAPPER_HELPER"

No, that won't work either.

Cheers,

Richard

