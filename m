Return-Path: <maksym.kokhan@globallogic.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id D4D1E78C7E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Aug 2018 14:28:37 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id u21-v6so11535611qku.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Aug 2018 07:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=globallogic.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4NcuIcRXAwlY0/TduvXvI3s2eD48h7j93Wu7tP7Y5pg=;
	b=USJNh7nb4ArXyPyASVZNbQIfiDpDnxkdVryNspfpRwYIlLnzNLKA2T3pZUSnJY7cuZ
	BEHVeNwvT58AX18zgohQ9a8OZkvSCLTQAwxcpfrJ7K+TjVgo44w/u+kggPS1Y+i+w41v
	StmFwGGwMd6GS2buKETNc9FjOMvoKVF2Hci+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4NcuIcRXAwlY0/TduvXvI3s2eD48h7j93Wu7tP7Y5pg=;
	b=i7YZIzVbokB5O8RgqK9y7vP3wIf/LGMABZ+OvHk9CkeBpDVeWvgbk9EG4PXKcH1QEQ
	eut3GBjBfk5rQFN1OXRyKPlgDe7f7rqGecNnT68Z4bx5CHmPFZ1hVIDW2ixlLXPdfzx7
	IOzb/4RbqjMIJtGG+84UAU8bE4A26VNhFnxO/839UisDzYpsQtJ4OF9NCkBrlIa6w71k
	DtDpqa3lbPYB6TPhA9jcAyMCTDlIuBPD4g2oqxNjo+/+JVwsF0fACTHENsZPhe46MFNP
	nalh17jaKkj4EUgC8x0kHmQIV8Oev6BCgAgbLUe8CCiEnIgPJEpEJw7iAiSyruRh0Qmz
	W8/A==
X-Gm-Message-State: AOUpUlF0lwLJSUYGLKGl38aE2Sx5huNbUL3g6vrO17U+SKflJL53vag3
	ZacxEPQsnWttIr1MnbkrtF9FyJcc3PGl3lLfyl5hZQ==
X-Google-Smtp-Source: AAOMgpeVDPPZcajZxFzNCZ9LmxQlBDjqg4Ly+7xy/XQI8G84T2Dp671hsOPtYa+T1vlIdqpqRqkdZGYORBHY1a0uoOc=
X-Received: by 2002:a37:9c46:: with SMTP id
	f67-v6mr17509821qke.180.1533652118733; 
	Tue, 07 Aug 2018 07:28:38 -0700 (PDT)
MIME-Version: 1.0
References: <a80f3bf9-abba-fd2c-b1b9-d2327de69f78@intel.com>
	<1533565018-19188-1-git-send-email-maksym.kokhan@globallogic.com>
	<CAJTo0LZJyJneBza8cg3pUTUd04vQ+k270RYAdfrB+j11feCkuA@mail.gmail.com>
In-Reply-To: <CAJTo0LZJyJneBza8cg3pUTUd04vQ+k270RYAdfrB+j11feCkuA@mail.gmail.com>
From: Maksym Kokhan <maksym.kokhan@globallogic.com>
Date: Tue, 7 Aug 2018 17:28:27 +0300
Message-ID: <CAMT6-xiDddxH2ws00ZDM16fdfWQX6etABcb-MbW0BOJ60mvhUA@mail.gmail.com>
To: ross.burton@intel.com
Cc: Ruslan Bilovol <ruslan.bilovol@globallogic.com>,
	Andrii Bordunov <andrii.bordunov@globallogic.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libusb: Add ptest
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
X-List-Received-Date: Tue, 07 Aug 2018 14:28:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 6, 2018 at 7:53 PM Burton, Ross <ross.burton@intel.com> wrote:
>
> The upgrade to libusb 1.0.22 happened in *May* so please do try and
> keep up to date with master.  In this case git did managed to merge
> anyway, but generally that won't be true.

Thank you for your reply, I fixed my mistake so now my patch is up to
date with master, and I sent the final patch v3.

Thanks,
Maksym

>
> Ross
>
> On 6 August 2018 at 15:16, Maksym Kokhan via Openembedded-core
> <openembedded-core@lists.openembedded.org> wrote:
> > The run-ptest script was added to run existing libusb1 tests and libusb1
> > recipe was changed to add ptest support to that package.
> >
> > Signed-off-by: Maksym Kokhan <maksym.kokhan@globallogic.com>
> > Reviewed-by: Andrii Bordunov <andrii.bordunov@globallogic.com>
> > ---
> >  meta/recipes-support/libusb/libusb1/run-ptest | 15 +++++++++++++++
> >  meta/recipes-support/libusb/libusb1_1.0.21.bb | 11 ++++++++++-
> >  2 files changed, 25 insertions(+), 1 deletion(-)
> >  create mode 100755 meta/recipes-support/libusb/libusb1/run-ptest
> >
> > diff --git a/meta/recipes-support/libusb/libusb1/run-ptest b/meta/recipes-support/libusb/libusb1/run-ptest
> > new file mode 100755
> > index 0000000..646a966
> > --- /dev/null
> > +++ b/meta/recipes-support/libusb/libusb1/run-ptest
> > @@ -0,0 +1,15 @@
> > +#!/bin/sh
> > +
> > +echo
> > +echo "---------------------------- libusb1 tests ---------------------------"
> > +echo
> > +
> > +./stress | tr '\n' ' '  | \
> > +sed 's/Starting test run: \([a-zA-Z_]*\)\.\.\. \([a-zA-Z_]*\) (.) /\2 \1\n/g' | \
> > +sed '$d' | \
> > +sed '{
> > +       s/^Success/PASS:/g
> > +       s/^Failure/FAIL:/g
> > +       s/^Error/FAIL:/g
> > +       s/^Skip/SKIP:/g
> > +}'
> > diff --git a/meta/recipes-support/libusb/libusb1_1.0.21.bb b/meta/recipes-support/libusb/libusb1_1.0.21.bb
> > index 1fefd14..56822a6 100644
> > --- a/meta/recipes-support/libusb/libusb1_1.0.21.bb
> > +++ b/meta/recipes-support/libusb/libusb1_1.0.21.bb
> > @@ -10,6 +10,7 @@ BBCLASSEXTEND = "native nativesdk"
> >
> >  SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2 \
> >             file://no-dll.patch \
> > +           file://run-ptest \
> >            "
> >
> >  SRC_URI[md5sum] = "1da9ea3c27b3858fa85c5f4466003e44"
> > @@ -17,7 +18,7 @@ SRC_URI[sha256sum] = "7dce9cce9a81194b7065ee912bcd55eeffebab694ea403ffb91b67db66
> >
> >  S = "${WORKDIR}/libusb-${PV}"
> >
> > -inherit autotools pkgconfig
> > +inherit autotools pkgconfig ptest
> >
> >  # Don't configure udev by default since it will cause a circular
> >  # dependecy with udev package, which depends on libusb
> > @@ -30,6 +31,14 @@ do_install_append() {
> >         fi
> >  }
> >
> > +do_compile_ptest() {
> > +    oe_runmake -C tests stress
> > +}
> > +
> > +do_install_ptest() {
> > +    install -m 755 ${B}/tests/.libs/stress ${D}${PTEST_PATH}
> > +}
> > +
> >  FILES_${PN} += "${base_libdir}/*.so.*"
> >
> >  FILES_${PN}-dev += "${base_libdir}/*.so ${base_libdir}/*.la"
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

