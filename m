Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web12.12868.1604675700900971484
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2020 07:15:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Y4Lt7gCF;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.65, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f65.google.com with SMTP id ay21so1634752edb.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2020 07:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aIq/7oRP9QEXz49vOnzB4jwt/EnVfSZ6kQvEZa0M448=;
        b=Y4Lt7gCFLR5BH+Ka9aqoI0oErwm83WNzo2rMAUKgbtKOvPvRGwx8RkV+aRA17PIXY6
         7FjJ/LlNnHQVhPpL7bCLUIzowxdPk0sE7yi4mRibivCrgQ72bB5AxXk175zVZCPGu/nb
         hotHR2xuKchbgebVgzOKgkwxqOJ/XhmKfaIFqYKzuxE92KvzLzzVqt3BglFmmQX1Q1KU
         QYBSNffyXjiX01npnjNGZWjWpe6hkBvA0TViyShTi4M/77TaX7Ft38eAbPxpeIa+Kbdi
         rvAZnRF5MHejrmzf2AuWOv6cZwn6AJ51oc7dklBthR/Txtns8op5U6EgX8yRrpkTilrx
         UhkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aIq/7oRP9QEXz49vOnzB4jwt/EnVfSZ6kQvEZa0M448=;
        b=SmBOYZZmR/b6I5F3W9021npgaL87/qoqlIVyXBAGMoeZJCe7t/2c/Mzb41XypCmCHI
         nO530TmCZB4Jh8cuttVhNXK2LN0IURMmrNPbx4QyJfugAvfC/nUulmQy0SmTK/2PiB5X
         9J7kfKWVNnEszj1cL/GoLb+mWL2345LkRjr4FrqsWg/FYgkKvbRtt+j/dvHzqAheARD/
         hoybiyG47mUewWsuKH+oY/4Ufa8tqIl9UT+kBdWt13Slaae0gYEAwwhT5LlNlujcqro5
         DWLeajbrJrDvwcNeB+/Ck19IW4iQyjJrtCBwDLyVoaMe2tLzy9aff5hprF+jW2XGcFFV
         KTEg==
X-Gm-Message-State: AOAM531z57TjOHqcGk0irGU5BigyY0VnkydKSlUhbia2s6T1A1nO7EyF
	fogzuI9G5DHMLeb8GUCC30zcEe/ontvLXipq5ipa5A==
X-Google-Smtp-Source: ABdhPJxf7olAG6gq7qkY69J6CGlFPI1k/zpEeDnTffFwzLA4Z3TMWQAdn0q49F4nhU9S0cplGAXslahAiWe1CI+MrB8=
X-Received: by 2002:a05:6402:3d9:: with SMTP id t25mr2537964edw.338.1604675699248;
 Fri, 06 Nov 2020 07:14:59 -0800 (PST)
MIME-Version: 1.0
References: <cover.1604643684.git.anuj.mittal@intel.com> <dfbeace839cf80d428725cb94de0887e59872bd9.1604643684.git.anuj.mittal@intel.com>
In-Reply-To: <dfbeace839cf80d428725cb94de0887e59872bd9.1604643684.git.anuj.mittal@intel.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Fri, 6 Nov 2020 05:14:48 -1000
Message-ID: <CAOSpxdaGhv8StEKo3GowBfHO6AFgdi82TVUGp5r1dnOCto4bXg@mail.gmail.com>
Subject: Re: [OE-core] [gatesgarth][PATCH 17/22] grub: clean up CVE patches
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 5, 2020 at 8:28 PM Anuj Mittal <anuj.mittal@intel.com> wrote:
>
> From: Yongxin Liu <yongxin.liu@windriver.com>
>
> Clean up several patches introduced in commit 6732918498 ("grub:fix
> several CVEs in grub 2.04").
>
> 1) Add CVE tags to individual patches.
> 2) Rename upstream patches and prefix them with CVE tags.
> 3) Add description of reference to upstream patch.
>
> Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>

This hasn't hit master yet.  Do we have the same "master first" policy
for gatesgarth as we do for dunfell?

Steve

> ---
>  ...14308-calloc-Use-calloc-at-most-places.patch} | 10 +++++++---
>  ...rflow-checking-primitives-where-we-do-.patch} | 10 +++++++---
>  ...-use-after-free-when-redefining-a-func.patch} | 10 +++++++---
>  ...eger-overflows-in-initrd-size-handling.patch} | 10 +++++++---
>  ...re-we-always-have-an-overflow-checking.patch} |  0
>  ...-Add-LVM-cache-logical-volume-handling.patch} |  0
>  ...ome-arithmetic-primitives-that-check-f.patch} |  0
>  ...unused-fields-from-grub_script_functio.patch} |  0
>  meta/recipes-bsp/grub/grub2.inc                  | 16 ++++++++--------
>  9 files changed, 36 insertions(+), 20 deletions(-)
>  rename meta/recipes-bsp/grub/files/{0003-calloc-Use-calloc-at-most-places.patch => CVE-2020-14308-calloc-Use-calloc-at-most-places.patch} (99%)
>  rename meta/recipes-bsp/grub/files/{0005-malloc-Use-overflow-checking-primitives-where-we-do-.patch => CVE-2020-14309-CVE-2020-14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-where-we-do-.patch} (99%)
>  rename meta/recipes-bsp/grub/files/{0007-script-Avoid-a-use-after-free-when-redefining-a-func.patch => CVE-2020-15706-script-Avoid-a-use-after-free-when-redefining-a-func.patch} (95%)
>  rename meta/recipes-bsp/grub/files/{0008-linux-Fix-integer-overflows-in-initrd-size-handling.patch => CVE-2020-15707-linux-Fix-integer-overflows-in-initrd-size-handling.patch} (96%)
>  rename meta/recipes-bsp/grub/files/{0001-calloc-Make-sure-we-always-have-an-overflow-checking.patch => calloc-Make-sure-we-always-have-an-overflow-checking.patch} (100%)
>  rename meta/recipes-bsp/grub/files/{0002-lvm-Add-LVM-cache-logical-volume-handling.patch => lvm-Add-LVM-cache-logical-volume-handling.patch} (100%)
>  rename meta/recipes-bsp/grub/files/{0004-safemath-Add-some-arithmetic-primitives-that-check-f.patch => safemath-Add-some-arithmetic-primitives-that-check-f.patch} (100%)
>  rename meta/recipes-bsp/grub/files/{0006-script-Remove-unused-fields-from-grub_script_functio.patch => script-Remove-unused-fields-from-grub_script_functio.patch} (100%)
>
> diff --git a/meta/recipes-bsp/grub/files/0003-calloc-Use-calloc-at-most-places.patch b/meta/recipes-bsp/grub/files/CVE-2020-14308-calloc-Use-calloc-at-most-places.patch
> similarity index 99%
> rename from meta/recipes-bsp/grub/files/0003-calloc-Use-calloc-at-most-places.patch
> rename to meta/recipes-bsp/grub/files/CVE-2020-14308-calloc-Use-calloc-at-most-places.patch
> index eb3e42c3af..637e368cb0 100644
> --- a/meta/recipes-bsp/grub/files/0003-calloc-Use-calloc-at-most-places.patch
> +++ b/meta/recipes-bsp/grub/files/CVE-2020-14308-calloc-Use-calloc-at-most-places.patch
> @@ -19,11 +19,15 @@ Among other issues, this fixes:
>
>  Fixes: CVE-2020-14308
>
> -Upstream-Status: Backport [commit f725fa7cb2ece547c5af01eeeecfe8d95802ed41
> -from https://git.savannah.gnu.org/git/grub.git]
> -
>  Signed-off-by: Peter Jones <pjones@redhat.com>
>  Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +
> +Upstream-Status: Backport
> +CVE: CVE-2020-14308
> +
> +Reference to upstream patch:
> +https://git.savannah.gnu.org/cgit/grub.git/commit/?id=f725fa7cb2ece547c5af01eeeecfe8d95802ed41
> +
>  [YL: don't patch on grub-core/lib/json/json.c, which is not existing in grub 2.04]
>  Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
>  ---
> diff --git a/meta/recipes-bsp/grub/files/0005-malloc-Use-overflow-checking-primitives-where-we-do-.patch b/meta/recipes-bsp/grub/files/CVE-2020-14309-CVE-2020-14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-where-we-do-.patch
> similarity index 99%
> rename from meta/recipes-bsp/grub/files/0005-malloc-Use-overflow-checking-primitives-where-we-do-.patch
> rename to meta/recipes-bsp/grub/files/CVE-2020-14309-CVE-2020-14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-where-we-do-.patch
> index 146602cd3e..896a2145d4 100644
> --- a/meta/recipes-bsp/grub/files/0005-malloc-Use-overflow-checking-primitives-where-we-do-.patch
> +++ b/meta/recipes-bsp/grub/files/CVE-2020-14309-CVE-2020-14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-where-we-do-.patch
> @@ -26,11 +26,15 @@ Among other issues, this fixes:
>
>  Fixes: CVE-2020-14309, CVE-2020-14310, CVE-2020-14311
>
> -Upstream-Status: Backport [commit 3f05d693d1274965ffbe4ba99080dc2c570944c6
> -from https://git.savannah.gnu.org/git/grub.git]
> -
>  Signed-off-by: Peter Jones <pjones@redhat.com>
>  Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +
> +Upstream-Status: Backport
> +CVE: CVE-2020-14309, CVE-2020-14310, CVE-2020-14311
> +
> +Reference to upstream patch:
> +https://git.savannah.gnu.org/cgit/grub.git/commit/?id=3f05d693d1274965ffbe4ba99080dc2c570944c6
> +
>  Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
>  ---
>   grub-core/commands/legacycfg.c | 29 +++++++++++++++++++-----
> diff --git a/meta/recipes-bsp/grub/files/0007-script-Avoid-a-use-after-free-when-redefining-a-func.patch b/meta/recipes-bsp/grub/files/CVE-2020-15706-script-Avoid-a-use-after-free-when-redefining-a-func.patch
> similarity index 95%
> rename from meta/recipes-bsp/grub/files/0007-script-Avoid-a-use-after-free-when-redefining-a-func.patch
> rename to meta/recipes-bsp/grub/files/CVE-2020-15706-script-Avoid-a-use-after-free-when-redefining-a-func.patch
> index fedfc5d203..329e554a68 100644
> --- a/meta/recipes-bsp/grub/files/0007-script-Avoid-a-use-after-free-when-redefining-a-func.patch
> +++ b/meta/recipes-bsp/grub/files/CVE-2020-15706-script-Avoid-a-use-after-free-when-redefining-a-func.patch
> @@ -19,11 +19,15 @@ dependent on the current behaviour without being broken.
>
>  Fixes: CVE-2020-15706
>
> -Upstream-Status: Backport [commit 426f57383d647406ae9c628c472059c27cd6e040
> -from https://git.savannah.gnu.org/git/grub.git]
> -
>  Signed-off-by: Chris Coulson <chris.coulson@canonical.com>
>  Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +
> +Upstream-Status: Backport
> +CVE: CVE-2020-15706
> +
> +Reference to upstream patch:
> +https://git.savannah.gnu.org/cgit/grub.git/commit/?id=426f57383d647406ae9c628c472059c27cd6e040
> +
>  Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
>  ---
>   grub-core/script/execute.c  |  2 ++
> diff --git a/meta/recipes-bsp/grub/files/0008-linux-Fix-integer-overflows-in-initrd-size-handling.patch b/meta/recipes-bsp/grub/files/CVE-2020-15707-linux-Fix-integer-overflows-in-initrd-size-handling.patch
> similarity index 96%
> rename from meta/recipes-bsp/grub/files/0008-linux-Fix-integer-overflows-in-initrd-size-handling.patch
> rename to meta/recipes-bsp/grub/files/CVE-2020-15707-linux-Fix-integer-overflows-in-initrd-size-handling.patch
> index 0731f0ec53..d4f9300c0a 100644
> --- a/meta/recipes-bsp/grub/files/0008-linux-Fix-integer-overflows-in-initrd-size-handling.patch
> +++ b/meta/recipes-bsp/grub/files/CVE-2020-15707-linux-Fix-integer-overflows-in-initrd-size-handling.patch
> @@ -7,12 +7,16 @@ These could be triggered by a crafted filesystem with very large files.
>
>  Fixes: CVE-2020-15707
>
> -Upstream-Status: Backport [commit e7b8856f8be3292afdb38d2e8c70ad8d62a61e10
> -from https://git.savannah.gnu.org/git/grub.git]
> -
>  Signed-off-by: Colin Watson <cjwatson@debian.org>
>  Reviewed-by: Jan Setje-Eilers <jan.setjeeilers@oracle.com>
>  Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +
> +Upstream-Status: Backport
> +CVE: CVE-2020-15707
> +
> +Reference to upstream patch:
> +https://git.savannah.gnu.org/cgit/grub.git/commit/?id=e7b8856f8be3292afdb38d2e8c70ad8d62a61e10
> +
>  Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
>  ---
>   grub-core/loader/linux.c | 74 +++++++++++++++++++++++++++++++++++-------------
> diff --git a/meta/recipes-bsp/grub/files/0001-calloc-Make-sure-we-always-have-an-overflow-checking.patch b/meta/recipes-bsp/grub/files/calloc-Make-sure-we-always-have-an-overflow-checking.patch
> similarity index 100%
> rename from meta/recipes-bsp/grub/files/0001-calloc-Make-sure-we-always-have-an-overflow-checking.patch
> rename to meta/recipes-bsp/grub/files/calloc-Make-sure-we-always-have-an-overflow-checking.patch
> diff --git a/meta/recipes-bsp/grub/files/0002-lvm-Add-LVM-cache-logical-volume-handling.patch b/meta/recipes-bsp/grub/files/lvm-Add-LVM-cache-logical-volume-handling.patch
> similarity index 100%
> rename from meta/recipes-bsp/grub/files/0002-lvm-Add-LVM-cache-logical-volume-handling.patch
> rename to meta/recipes-bsp/grub/files/lvm-Add-LVM-cache-logical-volume-handling.patch
> diff --git a/meta/recipes-bsp/grub/files/0004-safemath-Add-some-arithmetic-primitives-that-check-f.patch b/meta/recipes-bsp/grub/files/safemath-Add-some-arithmetic-primitives-that-check-f.patch
> similarity index 100%
> rename from meta/recipes-bsp/grub/files/0004-safemath-Add-some-arithmetic-primitives-that-check-f.patch
> rename to meta/recipes-bsp/grub/files/safemath-Add-some-arithmetic-primitives-that-check-f.patch
> diff --git a/meta/recipes-bsp/grub/files/0006-script-Remove-unused-fields-from-grub_script_functio.patch b/meta/recipes-bsp/grub/files/script-Remove-unused-fields-from-grub_script_functio.patch
> similarity index 100%
> rename from meta/recipes-bsp/grub/files/0006-script-Remove-unused-fields-from-grub_script_functio.patch
> rename to meta/recipes-bsp/grub/files/script-Remove-unused-fields-from-grub_script_functio.patch
> diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
> index 7c53193ebd..ff17dbe8b7 100644
> --- a/meta/recipes-bsp/grub/grub2.inc
> +++ b/meta/recipes-bsp/grub/grub2.inc
> @@ -19,14 +19,14 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
>             file://grub-module-explicitly-keeps-symbole-.module_license.patch \
>             file://0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch \
>             file://CVE-2020-10713.patch \
> -           file://0001-calloc-Make-sure-we-always-have-an-overflow-checking.patch \
> -           file://0002-lvm-Add-LVM-cache-logical-volume-handling.patch \
> -           file://0003-calloc-Use-calloc-at-most-places.patch \
> -           file://0004-safemath-Add-some-arithmetic-primitives-that-check-f.patch \
> -           file://0005-malloc-Use-overflow-checking-primitives-where-we-do-.patch \
> -           file://0006-script-Remove-unused-fields-from-grub_script_functio.patch \
> -           file://0007-script-Avoid-a-use-after-free-when-redefining-a-func.patch \
> -           file://0008-linux-Fix-integer-overflows-in-initrd-size-handling.patch \
> +           file://calloc-Make-sure-we-always-have-an-overflow-checking.patch \
> +           file://lvm-Add-LVM-cache-logical-volume-handling.patch \
> +           file://CVE-2020-14308-calloc-Use-calloc-at-most-places.patch \
> +           file://safemath-Add-some-arithmetic-primitives-that-check-f.patch \
> +           file://CVE-2020-14309-CVE-2020-14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-where-we-do-.patch \
> +           file://script-Remove-unused-fields-from-grub_script_functio.patch \
> +           file://CVE-2020-15706-script-Avoid-a-use-after-free-when-redefining-a-func.patch \
> +           file://CVE-2020-15707-linux-Fix-integer-overflows-in-initrd-size-handling.patch \
>  "
>  SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
>  SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
> --
> 2.28.0
>
>
> 
>
