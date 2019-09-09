Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8A1676A441
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2019 14:22:35 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id n7so16351301qtb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2019 07:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Ktz7SgWxFtbQ5XXHKe5fj/T+OeQYCUMfWxCclUROLS8=;
	b=gcvMXV8iR+dmxaMNkhS+2q7r3fMDp+lFxEYCHWaPlRg+q0yhrBO3xuovFTgdV5i6QD
	uoXtGfwuQmlDV/JfushkXkvApfdSTyf0pxb4xdkpqBuIw8I041TWVt/40M+SK+2qeMo5
	cTMzhSprzlEhMaoVx5YBDvttJEWlR4AAst01gFA700sfpDYlEbrEdKMxwKTlkFJP9UVX
	gpC6aQbzs1RbVocWbmZhSITXIsH6zFuxELmqKSM6HpN1UUkgP1NrZeAL4vyWAId5Ub5O
	RqzkR9q/BBZES7MM3+LN8fjw3SVTx4OMzbnDCkY/fQnwDjYbBf3+fhWz8miHN4C9G4ON
	/VNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ktz7SgWxFtbQ5XXHKe5fj/T+OeQYCUMfWxCclUROLS8=;
	b=Y6gnSs+9FOIz+tEJSDVoxRDIJQTbNkO6tKcuwGO69inRZCqpdkCGEh/mZVxYTSzUb6
	rap+TALq8VBe7G3DMGNqMhoxDvWpJQ4I1WZN+FnDX54GJdNGHuMpj1ZDUr66v0fzhMfi
	pz1Pu8sDkmQXMCvQiiu0d3DnlBY3PVNdfboSyGJGkv4aiFaKzqNtUmQUe4DVmCOBtxMu
	l8Z0jLTiz3J6Q0tW4g+yyBLqxtSsRm1ePkPjTXsHQW4BHhhr0M4TGdI7W/gFjDqsKAN+
	C+H5jCuJ4aSTqiXHWhd+n/c7i9dYpi7lLpcu8hasZ/Q95wrN6i0AJxDqUPmKUq/EGNoJ
	lTxQ==
X-Gm-Message-State: APjAAAVJOEr8S3Xffw4zadMRo2FsQ4dwFOgeaD6jMgPxQwPIMjTGERyH
	bDsP0TvUuYu9jZ8q8MG9HmAfyOdk7X2iWQXJqOI=
X-Google-Smtp-Source: APXvYqwTHFF84Q7J/jNkSkIE7DRNIyFafoa5Q2r1waeJl4dcNWS4vxrUo3VvnJH1vKHTkhhVoj26cJwPQpyFcBUqgmw=
X-Received: by 2002:ac8:41cd:: with SMTP id o13mr5662548qtm.80.1568038955346; 
	Mon, 09 Sep 2019 07:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190908232331.2295-1-raj.khem@gmail.com>
	<79b2c2ab-df72-fdcf-d859-d2cdde905ef7@intel.com>
In-Reply-To: <79b2c2ab-df72-fdcf-d859-d2cdde905ef7@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Sep 2019 07:22:09 -0700
Message-ID: <CAMKF1sr=5UXBSgy0zMMfM7G5UFrMewMupZseZ-33E0=HPJM2JA@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] elfutils: Fix build on ppc/musl
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
X-List-Received-Date: Mon, 09 Sep 2019 14:22:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 9, 2019 at 2:52 AM Ross Burton <ross.burton@intel.com> wrote:
>
> There's a 0.177 upgrade on the list (and in mut), is this required for
> that too?
>

if the patch which we are removing with this change is used
then yes it is needed.

> Ross
>
> On 09/09/2019 00:23, Khem Raj wrote:
> > musl relies on the pt_regs definitions from kernel ptrace headers
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >   .../elfutils/elfutils_0.176.bb                |  1 +
> >   ...cliude-asm-ptrace.h-for-pt_regs-defi.patch | 32 +++++++++++++++++++
> >   2 files changed, 33 insertions(+)
> >   create mode 100644 meta/recipes-devtools/elfutils/files/0001-ppc_initreg.c-Incliude-asm-ptrace.h-for-pt_regs-defi.patch
> >
> > diff --git a/meta/recipes-devtools/elfutils/elfutils_0.176.bb b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
> > index d98457e3f9..fe810282bc 100644
> > --- a/meta/recipes-devtools/elfutils/elfutils_0.176.bb
> > +++ b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
> > @@ -29,6 +29,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
> >              file://debian/disable_werror.patch \
> >              file://debian/testsuite-ignore-elflint.diff \
> >              file://0001-skip-the-test-when-gcc-not-deployed.patch \
> > +           file://0001-ppc_initreg.c-Incliude-asm-ptrace.h-for-pt_regs-defi.patch \
> >              file://run-ptest \
> >              file://ptest.patch \
> >              "
> > diff --git a/meta/recipes-devtools/elfutils/files/0001-ppc_initreg.c-Incliude-asm-ptrace.h-for-pt_regs-defi.patch b/meta/recipes-devtools/elfutils/files/0001-ppc_initreg.c-Incliude-asm-ptrace.h-for-pt_regs-defi.patch
> > new file mode 100644
> > index 0000000000..3303333c45
> > --- /dev/null
> > +++ b/meta/recipes-devtools/elfutils/files/0001-ppc_initreg.c-Incliude-asm-ptrace.h-for-pt_regs-defi.patch
> > @@ -0,0 +1,32 @@
> > +From 2e2232d0935bf8ef6e66ebffba3be68a73b5b3e5 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Sun, 8 Sep 2019 15:57:59 -0700
> > +Subject: [PATCH] ppc_initreg.c: Incliude asm/ptrace.h for pt_regs definition
> > +
> > +Fixes
> > +| ../../elfutils-0.176/backends/ppc_initreg.c:79:22: error: field 'r' has incomplete type
> > +|       struct pt_regs r;
> > +|                      ^
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + backends/ppc_initreg.c | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/backends/ppc_initreg.c b/backends/ppc_initreg.c
> > +index 0e0d359..e5cca7e 100644
> > +--- a/backends/ppc_initreg.c
> > ++++ b/backends/ppc_initreg.c
> > +@@ -33,6 +33,7 @@
> > + #include <stdlib.h>
> > + #if defined(__powerpc__) && defined(__linux__)
> > + # include <sys/ptrace.h>
> > ++# include <asm/ptrace.h>
> > + # include <sys/user.h>
> > + #endif
> > +
> > +--
> > +2.23.0
> > +
> >
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

