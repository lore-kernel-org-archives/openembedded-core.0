Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 182426168E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 23:33:15 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id h4so973961qkm.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 15:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=p7iZPnFMk+1zObqQ2iMQGKPniKbdQw6lEHj0Tbuy86E=;
	b=Hbd3WwEuXFI/5F7XXd8BNqBja3yA49onScUnY/mc8vTukg+3CCiQjLTbQHXYzuc+Vl
	WusbjOZzUTHeU28bggjcqI2mDxYqTuj3js79w7jdEt7VSN8GAZCMOIB2I/8st0x6ecSz
	Z+jsqCIUmCKnLuz5jT2BsSd1FpsFPkW7paR7qixcK6ocJRQ00gXdnYmH+uFXqF9lsaM7
	KU0DJVeLhhCNEFFAUyvE5/IuurjhtxyxZwfkW7AM4Dy/dc1DSo9oLWM+gcItTEp1hG7/
	St9ik3gfNXI3JcGT8/K1WhXwaNzEBYRphMxxnuSSI3juWqppxERBIE0OfOI47t8nRtMe
	t/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=p7iZPnFMk+1zObqQ2iMQGKPniKbdQw6lEHj0Tbuy86E=;
	b=naUSFExz9Fs+klY6tQK9OTSbtfBQcUTsNrDA9wkAze6ksF0smk+jvtSns6zL0hKWMw
	jKxhbbxaJFqLtKiHM9anpQCJboU1SE3o2n/Dq0nRRww3S/UP7Yufq1IfQ6wYVwTRcreP
	CcQjxwySGvrE9Huo79SjJpEPsRqRyIfZL7BaCaEoOhpjNAlztpYMw5iox6vT0RwFtyw0
	ta2pCUsL+fHcibQWs9eu2nC2XiOAQb12OK0hKlwv3rRWWd1VZZzqX5WnCGCApNU21ddU
	k1r7RIf4LKbTzw2o1ZJNU4ySerDqjHEY9JiWVuZLT0lrzMW4/32jxlGiwkBs36aztdWz
	pdTg==
X-Gm-Message-State: APjAAAW9hJtni9kIOlGiOGzMael0GW8SlbL40Cu6pumxYhS0B59O/VPL
	N35Xpeawdq2fYfCdlm+b63wCCCggI88o1KYw09s=
X-Google-Smtp-Source: APXvYqyIA7qkZorFmuBHvdnpAyE2KAoDinBqSPtm+umrdBRONvat8PCKwzL4Y6BDIP5+mLRVSkMPQeF+Kjp06lRtnhc=
X-Received: by 2002:a37:6307:: with SMTP id x7mr1757823qkb.225.1582673596534; 
	Tue, 25 Feb 2020 15:33:16 -0800 (PST)
MIME-Version: 1.0
References: <20200221224537.4052134-1-raj.khem@gmail.com>
	<20200221224537.4052134-3-raj.khem@gmail.com>
	<CAJ86T=WpKBfD119m1G5jgW4Y1UA---WWSc0UkMfRzi8oEiwPTA@mail.gmail.com>
In-Reply-To: <CAJ86T=WpKBfD119m1G5jgW4Y1UA---WWSc0UkMfRzi8oEiwPTA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Feb 2020 15:32:49 -0800
Message-ID: <CAMKF1sqDU3O4MOpmeL110pB651M-Zed+Ja6u3JtFhJgDGOmr2g@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Upgrade Helper <auh@auh.yoctoproject.org>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 25 Feb 2020 23:33:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 25, 2020 at 11:43 AM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Fri, Feb 21, 2020 at 2:46 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > From: Upgrade Helper <auh@auh.yoctoproject.org>
>
> Why does the author sometimes get set to "Upgrade Helper"? It doesn't
> seem to happen very often (4 times in the past 6 years in oe-core).
> What's special about those 4 cases?

well this was an oversight on my part, since the next steps in the
email did suggest

    - amend the patch and sign it off: git commit -s --reset-author --amend

I only did git am -s and then testing

but on a lighter note, it might be worth giving credit to Upgrade
Helper since it did
author the patch, perhaps will keep the AI in these machines happy.

>
> I think it would be clearer if the author was set to whoever ran the tool.
>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../ninja/ninja/fix-musl.patch                | 46 -------------------
> >  .../ninja/{ninja_1.9.0.bb => ninja_1.10.0.bb} |  6 +--
> >  2 files changed, 2 insertions(+), 50 deletions(-)
> >  delete mode 100644 meta/recipes-devtools/ninja/ninja/fix-musl.patch
> >  rename meta/recipes-devtools/ninja/{ninja_1.9.0.bb => ninja_1.10.0.bb} (87%)
> >
> > diff --git a/meta/recipes-devtools/ninja/ninja/fix-musl.patch b/meta/recipes-devtools/ninja/ninja/fix-musl.patch
> > deleted file mode 100644
> > index 7fd779110d..0000000000
> > --- a/meta/recipes-devtools/ninja/ninja/fix-musl.patch
> > +++ /dev/null
> > @@ -1,46 +0,0 @@
> > -From e92a915183f8bff268f74c8cd00d986301a2bbf8 Mon Sep 17 00:00:00 2001
> > -From: makepost <makepost@firemail.cc>
> > -Date: Mon, 24 Dec 2018 03:13:16 +0200
> > -Subject: [PATCH] Use st_mtim if st_mtime is macro, fix #1510
> > -
> > -In POSIX.1-2008, sys_stat has a st_mtim member and a st_mtime backward
> > -compatibility macro. Should help avoid hardcoding platform detection.
> > -
> > -Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> > -
> > -Upstream-Status: Pending
> > ----
> > - src/disk_interface.cc | 14 ++++----------
> > - 1 file changed, 4 insertions(+), 10 deletions(-)
> > -
> > -diff --git a/src/disk_interface.cc b/src/disk_interface.cc
> > -index d4c2fb0..dc297c4 100644
> > ---- a/src/disk_interface.cc
> > -+++ b/src/disk_interface.cc
> > -@@ -202,19 +202,13 @@ TimeStamp RealDiskInterface::Stat(const string& path, string* err) const {
> > -   // that it doesn't exist.
> > -   if (st.st_mtime == 0)
> > -     return 1;
> > --#if defined(__APPLE__) && !defined(_POSIX_C_SOURCE)
> > -+#if defined(_AIX)
> > -+  return (int64_t)st.st_mtime * 1000000000LL + st.st_mtime_n;
> > -+#elif defined(__APPLE__)
> > -   return ((int64_t)st.st_mtimespec.tv_sec * 1000000000LL +
> > -           st.st_mtimespec.tv_nsec);
> > --#elif (_POSIX_C_SOURCE >= 200809L || _XOPEN_SOURCE >= 700 || defined(_BSD_SOURCE) || defined(_SVID_SOURCE) || \
> > --       defined(__BIONIC__) || (defined (__SVR4) && defined (__sun)) || defined(__FreeBSD__))
> > --  // For glibc, see "Timestamp files" in the Notes of http://www.kernel.org/doc/man-pages/online/pages/man2/stat.2.html
> > --  // newlib, uClibc and musl follow the kernel (or Cygwin) headers and define the right macro values above.
> > --  // For bsd, see https://github.com/freebsd/freebsd/blob/master/sys/sys/stat.h and similar
> > --  // For bionic, C and POSIX API is always enabled.
> > --  // For solaris, see https://docs.oracle.com/cd/E88353_01/html/E37841/stat-2.html.
> > -+#elif defined(st_mtime) // A macro, so we're likely on modern POSIX.
> > -   return (int64_t)st.st_mtim.tv_sec * 1000000000LL + st.st_mtim.tv_nsec;
> > --#elif defined(_AIX)
> > --  return (int64_t)st.st_mtime * 1000000000LL + st.st_mtime_n;
> > - #else
> > -   return (int64_t)st.st_mtime * 1000000000LL + st.st_mtimensec;
> > - #endif
> > ---
> > -2.17.1
> > -
> > diff --git a/meta/recipes-devtools/ninja/ninja_1.9.0.bb b/meta/recipes-devtools/ninja/ninja_1.10.0.bb
> > similarity index 87%
> > rename from meta/recipes-devtools/ninja/ninja_1.9.0.bb
> > rename to meta/recipes-devtools/ninja/ninja_1.10.0.bb
> > index f1236e8ac8..bdc6365052 100644
> > --- a/meta/recipes-devtools/ninja/ninja_1.9.0.bb
> > +++ b/meta/recipes-devtools/ninja/ninja_1.10.0.bb
> > @@ -5,11 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
> >
> >  DEPENDS = "re2c-native ninja-native"
> >
> > -SRCREV = "b25c08bda4949192c69cea4cee057887341a2ffc"
> > +SRCREV = "ed7f67040b370189d989adbd60ff8ea29957231f"
> >
> > -SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release \
> > -           file://fix-musl.patch \
> > -"
> > +SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release"
> >  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
> >
> >  S = "${WORKDIR}/git"
> > --
> > 2.25.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

