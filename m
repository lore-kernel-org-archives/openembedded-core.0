Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0A4716058C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2019 15:47:05 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id i5so5736750qkd.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2019 08:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LVheyL802oP8hA7tpABMkSSCn/sEyaK/WQbzUtBk6gw=;
	b=dkA1llZCbNIJ+oxHmM+DHc+qMLif6cXIIx74F0xPGVI2aqNe9mohxckDq4x92Vtqol
	f5Q5fpzDNwCd7+wTK9Eu1FYRfeneKyyoHlNY5Jgemk0dWmwnHA67z3PWjWHg/wTg5/6r
	oQ+UEj5Ftu6XIOP9jffs8AFhRXXiBwWoUj8J2xilrqfuxEPpgZVMw0n8VlFYpDubpek2
	BcBTPFJeoi1eaEAlPCRT4FbP9ScwI7kcM62p6JdkkOqILWACHFHG7O9IPVGIWZz8e6uO
	LCLtgHSOIETlM/L+U9do6V7GNiC/QRsDEUjOqkU8bkr2Yyl3oI8RbAQxVXmUgppSA2G9
	olWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LVheyL802oP8hA7tpABMkSSCn/sEyaK/WQbzUtBk6gw=;
	b=ibssCmZA6XLugwwVAzmd1xPejT/g7dO9ygpa9ldiurSeu0VsMbCSJ65y9Mo6MLyRLu
	+Xw2VfatANsh9hEAMy1Kor6F/8dj48jEZIt2olbd82iju8dMCYMwxHBtXV9x18yZ8fBz
	e9JW8BBTfJ7R91mCsJqWjfxCzNiIsrKAbfSxWYAvMTC3CqQDmmaamc4WHy35ahjW7TQF
	th30ZFwFwr9UhGONgg9p5RFuXHi7CJS50k06x9S+DBgmJiYJMZWEwM84jW0rsapdOSdH
	yVH7wYe2GL2u+C3jnffdls1apNJRnvcmb+udGBi+JS2xnrJqDVHYUmMGnsepa+3j6CeB
	fxDg==
X-Gm-Message-State: APjAAAWddWcnTG0owr77+dOFM0pUipUqc606B94LeJ4EBJEkVyLhzons
	7mdsCBNCxLFV2N0t+oTZy+hHSGdpLrkrunc3hrw=
X-Google-Smtp-Source: APXvYqxS/TWw3VKd4i4ZLmB8tE0xotmoWiVlcpC+x0Qb7DXoXS0NH6UG22mqW5CxKuqIOChO7wb3qjSErnNtOUr0HcA=
X-Received: by 2002:a37:c943:: with SMTP id q64mr3541990qki.2.1552664826731;
	Fri, 15 Mar 2019 08:47:06 -0700 (PDT)
MIME-Version: 1.0
References: <1552592626-25569-1-git-send-email-rbilovol@cisco.com>
	<CAMKF1sp1JRLepD130zWkGgk1=Dx5q2+Fb=2HTwzH0RnEUMWZaQ@mail.gmail.com>
	<4da417cb-276e-eede-b8aa-1f7ad138c6a2@cisco.com>
In-Reply-To: <4da417cb-276e-eede-b8aa-1f7ad138c6a2@cisco.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Mar 2019 08:46:39 -0700
Message-ID: <CAMKF1sqO2Z67f-sxW7AHS8T4e7p5r9rbam=ZaVEQosSS5ZC-=A@mail.gmail.com>
To: Ruslan Bilovol <rbilovol@cisco.com>
Cc: XE-Linux <xe-linux-external@cisco.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libnss-nisplus: Add recipe
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
X-List-Received-Date: Fri, 15 Mar 2019 15:47:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 15, 2019 at 7:14 AM Ruslan Bilovol <rbilovol@cisco.com> wrote:
>
> On 3/14/19 11:42 PM, Khem Raj wrote:
> >
> >
> > On Thu, Mar 14, 2019 at 12:43 PM Ruslan Bilovol <rbilovol@cisco.com
> > <mailto:rbilovol@cisco.com>> wrote:
> >
> >     Same as with libnss-nis - this will substitute
> >     the glibc nisplus module which has been removed
> >
> >     SRCREV points to 1.3 release plus patch on top which
> >     allows to build with recent glibc versions
> >
> >
> > This looks okay but not
> > An Oe core candidate to me
>
> This recipe is very similar to libnss-nis which is a part
> of OE-Core. Do you mean we need to move both out of
> OE-Core (to meta-oe?)

if its required to build a reference image in OE-core or there are
multiple recipes outside oe-core in multiple layers which needs it
would make a good case for it. If both of these cases are not true
then not so much.

>
> Thanks,
> Ruslan
>
> >
> >
> >
> >     Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com
> >     <mailto:rbilovol@cisco.com>>
> >     ---
> >       .../libnss-nisplus/libnss-nisplus.bb <http://libnss-nisplus.bb>
> >                 | 31 ++++++++++++++++++++++
> >       1 file changed, 31 insertions(+)
> >       create mode 100644
> >     meta/recipes-extended/libnss-nisplus/libnss-nisplus.bb
> >     <http://libnss-nisplus.bb>
> >
> >     diff --git a/meta/recipes-extended/libnss-nisplus/libnss-nisplus.bb
> >     <http://libnss-nisplus.bb>
> >     b/meta/recipes-extended/libnss-nisplus/libnss-nisplus.bb
> >     <http://libnss-nisplus.bb>
> >     new file mode 100644
> >     index 0000000..2dbeee7
> >     --- /dev/null
> >     +++ b/meta/recipes-extended/libnss-nisplus/libnss-nisplus.bb
> >     <http://libnss-nisplus.bb>
> >     @@ -0,0 +1,31 @@
> >     +# Copyright (C) 2019 Ruslan Bilovol <rbilovol@cisco.com
> >     <mailto:rbilovol@cisco.com>>
> >     +# Released under the MIT license (see COPYING.MIT for the terms)
> >     +
> >     +SUMMARY = "NSS module for glibc, to provide NIS+ support for glibc"
> >     +
> >     +DESCRIPTION = "This package contains the NSS NIS+ plugin for glibc.\
> >     +This code was formerly part of glibc, but is now standalone to\
> >     +be able to link against TI-RPC for IPv6 support."
> >     +
> >     +HOMEPAGE = "https://github.com/thkukuk/libnss_nisplus"
> >     +LICENSE = "LGPL-2.1"
> >     +LIC_FILES_CHKSUM =
> >     "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
> >     +SECTION = "libs"
> >     +DEPENDS += "libtirpc libnsl2"
> >     +
> >     +PV = "1.3+git${SRCPV}"
> >     +
> >     +SRCREV = "c6934373c7bac91499ff7bbe7d2439599325ca63"
> >     +
> >     +SRC_URI = "git://github.com/thkukuk/libnss_nisplus
> >     <http://github.com/thkukuk/libnss_nisplus> \
> >     +          "
> >     +
> >     +S = "${WORKDIR}/git"
> >     +
> >     +inherit autotools pkgconfig
> >     +
> >     +BBCLASSEXTEND += "native nativesdk"
> >     +#
> >     +# We will skip parsing this packagegeoup for non-glibc systems
> >     +#
> >     +COMPATIBLE_HOST_libc-musl = 'null'
> >     --
> >     1.9.1
> >

