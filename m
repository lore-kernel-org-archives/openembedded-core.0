Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 739336172D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2020 21:17:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48Q1PL3H6qz3l;
	Sat, 22 Feb 2020 22:17:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582406247;
	bh=Cc+t5GQC/TZDWNFGuktOkC4h7Mc1tPU4uMm6P2IlFYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I2CwXWuw3uY7izsE86yezNn8/Q3Vx3Tfyd8nQyZ8Pv6r7DOVuf27E+kOxLcOBp2hp
	bM+A77Jg7JhojFp0y6HkGY5L3TsbD+GfQNKNMgrOfVkNkjrmPW3GrNLZ3oRmtlItrQ
	lftfdmsX42ZZXYS8WavpJuQhcPdCYkCPgN0KGvwpDOBqcWAmSTgjmP/L9PIrycdqG2
	fNNzh5eBrWfP3ivMbZEKE9a3EEycvQQkikarD5WX8vYCsYXEu7Dl0GZJnTZZob+ZaP
	r6P+v2mXZhNKX1dH4z0rn/jI8P2fuI486ckyReFkjiYRB+rTKtakHuWc+NyJGM0Coi
	hQFIsB1xdIwSs337BizK+9rn2aw6So0x0ircGV2yiFnN7b5Jb2ZZnUfIc9X1SIULYj
	Sb44DSmFyn3EdlPSGUhwXmYztbopyL/odE7G1T7UqgOD2IbrteHXTv0R+QnRRKy/V5
	joGJsO3202TANbV34VgCL6DGsQoq3xEgDVqKfNdUZ+PKpG4LbSdKF2BSseO2QvsZfU
	nPrqrHy0fAPsY4tdtPuhX4CqYS3VnMoPx5i9Dti8KE8eUracaXXQNSU4s8nAvIqaOm
	qIFXfmHdXqBKoB2AaPVJq41MYWG1u07kOsxKuHvz9WI1OHKOMyq0JpFgoI5ZaB0PUk
	1qQbE4X87IdRe1pH/Mpqs5l8=
Date: Sat, 22 Feb 2020 23:17:24 +0200
From: Adrian Bunk <bunk@stusta.de>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20200222211724.GC9628@localhost>
References: <alpine.LFD.2.21.2002221554210.9952@localhost.localdomain>
	<CANNYZj8EchSZ1vEPiOnx9n9X+osuikbL9hvYpnoykkPY+k66Og@mail.gmail.com>
	<alpine.LFD.2.21.2002221605550.10479@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.21.2002221605550.10479@localhost.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: can i totally ignore recipes not related to the current build?
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
X-List-Received-Date: Sat, 22 Feb 2020 21:17:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, Feb 22, 2020 at 04:07:56PM -0500, Robert P. J. Day wrote:
> On Sat, 22 Feb 2020, Alexander Kanavin wrote:
> 
> > BBMASK?
> 
>   BTW, that will work for me in this situation but is there a way to
> not have to enumerate all the recipes to ignore, and just say, "don't
> look at anything that is not related to building core-image-minimal?"
>...

How do you know without parsing that a recipe is not related?
Information like names of packages built or RPROVIDES are in
the recipes.

> rday

cu
Adrian

