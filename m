Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38264.1792425091425298003
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 08:51:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=egiTMLUM;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so22260195e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 08:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792425089; x=1793029889; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nwjRosfUn6SiY8rIWkLrcaviVXfs8YIq4fyX99q5uUo=;
        b=egiTMLUMWrKALL33uggV+wQyCRNMmEXGaqKrbFn7v0FxzUMzcZ+mz0F0Dk/fVzcg9a
         zyST6Ww0kbWHKP0LEHGa6Rum5UtP62AWu+bNdXBcSuWJsSM41TBcrqW1/rEGzGJjHPWI
         TZ8a52O/zSdd/Owdl3LdeBvqMEX2Jk1BCFnb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792425089; x=1793029889;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nwjRosfUn6SiY8rIWkLrcaviVXfs8YIq4fyX99q5uUo=;
        b=HeB0Ho3/obxW8Zn3z+bztZMGOm1rSDeOPttmaJZ1qnX398FvOzIUYEkIO+mB4mqvzb
         8GLeIN3iDx9/CdJyw3CITw8Q7Zr/VsS85CjYUl09+72b+n2lxFzd5fB49BF3O5z1I+5u
         VtoH/ZP6yYzvsspfeOwbGICMMv68It0n527AnB0tl2KAO2DCHDTwWngnBkfBDARCOtMW
         ornSPw+VOr0JMXziuUyFTxRG8oAhYeninvay5Olcp+ElMf4w56+htFusEKdV5HpJ7s8A
         jekYTkswpdj6uUOxTrhl5LNs4jY1zojplhErsZU4gxpIkgupcrhHelEAJpwDRXSxC+fn
         l/Hg==
X-Forwarded-Encrypted: i=1; AKwUvBzWGwAOquTmLjEWB4lbpuSy4+9sMOWCi60FVTioRaB+aWxLhnCevfapCqPlgnvzg85/A9o53Xc8l/Y4fn5ylfJlHw==@lists.openembedded.org
X-Gm-Message-State: AFq9FYJqsdDZXRF6Ap2uV1JeRWTn40VcDkBGJDsP7AaZYygcUsgw7/+i
	grHNp7KmVGfpAB6L7MhlPgOfF4OP3xsZIgFeF0/stP7xTBihrTtaXXj3SIoW3pQ0yWE=
X-Gm-Gg: AYBFou0BV1+3kDhwIE5cv9ywF7urAz0uAxWK9cwcsgU7ah+KwXMUrK582HzVQWnRTub
	m1GBNrhMCRI0XKv2ZfUWkxx4Tppu49MmtNHUs3gWIo3ZepxHOG5B+VTTLXttlUHgT1otEyAmY33
	ZyZo/seiPx0Ctss1Rs2pxoDfu+AKePxAvwoumkZrj3AqPX/R8kbbYWQPVPDRGfdef3j+cKnyCk3
	p4zyEbYsisa3fnUqvBNZpJzfAlFU8Qat1AVW2L3XEmKzasN3Q5ckcgR868z5Jf0HohinG51k0rA
	aNKQn2kC9rgLfpaHeO014TsXpIfRYmihxQgiHpzVN5ifIeptncuDmDtxSN4BcdIrs0yUOS2fgxF
	FETAWIFCeNVHYxKi/OgnW0a8hxY0Z8bbcQ8qiaBabWb+PKLKhBeuGr5d26bdts8DkwfQe+Rm3bM
	s2xopQ6FzL6kO63ykZsE2kZUuW574ms6555NWMRXjmxPv1qgb2toR6IxNnCjz7WR71sGRfmkxDY
	YWemFRBAcSbayzPuMERMfBWuktFyKCoOoBqmNoJKL7nFPa70YjmMBvHnp43NA==
X-Received: by 2002:a05:600c:a05:b0:4a1:813f:2a57 with SMTP id 5b1f17b1804b1-4a1d7608058mr179101575e9.13.1792425089394;
        Mon, 19 Oct 2026 08:51:29 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cd482bsm957775e9.12.2026.10.19.08.51.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 08:51:29 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 17:51:28 +0200
Message-Id: <DM8XNY7H8H69.16UB3TETMWE2N@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH 2/7] util-linux: patch
 CVE-2026-53613
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Marko, Peter" <Peter.Marko@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261005170513.632348-1-peter.marko@siemens.com>
 <20261005170513.632348-2-peter.marko@siemens.com>
 <DM3KT0WJ9OHK.32ZO1E9U41LL8@smile.fr>
 <AS8PR10MB5073AFD6A6A93D5C2837DCCFFD982@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS8PR10MB5073AFD6A6A93D5C2837DCCFFD982@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 16:18:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248194

On Mon Oct 19, 2026 at 4:22 PM CEST, Peter Marko wrote:
>
>
>> -----Original Message-----
>> From: Yoann Congal <yoann.congal@smile.fr>
>> Sent: Tuesday, October 13, 2026 10:44 AM
>> To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>;
>> openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [scarthgap][PATCH 2/7] util-linux: patch CVE-2026=
-53613
>>=20
>> On Mon Oct 5, 2026 at 7:05 PM CEST, Peter Marko via lists.openembedded.o=
rg
>> wrote:
>> > From: Peter Marko <peter.marko@siemens.com>
>> >
>> > Pick patch referencing this CVE from 2.41.5 release.
>> > Also pick patches implementing used helper functions and fixing
>> > consequent build errors.
>> >
>> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
>> > ---
>> >  meta/recipes-core/util-linux/util-linux.inc   |   5 +
>> >  ...ib-fileutils-add-ul_open_no_symlinks.patch |  98 +++++++++
>> >  ...dd-ul_openat_resolve-openat2-wrapper.patch |  85 ++++++++
>> >  ...x-RESOLVE_NO_SYMLINKS-fallback-value.patch |  71 +++++++
>> >  ...x-unused-parameter-warnings-without-.patch |  64 ++++++
>> >  .../util-linux/CVE-2026-53613.patch           | 192 +++++++++++++++++=
+
>> >  6 files changed, 515 insertions(+)
>> >  create mode 100644 meta/recipes-core/util-linux/util-linux/0001-lib-f=
ileutils-
>> add-ul_open_no_symlinks.patch
>> >  create mode 100644 meta/recipes-core/util-linux/util-linux/0001-lib-f=
ileutils-
>> add-ul_openat_resolve-openat2-wrapper.patch
>> >  create mode 100644 meta/recipes-core/util-linux/util-linux/0001-lib-f=
ileutils-fix-
>> RESOLVE_NO_SYMLINKS-fallback-value.patch
>> >  create mode 100644 meta/recipes-core/util-linux/util-linux/0001-lib-f=
ileutils-fix-
>> unused-parameter-warnings-without-.patch
>> >  create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-
>> 53613.patch
>> >
>> > diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipe=
s-core/util-
>> linux/util-linux.inc
>> > index 70acf6dfec3..db698ef9367 100644
>> > --- a/meta/recipes-core/util-linux/util-linux.inc
>> > +++ b/meta/recipes-core/util-linux/util-linux.inc
>> > @@ -50,6 +50,11 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-
>> linux/v${MAJOR_VERSION}/util-lin
>> >             file://CVE-2026-13595.patch \
>> >             file://CVE-2026-3184.patch \
>> >             file://CVE-2026-53614.patch \
>> > +           file://0001-lib-fileutils-add-ul_open_no_symlinks.patch \
>> > +           file://0001-lib-fileutils-add-ul_openat_resolve-openat2-wr=
apper.patch \
>> > +           file://0001-lib-fileutils-fix-unused-parameter-warnings-wi=
thout-.patch \
>> > +           file://0001-lib-fileutils-fix-RESOLVE_NO_SYMLINKS-fallback=
-
>> value.patch \
>> > +           file://CVE-2026-53613.patch \
>> >             "
>> >
>> >  SRC_URI[sha256sum] =3D
>> "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f"
>> > diff --git a/meta/recipes-core/util-linux/util-linux/0001-lib-fileutil=
s-add-
>> ul_openat_resolve-openat2-wrapper.patch b/meta/recipes-core/util-linux/u=
til-
>> linux/0001-lib-fileutils-add-ul_openat_resolve-openat2-wrapper.patch
>> > new file mode 100644
>> > index 00000000000..f8320ae82d5
>> > --- /dev/null
>> > +++ b/meta/recipes-core/util-linux/util-linux/0001-lib-fileutils-add-
>> ul_openat_resolve-openat2-wrapper.patch
>> > @@ -0,0 +1,85 @@
>> > +From 4cccf4edc256507734e3484cfaedf5980945c2fa Mon Sep 17 00:00:00
>> 2001
>> > +From: Karel Zak <kzak@redhat.com>
>> > +Date: Mon, 20 Jul 2026 14:36:16 +0200
>> > +Subject: [PATCH] lib/fileutils: add ul_openat_resolve() openat2 wrapp=
er
>> > +
>> > +Add ul_openat_resolve() as a generic openat2(2) wrapper with
>> > +caller-specified resolve flags. No fallback to weaker alternatives --
>> > +returns -1/ENOSYS if openat2 is unavailable.
>> > +
>> > +Rewrite ul_open_no_symlinks() to use ul_openat_resolve() with
>> > +RESOLVE_NO_SYMLINKS, dropping the unsafe O_NOFOLLOW fallback that
>> > +only protected the final path component.
>> > +
>> > +Add fallback defines for RESOLVE_NO_SYMLINKS and RESOLVE_BENEATH
>> > +in fileutils.h.
>> > +
>> > +Signed-off-by: Karel Zak <kzak@redhat.com>
>> > +(cherry picked from commit b9e07ce6f5ad54c38cf3ebc7100101e487be91bd)
>> > +(cherry picked from commit 1426aa06ff2f6a21cba9102c35e3577641b356ff)
>> > +
>> > +Upstream-Status: Backport [https://github.com/util-linux/util-
>> linux/commit/4cccf4edc256507734e3484cfaedf5980945c2fa]
>> > +Signed-off-by: Peter Marko <peter.marko@siemens.com>
>> > +---
>> > + include/fileutils.h |  9 +++++++++
>> > + lib/fileutils.c     | 22 ++++++++++++++--------
>> > + 2 files changed, 23 insertions(+), 8 deletions(-)
>> > +
>> Hello
>>=20
>> Isn't this patch similar to what caused
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16316 with tar?
>> (implementing a "new" openat2 syscall not supported by pseudo)
>> Is that safe to do here?
>>=20
>> We updated pseudo to fix that, but, I'd like to take some care to not
>> re-introduce the bug...
>
> Code using openat2 is essential for CVE-2026-53613 and CVE-2026-78410 pat=
ches.
> In wrynose this got inside without anyone thinking about this as the
> code was not presented in an recipe upgrade patch...

Yeah, that's how we find out about this issue as well: an
innocuous-looking tar CVE fix in an upgrade. I do read the changelog on
upgrades but I definitely can't review this kind of diff.

> For scarthgap, we do already have code prepared in pseudo, so
> native/bitbake case is covered. Green autobuilder job should basically
> guarantee that.
> Then, this is independent from glibc as it uses the syscall directly,
> so there we're safe and it's then all about kernel.
>
> openat2 was introduced in kernel 5.6, so these CVE patches will cause
> unpriviledged mount calls to newly have a requirement of kernel 5.6+.
> This is because the patch removes fallback to weaker methods when
> openat2 is not available.
> So the question now is who is still using EOL kernels (yocto comes
> with 6.6, while 5.10 is latest non-EOL and in 2 months it will be 6.1)
> and mount operations on target devices.
> Do we care about such scenario?

In https://git.openembedded.org/openembedded-core/tree/meta/conf/bitbake.co=
nf?h=3Dscarthgap#n470:
| OLDEST_KERNEL =3D "5.15"
| SDK_OLDEST_KERNEL =3D "3.2.0"
So, target is good.
I don't know if I trust the >=3D3.2.0 SDK kernel limit :-/

Anyway, I think the patch is good to go. I'll ask around to see if
anyone disagrees.

Thanks!
--=20
Yoann Congal
Smile ECS

