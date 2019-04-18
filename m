Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1D3AA6BA10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2019 14:37:57 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id h18so1801342lfj.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2019 07:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OCOC1VVGFw2XTwsJGp1zv3t6oqlxD1Wl+soXPdRFx2E=;
	b=cD8kose/BkTB29p3eJX1qUfd5M/baFkxbKDxwCkhVsJah3/styBpltiA1Wtt8lBiwz
	2V6L3KKTNYvV4H4uHmAzbYUgcHFXEVwCGSULFHhr2TbXkCa1Vn/+CycALn0FoV+jRhK6
	CKC+x59hK39SH55URgUWvb8UfukSQR1l1tWalTGCCOwcUNJRoCI5tzSROWQBRBnZK3lc
	xLul+UnOQNLsU51wH/g+bk+UdktMa5EPX47vrnl9EFO2pm2gDkN3mLZV8oVJl8H53Lj/
	UYoPyjtYPE7FIQnOHRfZxV4q1UJ3IXQh/r3km0089jh7ySdfrYh9iUC7vpVugMESYFCz
	ZUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OCOC1VVGFw2XTwsJGp1zv3t6oqlxD1Wl+soXPdRFx2E=;
	b=aafp8K/9rkcArNLWEQ4Y21n/DRFccrBWP4Kvk7HsW9gPj3AbbD+YPx5QxxI+m0W63f
	QunETquZ4su77pG/x2+d2wSPyXkA4WJm6FkS4oVYHSTGqVOtB3h9HM0EAGuFdPEpL8PE
	ytSDMxTmVinQ/phMEIr8BtaZCwC92JVMjOqDio7ect4uwdrnKDC8at15RHao39agDZ4W
	fqhlkBfFlB2xcTRpewSEDLqand7lpD+E1R7mGCYEwAPbXKqJn/a0uyyH7z6bZ1+sFIHz
	Y0kfKOIL7w+TiC7KzuY/Asoudhsh0Sddsqqjr8rTmN5Yl4Bk5nv57yN0Vb5CFPd/IcHA
	QVQw==
X-Gm-Message-State: APjAAAWnvgLWWoLlMx4rjDb7ESXRD9GWK2Rs02zlBiPvIUXdX5BU2CKO
	vCLhOc3JkqH85VVc49c5pftHnZTScFQys4wxPcY=
X-Google-Smtp-Source: APXvYqxH3I/5LHVDPIseoUs/AkHJPKFzDI5vPbcDQfrBLyQ2MbgHR8gZkuwiYLQTemoPaV2vjzjeMZIx7X1q8IZRiZk=
X-Received: by 2002:a19:4b84:: with SMTP id y126mr10436487lfa.15.1555598277761;
	Thu, 18 Apr 2019 07:37:57 -0700 (PDT)
MIME-Version: 1.0
References: <SL2P216MB028292C44E997FA682A1C8DADD260@SL2P216MB0282.KORP216.PROD.OUTLOOK.COM>
	<CANNYZj_nwJpa_Yj-8_YYnu194c_3GSdb1iCg5EkDhXOCjh_ZzQ@mail.gmail.com>
	<307926a6c77f2ab0af46fa2f668b73bf4ddf0731.camel@gmail.com>
In-Reply-To: <307926a6c77f2ab0af46fa2f668b73bf4ddf0731.camel@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 18 Apr 2019 07:37:27 -0700
Message-ID: <CAKmqyKNqNRumrm6Bf0EnSCQVKViZnF5buDG9TAuzz8rCMJLxpA@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] u-boot: Fix missing Python.h build failure
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
X-List-Received-Date: Thu, 18 Apr 2019 14:37:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 18, 2019 at 7:29 AM Joshua Watt <jpewhacker@gmail.com> wrote:
>
> On Thu, 2019-04-18 at 14:16 +0200, Alexander Kanavin wrote:
> > Can we take this opportunity to teach u-boot to use Python 3.x
> > instead? oe-core is trying to eliminate Python 2.x dependencies
> > everywhere.
>
> It looks like the libfdt code in u-boot currently requires Python 2, so
> it would be an unstream change to convert it to Python 3. It also
> appears to be compiling a C module to work with Python 2 so its
> probably not as simple as "convert the script".

Agreed, the u-boot Maintainers added a patch to specifically use
Python2 recently so I think we are stuck with Python2 here until
upstream u-boot is updated.

Alistair

>
>
> >
> > Alex
> >
> > On Thu, 18 Apr 2019 at 13:38, Alistair Francis <
> > alistair@alistair23.me> wrote:
> > > Signed-off-by: Alistair Francis <alistair@alistair23.me>
> > > ---
> > >  meta/recipes-bsp/u-boot/u-boot.inc | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-
> > > bsp/u-boot/u-boot.inc
> > > index 96c1f94011..9a754fd09b 100644
> > > --- a/meta/recipes-bsp/u-boot/u-boot.inc
> > > +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> > > @@ -13,7 +13,7 @@ DEPENDS += "swig-native python-native"
> > >
> > >  EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX}
> > > CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" V=1'
> > >  EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS}
> > > ${BUILD_LDFLAGS}"'
> > > -EXTRA_OEMAKE += 'PYTHON=nativepython
> > > STAGING_INCDIR=${STAGING_INCDIR_NATIVE}
> > > STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE}'
> > > +EXTRA_OEMAKE += 'PYTHON2=nativepython
> > > STAGING_INCDIR=${STAGING_INCDIR_NATIVE}
> > > STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE}'
> > >
> > >  PACKAGECONFIG ??= "openssl"
> > >  # u-boot will compile its own tools during the build, with
> > > specific
> > > --
> > > 2.20.1
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> Joshua Watt <JPEWhacker@gmail.com>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

