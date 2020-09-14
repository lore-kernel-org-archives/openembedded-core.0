Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web11.687.1600123274219157139
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 15:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TmsLjDrN;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id ay8so1135481edb.8
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 15:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NJLhwMtfnsgSQG8eDSzmX/3nLcvVK7ReGOt4dJ6v+l0=;
        b=TmsLjDrNsWKTwUYJY0obKmmnAZr6Bw7bUCDDx01fgKXNcpvJsKsh3TJICBR+S9GN1U
         Chq7Lel5hQ8g5nRvtjNJl6xVbSII3bdRU/N0C67eQlZtraO454F4Igcgul/GV6e3b4zi
         QTZTGFlIO022HFt/Q2wWncecwF/31NwE9BWHqhOczT06DCxVyT+dwXdi5M+N46sNV5o5
         +tTf9ISr4rdR+9Fr2Xg3nDHfxGhUEdMhB3n2h1UlDfyaSFhiKHkL+Jb81SSvGGz3Ytjr
         JZy2w8y9WC2OiipD4EFRunONdhT9bUIo0kR8zEbvN57NdRhWC2xML2GGE3O69Ara2Lq0
         3cdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NJLhwMtfnsgSQG8eDSzmX/3nLcvVK7ReGOt4dJ6v+l0=;
        b=TKluNVP+A6LSK3oFNf25ExB66oCJMXdI0ufNhgZnWZNIeX2dwlV6D1SP+rkN9g8ReD
         UfyIWbBaDANMGdzlGTMiJCFQB6KQ8JD24GI0Su06HKCHxm6tTgVqlE2Xn40fgplkKZ5D
         yjYKMv6CEDTUXuDQux2yEtLmRirUNzh2DFr40Ujq2QJJRjWxeEEJ4cDRx+pxlF7Ldvv5
         d9Ue7dzNjfc4+RoVTjLjAh+vtGpQJDeoDUfDunOZTs/GFPZKfEeMj+cJxPTTvB4UDyv0
         ochXu/xlk5AxS/rbOpE6LRWwEbwgCr9jBqX7WjL0H4M5G3Ua4iuauusAeysYETrlz4Az
         lS6A==
X-Gm-Message-State: AOAM531NP7NMmJkv3HeSY92Op0ndtJON29jysjhW56m8v/PNUM6u1Z8g
	gZVcdouZBd1YuWzgdzBZSY5AEySi64bzO9E5IR8=
X-Google-Smtp-Source: ABdhPJy0Z1rym0RIFBOV2rbvXYt7KCF9VKGGoGyl+8MBlhTBlJacd0BK3rppu0kBOUEidiBLM95rqzuiF9dt6vRtuPI=
X-Received: by 2002:a50:abc3:: with SMTP id u61mr18925002edc.129.1600123272647;
 Mon, 14 Sep 2020 15:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <1634C744B7F9FBBA.6928@lists.openembedded.org>
In-Reply-To: <1634C744B7F9FBBA.6928@lists.openembedded.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 14 Sep 2020 18:39:42 -0400
Message-ID: <CADkTA4MsGZntSZtpUvVsShiY7-4cG0ByH76DiFvEukfdCAJqLA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/6] linux-yocto: consolidated pull request
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

And also for the record, there's a 7th patch in my series that didn't
make it into my pull request (a configuration change)

Richard grabbed it from the branch.

If anyone is trying to manually apply the series, it will fail.

Bruce

On Mon, Sep 14, 2020 at 6:34 PM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Richard,
>
> Here's the latest round of -stable updates for the active kernels in
> master.
>
> My first runs ran into the lttng-modules issues, and I've included a
> 10 patch backport of changes from lttng 2.12.x to address the various
> build issues I found against 5.4 and 5.8.
>
> There's a different lttng patch on the list, but it didn't address all
> of my build failures, so I generated this full backport change.
>
> Cheers,
>
> Bruce
>
> The following changes since commit 070d9b8f5e753e8928d2d7048e0c7bd9adbb3c29:
>
>   linux-yocto/config: netfilter: Enable nat for ipv4 and ipv6 (2020-09-14 12:13:47 -0400)
>
> are available in the Git repository at:
>
>   git://git.yoctoproject.org/poky-contrib zedd/kernel
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (5):
>   linux-yocto/5.8: update to v5.8.8
>   linux-yocto/5.4: update to v5.4.64
>   linux-yocto/config: configuration warning cleanup
>   linux-yocto/5.8: update to v5.8.9
>   linux-yocto/5.4: update to v5.4.65
>
> Jens Rehsack (1):
>   lttng-modules: backport patches from 2.12.x to fix 5.4.64+ and 5.8.9+
>     builds
>
>  .../linux/linux-yocto-rt_5.4.bb               |   6 +-
>  .../linux/linux-yocto-rt_5.8.bb               |   6 +-
>  .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
>  .../linux/linux-yocto-tiny_5.8.bb             |   8 +-
>  meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
>  meta/recipes-kernel/linux/linux-yocto_5.8.bb  |  22 +-
>  ...ndency-issue-when-building-in-tree-w.patch |  54 ++
>  ...ce.h-into-the-mmu-sub-directory-v5.9.patch |  41 +
>  ...Make-kvm_mmu_page-definition-and-acc.patch |  39 +
>  ...he-length-of-per-inode-prealloc-list.patch |  84 ++
>  ...e-via-a-block-bitmap-read-is-prefetc.patch |  63 ++
>  ...al-of-smp_-read_barrier_depends-v5.9.patch | 391 ++++++++
>  ...teback-Drop-I_DIRTY_TIME_EXPIRE-v5.9.patch |  59 ++
>  ...x-sync-livelock-due-to-b_dirty_time-.patch | 117 +++
>  ...es-for-ext4_discard_preallocations-a.patch |  52 +
>  .../0010-Fix-system-call-filter-table.patch   | 918 ++++++++++++++++++
>  .../lttng/lttng-modules_2.12.2.bb             |  12 +-
>  17 files changed, 1865 insertions(+), 37 deletions(-)
>  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Kconfig-fix-dependency-issue-when-building-in-tree-w.patch
>  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-fix-Move-mmutrace.h-into-the-mmu-sub-directory-v5.9.patch
>  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-fix-KVM-x86-mmu-Make-kvm_mmu_page-definition-and-acc.patch
>  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-fix-ext4-limit-the-length-of-per-inode-prealloc-list.patch
>  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0005-fix-ext4-indicate-via-a-block-bitmap-read-is-prefetc.patch
>  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0006-fix-removal-of-smp_-read_barrier_depends-v5.9.patch
>  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0007-fix-writeback-Drop-I_DIRTY_TIME_EXPIRE-v5.9.patch
>  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0008-fix-writeback-Fix-sync-livelock-due-to-b_dirty_time-.patch
>  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0009-fix-version-ranges-for-ext4_discard_preallocations-a.patch
>  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0010-Fix-system-call-filter-table.patch
>
> --
> 2.19.1
>
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
