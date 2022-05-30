Return-Path: <sakoman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56CFDC433FE
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 15:49:41 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web10.38223.1653925772508153410
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 08:49:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=K9wNQJRt;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: sakoman@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id s23so11654807iog.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 08:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HxttGe4UfM/Oly4nU/OChgd70At7V2COROukfUQn6XE=;
        b=K9wNQJRt5y+zA8GYSn27nyCAcjPkkzZp5Ff64g4tjFiET4rcgxSZ310wIPttsFKoSU
         B+yqb1cFctlRrOUNi7ApTmNG0N3yYp+rIsPzyN4cTAvfbyp4aGld24qCgFUW3FEujqsC
         fKhV45st3tdmV3zEH8w/tXEi+nmKXXEq6fo0bVx8v9MsFUG5ZjYzG/LKFVFkdE4nE0gn
         ovMjpOcJlq4hqmm0CzLUU60n5PVV21aGT66TPGFjUS0UL3HQGp/a/+Q+ci9QazxuOdCb
         J+Cct55Uzi8n3KQYp/oSKtWutGCYk4RNsYa4NfyHeEXbkJ7vUU8qRq6R+NEMWpQg4qDs
         /JSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HxttGe4UfM/Oly4nU/OChgd70At7V2COROukfUQn6XE=;
        b=fwc+TnMrMkpeMF1C6ysLIPDIvP7e52+Dis56FH/X5gl1kMXjrQt8+148GpZzKDtwif
         RQdjsMsRiNUT11xXozTLvF9oawtrQzkiW72lb0ZEXsy9bXCfc3B7ccTVbRbWrxESYJPY
         284Xq9MwqxWZDhxWcODn4C0EYRiZiqqYm5+pHr37HeWDbThaAzAWEVYe42wu1RfvhFmu
         R7u2tWVHr1ginT2Jp/pz6sp9n99EiC+cJH1bK/pUfjDCWr19BuEnmq/ia9UC4gtJAx8R
         +bJx7N5lloPRbOqSDDuV46LnKdx5b1XZxkPMfcrxbyCKVZimld/uxiO6pskNLx9nM0ZW
         To4g==
X-Gm-Message-State: AOAM532v5LdRNfEn9Ja+f3hFR7756nzUGsApWHmPQc0bQG5l6d1ztNUB
	/308D3noHt/o7Jq2FrmDZZjkcnvqIMpRiVaYQx4=
X-Google-Smtp-Source: 
 ABdhPJzuaRqiJx6Bq+soPIcuuruE+IOapsVsxU88j4tXL6dsB/Qs67j4pyzdmqNjObZfjVGmisiNr1wmS7StwR81MLA=
X-Received: by 2002:a05:6602:15d0:b0:663:ffe9:57b4 with SMTP id
 f16-20020a05660215d000b00663ffe957b4mr17282224iow.56.1653925771786; Mon, 30
 May 2022 08:49:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220530121318.211356-1-davide.gardenal@huawei.com>
In-Reply-To: <20220530121318.211356-1-davide.gardenal@huawei.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 30 May 2022 05:49:21 -1000
Message-ID: 
 <CAGDS+n=zq+79_JrEC_s-X_f9BEMYXWsyZZrogUk1Z+iLjPvgKQ@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] libpcre2: upgrade 10.39 -> 10.40
To: Davide Gardenal <davidegarde2000@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Davide Gardenal <davide.gardenal@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 15:49:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166288

On Mon, May 30, 2022 at 2:13 AM Davide Gardenal
<davidegarde2000@gmail.com> wrote:
>
> Minor bug fixes and security updates.

There is a similar patch in master:

https://git.openembedded.org/openembedded-core/commit/?id=a4fed908dbb53f7e03257bf317af534dda6a471c

I wasn't going to take it unless requested, since the release notes said:

"Mainly a bug-fix release, but also includes an update to Unicode
property handling"

Would like some feedback from others on whether this is likely to be
an issue or not.

> Delete CVE-2022-1586.patch, wrong CVE code (patch included in 10.40).
>
> CVE: CVE-2022-1587

If this is the case then you should submit a patch for master to
correct this.  If people agree that the version bump is suitable for
LTS I would then take the upgrade patch from master along with your
patch to fix the CVE confusion.

Thanks for helping with CVEs!

Steve

> Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
> ---
>  .../libpcre/libpcre2/CVE-2022-1586.patch      | 58 -------------------
>  .../{libpcre2_10.39.bb => libpcre2_10.40.bb}  |  5 +-
>  2 files changed, 2 insertions(+), 61 deletions(-)
>  delete mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2022-1586.patch
>  rename meta/recipes-support/libpcre/{libpcre2_10.39.bb => libpcre2_10.40.bb} (90%)
>
> diff --git a/meta/recipes-support/libpcre/libpcre2/CVE-2022-1586.patch b/meta/recipes-support/libpcre/libpcre2/CVE-2022-1586.patch
> deleted file mode 100644
> index 10d88d7b73..0000000000
> --- a/meta/recipes-support/libpcre/libpcre2/CVE-2022-1586.patch
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -From e881ed5028622959cf8859c053501fb1b16387f1 Mon Sep 17 00:00:00 2001
> -From: Hitendra Prajapati <hprajapati@mvista.com>
> -Date: Mon, 23 May 2022 13:52:39 +0530
> -Subject: [PATCH] CVE-2022-1586
> -
> -Upstream-Status: Backport from https://github.com/PCRE2Project/pcre2/commit/50a51cb7e67268e6ad417eb07c9de9bfea5cc55a
> -
> -Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ----
> - ChangeLog               | 3 +++
> - src/pcre2_jit_compile.c | 2 +-
> - src/pcre2_jit_test.c    | 3 +++
> - 3 files changed, 7 insertions(+), 1 deletion(-)
> -
> -diff --git a/ChangeLog b/ChangeLog
> -index d27542d..cd3da65 100644
> ---- a/ChangeLog
> -+++ b/ChangeLog
> -@@ -63,6 +63,9 @@ Version 10.39 29-October-2021
> -
> -   Reformat slightly to make it C89 compatible again.
> -
> -+23. Fixed a unicode properrty matching issue in JIT. The character was not
> -+fully read in caseless matching.
> -+
> -
> - Version 10.38 01-October-2021
> - -----------------------------
> -diff --git a/src/pcre2_jit_compile.c b/src/pcre2_jit_compile.c
> -index db2ce65..5baca9b 100644
> ---- a/src/pcre2_jit_compile.c
> -+++ b/src/pcre2_jit_compile.c
> -@@ -7473,7 +7473,7 @@ while (*cc != XCL_END)
> -     {
> -     SLJIT_ASSERT(*cc == XCL_PROP || *cc == XCL_NOTPROP);
> -     cc++;
> --    if (*cc == PT_CLIST)
> -+    if (*cc == PT_CLIST && *cc == XCL_PROP)
> -       {
> -       other_cases = PRIV(ucd_caseless_sets) + cc[1];
> -       while (*other_cases != NOTACHAR)
> -diff --git a/src/pcre2_jit_test.c b/src/pcre2_jit_test.c
> -index 8dee16e..7bb307e 100644
> ---- a/src/pcre2_jit_test.c
> -+++ b/src/pcre2_jit_test.c
> -@@ -412,6 +412,9 @@ static struct regression_test_case regression_test_cases[] = {
> -       { MUP, A, 0, 0 | F_PROPERTY, "[\\P{L&}]{2}[^\xc2\x85-\xc2\x89\\p{Ll}\\p{Lu}]{2}", "\xc3\xa9\xe6\x92\xad.a\xe6\x92\xad|\xc2\x8a#" },
> -       { PCRE2_UCP, 0, 0, 0 | F_PROPERTY, "[a-b\\s]{2,5}[^a]", "AB  baaa" },
> -       { MUP, 0, 0, 0 | F_NOMATCH, "[^\\p{Hangul}\\p{Z}]", " " },
> -+      { MUP, 0, 0, 0, "[\\p{Lu}\\P{Latin}]+", "c\xEA\xA4\xAE,A,b" },
> -+      { MUP, 0, 0, 0, "[\\x{a92e}\\p{Lu}\\P{Latin}]+", "c\xEA\xA4\xAE,A,b" },
> -+      { CMUP, 0, 0, 0, "[^S]\\B", "\xe2\x80\x8a" },
> -
> -       /* Possible empty brackets. */
> -       { MU, A, 0, 0, "(?:|ab||bc|a)+d", "abcxabcabd" },
> ---
> -2.35.3
> -
> diff --git a/meta/recipes-support/libpcre/libpcre2_10.39.bb b/meta/recipes-support/libpcre/libpcre2_10.40.bb
> similarity index 90%
> rename from meta/recipes-support/libpcre/libpcre2_10.39.bb
> rename to meta/recipes-support/libpcre/libpcre2_10.40.bb
> index 36c51d700a..3843d43b69 100644
> --- a/meta/recipes-support/libpcre/libpcre2_10.39.bb
> +++ b/meta/recipes-support/libpcre/libpcre2_10.40.bb
> @@ -8,14 +8,13 @@ SUMMARY = "Perl Compatible Regular Expressions version 2"
>  HOMEPAGE = "http://www.pcre.org"
>  SECTION = "devel"
>  LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENCE;md5=43cfa999260dd853cd6cb174dc396f3d"
> +LIC_FILES_CHKSUM = "file://LICENCE;md5=41bfb977e4933c506588724ce69bf5d2"
>
>  SRC_URI = "https://github.com/PhilipHazel/pcre2/releases/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
> -           file://CVE-2022-1586.patch \
>  "
>  UPSTREAM_CHECK_URI = "https://github.com/PhilipHazel/pcre2/releases"
>
> -SRC_URI[sha256sum] = "0f03caf57f81d9ff362ac28cd389c055ec2bf0678d277349a1a4bee00ad6d440"
> +SRC_URI[sha256sum] = "14e4b83c4783933dc17e964318e6324f7cae1bc75d8f3c79bc6969f00c159d68"
>
>  CVE_PRODUCT = "pcre2"
>
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166283): https://lists.openembedded.org/g/openembedded-core/message/166283
> Mute This Topic: https://lists.openembedded.org/mt/91429211/3617601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sakoman@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

