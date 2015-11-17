Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0EC176011B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 19:16:48 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so169135037wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 11:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=a55djqLPFMGkOq0CNtpveFV1ZL557eVbvAzGIk3Wl6Q=;
	b=TT45SK3yL1bcf8MqI+F6mYK/fD0e02Lcdei//8pm48xA8AQefWQaJDUS2zc5EzcvAu
	JQWlT2JD8hj9ihJytsvGCLURe4A5/z/bQgUQceEm8QVVUginyMrI8kn/EDSFXUSJp8AH
	3Bqnm+KkQ3zwyEN/nEsvP8y1fcXOBbZpGY1LILZl6wN/NQGioC36oxSdM/03JVLs42xn
	uWGDWhLDZVTPBE5XFpReVq+upb2hAOheuBFaNbgDHI0iO1BHYZPunGdIIoRnySPJn05/
	C9Nab03Z89eFYIHnArLc3KOPewuhuysgEsOnrpmZA0qlAMDhUAVoRI7nGip9MvE7eSPI
	0xvw==
MIME-Version: 1.0
X-Received: by 10.194.93.164 with SMTP id cv4mr34013260wjb.43.1447787809352;
	Tue, 17 Nov 2015 11:16:49 -0800 (PST)
Received: by 10.194.140.38 with HTTP; Tue, 17 Nov 2015 11:16:49 -0800 (PST)
In-Reply-To: <1447780178.1472.29.camel@pbcl.net>
References: <1447739760-14395-1-git-send-email-armccurdy@gmail.com>
	<1447773377.1472.28.camel@pbcl.net>
	<CAJTo0La98Rv=0ZwdHce4FTknVAmZnGEnNmpXopK9+8cKqbnj8Q@mail.gmail.com>
	<1447780178.1472.29.camel@pbcl.net>
Date: Tue, 17 Nov 2015 11:16:49 -0800
Message-ID: <CAJ86T=V7WyuBuLvn7spNWJxW3TohpeAgf7yFFyahr0F29t1RhQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] directfb.inc: force bfd linker for armv7a
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
X-List-Received-Date: Tue, 17 Nov 2015 19:16:49 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 17, 2015 at 9:09 AM, Phil Blundell <pb@pbcl.net> wrote:
> On Tue, 2015-11-17 at 16:44 +0000, Burton, Ross wrote:
>
> On 17 November 2015 at 15:16, Phil Blundell <pb@pbcl.net> wrote:
>
> Does the resulting directfb-csource binary actually work with that
> change?  My recollection is that ld.bfd will just silently permit
> relocs that gold (correctly) refuses to allow.
>
>
> Personally I don't use DirectFB (and am constantly surprised it's still a
> thing) so at this point I'm not going to merge either of these patches until
> someone can confirm that their fix *works on hardware* instead of just
> fixing the build.
>
>
> I think that's a reasonable position.  In any case, the underlying issue is
> a compiler bug and ought really to be fixed there rather than patching
> directfb or any other package that just happens to fall over it.
>

The directfb-csource binary linked with the bfd linker segfaults on
startup, so it does indeed look like a compiler problem.

