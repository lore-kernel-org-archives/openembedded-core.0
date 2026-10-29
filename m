Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4492.1793244941122457555
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 20:35:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=DeDDEnnA;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93f1e5d7450so139915785a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 20:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793244940; x=1793849740; darn=lists.openembedded.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9+YkE4e37j9RIT5MOPDzuz7RYslYY/DgjlPAIe4fyA0=;
        b=DeDDEnnAHzS0iszzB0GKJ1otTXCawlQ09/5TZwb9YHSeeuZwavEZK2Oq6Qyr3KIuH6
         9ubpzFhviV6Wfrmp2u9ReBVqvuYZA87Q+srFry+ez4Dgz95SO2JUlotbmzd1pEHvgTsw
         9ItLVjBgzaE6cgwPOduWllZzZr+oFnfSYYp8nAijFzIAM7eutmJCgUhBcB/X6bpueRda
         v1dL0SYQT3eYcQ49cLGHDSEmbGcvSfJsQZ32n0BuXaFhTBdvtMHMQn5S5O3zhvlhdQH/
         UYOncMNtlhmDHg7C7qXdmpVYrMLCk/od3FXIIVj3IL5RGLNxWtLpyiaSIxIjkVcdwvY6
         R9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793244940; x=1793849740;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9+YkE4e37j9RIT5MOPDzuz7RYslYY/DgjlPAIe4fyA0=;
        b=XkhpvqSsWA+g0JKyl/m2T3Ry0pUot5aVBuMdlhOcWwq/NfYiVVyFP96f2AKJtac6Xr
         nOzceOUMQjJ2pHAQ1IRXfxS1+9JutfHahamVEdBUwxIFh5x0dTI5NX/tmu6qrrkcZw2X
         NSArnv1Lmv6kdjEISsVNtZ7ZjFWnemCQB6X2JEkJG1AtABZbFi0QU3MOYzcetLxqc0Lg
         r0E7ljnu3ai2onKbqI8/6R+1yFhUdUkkm7IkHzeLTmsTG9JY1QCGFcKlbbMWOFvAJ7ky
         UVRee/p1/5Wu69x9/Ydj+bcz2RuXc5qQuGfIVJtTLUadUjhufrqC76nkTdjBTBkjgobN
         AkpA==
X-Gm-Message-State: AFq9FYKgKRuEnXWMCdlxaNU+6ZSOcDXmIO4sRcjXAXq9sdkyYwuYf5qb
	iia01tvKIyY+nVvy33qW9gQzRQLwS6jSAqCT0STfMV7b45eM6VBIvSUmZTX7PefD
X-Gm-Gg: AYBFou2GfKCfQvqO8wDbQIfvmq+0xVBXM1VUWtPndFJWNt8Z6XYrodiGJCOMziDtJaD
	0NTQFWXQMDojJWuRLliOqtiuUGCf9clnRokWmUBnpnu0bUEpPmbRlsqPtygYMY3CUqGGyGKL9DK
	k+/5bOwis+KUpYpf3VtAmTEjcIR3iylv55iButU+JiCspXxB+ztrhISBmKDnHCmfe+PKHOkTKQV
	kjDXlLkFKf57mSWkl5lQtH5jyjCQ+A/8VCva2gbmnb0exEdmYJn0mOjpQzE8twO50et68yGx6EI
	KSHLEm9jXBlIo5dtrQ6hfAtQ6K89bTmoRmKCmXhZApG47LuAqojj2YQC0nF6GPZM0KbDCn1Z0i6
	4iZSCccofTfbfUrB/bIlJC7vqhRG8kB1ldeSsA5vEoqzqs1f7eU7fw94RtH1VguYowobWD7y5tj
	EYlpufLfB/x+qqAq1RVPVfpLmStHS6zSP0IwleUXnHIAqeI1fr3kiW0/Tz2kwf8VXfZnjM4NJhz
	iMtdpqGq4cKv8ulMOyw46ZiaKOviYhPRF0PWehj3i7hvaCOzTwH6yMo+2WM/H8C+Cl5EoYRZC2D
	IfoV/FwBIHO/ob8wkGSo90NHNUH6JO5DGCH90gz1GM3vQR37yi8vXpwJivFtR+FEjAzLskhpZBd
	+RgO5qr0O6AaSBCV4oPP8ta1oPf1YRA1T9e5XVv9lxwiXxq9rx1WlDmdmAJFalurj0RIkzP+zqw
	==
X-Received: by 2002:a05:620a:4044:b0:940:f53d:5eb with SMTP id af79cd13be357-94408ccad65mr670946685a.35.1793244939777;
        Wed, 28 Oct 2026 20:35:39 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f0787d96sm1420504685a.28.2026.10.28.20.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 20:35:37 -0700 (PDT)
Message-ID: <6ae2bf09.0a372733.3ab85e.5e55@mx.google.com>
Date: Wed, 28 Oct 2026 20:35:37 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Prasanth R <ragaprasanth@gmail.com>
Cc: openembedded-core@lists.openembedded.org, prasanth.r@lineo.co.jp
Subject: Re: [PATCH] kernel.bbclass: fix -dev files when KERNEL_PACKAGE_NAME is PN
In-Reply-To: <20261029024010.2113092-1-ragaprasanth@gmail.com>
References: <20261029024010.2113092-1-ragaprasanth@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 03:35:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248875

On Wed, Oct 29, 2026 at 11:40 AM Prasanth R <ragaprasanth@gmail.com> wrote:
>

Can you elaborate on the configuration / build that you are doing that
is triggering this ? You have multiple kernels ? and you are setting
KERNEL_PACKAGE_NAME =3D  "${PN}" as part of that ? How you ran into this
is important for understanding the context. It could be that we can
avoid the issue in another way.

> With KERNEL_PACKAGE_NAME =3D "${PN}", FILES:${KERNEL_PACKAGE_NAME}-dev and
> FILES:${PN}-dev from bitbake.conf become the same variable and the
> bitbake.conf value wins. The same happens for -dbg. The kernel files are
> then not packaged and do_package fails:

Also for -dbg, the bitbake.conf value is a superset of what the kernel class
sets, so nothing is actually lost there. It is just the key collision
warning. Worth saying that, so it is clear that -dev is the real breakage.

>
>   ERROR: linux-yocto-7.2.8+git-r0 do_package: QA Issue: linux-yocto:
>   Files/directories were installed but not shipped in any package:
>     /boot/System.map-7.2.8-yocto-standard
>     /boot/config-7.2.8-yocto-standard
>     /boot/Module.symvers-7.2.8-yocto-standard
>
> This matters when a second kernel recipe. So, Rename the kernel variables
> to the ${PN} names before the keys are expanded, so the kernel values are k=
ept.

This sentence is broken. Can you say who actually sets
KERNEL_PACKAGE_NAME =3D "${PN}" and why? I assume an alternate/second
kernel recipe, but that should be spelled out. This is the specifics
that are hinted at in my opening question.

I'd also like the commit message to explain why an event handler is
needed. My first reaction was that this was more complex than it needed
to be. But key expansion happens (in sorted order) before anonymous python
runs, so by the time __anonymous() sees it, the kernel value is already
gone. Fixing it in anonymous python would also clobber any :append to
FILES:${KERNEL_PACKAGE_NAME}-dev from a bbappend. A :append in the class
keeps the files but still triggers the "Variable key ... replaces original
key" warning on every parse. So renaming before expansion is the right
place. Just say so in the commit, so the next person doesn't have to work
it out again.

>
> Remove the old warning about bug 11905, which was closed as not a bug.

Fine. 11905 is the same key expansion ordering issue, and that is
expected bitbake behaviour, which is why the fix belongs here.

>
> AI-Generated: Uses Claude
> Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
> ---
>
> Notes:
>     Tested on master: without this patch do_package fails with the
>     QA error above; with it the build passes with no warnings and linux-yoc=
to-dev
>     contains System.map, Module.symvers and the config.

Please also confirm the default case (KERNEL_PACKAGE_NAME =3D "kernel") is
unchanged. It should be, since the handler returns early, but it is the
case almost everyone uses.

Also note in the commit that with KERNEL_PACKAGE_NAME =3D "${PN}", the -dev
package no longer picks up the bitbake.conf default -dev contents
(includedir, .so symlinks, etc). That matches what kernel-dev gets
today, so I think it is correct, but it is a behaviour change and should
be stated (and confirmed by testing).

>
>  meta/classes-recipe/kernel.bbclass | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kerne=
l.bbclass
> index 0a6d754108..b018c164fd 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -60,16 +60,23 @@ KERNEL_VERSION_NAME[vardepvalue] =3D "${LINUX_VERSION}"
>  KERNEL_VERSION_PKG_NAME =3D "${@legitimize_package_name(d.getVar('KERNEL_V=
ERSION'))}"
>  KERNEL_VERSION_PKG_NAME[vardepvalue] =3D "${LINUX_VERSION}"
>
> +# With KERNEL_PACKAGE_NAME =3D "${PN}", FILES:${PN}-dev/-dbg from bitbake.=
conf
> +# would replace the kernel values during key expansion, so rename the kern=
el
> +# variables to the ${PN} names first.

Same here. Add a line saying this must run before key expansion
(i.e. it can't live in __anonymous), so nobody "simplifies" it later.

> +python kernel_package_name_handler () {
> +    d =3D e.data
> +    if d.getVar("KERNEL_PACKAGE_NAME") !=3D d.getVar("PN"):
> +        return
> +
> +    for pkg in ("dev", "dbg"):
> +        d.renameVar("FILES:${KERNEL_PACKAGE_NAME}-%s" % pkg, "FILES:${PN}-=
%s" % pkg)
> +}
> +addhandler kernel_package_name_handler
> +kernel_package_name_handler[eventmask] =3D "bb.event.RecipePreFinalise"
> +
>  python __anonymous () {
> -    pn =3D d.getVar("PN")
>      kpn =3D d.getVar("KERNEL_PACKAGE_NAME")
>
> -    # XXX Remove this after bug 11905 is resolved
> -    #  FILES:${KERNEL_PACKAGE_NAME}-dev doesn't expand correctly
> -    if kpn =3D=3D pn:
> -        bb.warn("Some packages (E.g. *-dev) might be missing due to "
> -                "bug 11905 (variable KERNEL_PACKAGE_NAME =3D=3D PN)")
> -

The code itself looks fine. A v2 with the commit message and comment
updates and I'll ack it.

Bruce

> --
> 2.34.1
