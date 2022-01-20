Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <2fd0eb95185feb18e75c4570a4f71bb6188ee3f1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] security_flags.inc: don't default to PIE if image-prelink is enabled
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Thu, 20 Jan 2022 20:43:07 +0000
In-Reply-To: <CAFrQVPMvR0QnLan+=bdi0ZmgTpCxmz=-SZQxyTuEcm6=OTDmmw@mail.gmail.com>
References: <20220120033045.1098738-1-bkylerussell@gmail.com>
	 <CANNYZj9TtSZmzNJ8Jjsoa86WUEzKcBgMMEn2=OBrwyYj+dmxQg@mail.gmail.com>
	 <CAFrQVPMvR0QnLan+=bdi0ZmgTpCxmz=-SZQxyTuEcm6=OTDmmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: bkylerussell@gmail.com, Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>

On Thu, 2022-01-20 at 12:41 -0500, bkylerussell@gmail.com wrote:
> Yes, we do use prelink.  I think our use case primarily benefits from CoW
> memory savings, rather than load times.  Of course, GCCPIE can be overridden
> in the distro layer, but seeing as image-prelink.bbclass still exists
> upstream, the default definition should support configurations that choose to
> enable it.  

It would seem that glibc plan to remove prelink support in 2.36. If anyone wants
it to stick around they need to convince the glibc developers not to do that as
I don't think we'd be able to sustain it if it is removed there.

I'm seriously considering removing prelink from OE-Core before the LTS at this
point given the position glibc has and the lack of maintenance prelink clearly
has in OE :(.

Cheers,

Richard

