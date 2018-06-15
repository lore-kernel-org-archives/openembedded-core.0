Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 773287520E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 14:43:08 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id m21-v6so6565364uan.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 07:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=auBEobXxzo6278mQ7KhcWNX3J9fwXQw/1JJKYpXJ0mg=;
	b=JYcqK6qL/ghr103XI/1jiM1T8P8BOi3Ormiy+AZghK6OvPj60qvIO5POcPaaVFGGJE
	qXe4zIdA8dX1yYfe56w8/zsKYY3Cn048npnQlxUfQ15XQ4NRssui+iV7xmGSVdLsVRoZ
	d6VD9wuBKMKIfFry++QZYlt1iGM9nO2NLaRbvz7Sr1l4S1KmGFt4EGsyllBnBfWoRpek
	YXBecNyCSYrdeI4MIo/cVjSqFs9cqb0tb7o5dEnLXOWApZXjc4H13Jy71IRSs1i4cTpS
	AB9Ht8kPLcFfGjHW5rHZdZ3PDCZt2ua3mJV9EiVaWKevWFOY0xp6naMccCXg7CiRxWQY
	GviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=auBEobXxzo6278mQ7KhcWNX3J9fwXQw/1JJKYpXJ0mg=;
	b=HnP6XPR+YI3j699x0fYj/FNtfRaWoGWev2P7ZOKWNLncpt/aKu3QH7emscFLTwE7rh
	BhSBzNGiNgrjT/9ZqLTeVvdKIx91xvyZkznMWrEWu5QkJrC5qm0nKy7loNSmKSz8j4HJ
	d8xRp9Ii7kcz3JxAwdIttiy4pE24o4hv9vbJlPxMi7Gxa9A6tOpv80YSz2Mt2pSiWNVr
	3Yu9GWtl18ZztjMA1IoxvykuZ0xEwsdMb1REnR6ze96GYge0Z2mO+K1odQJNEZwYw09G
	wt+RPYh35kHLt/3gaaJz9BfCDmSn7YxIloLzzuTtrXIc/MbsBZp6MIcX9h/DzZasYTkf
	dY0w==
X-Gm-Message-State: APt69E1sbvcjXCg+QgphZR2S0Pk6O7DniAjHMozFQkViyp0BFQxqSzC+
	Ut++Pgm8sUfKaCYf5r3Oht46bXCHvfEaPOXcc6w=
X-Google-Smtp-Source: ADUXVKLqFVQWXEFQm/tBbBt867ihfluJUQ/H/YXliT5SGrt9EW0WU1AXta7sWj6nOe2R9xOiY7nVpXyXD8VQ00bIgWg=
X-Received: by 2002:ab0:5323:: with SMTP id
	x32-v6mr1280143uax.139.1529073789009; 
	Fri, 15 Jun 2018 07:43:09 -0700 (PDT)
MIME-Version: 1.0
References: <1528977321-8121-1-git-send-email-ovidiu.panait@windriver.com>
	<002e01d403d8$b811f1b0$2835d510$@neuf.fr>
	<20da1542-9903-d4fc-b38f-8f0ad3b2d4a1@gmail.com>
	<CAJ86T=UjDUYfQ3wAb4YCT954HjBfZMz1fnFkBxUV40xj=aBgow@mail.gmail.com>
	<CAMKF1spJGLVW_HKD9YEgDY6aidz6q_TvjohfoJHnXHDiyc3vtg@mail.gmail.com>
	<CAJ86T=U7Uk0uajnnu=1P_dSxGrO3thQDp9655KC1EEYesPa3_Q@mail.gmail.com>
	<CAMKF1srPwWebGHZcmnV5vaNhRgSjrp2DG0CgT44zyUqfnFBf_A@mail.gmail.com>
	<CAJ86T=WRTcXsWs3V32RC0dTNG-F7va_5m-hd6zYQ6aF6YZcxdw@mail.gmail.com>
	<002301d40477$f719ceb0$e54d6c10$@neuf.fr>
	<CAJ86T=WBdYPraOcxAp579Uganz6RQxV1hEzvtc5T+pencYm1xA@mail.gmail.com>
	<002901d40495$79dea6a0$6d9bf3e0$@neuf.fr>
In-Reply-To: <002901d40495$79dea6a0$6d9bf3e0$@neuf.fr>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Jun 2018 07:42:42 -0700
Message-ID: <CAMKF1spG_itWAibibmJhZ1upadtEnEdtXZDHfDOhvjGAP4w+VQ@mail.gmail.com>
To: Herve Jourdain <herve.jourdain@neuf.fr>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] db: disable the ARM assembler mutex code
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
X-List-Received-Date: Fri, 15 Jun 2018 14:43:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 15, 2018 at 3:41 AM Herve Jourdain <herve.jourdain@neuf.fr> wro=
te:
>
> Hi,
>
> Actually, I meant "works" in the sense of "does compile" - as opposed to =
armv8 where it does not compile, which is why we're having this discussion =
in the first place.
> So I was merely suggesting to not modify previous oe behavior for the db =
package for previous architectures, and just add the removal of 'swp' for a=
rmv8, where it matters most.
>
> If we want to look at it in details, based on the "ARM Architecture Refer=
ence Manual ARMv7-A and ARMv7-R edition":
> 1. SWP is the way to go before ARMv6.
> 2. SWP has been deprecated in ARMv6.
> 3. SWP has been deprecated AND made optional in ARMv7ve.
> 4. "The SWP and SWPB instructions rely on the properties of the system be=
yond the processor to ensure that no stores from other observers can occur =
between the load access and the store access, and this might not be impleme=
nted for all regions of memory on some system implementations. In all cases=
, SWP and SWPB do ensure that no stores from the processor that executed th=
e SWP or SWPB instruction can occur between the load access and the store a=
ccess of the SWP or SWPB."
>
> This latest part means that it may or may not work in SMP environments, i=
t depends on how the system is architecture around the cores - most likely =
how the bus system is designed I believe. So it may actually be working fin=
e if the system/bus designer has taken that into account.
>
> This said, I believe that from point #3 above, it might make sense to dis=
able SWP for armv7ve as well, since being optional means that it might be c=
ompiled correctly, but still fail at runtime, depending on the choices of t=
he SoC manufacturer.
> So my recommendation would be to add:
> MUTEX_armv7ve =3D ""
> MUTEX_armv8 =3D ""
>
> To disable 'swp' by default only for those 2 archs, while keeping things =
like they are for previous architectures.
>

the least intrusive fix it to fix what we need and let the defaults be
as it in this case.

> Cheers,
> Herve
>
> -----Original Message-----
> From: Andre McCurdy [mailto:armccurdy@gmail.com]
> Sent: vendredi 15 juin 2018 09:39
> To: Herve Jourdain <herve.jourdain@neuf.fr>
> Cc: Khem Raj <raj.khem@gmail.com>; Ovidiu Panait <ovidiu.panait@windriver=
.com>; Patches and discussions about the oe-core layer <openembedded-core@l=
ists.openembedded.org>
> Subject: Re: [OE-core] [PATCH 1/1] db: disable the ARM assembler mutex co=
de
>
> On Fri, Jun 15, 2018 at 12:10 AM, Herve Jourdain <herve.jourdain@neuf.fr>=
 wrote:
> > Hi,
> >
> > So the issue is whether we want to change the behaviour of previous arc=
hitectures, or if we try to fix the issue only for the architectures that d=
on't work.
> > Until now, the db recipe was enabling the 'swp' optimization, and that =
behavior could be disabled on .bbappend if needed.
> > While that works fine until armv7ve, it does not work for armv8, which =
has removed support for those instructions.
>
> I don't know if "works fine until armv7ve" is correct. Although the swp i=
nstruction exists for armv7, according to the link I posted yesterday, it i=
s not guaranteed to work.
>
>   https://community.arm.com/processors/b/blog/posts/locks-swps-and-two-sm=
oking-barriers
>
> Or do you have other evidence to suggest that swp is safe to use for armv=
7?
>
> > Therefore, there is a need to fix it for armv8 - and armv8 only - where=
as it can be safely used on previous architectures.
> > If we remove the use for all ARM architectures, that might create some =
regression/issues.
> > If we just remove the use of 'swp' only for armv8, we ensure it doesn't=
 break anything that's running on previous ARM architectures.
> >
> > Cheers,
> > Herve
> >
> > -----Original Message-----
> > From: Andre McCurdy [mailto:armccurdy@gmail.com]
> > Sent: vendredi 15 juin 2018 00:03
> > To: Khem Raj <raj.khem@gmail.com>
> > Cc: Herve Jourdain <herve.jourdain@neuf.fr>; Ovidiu Panait
> > <ovidiu.panait@windriver.com>; Patches and discussions about the
> > oe-core layer <openembedded-core@lists.openembedded.org>
> > Subject: Re: [OE-core] [PATCH 1/1] db: disable the ARM assembler mutex
> > code
> >
> > On Thu, Jun 14, 2018 at 2:48 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >> On Thu, Jun 14, 2018 at 1:01 PM Andre McCurdy <armccurdy@gmail.com> wr=
ote:
> >>> On Thu, Jun 14, 2018 at 12:24 PM, Khem Raj <raj.khem@gmail.com> wrote=
:
> >>> > On Thu, Jun 14, 2018 at 12:12 PM Andre McCurdy
> >>> > <armccurdy@gmail.com>
> >>> > wrote:
> >>> >>
> >>> >> On Thu, Jun 14, 2018 at 9:40 AM, Khem Raj <raj.khem@gmail.com> wro=
te:
> >>> >> > On 6/14/18 5:10 AM, Herve Jourdain wrote:
> >>> >> >> Hi,
> >>> >> >>
> >>> >> >> I believe I solved that same problem by just adding, in the
> >>> >> >> case of
> >>> >> >> armv8
> >>> >> >> (which I believe may be the new architecture you're referring t=
o):
> >>> >> >> MUTEX_armv8 =3D ""
> >>> >> >> This way, it allows previous versions to work just like they
> >>> >> >> did before, without having to disable ARM assembler mutex code
> >>> >> >> for architectures that support it correctly - up to armv7ve I
> >>> >> >> believe.
> >>> >> >> Of course, we might need to also have a good definition for
> >>> >> >> armv8, which is the object of another thread.
> >>> >> >
> >>> >> > right thats a better approach.
> >>> >>
> >>> >> SWP is not guaranteed to work on SMP systems... and even if it
> >>> >> does, performance is likely to be worse than the pthreads version
> >>> >> (which can take advantage of the newer instructions).
> >>> >>
> >>> >>
> >>> >> https://community.arm.com/processors/b/blog/posts/locks-swps-and-
> >>> >> t
> >>> >> wo-smoking-barriers
> >>> >>
> >>> >> In general, use of hand optimised assembler mutex implementations
> >>> >> in user space isn't something to be encouraged - use pthreads (or
> >>> >> maybe a gcc intrinsic) instead.
> >>> >>
> >>> >
> >>> > question is about disabling it on old arm machines, do we have
> >>> > data where we know that other sync methods without swp works
> >>> > better on
> >>> > armv5 and lower ?
> >>>
> >>> On armv5 and below a hand optimised implementation using SWP is
> >>> likely to be faster than pthreads. No one is suggesting otherwise.
> >>>
> >>> On SMP (highly likely nowadays for armv7 and above), SWP simply
> >>> might not work (aside from the fact that if it does work, it's
> >>> likely to be slower than pthreads). It's not really a question of
> >>> performance there, so the proposal to only disable SWP for armv8
> >>> doesn't seem like a safe solution.
> >>
> >> Suggestion is not to just do it for armv8 but To keep it there where
> >> its beneficial
> >
> > You can always argue that micro optimisations are beneficial. The quest=
ion is whether they make a big enough difference in some real world use cas=
e to be worth the maintenance effort.
> >
> >>> Using pthreads unconditionally is safe and easy. Unless you can
> >>> prove that hand optimised SWP is really a big win for armv5 (is
> >>> anyone really running a performance critical database on an armv5
> >>> system?) why not keep the recipe simple and use pthreads everywhere?
> >>>
> >>> >> I think the original patch is good.
> >>> >>
> >>> >> >> Cheers,
> >>> >> >> Herve
> >>> >> >>
> >>> >> >> -----Original Message-----
> >>> >> >> From: openembedded-core-bounces@lists.openembedded.org
> >>> >> >> [mailto:openembedded-core-bounces@lists.openembedded.org] On
> >>> >> >> Behalf Of Ovidiu Panait
> >>> >> >> Sent: jeudi 14 juin 2018 13:55
> >>> >> >> To: openembedded-core@lists.openembedded.org
> >>> >> >> Subject: [OE-core] [PATCH 1/1] db: disable the ARM assembler
> >>> >> >> mutex code
> >>> >> >>
> >>> >> >> The swpb in macro MUTEX_SET will cause "undefined instruction"
> >>> >> >> error on the new arm arches which don't support this assembly
> >>> >> >> instruction any more. If use ldrex/strex to replace swpb, the
> >>> >> >> old arm arches don't support them. So to avoid this issue,
> >>> >> >> just disable the ARM assembler mutex code, and use the default
> >>> >> >> pthreads mutex.
> >>> >> >>
> >>> >> >> Signed-off-by: Li Zhou <li.zhou@windriver.com>
> >>> >> >> Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
> >>> >> >> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> >>> >> >> ---
> >>> >> >>  meta/recipes-support/db/db_5.3.28.bb | 13 +------------
> >>> >> >>  1 file changed, 1 insertion(+), 12 deletions(-)
> >>> >> >>
> >>> >> >> diff --git a/meta/recipes-support/db/db_5.3.28.bb
> >>> >> >> b/meta/recipes-support/db/db_5.3.28.bb
> >>> >> >> index 093ee44909..15b4155a29 100644
> >>> >> >> --- a/meta/recipes-support/db/db_5.3.28.bb
> >>> >> >> +++ b/meta/recipes-support/db/db_5.3.28.bb
> >>> >> >> @@ -59,18 +59,7 @@ FILES_SOLIBSDEV =3D "${libdir}/libdb.so
> >>> >> >> ${libdir}/libdb_cxx.so"
> >>> >> >>  # All the --disable-* options replace --enable-smallbuild,
> >>> >> >> which breaks a bunch of stuff (eg. postfix)  DB5_CONFIG ?=3D
> >>> >> >> "--enable-o_direct --disable-cryptography --disable-queue
> >>> >> >> --disable-replication --disable-verify --disable-compat185
> >>> >> >> --disable-sql"
> >>> >> >>
> >>> >> >> -EXTRA_OECONF =3D "${DB5_CONFIG} --enable-shared --enable-cxx
> >>> >> >> --with-sysroot"
> >>> >> >> -
> >>> >> >> -# Override the MUTEX setting here, the POSIX library is -#
> >>> >> >> the default - "POSIX/pthreads/library".
> >>> >> >> -# Don't ignore the nice SWP instruction on the ARM:
> >>> >> >> -# These enable the ARM assembler mutex code, this won't -#
> >>> >> >> work with thumb compilation...
> >>> >> >> -ARM_MUTEX =3D "--with-mutex=3DARM/gcc-assembly"
> >>> >> >> -MUTEX =3D ""
> >>> >> >> -MUTEX_arm =3D "${ARM_MUTEX}"
> >>> >> >> -MUTEX_armeb =3D "${ARM_MUTEX}"
> >>> >> >> -EXTRA_OECONF +=3D "${MUTEX} STRIP=3Dtrue"
> >>> >> >> +EXTRA_OECONF =3D "${DB5_CONFIG} --enable-shared --enable-cxx
> >>> >> >> --with-sysroot
> >>> >> >> STRIP=3Dtrue"
> >>> >> >>  EXTRA_OEMAKE +=3D "LIBTOOL=3D'./${HOST_SYS}-libtool'"
> >>> >> >>
> >>> >> >>  EXTRA_AUTORECONF +=3D "--exclude=3Dautoheader  -I
> >>> >> >> ${S}/dist/aclocal -I${S}/dist/aclocal_java"
> >>> >> >> --
> >>> >> >> 2.17.1
> >>> >> >>
> >>> >> >> --
> >>> >> >> _______________________________________________
> >>> >> >> Openembedded-core mailing list
> >>> >> >> Openembedded-core@lists.openembedded.org
> >>> >> >> http://lists.openembedded.org/mailman/listinfo/openembedded-co
> >>> >> >> r
> >>> >> >> e
> >>> >> >>
> >>> >> >
> >>> >> >
> >>> >> >
> >>> >> > --
> >>> >> > _______________________________________________
> >>> >> > Openembedded-core mailing list
> >>> >> > Openembedded-core@lists.openembedded.org
> >>> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-cor
> >>> >> > e
> >>> >> >
> >
>

