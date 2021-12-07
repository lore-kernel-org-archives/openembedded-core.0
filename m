Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66185C433EF
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 06:44:27 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web08.63807.1638859464312645467
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 22:44:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Xdo6x695;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id p3so12235286qvj.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 22:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jxLa8c37M47dhzR3rCmaCwcQre5kQL1z30L9BU3WLV4=;
        b=Xdo6x695Tb2BGcXgZPacXXvPU+pGPMHZ1+5KY3q0hgPCozjfTuX+pjSzJvt7+dhhTc
         ilgsx+WfvhemFsyZHlEBL0a1MOsjqvR7AMqQwatLDwlGgHhs2pKahk13WUHqFp1aBBXv
         x5uy2is0+fW4KmLsXiTgtmnFYwoNI6SzF6r/UGs3I6EBb5g8fFm3tfVdI09WKDpRxIzh
         v2hdb74Q1vyizdMqA8vORdUin12EvRKBjXV+o5TOmAKro5gfCZmh4rUTZKCQBxCH/NSl
         OeiMYUiefpLFweXmesvkd2JP8D4MTTaXgbsEWstfdDoVMkWUb5ZqkPIcpqPUrhQV/30L
         14Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jxLa8c37M47dhzR3rCmaCwcQre5kQL1z30L9BU3WLV4=;
        b=KqJxrUICNnVD4Ai5FiAZZabCjAeV39xhYqO946PTMfcFJybeDDK7B+fn+CdDdTRcbe
         0pXyh5wGfSmHa6MITkipRyB/fuprwQ6SNTqFbiHAi4VuN4ZNNGCeDG6MISe1WKIVL9lg
         uoUzNb9U6xcXKrO/UWBxMoOAHDCkh5HnOuqjqa/SKq69ai1CT1QrFSI1DvHiuvkX5fy5
         X6tr0PckykSIzWoWiK1X802/JyISa/d1jsi0wxJpif4HkRhxD8Gg1BSLOuMCAGSg5EW5
         o5GX/z+t1IPaQeuR5dxgnRF+kxM7bOBHcb17bSM1/UONP3u6oXt4ZNK/qJxxZLWjD8Iz
         /0wA==
X-Gm-Message-State: AOAM530O7s8wj4E2Wau2OpN8i+e3n8RTd/pW/jXMyHd4qgEJmE5nZeTa
	2uD3pXP45H9RjKNbO+G9xDJX2c88/Uky+zZRGLk=
X-Google-Smtp-Source: 
 ABdhPJzJ5VJ45ZzolgOfWbOfWGfQsXhSQLhT5HaDfbTUgbL9D9OlRgnHS1V9+KjXcdJKxuWaHsAGuUvNnM2r4AAuH5w=
X-Received: by 2002:a05:6214:c83:: with SMTP id
 r3mr43066375qvr.110.1638859463402;
 Mon, 06 Dec 2021 22:44:23 -0800 (PST)
MIME-Version: 1.0
References: <20211206124721.3899116-1-ross.burton@arm.com>
In-Reply-To: <20211206124721.3899116-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Dec 2021 22:43:56 -0800
Message-ID: 
 <CAMKF1sowYkumsC-DuphC3UxAEtWPsnEohYnkunct2iQFnaJH0w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] tcf-agent: cleanup patches
To: Ross Burton <ross@burtonini.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 06:44:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159282

On Mon, Dec 6, 2021 at 4:47 AM Ross Burton <ross@burtonini.com> wrote:
>
> ldflags.patch isn't really suitable for upstream, so mark inappropriate.
>
> fix_ranlib.patch has been rebased into uselessness over time, it's now
> setting RANLIB to just '$@' which expands to '' when called, so is a
> null operation.

this works with gcc-ranlib wrapper only which expands $@ shell array,
but it will fail if RANLIB was set to <cross>-ranlib or
<cross>-llvn-ranlib has same behaviour
so IMO  this patch should be kept for portability reasons.

>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../tcf-agent/tcf-agent/fix_ranlib.patch        | 17 -----------------
>  .../tcf-agent/tcf-agent/ldflags.patch           |  6 +++++-
>  .../recipes-devtools/tcf-agent/tcf-agent_git.bb |  1 -
>  3 files changed, 5 insertions(+), 19 deletions(-)
>  delete mode 100644 meta/recipes-devtools/tcf-agent/tcf-agent/fix_ranlib.patch
>
> diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent/fix_ranlib.patch b/meta/recipes-devtools/tcf-agent/tcf-agent/fix_ranlib.patch
> deleted file mode 100644
> index abd33babeb..0000000000
> --- a/meta/recipes-devtools/tcf-agent/tcf-agent/fix_ranlib.patch
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -Actually pass the arguments to RANLIB.
> -
> -Upstream-Status: Pending
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -Index: agent/Makefile.inc
> -===================================================================
> ---- a/Makefile.inc
> -+++ b/Makefile.inc
> -@@ -92,6 +92,7 @@ ifeq ($(OPSYS),GNU/Linux)
> -     OPTS += -DUSE_uuid_generate=0
> -   endif
> -   OPTS += -DENABLE_arch_$(shell uname -m)
> -+  RANLIB += $@
> - endif
> -
> - ifneq ($(OPSYS),Windows)
> diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch b/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
> index c03c55d22b..dfe492091c 100644
> --- a/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
> +++ b/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
> @@ -1,4 +1,8 @@
> -Upstream-Status: Pending
> +We need LDFLAGS to be respected otherwise there are QA warnings as the right
> +flags don't get used.
> +
> +Upstream-Status: Inappropriate
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
>
>  From d92af0483c20365fd0af740d0baef8870b4aa374 Mon Sep 17 00:00:00 2001
>  From: Abdur Rehman <abdur_rehman@mentor.com>
> diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
> index d6d563d8e7..0d627f4e23 100644
> --- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
> +++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
> @@ -11,7 +11,6 @@ PV = "1.7.0+git${SRCPV}"
>
>  UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
>  SRC_URI = "git://git.eclipse.org/r/tcf/org.eclipse.tcf.agent.git;protocol=https;branch=master \
> -           file://fix_ranlib.patch \
>             file://ldflags.patch \
>             file://tcf-agent.init \
>             file://tcf-agent.service \
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159226): https://lists.openembedded.org/g/openembedded-core/message/159226
> Mute This Topic: https://lists.openembedded.org/mt/87538834/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

