Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id D72D76D61B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 14:35:11 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id l7so4869141oil.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 07:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=o04VRq+ZTcNH4WnqOk0jeJVOiGcTpgJSnptQhRW2kFE=;
	b=dc95qqfFGDaHLYOMJa75U1yTj7V9gLA3z4ZJCta5UMS2Vv59UrAoNZjABZhjLYTHcq
	7YTwI6ALHWvmBV5Tqq0sRVcVv/37fZUDtKa+jZqwnZpjG4XCyrHJeecc+Fqo7MgMal+/
	YyySlhxlVlcsnpnAoe8HHxKIO2mVMfo1ey6MX0+QDzyIG3mediX0d3NVoFKU0OkRJ8EA
	Z2wJa0/x9FBosFRs0EhggYmThgA4WU1/6ddgDq626z7nYoKkWRiw3rXXMkQXCL8aSPFI
	LfUmgUOLPVOWJ9Swt+2eArHrPfgYQufBTURbbuH/4bDBPHJi5uf7FXCbAbeG7uotrcXc
	Ljmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=o04VRq+ZTcNH4WnqOk0jeJVOiGcTpgJSnptQhRW2kFE=;
	b=W25omcN9Qnlt+6pmsi4kwTm/VlgOaWHI0KVw29CweaSQArTM+zplbYfvf5uXlefTCE
	2xMoWpn98yVtCdntkPSH0erL+d3k4nk8jsFHCQG0fYgCGHZoJql6nYCAvOJ2hd5vcmMP
	AR0cBaQCsG2k7Bfm/BFloMaxsjgnF9bNyXpAFwbcdyCzcw1JGxtjQA6DxziS8Q9Xb9sZ
	Z1Jm4NW0xxDSaL/YQkZF/Pnkt21BSTKhvdhqKk7gZhprfu0mFRTEZwuDo6kSiDg4PNR1
	iaRerjndWzkEOyRNfE2YlGww7mbd3Q8MVqa0z2wkOtez3py5PBX/Ljc7BgHAIElA2aBK
	QASw==
X-Gm-Message-State: APjAAAUB7bSdA/NMnDmbbAbprIF/gbJRRywtUN4Z3uYX1y/JNvU33Zkn
	NdNPcpMAiKA/kVOeEhDdOGWuUjdzkeA+YUUNT0Z0BveG
X-Google-Smtp-Source: APXvYqwJrFaoDWd0NCJ+9yLsCBAgp5ryi3wO8/9sp7Eo4tb3XeOPv9qgo3fmXTTzv1lYT3iT4X5xkWEqDVwcIfxgN84=
X-Received: by 2002:aca:e689:: with SMTP id d131mr6046766oih.132.1556116512638;
	Wed, 24 Apr 2019 07:35:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190323163858.15371-1-open.source@oleksandr-kravchuk.com>
	<CAJTo0LaYdMRz41qeojHLsv9zj+VL6u7EL8LwM3=JKnKcriw_bQ@mail.gmail.com>
	<891ea63e-134f-ded4-b0a7-f1c75022d4cd@oleksandr-kravchuk.com>
In-Reply-To: <891ea63e-134f-ded4-b0a7-f1c75022d4cd@oleksandr-kravchuk.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Apr 2019 16:35:01 +0200
Message-ID: <CANNYZj-Ld+RK=H1+Z1LNyJ9q0MobGU7nWVqRJxekRA3YLAvuSw@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] ninja: upate to 1.9.0
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
X-List-Received-Date: Wed, 24 Apr 2019 14:35:12 -0000
Content-Type: text/plain; charset="UTF-8"

Master is never force pushed to and always has a linear history, so
any changes need to apply cleanly to the latest commit in it.

Alex

On Wed, 24 Apr 2019 at 16:31, Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Sure. It's already in master though.
>
> Should I send a new patch or just a diff with master?
>
> On 23/04/2019 11:26, Burton, Ross wrote:
> > On Sat, 23 Mar 2019 at 16:39, Oleksandr Kravchuk
> > <open.source@oleksandr-kravchuk.com> wrote:
> >> +++ b/meta/recipes-devtools/ninja/ninja/fix-musl.patch
> >> @@ -0,0 +1,39 @@
> >> +2ff54ad7478a90bd75c91e434236a Mon Sep 17 00:00:00 2001
> >> +From: makepost <makepost@firemail.cc>
> >> +Date: Mon, 24 Dec 2018 03:13:16 +0200
> >> +Subject: [PATCH] Use st_mtim if st_mtime is macro, fix #1510
> >> +
> >> +In POSIX.1-2008, sys_stat has a st_mtim member and a st_mtime backward
> >> +compatibility macro. Should help avoid hardcoding platform detection.
> >> +---
> >> + src/disk_interface.cc | 14 ++++----------
> >> + 1 file changed, 4 insertions(+), 10 deletions(-)
> >> +
> >> +diff --git a/src/disk_interface.cc b/src/disk_interface.cc
> >> +index d4c2fb087..dc297c449 100644
> >> +--- src/disk_interface.cc
> >> ++++ /src/disk_interface.cc
> >> +@@ -202,19 +202,13 @@ TimeStamp RealDiskInterface::Stat(const string& path, string* err) const {
> >> +   // that it doesn't exist.
> >> +   if (st.st_mtime == 0)
> >> +     return 1;
> >> +-#if defined(__APPLE__) && !defined(_POSIX_C_SOURCE)
> >> ++#if defined(_AIX)
> >> ++  return (int64_t)st.st_mtime * 1000000000LL + st.st_mtime_n;
> >> ++#elif defined(__APPLE__)
> >> +   return ((int64_t)st.st_mtimespec.tv_sec * 1000000000LL +
> >> +           st.st_mtimespec.tv_nsec);
> >> +-#elif (_POSIX_C_SOURCE >= 200809L || _XOPEN_SOURCE >= 700 || defined(_BSD_SOURCE) || defined(_SVID_SOURCE) || \
> >> +-       defined(__BIONIC__) || (defined (__SVR4) && defined (__sun)) || defined(__FreeBSD__))
> >> +-  // For glibc, see "Timestamp files" in the Notes of http://www.kernel.org/doc/man-pages/online/pages/man2/stat.2.html
> >> +-  // newlib, uClibc and musl follow the kernel (or Cygwin) headers and define the right macro values above.
> >> +-  // For bsd, see https://github.com/freebsd/freebsd/blob/master/sys/sys/stat.h and similar
> >> +-  // For bionic, C and POSIX API is always enabled.
> >> +-  // For solaris, see https://docs.oracle.com/cd/E88353_01/html/E37841/stat-2.html.
> >> ++#elif defined(st_mtime) // A macro, so we're likely on modern POSIX.
> >> +   return (int64_t)st.st_mtim.tv_sec * 1000000000LL + st.st_mtim.tv_nsec;
> >> +-#elif defined(_AIX)
> >> +-  return (int64_t)st.st_mtime * 1000000000LL + st.st_mtime_n;
> >> + #else
> >> +   return (int64_t)st.st_mtime * 1000000000LL + st.st_mtimensec;
> >> + #endif
> > This patch has no Signed-off-by or Upstream-Status.  Can you add those please?
> >
> > Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

