Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id C67676B463
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 09:27:06 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id q14so4109416itk.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 02:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KplAr2uh8J4lhHdZdrDZbgdQif380lpDLuXCx76CWm4=;
	b=BFWCi5iJK6KWonKB1WDEpVsXHQ9kXhX9LcwujTt4Xlpyd9ZkTkhxkDaVmYTc30L3D+
	NO2kVvaEkVE7H/WCMNzx+d7TBQgOAeVd5Vt2366tI0Re18o1f6zc3mi+vSfV51eL4dh4
	zARuxGBRHGfGY/z0qYy8XJ51ES2Iw9laJFTFRyReC5jkzIOkwi00PB0BkUJhQL0dDM00
	JaunPqoUVlBvS1gVSUOVK3tUUXmVg57pGHSxXS+w8TcnqLe16aQEcjphV9ZaLFkX6iS8
	3zyDUzxPAw/RionjOi4RdPl/k5E1YZvyDciZLnIgGVVmPQzhYFk2W/MsjvjKJIjfUqIu
	PMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KplAr2uh8J4lhHdZdrDZbgdQif380lpDLuXCx76CWm4=;
	b=tBP3eGbCCKU7OSc6dZspmyrjaf1uwvayRqzlssZQ1PgpSu2Euf9frjugZwITli//i0
	Ue7iQsDYWfOLHDT77+VJpnrDJfoyBSFQPdh7nVNYXPQObroJzV/kvBLBHq2bA4B9oXpJ
	hH6C3MDKluSiQdcSe+6S6GZExgB6j3uuTltBlkHhtFkvixeXFWCIn8UVyy+HaL5pGzWo
	TtT0QeC4geezvL2ThHXRksLXcjrw3rbEZ+JfqG/NNrscbhhXAetcP4ROcdqiFYbX0r5c
	PX4cFejN0UBzmvV/d8LrHUyDcWnPtDsIHiP+KndB2CRrfy0Q+FBtgrQD19e8lQyBoKfx
	claA==
X-Gm-Message-State: APjAAAWIiVjKc464Kf1nMvisvukqCUqVY7dawR+Ck0be0ggFhYLAdEqp
	2tVLpEoURqfJ62KZz3xijdpYlxlkyRrKhSQTcQPdnLa1
X-Google-Smtp-Source: APXvYqxNlOQeUCCxEYi8SsPXa+sDHKkl5C8NvRHx8opPEh87S2D7s9qGVxJAgfwHGY72tTMnmJ15AtDZUOwl89ADqwI=
X-Received: by 2002:a24:ad2:: with SMTP id 201mr1186467itw.26.1556011627665;
	Tue, 23 Apr 2019 02:27:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190323163858.15371-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190323163858.15371-1-open.source@oleksandr-kravchuk.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Apr 2019 10:26:56 +0100
Message-ID: <CAJTo0LaYdMRz41qeojHLsv9zj+VL6u7EL8LwM3=JKnKcriw_bQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 23 Apr 2019 09:27:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, 23 Mar 2019 at 16:39, Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
> +++ b/meta/recipes-devtools/ninja/ninja/fix-musl.patch
> @@ -0,0 +1,39 @@
> +2ff54ad7478a90bd75c91e434236a Mon Sep 17 00:00:00 2001
> +From: makepost <makepost@firemail.cc>
> +Date: Mon, 24 Dec 2018 03:13:16 +0200
> +Subject: [PATCH] Use st_mtim if st_mtime is macro, fix #1510
> +
> +In POSIX.1-2008, sys_stat has a st_mtim member and a st_mtime backward
> +compatibility macro. Should help avoid hardcoding platform detection.
> +---
> + src/disk_interface.cc | 14 ++++----------
> + 1 file changed, 4 insertions(+), 10 deletions(-)
> +
> +diff --git a/src/disk_interface.cc b/src/disk_interface.cc
> +index d4c2fb087..dc297c449 100644
> +--- src/disk_interface.cc
> ++++ /src/disk_interface.cc
> +@@ -202,19 +202,13 @@ TimeStamp RealDiskInterface::Stat(const string& path, string* err) const {
> +   // that it doesn't exist.
> +   if (st.st_mtime == 0)
> +     return 1;
> +-#if defined(__APPLE__) && !defined(_POSIX_C_SOURCE)
> ++#if defined(_AIX)
> ++  return (int64_t)st.st_mtime * 1000000000LL + st.st_mtime_n;
> ++#elif defined(__APPLE__)
> +   return ((int64_t)st.st_mtimespec.tv_sec * 1000000000LL +
> +           st.st_mtimespec.tv_nsec);
> +-#elif (_POSIX_C_SOURCE >= 200809L || _XOPEN_SOURCE >= 700 || defined(_BSD_SOURCE) || defined(_SVID_SOURCE) || \
> +-       defined(__BIONIC__) || (defined (__SVR4) && defined (__sun)) || defined(__FreeBSD__))
> +-  // For glibc, see "Timestamp files" in the Notes of http://www.kernel.org/doc/man-pages/online/pages/man2/stat.2.html
> +-  // newlib, uClibc and musl follow the kernel (or Cygwin) headers and define the right macro values above.
> +-  // For bsd, see https://github.com/freebsd/freebsd/blob/master/sys/sys/stat.h and similar
> +-  // For bionic, C and POSIX API is always enabled.
> +-  // For solaris, see https://docs.oracle.com/cd/E88353_01/html/E37841/stat-2.html.
> ++#elif defined(st_mtime) // A macro, so we're likely on modern POSIX.
> +   return (int64_t)st.st_mtim.tv_sec * 1000000000LL + st.st_mtim.tv_nsec;
> +-#elif defined(_AIX)
> +-  return (int64_t)st.st_mtime * 1000000000LL + st.st_mtime_n;
> + #else
> +   return (int64_t)st.st_mtime * 1000000000LL + st.st_mtimensec;
> + #endif

This patch has no Signed-off-by or Upstream-Status.  Can you add those please?

Ross

