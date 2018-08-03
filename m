Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id EF09278BD5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Aug 2018 18:39:10 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id 13-v6so2059143qkl.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Aug 2018 11:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=aTbAwQqApfnsR/cclbTwfr3dk4bhi+AgkYrAb2VeuE4=;
	b=PmFEfO4t8Rbf7TmgDxTQmzpuGds825szcdN5Kb7CZe+05r9bBmBYeZQ6q3aBqS2W5C
	Bz4lHmAcZSOKHmt0nMibDuSRfYl9lpTWMoAQNWpSbhVs7AyHCmSQ8ozlUpcgBFDCNkvx
	V8+XhtqhJNulHK0MOSWB8h7KBDgjZR3mYKnhZPbv7tIoD7fqLnL2XesbcY0ArvTR88Bv
	5y+mf65FZ3FybITyv5mkTffV2+M5Tugl/VSsGIH5rAEDeb1iogThty/mevyf+j6V3kw3
	dQDM9EqsOwaxZLI7I5BCP90F3GY4qoPtukoprbfMATSXP/WY9Faa4wybJliIVogtPF8d
	5KMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=aTbAwQqApfnsR/cclbTwfr3dk4bhi+AgkYrAb2VeuE4=;
	b=iDm3cEqMICvVAW87dMqMPYIUqM49+6MqATd2UKzsabVV/DTvF8NlPv0QQh406ZVxzr
	+N66xJpN7od9c/fC898iX1XNVlCwqqmauTYJ8hSzwxBkMcz2xnjf8dOnISqPyo04uOvI
	Wxfs9P9HISwD/lbf7Q2WRgjuvcZPUSYwleIoCc9JcyuT0un5VOnJ4XPDyfgLsddbjoQz
	9j8OFDKsX0YNf5DskXidcwdd/l73OJyF5K9QmV61s2eMJy691/2xuULCsP44oBjABMTS
	LKpWlGCz2kgHIbjYMgRJhCX4iy1RToWx+rjwgLSHspz3hQMfOB/u5SDPAzVWPY84HTSL
	WZYQ==
X-Gm-Message-State: AOUpUlGGg3Tc87n3nx2CuWAgmWmx5buqb+mBxtDhYmcBb0QpKXzC9teg
	eQQuw522QJpL3sbRefSdbu4XHsyH0MKxmqSBZlI=
X-Google-Smtp-Source: AAOMgpeIzimMWWEfBVlIfpPBI4bNnFc3t5USvaLgJ1WBhSqR44PWozv2Re+5AeF2W5PBDQ5kOONECP+9rqpexUPzFjE=
X-Received: by 2002:a37:4a94:: with SMTP id
	x142-v6mr4716406qka.110.1533321551506; 
	Fri, 03 Aug 2018 11:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <20180803173014.20748-1-raj.khem@gmail.com>
	<CAJTo0La79XMhGOVqHiinp7TKJM=1BD2zg5dZACecao7C9RLDsQ@mail.gmail.com>
In-Reply-To: <CAJTo0La79XMhGOVqHiinp7TKJM=1BD2zg5dZACecao7C9RLDsQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Aug 2018 11:38:45 -0700
Message-ID: <CAMKF1sooh5sExwGxT4VH87jqosYiRtGDcTXz=sHt13g7csbehg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libidn2: Fix charset.alias issue with musl
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
X-List-Received-Date: Fri, 03 Aug 2018 18:39:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 3, 2018 at 11:17 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> Has that actually been fixed in gnulib yet?
>

haven't check lately but few months back it is not fixed yet.

> Ross
>
> On 3 August 2018 at 18:30, Khem Raj <raj.khem@gmail.com> wrote:
> > Fixes
> > ERROR: libidn2-2.0.5-r0 do_package: QA Issue: libidn2: Files/directories were installed but not shipped in any packag
> > e:
> >   /usr/lib/charset.alias
> > Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or del
> > ete them within do_install.
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  ...charset_alias-when-building-for-musl.patch | 23 +++++++++++++++++++
> >  meta/recipes-extended/libidn/libidn2_2.0.5.bb |  4 +++-
> >  2 files changed, 26 insertions(+), 1 deletion(-)
> >  create mode 100644 meta/recipes-extended/libidn/libidn2/Unset-need_charset_alias-when-building-for-musl.patch
> >
> > diff --git a/meta/recipes-extended/libidn/libidn2/Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/libidn/libidn2/Unset-need_charset_alias-when-building-for-musl.patch
> > new file mode 100644
> > index 0000000000..ace50bbfde
> > --- /dev/null
> > +++ b/meta/recipes-extended/libidn/libidn2/Unset-need_charset_alias-when-building-for-musl.patch
> > @@ -0,0 +1,23 @@
> > +Unset need_charset_alias when building for musl
> > +
> > +localcharset uses ac_cv_gnu_library_2_1 from glibc21.m4
> > +which actually shoudl be fixed in gnulib and then all downstream
> > +projects will get it eventually. For now we apply the fix to
> > +coreutils
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +Index: libidn2-2.0.5/unistring/Makefile.am
> > +===================================================================
> > +--- libidn2-2.0.5.orig/unistring/Makefile.am
> > ++++ libidn2-2.0.5/unistring/Makefile.am
> > +@@ -293,7 +293,7 @@ install-exec-localcharset: all-local
> > +         case '$(host_os)' in \
> > +           darwin[56]*) \
> > +             need_charset_alias=true ;; \
> > +-          darwin* | cygwin* | mingw* | pw32* | cegcc*) \
> > ++          darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
> > +             need_charset_alias=false ;; \
> > +           *) \
> > +             need_charset_alias=true ;; \
> > diff --git a/meta/recipes-extended/libidn/libidn2_2.0.5.bb b/meta/recipes-extended/libidn/libidn2_2.0.5.bb
> > index aaf9ecd7e7..0d7bddbc7f 100644
> > --- a/meta/recipes-extended/libidn/libidn2_2.0.5.bb
> > +++ b/meta/recipes-extended/libidn/libidn2_2.0.5.bb
> > @@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ab90e75ef97cc6318ce4f2fbda62fe4d \
> >                      file://src/idn2.c;endline=16;md5=0283aec28e049f5bcaaeee52aa865874 \
> >                      file://lib/idn2.h.in;endline=27;md5=c2cd28d3f87260f157f022eabb83714f"
> >
> > -SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz"
> > +SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz \
> > +           file://Unset-need_charset_alias-when-building-for-musl.patch \
> > +          "
> >  SRC_URI[md5sum] = "eaf9a5b9d03b0cce3760f34b3124eb36"
> >  SRC_URI[sha256sum] = "53f69170886f1fa6fa5b332439c7a77a7d22626a82ef17e2c1224858bb4ca2b8"
> >
> > --
> > 2.18.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

