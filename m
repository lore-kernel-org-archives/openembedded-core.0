Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id CDE45617FA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 19:57:10 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id p6so244329vsj.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 11:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=dGKWqgcIDg/aFY1g3nmtJjfrZw6XwNV/yFJolwqlxaM=;
	b=c/5iI95nziJv99pbeXZzbPe8Rrvb3QCyfcfE8wnMGQ1Gs3xv8ZGHQCx5dnRvYD73Ap
	uvyft0SxmUhqa57XXp/4h2u/jF2qCLEaF/gw+nmI0V2fQEBbzgFdVgT6Ouez6REs/7eH
	3KHg8zUZHaMdkXt6kR20woKkcZ7Y/J8nN/741x60UJ9zSmQ8Pndb5/XKDMw2gtGxXch1
	svP2cvaDWO7Z/ALZj79tVEm2PzCl8ikLITYUtD68oQvTjd/udFbgXXQkQrylCgiqR74A
	WzV6uTTx9ot3S3GGFT5gEHfle8ATto6DIX08qi1uAxP6PDl2mNIgguGZdJk4e9mT0QAg
	r0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=dGKWqgcIDg/aFY1g3nmtJjfrZw6XwNV/yFJolwqlxaM=;
	b=cabbwbEaeotEAy60W9+7riaQpBvd/j5w5szexYqOxPag1zlhvgdESjlI7ctm1waF5q
	SfypJeLAXzvazS0EuRheqvz5bGxL7UezlQAJv46Yoyywnvq8o+SzahC9GG+wLWd9mrL8
	jAnD59LuA4tc0RXMXxcux+9x1v9+BbYSrnCm9m31k7lIncgngyH2mc+IKUmiD+doyqsI
	TsdEFjVH7j5IKY/P2A4Qdabb85t3gvMTXu/P76Tv56kOnKxnQYKJpQq4ykHeap7IzQQY
	7dZnmysSLbcnECShCeLEPU+j8tN/Z4Nw/cIt+bXmmTK5qBrx0URAnEHS4Aj/j/5DMiUv
	k3xA==
X-Gm-Message-State: APjAAAV0UwhIAksFRBMTTdN3eojSXRxoqecyXbl5eBWzmTrktIHyw5Py
	76/06kdpzFnTaz/IoBYifP2xWoYSaZ6HSHcLRJo=
X-Google-Smtp-Source: APXvYqwzytnt1Lzo58EG+y/w6pZqDBMMEVuwoCWHwSN9CsRfyJD3IbqtxNO5ULxIn7LyBnBVfgBC7WRMWy6/7PwUMM0=
X-Received: by 2002:a05:6102:a10:: with SMTP id
	t16mr801298vsa.130.1582660631557; 
	Tue, 25 Feb 2020 11:57:11 -0800 (PST)
MIME-Version: 1.0
References: <20200221224537.4052134-1-raj.khem@gmail.com>
	<20200221224537.4052134-3-raj.khem@gmail.com>
	<CAJ86T=WpKBfD119m1G5jgW4Y1UA---WWSc0UkMfRzi8oEiwPTA@mail.gmail.com>
	<CANNYZj9XLm-OyAzMHCDauggbpUVBfnCLq1VXFZjw1eaWM0YyQg@mail.gmail.com>
In-Reply-To: <CANNYZj9XLm-OyAzMHCDauggbpUVBfnCLq1VXFZjw1eaWM0YyQg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 25 Feb 2020 11:56:58 -0800
Message-ID: <CAJ86T=W1n2GoOa7wSdKzZ1rPOr1RkMgAH7b+CKZypXBi66HQag@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] ninja: upgrade 1.9.0 -> 1.10.0
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
X-List-Received-Date: Tue, 25 Feb 2020 19:57:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2020 at 11:47 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> These are the commits produced monthly by a tool called Automated Upgrade=
 Helper and sent directly to recipe maintainers as listed in maintainers.in=
c. When maintainers receive the patches, they're supposed to reset the auth=
or to themselves, but sometimes it doesn't happen.
>
> Search for 'auh' in oe-core list for monthly summaries of AUH work.

Thanks. The maintainers sometimes forgetting to reset the author was
the part I was missing. Maybe the patch checker could be updated to
check for that?

> Alex
>
> On Tue, 25 Feb 2020 at 20:43, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> On Fri, Feb 21, 2020 at 2:46 PM Khem Raj <raj.khem@gmail.com> wrote:
>> >
>> > From: Upgrade Helper <auh@auh.yoctoproject.org>
>>
>> Why does the author sometimes get set to "Upgrade Helper"? It doesn't
>> seem to happen very often (4 times in the past 6 years in oe-core).
>> What's special about those 4 cases?
>>
>> I think it would be clearer if the author was set to whoever ran the too=
l.
>>
>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > ---
>> >  .../ninja/ninja/fix-musl.patch                | 46 ------------------=
-
>> >  .../ninja/{ninja_1.9.0.bb =3D> ninja_1.10.0.bb} |  6 +--
>> >  2 files changed, 2 insertions(+), 50 deletions(-)
>> >  delete mode 100644 meta/recipes-devtools/ninja/ninja/fix-musl.patch
>> >  rename meta/recipes-devtools/ninja/{ninja_1.9.0.bb =3D> ninja_1.10.0.=
bb} (87%)
>> >
>> > diff --git a/meta/recipes-devtools/ninja/ninja/fix-musl.patch b/meta/r=
ecipes-devtools/ninja/ninja/fix-musl.patch
>> > deleted file mode 100644
>> > index 7fd779110d..0000000000
>> > --- a/meta/recipes-devtools/ninja/ninja/fix-musl.patch
>> > +++ /dev/null
>> > @@ -1,46 +0,0 @@
>> > -From e92a915183f8bff268f74c8cd00d986301a2bbf8 Mon Sep 17 00:00:00 200=
1
>> > -From: makepost <makepost@firemail.cc>
>> > -Date: Mon, 24 Dec 2018 03:13:16 +0200
>> > -Subject: [PATCH] Use st_mtim if st_mtime is macro, fix #1510
>> > -
>> > -In POSIX.1-2008, sys_stat has a st_mtim member and a st_mtime backwar=
d
>> > -compatibility macro. Should help avoid hardcoding platform detection.
>> > -
>> > -Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com=
>
>> > -
>> > -Upstream-Status: Pending
>> > ----
>> > - src/disk_interface.cc | 14 ++++----------
>> > - 1 file changed, 4 insertions(+), 10 deletions(-)
>> > -
>> > -diff --git a/src/disk_interface.cc b/src/disk_interface.cc
>> > -index d4c2fb0..dc297c4 100644
>> > ---- a/src/disk_interface.cc
>> > -+++ b/src/disk_interface.cc
>> > -@@ -202,19 +202,13 @@ TimeStamp RealDiskInterface::Stat(const string&=
 path, string* err) const {
>> > -   // that it doesn't exist.
>> > -   if (st.st_mtime =3D=3D 0)
>> > -     return 1;
>> > --#if defined(__APPLE__) && !defined(_POSIX_C_SOURCE)
>> > -+#if defined(_AIX)
>> > -+  return (int64_t)st.st_mtime * 1000000000LL + st.st_mtime_n;
>> > -+#elif defined(__APPLE__)
>> > -   return ((int64_t)st.st_mtimespec.tv_sec * 1000000000LL +
>> > -           st.st_mtimespec.tv_nsec);
>> > --#elif (_POSIX_C_SOURCE >=3D 200809L || _XOPEN_SOURCE >=3D 700 || def=
ined(_BSD_SOURCE) || defined(_SVID_SOURCE) || \
>> > --       defined(__BIONIC__) || (defined (__SVR4) && defined (__sun)) =
|| defined(__FreeBSD__))
>> > --  // For glibc, see "Timestamp files" in the Notes of http://www.ker=
nel.org/doc/man-pages/online/pages/man2/stat.2.html
>> > --  // newlib, uClibc and musl follow the kernel (or Cygwin) headers a=
nd define the right macro values above.
>> > --  // For bsd, see https://github.com/freebsd/freebsd/blob/master/sys=
/sys/stat.h and similar
>> > --  // For bionic, C and POSIX API is always enabled.
>> > --  // For solaris, see https://docs.oracle.com/cd/E88353_01/html/E378=
41/stat-2.html.
>> > -+#elif defined(st_mtime) // A macro, so we're likely on modern POSIX.
>> > -   return (int64_t)st.st_mtim.tv_sec * 1000000000LL + st.st_mtim.tv_n=
sec;
>> > --#elif defined(_AIX)
>> > --  return (int64_t)st.st_mtime * 1000000000LL + st.st_mtime_n;
>> > - #else
>> > -   return (int64_t)st.st_mtime * 1000000000LL + st.st_mtimensec;
>> > - #endif
>> > ---
>> > -2.17.1
>> > -
>> > diff --git a/meta/recipes-devtools/ninja/ninja_1.9.0.bb b/meta/recipes=
-devtools/ninja/ninja_1.10.0.bb
>> > similarity index 87%
>> > rename from meta/recipes-devtools/ninja/ninja_1.9.0.bb
>> > rename to meta/recipes-devtools/ninja/ninja_1.10.0.bb
>> > index f1236e8ac8..bdc6365052 100644
>> > --- a/meta/recipes-devtools/ninja/ninja_1.9.0.bb
>> > +++ b/meta/recipes-devtools/ninja/ninja_1.10.0.bb
>> > @@ -5,11 +5,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da81586a64a=
d4e476c791cda7e2f2c52e"
>> >
>> >  DEPENDS =3D "re2c-native ninja-native"
>> >
>> > -SRCREV =3D "b25c08bda4949192c69cea4cee057887341a2ffc"
>> > +SRCREV =3D "ed7f67040b370189d989adbd60ff8ea29957231f"
>> >
>> > -SRC_URI =3D "git://github.com/ninja-build/ninja.git;branch=3Drelease =
\
>> > -           file://fix-musl.patch \
>> > -"
>> > +SRC_URI =3D "git://github.com/ninja-build/ninja.git;branch=3Drelease"
>> >  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>.*)"
>> >
>> >  S =3D "${WORKDIR}/git"
>> > --
>> > 2.25.1
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

