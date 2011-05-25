Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QPH8Q-0006zL-IV
	for openembedded-core@lists.openembedded.org;
	Wed, 25 May 2011 18:40:38 +0200
Received: by ewy5 with SMTP id 5so2466999ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2011 09:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vI3Kzp+ThoJj+FUmtu+JGnLk0rHJdEvy4dJS2Xr45dY=;
	b=VkYLSbtG1EgHY+CPfNpv1JSAJXYXayhnGJnH7YIdt1T1dkNPheEqzCR5rCZTSepItL
	ctDZDB1aozXrNoc6Z76vCghO1+V2R7QIDCyX8YpvK6FV0eI/GtT5ZbwGBXt8e3QxBqou
	jvhamuqaG/Zt3Xx0ch5tOwpEGOo9milmlL6AY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=sENaqawTd5mS0MU4Lpc8p8IldX/spuJEmSu4M3JxfRxUzZh8gAZwF43bxvMG0I2d1R
	2m/sXG/CdLEEpqKNy6XOWmW0h5SMmEOXGgISnW2yayyhQXb9kdn104Q89cb82VtkpkjP
	bfunbcjtb3tL5y/ZajD03usp0EFQ0v37rtBRU=
Received: by 10.14.119.1 with SMTP id m1mr1751153eeh.44.1306341452509; Wed, 25
	May 2011 09:37:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.78 with HTTP; Wed, 25 May 2011 09:36:57 -0700 (PDT)
In-Reply-To: <1306338695.27470.41.camel@rex>
References: <4DDBDE9D.5000709@linux.intel.com> <1306338695.27470.41.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 May 2011 09:36:57 -0700
Message-ID: <BANLkTim8VzrP7Zd4yDRaa75X0gXUL7wC=g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: Updating u-boot for oe-core or meta-yocto
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 May 2011 16:40:38 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 25, 2011 at 8:51 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I did a little research and I'd like to try and help us move forward.
>
> The "problem" at the moment is both oe-core and meta-ti have u-boot
> recipes. If Yocto were to merge in the meta-ti recipe to meta-yocto it
> would overshadow the oe-core recipe. I believe Yocto wants to encourage
> sharing a core on codebases like u-boot which are receptive and working
> to facilitate collaboration (not unlike Yocto itself).
>
> Valid questions are therefore:
>
> a) What can we do to the u-boot recipe in core to make it customisable
> from layers like meta-ti
>
> b) Is it possible for the u-boot recipe in meta-ti to be a .bbappend
> rather than a recipe which overwrites the default.
>
> For a), I know Darren has some patches which drop the COMPATIBLE_MACHINE
> usage for example and instead raise the skip parsing exception when
> UBOOT_MACHINE isn't set which is a step in the right direction. If we
> find other issues, lets fix them.
>
> For b), I talked to Koen and he's going to see how feasible this is
> although as always with this kind of issue there are various
> complicating factors.
>
> Hopefully if we work both sides of the problem we can get this resolved.
> Darren, if you could send out some of your patches so far (e.g. for
> COMPATIBLE_MACHINE) that might be helpful.
>
> If the ultimate answer is that no, meta-ti has so many changes or
> specific requirements that mean it needs to stay a .bb file then lets
> cross that bridge if we come to it but I think this discussion makes
> sense before reaching that conclusion. Its possible the last release of
> u-boot has sufficient beagle support for yocto's needs and we could use
> that instead.
>
> Just on a more general note, the agreement on resolving the beagleboard
> issue stands as is. The plan is to make beagleboard support in
> meta-yocto as near a copy of the meta-ti pieces as possible with the
> exception of the kernel where linux-yocto will import the needed patches
> to demo the kernel tooling functionality. The layer tooling under
> development will automate the process of syncing those pieces. I think
> everyone is happy with the agreement and we just need to address some
> corner cases like u-boot.
>

so is it just a question of beagleboard support or a broader support
for all machines ?
I know various boards use very different versions
of u-boot so is oe-core going to bring that support
to u-boot in oe-core and maintain that ?

IMO keeping oe-core relatively free of machine dependent stuff would be better.


