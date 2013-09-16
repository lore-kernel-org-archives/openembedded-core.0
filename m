Return-Path: <anders@chargestorm.se>
Received: from stoexhubfe01.domain01.net (STOEXHUBFE01.domain01.net
	[83.145.59.140])
	by mail.openembedded.org (Postfix) with ESMTP id 122906C84B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 10:08:05 +0000 (UTC)
Received: from ad.chargestorm.se (213.114.79.21) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Mon, 16 Sep 2013 12:08:04 +0200
Date: Mon, 16 Sep 2013 12:08:03 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20130916100803.GB3268@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <1379071094.3484.245.camel@ted>
	<CAMKF1so0f+8uJnqTxK0b+gkhhQAcjsAsVYZp8E_V5pEiL1heuQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1so0f+8uJnqTxK0b+gkhhQAcjsAsVYZp8E_V5pEiL1heuQ@mail.gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: [PATCH] linux-libc-headers: Add big warning about antisocial behaviour
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
X-List-Received-Date: Mon, 16 Sep 2013 10:08:05 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Khem Raj <raj.khem@gmail.com> [130914 06:24]:



> On Friday, September 13, 2013, Richard Purdie wrote:

>     I'm getting concerned with the number of people forking this recipe
>     and not understanding what they're doing. I'm therefore proposing
>     adding in a suitable warning to people thinking of copying it.

>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>     ---
>     diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-header=
s.inc
>     b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
>     index 96fe2ff..79b7dc4 100644
>     --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
>     +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
>     @@ -2,6 +2,28 @@ DESCRIPTION =3D "Sanitized set of kernel headers for=
 the C
>     library's use."
>     =A0SECTION =3D "devel"
>     =A0LICENSE =3D "GPLv2"

>     +####################################################################=
#####
>     +#### =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0PLEASE READ
>     +####################################################################=
#####
>     +#
>     +# You're probably looking here thinking you need to create some new =
copy
>     +# of linux-libc-headers since you have your own custom kernel. To put
>     +# this simply, you DO NOT.
>     +#
>     +# Why? These headers are used to build the libc. If you customise the
>     +# headers you are customising the libc and the libc becomes machine
>     +# specific. Most people do not add custom libc extensions to the ker=
nel
>     +# and have a machine specific libc.
>     +#
>     +# But you have some kernel headers you need for some driver? That is=
 fine
>     +# but get them from STAGING_KERNEL_DIR where the kernel installs its=
elf.
>     +# This will make the package using them machine specific but this is=
 much
>     +# better than having a maching specific C library. This does mean yo=
ur
>     +# recipe needs a DEPENDS +=3D "virtual/kernel" but again, that is fi=
ne and
>     +# makes total sense.
>     +#
>     +# -- RP


> There are cases where we have bsps with 2.6.3x kernels and libc compiled
> against 3.10 assumes syscalls
> Which the kernel will not provide. These kinds are genuine cases for crea=
ting
> equivalent recipes
> You should mention the valid case too in this notice and basically asses =
the
> user is knowing what. He is doing

I'd be inclined to say that anyone working on / adding a bsp that needs
this, will (hopefully) understand this anyway. If you know that
3.x-based kernel headers aren't working, you're going to add a patched
linux-libc-headers regardless of the warning above.

Cheers,
Ander

--=20
Anders Darander
ChargeStorm AB / eStorm AB

