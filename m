Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 811FDC433FE
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 21:04:25 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.8123.1669237459098593335
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Nov 2022 13:04:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R3l2epGz;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id a15so22737551ljb.7
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Nov 2022 13:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BWQH9NAA9n973LBq0Hj7/D245rIMDNV3kSRW7ch3Tsg=;
        b=R3l2epGzAr1pSPtXb/w977oaZzP9HtGbXG7TVzrXNVHN+g7YhrsFoKNv4HlIKDOhWN
         uLcL4vKPyx/9/DG1c3FC/am1kCDL2rrz0WyXFtcLgkMWgtP24zxU0Gd/vq/IMU/tMwsn
         GS836NQRiLmdmf0HarKmlfvXyq12MkRsqOj+YAX8bYHR30l7GqZKgMdkn0qPYzZsMyNq
         PKziaGDhdCTT1IxNvCVPBpMK6SfX5t06uPgYcQbgZgRJo4EiC8VCt1QIkxMks0CLKUyz
         tNcTKRE9knl4B3WFf84zesNAgpufT+rqXpwbEkC1qcDKReKJJWmn9zGBQ6fedJqngRmS
         LqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BWQH9NAA9n973LBq0Hj7/D245rIMDNV3kSRW7ch3Tsg=;
        b=Q4Tj/aNoUKXQNpwEgatj+PL3FdGyO4bMCugVXWy0UM0cOmMExS5aLY9fdmmBtdvfbQ
         lpoAfxvzIP43/IfzXYQxHuhJoCknXMoUh3PHy0kbtUNBfk/pPCT01DNWvAjN1oo912be
         6PmEPYLWiiLg0pWuZUu51vd2SHM0mj+h86u5kLo3Mp3YTldOLk7cLKno47LiVRhLsl6E
         XGsw7THoGZ83ZLsztT4fbIM7EVxR7RVslShNt+C1ZjielJ43p3gX7MnAK/LDdzTx5Ebi
         UTvZUboru1A+ueI/iSuYFSx8iIH8MLODhyn1tnxExX7Jvrh7BUMflRJIDSdGBChSjeWJ
         l9OA==
X-Gm-Message-State: ANoB5pkfCV/rtIHkchJR/DKWF+KiAgDrhu3g+/K4oCJekFvZfRAErPMK
	fHHB6kv4KFexT+2MkuBUD6IXoTVo7iacPPLL6q0=
X-Google-Smtp-Source: AA0mqf4grb4KbniIRB4elu7F5HuAwd2po36kY5nbNO4nZvPtN5UeztVGnAME32T9WQX3+y2EtyxvpqwBgW+ozSRk/KY=
X-Received: by 2002:a2e:b5a9:0:b0:277:524c:f83d with SMTP id
 f9-20020a2eb5a9000000b00277524cf83dmr9880017ljn.217.1669237457122; Wed, 23
 Nov 2022 13:04:17 -0800 (PST)
MIME-Version: 1.0
References: <20221123194214.2317638-1-raj.khem@gmail.com>
In-Reply-To: <20221123194214.2317638-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 23 Nov 2022 22:04:05 +0100
Message-ID: <CANNYZj-_PErGXvSVT4nm5N+ecE4NX4CnRDznuMgLdxz-x2-6Og@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rsync: Delete upstreamed patch
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Nov 2022 21:04:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173728

I think the more accurate description is not that the patch has been
applied, but rather that upstream applied a different patch that makes
this one unnecessary.

Alex

On Wed, 23 Nov 2022 at 20:42, Khem Raj <raj.khem@gmail.com> wrote:
>
> It has been applied upstream see
> https://github.com/WayneD/rsync/commit/9a3449a3980421f84ac55498ba565bc112b20d6c
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...antic-errors-at-the-end-of-configure.patch | 44 -------------------
>  meta/recipes-devtools/rsync/rsync_3.2.7.bb    |  1 -
>  2 files changed, 45 deletions(-)
>  delete mode 100644 meta/recipes-devtools/rsync/files/0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch
>
> diff --git a/meta/recipes-devtools/rsync/files/0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch b/meta/recipes-devtools/rsync/files/0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch
> deleted file mode 100644
> index f11f13dd48..0000000000
> --- a/meta/recipes-devtools/rsync/files/0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From e6321b0b456fca987b48d5ec7aba7e2826128e5f Mon Sep 17 00:00:00 2001
> -From: Paul Eggert <eggert@cs.ucla.edu>
> -Date: Thu, 18 Aug 2022 07:46:28 -0700
> -Subject: [PATCH] Turn on -pedantic-errors at the end of 'configure'
> -
> -Problem reported by Khem Raj in:
> -https://lists.gnu.org/r/autoconf-patches/2022-08/msg00009.html
> -Upstream-Status: Submitted [https://lists.samba.org/archive/rsync/2022-August/032862.html]
> -
> ----
> - configure.ac | 20 ++++++++++++++++++++
> - 1 file changed, 20 insertions(+)
> -
> -diff --git a/configure.ac b/configure.ac
> -index a2c9955..afabef0 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -1437,6 +1437,26 @@ case "$CC" in
> -     ;;
> - esac
> -
> -+# Enable -pedantic-errors last, so that it doesn't mess up other
> -+# 'configure' tests.  For example, Autoconf uses empty function
> -+# prototypes like 'int main () {}' which Clang 15's -pedantic-errors
> -+# would reject.  Generally it's not a good idea to try to run
> -+# 'configure' itself with strict compiler checking.
> -+if test x"$GCC" = x"yes"; then
> -+    if test x"$with_included_popt" != x"yes"; then
> -+      # Turn pedantic warnings into errors to ensure an array-init overflow is an error.
> -+      CFLAGS="$CFLAGS -pedantic-errors"
> -+    else
> -+      # Our internal popt code cannot be compiled with pedantic warnings as errors, so try to
> -+      # turn off pedantic warnings (which will not lose the error for array-init overflow).
> -+      # Older gcc versions don't understand -Wno-pedantic, so check if --help=warnings lists
> -+      # -Wpedantic and use that as a flag.
> -+      case `$CC --help=warnings 2>/dev/null | grep Wpedantic` in
> -+          *-Wpedantic*) CFLAGS="$CFLAGS -pedantic-errors -Wno-pedantic" ;;
> -+      esac
> -+    fi
> -+fi
> -+
> - AC_CONFIG_FILES([Makefile lib/dummy zlib/dummy popt/dummy shconfig])
> - AC_OUTPUT
> -
> diff --git a/meta/recipes-devtools/rsync/rsync_3.2.7.bb b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
> index e52699d24f..19574bcb1c 100644
> --- a/meta/recipes-devtools/rsync/rsync_3.2.7.bb
> +++ b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
> @@ -15,7 +15,6 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
>             file://makefile-no-rebuild.patch \
>             file://determism.patch \
>             file://0001-Add-missing-prototypes-to-function-declarations.patch \
> -           file://0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch \
>             "
>  SRC_URI[sha256sum] = "4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488fb2dc41346f2bb"
>
> --
> 2.38.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173725): https://lists.openembedded.org/g/openembedded-core/message/173725
> Mute This Topic: https://lists.openembedded.org/mt/95225031/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

