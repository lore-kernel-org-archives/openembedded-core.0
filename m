Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 378B4C433EF
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 00:17:51 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web09.22269.1653265065660791953
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 May 2022 17:17:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q7zGTty0;
 spf=pass (domain: gmail.com, ip: 209.85.222.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id t2so7608768qkb.12
        for <openembedded-core@lists.openembedded.org>;
 Sun, 22 May 2022 17:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KRrljkzqQQC56nSBzPfEQYBL9MiJ9sfpKvhHoykfsLA=;
        b=Q7zGTty0aAmgg1ZfPkcsAdKZgkno80uvtV0kvIYl8PBkN0aiDI6kxgIS/WBqlM/hBd
         AIe6K28QPL/uGH3Row379yU0JTiXYF3hl3RSxB2ZA9Kvb5jW01PLafsn6Plk6WL1x0Cp
         wZVt+VUP5xKT3kUxgTukeOh5qR6swvq1j3U85lQq73StnF7Cb95KRGkH959HVW0Euj8n
         bkq0zegPqc5ZQvegnFcjpMOVNVfyEU6CiSy3AZV34lvoiHQ1pAjfh6w6VMEbuI1QxwIH
         zm2M9q8UtB/3ssjKiyjXzImBxAAc6suq58UeWCV/kkXDtYyt2oELGJFmV33AL5mB+XDm
         /Big==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KRrljkzqQQC56nSBzPfEQYBL9MiJ9sfpKvhHoykfsLA=;
        b=NWsd9HChDYddKOkI21/1H0f++PMfcd2DhoCtfLlRbjBXzAEN6KMLdVXw6HxvF/emAo
         KjHvRDz0mQb6hUwyHanQ2v6+VuZQjLbo/qqms6p2N8j4EJW96kcgN3B5Y6u6lCXDd+fj
         +iFSfQDHKC0zhyS9VVp5cT9V1hgnd7BdYWQD+NBbiv3tTMQFZ4enaj9QIBbsEMQAN4yt
         7BKm5LapGBPH5i6jHbNSmM9zAPl+9OxI5E3IfaX5q9KzLL0S+AE4gu1xar35XfwdXS8Z
         8RE56i1OAeDsk6g75ED0+iwDv4LTb5fFmGxflRMROHXLnryeySrG6sc5PnNOkVtZRt9Z
         awPw==
X-Gm-Message-State: AOAM533YphOPHWOlWZhd9NSgYL5F0eJ2CjMqITauNr6NyJ5fdGrW8uRI
	PG4+YRFVHXHJLRn6d1YOczCWcyGZ1L2FjqO7p8I0Ln+XYJw=
X-Google-Smtp-Source: 
 ABdhPJwTbRWaEFhk2TZ4z8p2ZYuHf1p7mTcIpThaZfEgIT/V+LLBWkU7qUnFj/NvPbaBuL1Y+9J0Z+t6QO8RVbToC2c=
X-Received: by 2002:a05:620a:17a6:b0:6a0:8ebe:c24a with SMTP id
 ay38-20020a05620a17a600b006a08ebec24amr12411925qkb.227.1653265064598; Sun, 22
 May 2022 17:17:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220522173145.1015305-1-jiaqing.zhao@linux.intel.com>
In-Reply-To: <20220522173145.1015305-1-jiaqing.zhao@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 22 May 2022 17:17:18 -0700
Message-ID: 
 <CAMKF1sqhrZsABy8fkWRopzMSKipc7uV-guRazjShBnLwN9iwfw@mail.gmail.com>
Subject: Re: [oe-core] [PATCH 0/4] systemd: Update patches
To: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 00:17:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165987

I have sent patches to remove the obsolete patches few days ago some
of which are listed here. Please rebase your patch on top of master
and resend rebased patchset

On Sun, May 22, 2022 at 10:32 AM Jiaqing Zhao
<jiaqing.zhao@linux.intel.com> wrote:
>
> This patchset updates the existing systemd patches, these patches are
> upstreamed, no longer needed or fix needed. Update these patches before
> bumping to v251.
>
> Jiaqing Zhao (4):
>   systemd: Drop 0001-test-parse-argument-Include-signal.h.patch
>   systemd: Remove __compare_fn_t type in musl-specific patch
>   systemd: Drop 0002-don-t-use-glibc-specific-qsort_r.patch
>   systemd: Fix path returned in sd_path_lookup()
>
>  ...sysctl.d-binfmt.d-modules-load.d-to-.patch |  73 ++++++++
>  ...se-ROOTPREFIX-without-suffixed-slash.patch |  42 -----
>  ...test-parse-argument-Include-signal.h.patch |  27 ---
>  ...002-don-t-use-glibc-specific-qsort_r.patch | 163 ------------------
>  ...-missing_type.h-add-comparison_fn_t.patch} |  44 ++---
>  ...missing.h-check-for-missing-strndupa.patch |  14 +-
>  meta/recipes-core/systemd/systemd_250.5.bb    |   6 +-
>  7 files changed, 96 insertions(+), 273 deletions(-)
>  create mode 100644 meta/recipes-core/systemd/systemd/0001-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
>  delete mode 100644 meta/recipes-core/systemd/systemd/0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch
>  delete mode 100644 meta/recipes-core/systemd/systemd/0001-test-parse-argument-Include-signal.h.patch
>  delete mode 100644 meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
>  rename meta/recipes-core/systemd/systemd/{0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch => 0003-missing_type.h-add-comparison_fn_t.patch} (61%)
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165982): https://lists.openembedded.org/g/openembedded-core/message/165982
> Mute This Topic: https://lists.openembedded.org/mt/91272623/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

