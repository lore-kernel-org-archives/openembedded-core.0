Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.1226.1615506961944195740
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 15:56:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eLXgKHMc;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id g185so22621844qkf.6
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 15:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tYkLKVKLZqUnTQEiYjhYbhcYbcc1pLc11FrO1sNMdTE=;
        b=eLXgKHMc740hBfOcBzwP1QO2cu80CtTb2poSr6o555Pt1qnUMfg7xQDPLtfBb+/bLc
         kFTk4hSkdDwaJXFNh4n9LBNj+tiI9IA10sXHGKHwJpLff42AXB+5MuDfE5yZC5+Zk7Gq
         6SLl1y2MDd1G+ezLSbtwnxE3cpd13zm8zEHmtne2l543/CnPnyyYshYA5uGY2CiJOW4c
         ZOpRogJ93hoxqa3xmT1W/wojM2p2eWVSyA7yk6jQGvgHedH8SQohdyBXlvaWa+emRkR3
         d4NlpAWU6RS/A9mU1SJI017kodDO1MrzVYDzKHjfVPqPUtsc6ltqJ1rr2GiNaTrZbhFQ
         r8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tYkLKVKLZqUnTQEiYjhYbhcYbcc1pLc11FrO1sNMdTE=;
        b=IOS39gZrmHfuHik4O3KhBM1eCvEMJfVky8gUQSqrKSY5idAsXv4Hb/GUE44FjXrYkK
         vzLIa9YDEUU1DeeWfX9Uq1X0X6Nl4xe5N8KDPZyB+VvXdcYvXnFqMVcJS2faALH5+Se5
         zT1oh6ZP6Dg7s4s4008GtumNRWfLz62GCqVrpqrj+qss6z3pKL0zVlYzSUVWlKPQJinw
         kconQX3eJv2JdQcSmTXcx+iYVucTkBZHC41vsjoX4Pm0D7LAAHv9GmKElH9R8g+7CTWF
         ZzNJEcIx4Y5v32HxOJKMdmyU7IuccWenO9huqEdAz3egXMuDhVdRMkjU8/fX5jQlX9TM
         NmxA==
X-Gm-Message-State: AOAM531g3HOEzhS/+HnCdcWJ0X5Fd6DKhaRu4kXeVMy2QOt1Pccmojpc
	dabeidsIIA1l4KXtrDdOo53gmVpg9yeqH18qtXI=
X-Google-Smtp-Source: ABdhPJwobdpNm5JFmBWu/3yP0oClm6NRdLEG1oC4jsZipcuQNalaJKDm6n3MxlBY0TK0b4kb+oOYxuYYfhCGCbA7TVM=
X-Received: by 2002:a37:8ec4:: with SMTP id q187mr10243281qkd.381.1615506960933;
 Thu, 11 Mar 2021 15:56:00 -0800 (PST)
MIME-Version: 1.0
References: <20210311152128.41215-1-khairul.rohaizzat.jamaluddin@intel.com>
In-Reply-To: <20210311152128.41215-1-khairul.rohaizzat.jamaluddin@intel.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 11 Mar 2021 15:55:34 -0800
Message-ID: <CAMKF1spX6z9vvv7QNbWhkapX-Z1=FWZVh0W2+OM2qSbxPqQgkQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: Fix CVE-2021-27645
To: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 11, 2021 at 7:21 AM Jamaluddin, Khairul Rohaizzat
<khairul.rohaizzat.jamaluddin@intel.com> wrote:
>
> From: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
>
> CVE:
> CVE-2021-27645
>

lgtm. Do we need it for dunfell and gatesgarth as well ?

> Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
> ---
>  .../glibc/glibc/CVE-2021-27645.patch          | 51 +++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.33.bb         |  1 +
>  2 files changed, 52 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-27645.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/CVE-2021-27645.patch b/meta/recipes-core/glibc/glibc/CVE-2021-27645.patch
> new file mode 100644
> index 0000000000..26c5c0d2a9
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/CVE-2021-27645.patch
> @@ -0,0 +1,51 @@
> +From dca565886b5e8bd7966e15f0ca42ee5cff686673 Mon Sep 17 00:00:00 2001
> +From: DJ Delorie <dj@redhat.com>
> +Date: Thu, 25 Feb 2021 16:08:21 -0500
> +Subject: [PATCH] nscd: Fix double free in netgroupcache [BZ #27462]
> +
> +In commit 745664bd798ec8fd50438605948eea594179fba1 a use-after-free
> +was fixed, but this led to an occasional double-free.  This patch
> +tracks the "live" allocation better.
> +
> +Tested manually by a third party.
> +
> +Related: RHBZ 1927877
> +
> +Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
> +Reviewed-by: Carlos O'Donell <carlos@redhat.com>
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=dca565886b5e8bd7966e15f0ca42ee5cff686673]
> +
> +CVE: CVE-2021-27645
> +
> +Reviewed-by: Carlos O'Donell <carlos@redhat.com>
> +Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
> +---
> + nscd/netgroupcache.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/nscd/netgroupcache.c b/nscd/netgroupcache.c
> +index dba6ceec1b..ad2daddafd 100644
> +--- a/nscd/netgroupcache.c
> ++++ b/nscd/netgroupcache.c
> +@@ -248,7 +248,7 @@ addgetnetgrentX (struct database_dyn *db, int fd, request_header *req,
> +                                            : NULL);
> +                                   ndomain = (ndomain ? newbuf + ndomaindiff
> +                                              : NULL);
> +-                                  buffer = newbuf;
> ++                                  *tofreep = buffer = newbuf;
> +                                 }
> +
> +                               nhost = memcpy (buffer + bufused,
> +@@ -319,7 +319,7 @@ addgetnetgrentX (struct database_dyn *db, int fd, request_header *req,
> +                   else if (status == NSS_STATUS_TRYAGAIN && e == ERANGE)
> +                     {
> +                       buflen *= 2;
> +-                      buffer = xrealloc (buffer, buflen);
> ++                      *tofreep = buffer = xrealloc (buffer, buflen);
> +                     }
> +                   else if (status == NSS_STATUS_RETURN
> +                            || status == NSS_STATUS_NOTFOUND
> +--
> +2.27.0
> +
> diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/glibc/glibc_2.33.bb
> index c47826a51e..d0a290822b 100644
> --- a/meta/recipes-core/glibc/glibc_2.33.bb
> +++ b/meta/recipes-core/glibc/glibc_2.33.bb
> @@ -45,6 +45,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>             file://0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
>             file://0031-x86-Require-full-ISA-support-for-x86-64-level-marker.patch \
>             file://0032-string-Work-around-GCC-PR-98512-in-rawmemchr.patch \
> +           file://CVE-2021-27645.patch \
>             "
>  S = "${WORKDIR}/git"
>  B = "${WORKDIR}/build-${TARGET_SYS}"
> --
> 2.29.0
>
>
> 
>
