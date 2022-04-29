Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <58c8fae2950790db746d5059a7f0ecd9993fed81.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] go: Always pass interpreter to linker
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Fri, 29 Apr 2022 13:45:23 +0100
In-Reply-To: <c01611bd-8a0b-b91c-ff8a-bae9b877d1ee@jv-coder.de>
References: <20220411123520.95107-1-lkml@jv-coder.de>
	 <CANPvuRnKqQaanAZMVWym8K+t3sBm_noNNoCH=kV37RWtb8ncqw@mail.gmail.com>
	 <CAMKF1sq2zZigpSpX5AzgTY+7Q0JR1q2pWDOgcioTPeQ6F52nkg@mail.gmail.com>
	 <c01611bd-8a0b-b91c-ff8a-bae9b877d1ee@jv-coder.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: J?rg Vehlow <lkml@jv-coder.de>, Khem Raj <raj.khem@gmail.com>, Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Joerg Vehlow <joerg.vehlow@aox.de>

On Thu, 2022-04-14 at 07:24 +0200, J?rg Vehlow wrote:
> Hi,
> 
> Am 4/11/2022 um 6:04 PM schrieb Khem Raj:
> > On Mon, Apr 11, 2022 at 6:30 AM Jose Quaresma <quaresma.jose@gmail.com> wrote:
> > > 
> > > 
> > > 
> > > J?rg Vehlow <lkml@jv-coder.de> escreveu no dia segunda, 11/04/2022 à(s) 13:35:
> > > > 
> > > > From: Joerg Vehlow <joerg.vehlow@aox.de>
> > > > 
> > > > When gos internal linker is used, it uses hardcoded paths to the
> > > > interpreter (dynamic linker). For x86_64 this hardcoded path is
> > > > /lib64/ld-linux-x86-64.so.2, but yocto's default dynamic linker path
> > > > is /lib64/ld-linux-x86-64.so.2.
> > > 
> > > 
> > > Is this correct? The first path is the seme one of the second.
> > 
> > its a typo, Sadly we do differ in baselib naming convention on x86_64
> > ( without multilib )
> > compared to other distributions which are inherently multilib and use
> > /lib64 OE instead uses
> > /lib when multilib is not enabled but lib64/ when multilib is enabled.
> 
> Any comment on the content of the patch or do I have to send a v2 with a
> fixed commit message?

It merged:

https://git.yoctoproject.org/poky/commit/?id=460012e04a89e0b84fd5949c9a2229ef46e7a341

Cheers,

Richard

