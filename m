Return-Path: <raj.khem@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 88EFE780F6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 13:38:23 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id f28so6474253lfi.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 06:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=0jI9NEZD4X5DywSKXZgF9i1Am4w6SEcq2W7BTq0ayx4=;
	b=o9/0fTuKpU6rkkU5M938PsUkL1aore2hG53r1eh+I6MMKjb8hUodnuI87r1/vzM0Pl
	XjCNd3rH1zqLraFHAgnzRlQ5ntBOKSRbX15YiSqeSUP/WE6LzDx7X15Rq1x+XO3SSbEJ
	Ic+4SzIT+w0JRH/aBQ+czdVX7XjLbiwij4GqIlIqL2RV/CMcQ/+wfGlI6cxChpT3l8zN
	+KFxu/+RNYhh/dc5sQ8YgMq96zlpSNPgFaapiwQS0oPtYE1lcDIEJ4/k4Lr5vg3c+LiM
	I8XC6r0GxOo+49KBm0Iui420sPgREPeiLBp0rZJ6xs9eF+j80QxSRE86da/cz8iBSmYE
	NADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=0jI9NEZD4X5DywSKXZgF9i1Am4w6SEcq2W7BTq0ayx4=;
	b=bHqyY7koa20AjElyE3TcszwlW5HNBsMDSDVJY57i3z2j47zvA60NGgAc+ZsRE8w7Ky
	VFtjLdix5l7NyipR/LSDWEjEc6WEenQe+rmlzi0llYvAQzOkYKApUc4smYS3mRQwrX1r
	dwyptPH/zF2rargbL/sJ0NZKrYqNCVQsEZaLxJMTwXm6WCTVuEZBLUMqget8G6vf+aPS
	xVw9Z1DSH/Qlto7GQ74HAPd8F40smCjJcTPZy/kiA/vNqfBPThg88Evwn2T2mBFK9nEU
	WB7lwTjGPbSJuuXHeeZmns7ts/NjQKJEbvovWAauvGl8NFoLSt2+2oBDTaCrZCzt5XDr
	9E0Q==
X-Gm-Message-State: AKS2vOxHM6s3qM/cozKUwUDOPRwkkhH90+c0h3pfWsCYJAHUWxCSzN6R
	aHRh8foTB9l+IfTN/z9GieYvqQvW9FJp
X-Received: by 10.80.154.129 with SMTP id p1mr6184989edb.131.1498225103546;
	Fri, 23 Jun 2017 06:38:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.165.198 with HTTP; Fri, 23 Jun 2017 06:37:52 -0700 (PDT)
In-Reply-To: <1498214792.25895.23.camel@andred.net>
References: <20170622151404.27496-1-git@andred.net>
	<CAMKF1spVoW38edBHwvV8vGg9C00K1tQvqRC1LR2NXofZm5DkEA@mail.gmail.com>
	<1498214792.25895.23.camel@andred.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Jun 2017 06:37:52 -0700
Message-ID: <CAMKF1sowVfO=avnnSJtDhYi=nda0hU_htvcTcmtdWydCxzOqvg@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-libc-headers: fix duplicate IFF_LOWER_UP DORMANT ECHO on musl
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
X-List-Received-Date: Fri, 23 Jun 2017 13:38:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 23, 2017 at 3:46 AM, Andr=C3=A9 Draszik <git@andred.net> wrote:
> connman is not doing anything wrong here.
>

yes I am aware of this

> The kernel is redefining IFF_LOWER_UP, because it thinks the libc doesn't
> define it yet (and glibc doesn't).
>
> libc-compat.h is the way to solve these kind of issues. There also is htt=
ps:
> //lkml.org/lkml/2017/3/12/238 which is very similar. I'll pick that inste=
ad.
>
see the comment https://lkml.org/lkml/2017/3/16/121
that worries me for this patch

I am not questioning the correctness of patch too. But
it would be better to get this patch accepted into kernel
before applying to OE since these are kind of patches which
you can get stuck with for life if upstream is not accepting it.

> Cheers,
> Andre'
>
> On Thu, 2017-06-22 at 22:26 +0000, Khem Raj wrote:
>> I would rather fix the package instead of kernel headers unless kernel
>> community accepts this patch
>>
>> On Thu, Jun 22, 2017 at 11:14 AM Andr=C3=A9 Draszik <git@andred.net> wro=
te:
>>
>> > From: Andr=C3=A9 Draszik <adraszik@tycoint.com>
>> >
>> > musl _does_ define IFF_LOWER_UP DORMANT ECHO so we should
>> > prevent redefinition of these when on musl.
>> >
>> > As per the included patch, this can be triggered by
>> > (from connman 6to4.c):
>> >     include <errno.h>
>> >     include <stdio.h>
>> >     include <stdlib.h>
>> >     include <string.h>
>> >     include <sys/socket.h>
>> >     include <netinet/in.h>
>> >     include <arpa/inet.h>
>> >     include <net/if.h>
>> >     include <linux/ip.h>
>> >     include <linux/if_tunnel.h>
>> >     include <linux/netlink.h>
>> >     include <linux/rtnetlink.h>
>> >     include <sys/ioctl.h>
>> >     include <unistd.h>
>> >
>> > In file included from ../git/src/6to4.c:34:0:
>> > .../usr/include/linux/if.h:97:2: error: expected identifier before
>> > numeric
>> > constant
>> >   IFF_LOWER_UP   =3D 1<<16, /* __volatile__ */
>> >   ^
>> >
>> > This is because at that time, IFF_LOWER_UP has been converted
>> > to 0x10000 already:
>> > enum net_device_flags {
>> >  0x10000 =3D 1<<16,
>> >  0x20000 =3D 1<<17,
>> >  0x40000 =3D 1<<18,
>> >
>> > };
>> >
>> > By defining __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO
>> > to 0, we avoid the duplicated definition.
>> >
>> > Signed-off-by: Andr=C3=A9 Draszik <adraszik@tycoint.com>
>> > ---
>> >  ....h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch | 62
>> > ++++++++++++++++++++++
>> >  .../linux-libc-headers/linux-libc-headers_4.10.bb  |  1 +
>> >  2 files changed, 63 insertions(+)
>> >  create mode 100644
>> > meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-libc-
>> > compat.h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch
>> >
>> > diff --git
>> > a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-libc-
>> > compat.h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch
>> > b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-libc-
>> > compat.h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch
>> > new file mode 100644
>> > index 0000000000..fd1bb9edb8
>> > --- /dev/null
>> > +++
>> > b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-libc-
>> > compat.h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch
>> > @@ -0,0 +1,62 @@
>> > +From 08a04c025395b0580913285045f2af36ee0985db Mon Sep 17 00:00:00 200=
1
>> > +From: =3D?UTF-8?q?Andr=3DC3=3DA9=3D20Draszik?=3D <adraszik@tycoint.co=
m>
>> > +Date: Thu, 15 Jun 2017 16:55:33 +0100
>> > +Subject: [PATCH] libc-compat.h: musl _does_ define IFF_LOWER_UP DORMA=
NT
>> > ECHO
>> > +MIME-Version: 1.0
>> > +Content-Type: text/plain; charset=3DUTF-8
>> > +Content-Transfer-Encoding: 8bit
>> > +
>> > +To trigger this (from connman 6to4.c):
>> > +    include <errno.h>
>> > +    include <stdio.h>
>> > +    include <stdlib.h>
>> > +    include <string.h>
>> > +    include <sys/socket.h>
>> > +    include <netinet/in.h>
>> > +    include <arpa/inet.h>
>> > +    include <net/if.h>
>> > +    include <linux/ip.h>
>> > +    include <linux/if_tunnel.h>
>> > +    include <linux/netlink.h>
>> > +    include <linux/rtnetlink.h>
>> > +    include <sys/ioctl.h>
>> > +    include <unistd.h>
>> > +
>> > +In file included from ../git/src/6to4.c:34:0:
>> > +/scratch/yocto/build-tgm-r3-poky-fpp-tgm.pyro/tmp/work/tgm_r3-poky-
>> > linux-musl/connman/1.33-git4+AUTOINC+aa5b3dc12b-r0/recipe-
>> > sysroot/usr/include/linux/if.h:97:2:
>> > error: expected identifier before numeric constant
>> > +  IFF_LOWER_UP   =3D 1<<16, /* __volatile__ */
>> > +  ^
>> > +
>> > +This is because at that time, IFF_LOWER_UP has been converted
>> > +to 0x10000 already:
>> > +enum net_device_flags {
>> > + 0x10000 =3D 1<<16,
>> > + 0x20000 =3D 1<<17,
>> > + 0x40000 =3D 1<<18,
>> > +
>> > +};
>> > +
>> > +Upstream-Status: Pending
>> > +Signed-off-by: Andr=C3=A9 Draszik <adraszik@tycoint.com>
>> > +Acked-by: Stephane Ayotte <sayotte@tycoint.com>
>> > +---
>> > + include/uapi/linux/libc-compat.h | 3 ++-
>> > + 1 file changed, 2 insertions(+), 1 deletion(-)
>> > +
>> > +diff --git a/include/uapi/linux/libc-compat.h
>> > b/include/uapi/linux/libc-compat.h
>> > +index f11ec0e..2003ae4 100644
>> > +--- a/include/uapi/linux/libc-compat.h
>> > ++++ b/include/uapi/linux/libc-compat.h
>> > +@@ -70,7 +70,8 @@
>> > + #define __UAPI_DEF_IF_NET_DEVICE_FLAGS 0
>> > + /* For the future if glibc adds IFF_LOWER_UP, IFF_DORMANT and IFF_EC=
HO
>> > */
>> > + #ifndef __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO
>> > +-#define __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO 1
>> > ++/* musl has these defined */
>> > ++#define __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO 0
>> > + #endif /* __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO */
>> > +
>> > + #else /* _NET_IF_H */
>> > +--
>> > +2.11.0
>> > +
>> > diff --git a/meta/recipes-kernel/linux-libc-headers/
>> > linux-libc-headers_4.10.bb b/meta/recipes-kernel/linux-libc-headers/
>> > linux-libc-headers_4.10.bb
>> > index 108446aa34..29262789a8 100644
>> > --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.10.b=
b
>> > +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.10.b=
b
>> > @@ -4,6 +4,7 @@ SRC_URI_append_libc-musl =3D "\
>> >      file://0001-libc-compat.h-fix-some-issues-arising-from-in6.h.patc=
h
>> > \
>> >      file://0002-libc-compat.h-prevent-redefinition-of-struct-
>> > ethhdr.patch
>> > \
>> >      file://0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch \
>> > +
>> > file://0001-libc-compat.h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch=
 \
>> >     "
>> >
>> >  SRC_URI[md5sum] =3D "b5e7f6b9b2fe1b6cc7bc56a3a0bfc090"
>> > --
>> > 2.11.0
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

