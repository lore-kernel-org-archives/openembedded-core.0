Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 078297D006
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Apr 2019 17:12:01 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id g7so7712633qtc.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Apr 2019 10:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Zq3tEc8qLT6iHtg7c1vKb56/s1pu00XsoJRSY1bbEoo=;
	b=qhe66Ke8I2LJ1RkAgSUfeSvOVZiFp04ad2HRIuAIDqEQJpKf2a7xGolDdcJ7B7b6uJ
	kG3eFX4G+4kRWvxVrXqLFyxsZSM/BtB+a1kwNtBYFuCAWl9ctjOPisc9p1KrptnSpuVZ
	jb9h3YWRYyXDT4xvrOgmpPLbqPNx3RebPPBBZZEXB0fkNpe6Jiet1AwDpoXgTxxy9JYu
	b4rR1ssEd+k2lcvIQYFFQjGG1DI/wWvbF3RjmC1BpXVvEgD13Ym3ddpcYpkj32CLCjZj
	DC2ohvcHlM0S0kjnRyC3UfxtI7fRJQblGhXu22beWyrwsk03AiYp1gw8Y1xBrtUHEEGM
	fuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Zq3tEc8qLT6iHtg7c1vKb56/s1pu00XsoJRSY1bbEoo=;
	b=geWW3MdOzz5z6Z2s5kjCMsRSQv6ClY+eWev0pavNd8LX3YwxX4vdH9vpWyc/MxO1TP
	TlsUjVLxiErZL47VLwiMRvFEs5TaEmGxlCMMXGfVa5juExFG5Q79IRoU5IX7VHSrNe8P
	tmhRIb25J9yGYurrC/jYjV4IzqkrBZavOIijtJD51fkzP/JuxWDT296oOA9HaBEqIDkx
	x4dWJCxMUSZUK8dUNCUF8fdkG3ceYkUxmM4k4NiODRzoAlEak/zxpzI5E7BX3aaDniZb
	lCSBC6IpCyModZYBIng19BrXgj4XMPvnRj2GAKOyP77coOHUJSkVGIoqFNFCvMnrbTVn
	KP3w==
X-Gm-Message-State: APjAAAX6VfdzUBbyqdXsld6CMsiOs2RCoQuc+y/0HOffnrWjOjQOuQyC
	7qkCjtyyd2+d+OVUG5olUYols9HM7o+7RRfL/AU=
X-Google-Smtp-Source: APXvYqyUS3UoYDWsdK9FVaMe2znoibyTss2JB7inXSfz0GXbv3avk+H52NBV/mUa9dwUKtW/EH8eW27P/okcvpZ8Tjw=
X-Received: by 2002:a0c:92f9:: with SMTP id c54mr11232916qvc.194.1556385122677;
	Sat, 27 Apr 2019 10:12:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190323163858.15371-1-open.source@oleksandr-kravchuk.com>
	<CAJTo0LaYdMRz41qeojHLsv9zj+VL6u7EL8LwM3=JKnKcriw_bQ@mail.gmail.com>
	<891ea63e-134f-ded4-b0a7-f1c75022d4cd@oleksandr-kravchuk.com>
	<CANNYZj-Ld+RK=H1+Z1LNyJ9q0MobGU7nWVqRJxekRA3YLAvuSw@mail.gmail.com>
In-Reply-To: <CANNYZj-Ld+RK=H1+Z1LNyJ9q0MobGU7nWVqRJxekRA3YLAvuSw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 27 Apr 2019 10:11:36 -0700
Message-ID: <CAMKF1sqkbMKJ0H3xeasVK=xcmAQ6qBnkty13Bm-PjLYc=rtCSw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
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
X-List-Received-Date: Sat, 27 Apr 2019 17:12:02 -0000
Content-Type: text/plain; charset="UTF-8"

another issue I see

https://errors.yoctoproject.org/Errors/Details/238569/

On Wed, Apr 24, 2019 at 7:35 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Master is never force pushed to and always has a linear history, so
> any changes need to apply cleanly to the latest commit in it.
>
> Alex
>
> On Wed, 24 Apr 2019 at 16:31, Oleksandr Kravchuk
> <open.source@oleksandr-kravchuk.com> wrote:
> >
> > Sure. It's already in master though.
> >
> > Should I send a new patch or just a diff with master?
> >
> > On 23/04/2019 11:26, Burton, Ross wrote:
> > > On Sat, 23 Mar 2019 at 16:39, Oleksandr Kravchuk
> > > <open.source@oleksandr-kravchuk.com> wrote:
> > >> +++ b/meta/recipes-devtools/ninja/ninja/fix-musl.patch
> > >> @@ -0,0 +1,39 @@
> > >> +2ff54ad7478a90bd75c91e434236a Mon Sep 17 00:00:00 2001
> > >> +From: makepost <makepost@firemail.cc>
> > >> +Date: Mon, 24 Dec 2018 03:13:16 +0200
> > >> +Subject: [PATCH] Use st_mtim if st_mtime is macro, fix #1510
> > >> +
> > >> +In POSIX.1-2008, sys_stat has a st_mtim member and a st_mtime backward
> > >> +compatibility macro. Should help avoid hardcoding platform detection.
> > >> +---
> > >> + src/disk_interface.cc | 14 ++++----------
> > >> + 1 file changed, 4 insertions(+), 10 deletions(-)
> > >> +
> > >> +diff --git a/src/disk_interface.cc b/src/disk_interface.cc
> > >> +index d4c2fb087..dc297c449 100644
> > >> +--- src/disk_interface.cc
> > >> ++++ /src/disk_interface.cc
> > >> +@@ -202,19 +202,13 @@ TimeStamp RealDiskInterface::Stat(const string& path, string* err) const {
> > >> +   // that it doesn't exist.
> > >> +   if (st.st_mtime == 0)
> > >> +     return 1;
> > >> +-#if defined(__APPLE__) && !defined(_POSIX_C_SOURCE)
> > >> ++#if defined(_AIX)
> > >> ++  return (int64_t)st.st_mtime * 1000000000LL + st.st_mtime_n;
> > >> ++#elif defined(__APPLE__)
> > >> +   return ((int64_t)st.st_mtimespec.tv_sec * 1000000000LL +
> > >> +           st.st_mtimespec.tv_nsec);
> > >> +-#elif (_POSIX_C_SOURCE >= 200809L || _XOPEN_SOURCE >= 700 || defined(_BSD_SOURCE) || defined(_SVID_SOURCE) || \
> > >> +-       defined(__BIONIC__) || (defined (__SVR4) && defined (__sun)) || defined(__FreeBSD__))
> > >> +-  // For glibc, see "Timestamp files" in the Notes of http://www.kernel.org/doc/man-pages/online/pages/man2/stat.2.html
> > >> +-  // newlib, uClibc and musl follow the kernel (or Cygwin) headers and define the right macro values above.
> > >> +-  // For bsd, see https://github.com/freebsd/freebsd/blob/master/sys/sys/stat.h and similar
> > >> +-  // For bionic, C and POSIX API is always enabled.
> > >> +-  // For solaris, see https://docs.oracle.com/cd/E88353_01/html/E37841/stat-2.html.
> > >> ++#elif defined(st_mtime) // A macro, so we're likely on modern POSIX.
> > >> +   return (int64_t)st.st_mtim.tv_sec * 1000000000LL + st.st_mtim.tv_nsec;
> > >> +-#elif defined(_AIX)
> > >> +-  return (int64_t)st.st_mtime * 1000000000LL + st.st_mtime_n;
> > >> + #else
> > >> +   return (int64_t)st.st_mtime * 1000000000LL + st.st_mtimensec;
> > >> + #endif
> > > This patch has no Signed-off-by or Upstream-Status.  Can you add those please?
> > >
> > > Ross
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

