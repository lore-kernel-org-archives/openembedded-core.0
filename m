Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id DDA2760291
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 21:12:00 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id l4so997287ite.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 14:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=3cJaKECw0NUG65aW4Nc31Bp3B45meZLYptYuQ8esnuc=;
	b=t2WJb6PZGCOA9cLsj3Q/31ZhKLZLX0T4HCgt/+m52mzClZ4NtcKKpdp/bimx/7a5S1
	lrccmXWMfSfJhE2SUT2nELPL6uwOlSQpY85ZoPTMp+w2Waexh6H8RVDes94XL2/esqI/
	CJywQBteHeBw5I9GbPrcDfw1yRPKAtZPC4xS+fvTDT2JofVoc9kPTzwfF6MYnpPinH5B
	3xnPy4AGiJSKMd+CuTvRtrfE/QazZuJXYMK69LF0mBvfgGeN/W4GZXYonFpND2M73Fxo
	vSZU/InFH/AGru8imyKQmBp6LgvhrLWG/GJOGgDWnFxn1qLOVpdHJcenAlNHNz4MtRQn
	6h1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=3cJaKECw0NUG65aW4Nc31Bp3B45meZLYptYuQ8esnuc=;
	b=ZH5O76RaYB4hnwowVxLncw9bZttxEcHhhTXQFrVfA8vfBsSkaC7Jlo20UtE0jD/B6L
	2C8HbkBwNEqRzfl9Dry4/ZyuGendwVigPcpBbye/R+UlZ0be3AIbH83fiBMjt/aKj+nD
	91v/pLvhKCnm6Kic9Px+3jZHkNskFbzqpnFKcBCUPGxbl9azMyoxsIs+IL8a079OUgg/
	tBESQqHpcV1YyUDQ5n1BdCnY24N8cEWaHk4qPtNQXgjOKQFp+9RFddp1rPmNn6hpaf4z
	BlZ9l8Sq4YbiXCE2+xCRW3kxU67hQbB91b5T7GD6gNUh3IVxB4sLtudhW0r4m8cTj4CT
	CJDw==
X-Gm-Message-State: APjAAAUORWWS6PTRSDRehft8KOMwA1TUWasAajl4xnh9r/OhXwtdWwqM
	f4Bp+FjrrxID9JEJvPYTizYHcOGChfNzXsec8Wc=
X-Google-Smtp-Source: APXvYqyFW2WIdfxfFnhY19LXrsNbCcrlaU0MMUbI3Ugt7sV4cigSmXcqaDXIfGG4XFISvpiqZ4nBXNDI7kXUyf/tSmY=
X-Received: by 2002:a24:7d84:: with SMTP id b126mr876076itc.58.1553548321925; 
	Mon, 25 Mar 2019 14:12:01 -0700 (PDT)
MIME-Version: 1.0
References: <CALbNGRRm1QAgY2MHbTUA_Ly9L_Kt6ZzkR55jArkCE53G=ts8tA@mail.gmail.com>
	<CAMKF1sri_7L8sb95L5BjD3d2iMJq4PnqK+pD0XnTibUpwogpsQ@mail.gmail.com>
	<20190323211604.GA20793@localhost>
	<CALbNGRQPtnNLSVhDzXgnvn-2VNPPMfQTY5vDdwM3xr5iVcGofg@mail.gmail.com>
	<20190323215336.GA22469@localhost>
	<CALbNGRScKq9gCQWbU2wchSvQ3cf2aRNnn5601fOATuKMdVOFCA@mail.gmail.com>
	<CAAQYJAsLQFn3VrB7gSTkytA8Rm-1GkKLBLHHpVzonpqykrHnRg@mail.gmail.com>
	<20190325161004.GB484@localhost>
	<CALbNGRSgkQrjKrhEywJb3DhvKv3gkobZvv7YG_DxE039SAqJaw@mail.gmail.com>
	<CALbNGRThou+6CNKotr-hduJoKNPgg+F2i8PQdgjBGcGRZeOKdw@mail.gmail.com>
	<20190325174629.GA5805@localhost>
In-Reply-To: <20190325174629.GA5805@localhost>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 25 Mar 2019 22:11:49 +0100
Message-ID: <CALbNGRTqm3nOXqvZnX=LBQ_6=28jUs4kAhk=sjbNjdM=MFZjNw@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: musl thoughts
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
X-List-Received-Date: Mon, 25 Mar 2019 21:12:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2019 at 6:46 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Mon, Mar 25, 2019 at 06:15:40PM +0100, Andreas M=C3=BCller wrote:
> >...
> > Looked into this. Found an old musl build failure of networkmanager
> > [1] but I think the issue has not changed:
> >
> > | In file included from
> > TOPDIR/build/tmp/work/mips32r2-yoe-linux-musl/networkmanager/1.14.4-r0/=
recipe-sysroot/usr/include/net/ethernet.h:10,
> > |                  from ../NetworkManager-1.14.4/shared/n-acd/src/n-acd=
.c:28:
> > | TOPDIR/build/tmp/work/mips32r2-yoe-linux-musl/networkmanager/1.14.4-r=
0/recipe-sysroot/usr/include/netinet/if_ether.h:111:8:
> > error: redefinition of 'struct ethhdr'
> > |  struct ethhdr {
> > |         ^~~~~~
> > | In file included from ../NetworkManager-1.14.4/shared/n-acd/src/n-acd=
.c:26:
> > | TOPDIR/build/tmp/work/mips32r2-yoe-linux-musl/networkmanager/1.14.4-r=
0/recipe-sysroot/usr/include/linux/if_ether.h:167:8:
> > note: originally defined here
> > | struct ethhdr {
> > |         ^~~~~~
> >
> > glibc does not fail because it does include linux header
> > | /* Get definitions from kernel header file.  */
> > | #include <linux/if_ether.h>
> > and does not define struct ethhdr
> >
> > linux/if_ether.h says:
> > /* allow libcs like musl to deactivate this, glibc does not implement t=
his. */
> > #ifndef __UAPI_DEF_ETHHDR
> > #define __UAPI_DEF_ETHHDR        1
> > #endif
> >
> > #if __UAPI_DEF_ETHHDR
> > struct ethhdr {
> >     unsigned char    h_dest[ETH_ALEN];    /* destination eth addr    */
> >     unsigned char    h_source[ETH_ALEN];    /* source ether addr    */
> >     __be16        h_proto;        /* packet type ID field    */
> > } __attribute__((packed));
> > #endif
> >
> > musl does not include linux header but defines which is differen from
> > what linux does:
> > struct ethhdr {
> >     uint8_t h_dest[ETH_ALEN];
> >     uint8_t h_source[ETH_ALEN];
> >     uint16_t h_proto;
> > };
> > and later
> > #define __UAPI_DEF_ETHHDR       0
> >
> > So for networkmanager there is either some wrong sequence or it
> > includes linux headers.
>
> musl headers providing own different definitions of kernel interfaces
> is a problem in musl.
>
> After reading [1] I think that this is musl upstream having made the
> decision of not even trying to work properly with the kernel headers.
>
> OE adding a not upstreamable patch that removes one of the two
> definitions in musl builds might be the best available solution.
>
> > And I am still not confident that it is our job to teach umpteen
> > projects written for linux how to write portable code (oe-core has 147
> > musl related patches and meta-openembedded has 140)...
> >...
>
> This is not about writing portable code, this is about problems with musl=
.
>
> Using the Linux userspace headers is obviously not portable to non-Linux,
> but many packages like NetworkManager are anyways Linux-only no matter
> what you do.
>
> > Andreas
>
> cu
> Adrian
>
> [1] https://wiki.musl-libc.org/faq.html#Q:-Why-am-I-getting-
>
Have looked into some papers at musl page and the link above: The more
I read from them the less I am interested in wasting my time on it.
There is too often this 'the world is full of idiots - and it is just
us doing the right thing' between the lines. Starts that they call
musl 'correct' - while their own performance charts are - for my use
case - unacceptable (ok outdated - maybe things changed). One could
say: Go and give it a try but there is just a little problem: I think
it'll take weeks to get images with contents I interested in.

Looked into networkmanager: There are dozen places where linux headers
are used - I don't see a clean solution we could offer upstream.

What bugs me most: Silently a rule was introduced that patches failing
for musl are not accepted - or did I miss something. A project
considering itself as center of the world blocks resources here in
times these are limited.

Just to add that I spent past three weekends to wipe after patches
being removed / 'bit-rottened' stuff was removed from a layer I
maintain right before next release. Ahh maintainer means take care /
answer user questions take / complaints when something does not work -
but when it comes to decisions: Please keep you mouth shut.

it is enough

Andreas

