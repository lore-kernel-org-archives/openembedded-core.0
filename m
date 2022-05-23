Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEB1EC433F5
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 02:34:31 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web12.23196.1653273263346570772
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 May 2022 19:34:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dpoO9ttj;
 spf=pass (domain: gmail.com, ip: 209.85.222.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id r84so526475qke.10
        for <openembedded-core@lists.openembedded.org>;
 Sun, 22 May 2022 19:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kzfA3V2BRXY7M3UYMpxXRdWNZwZ/rVVjcPcXuDVxMPI=;
        b=dpoO9ttj9y58G7CTxKh9ckFyHo1YxOSx9O0ns/mNb9/zL/NxZiYBqU4oN+OOpPMJWF
         r4fEf51XPRr+yag1PAUjdluVHb+5tqLD1SAu0D43PYFJXgPjqJXWoq7jQ37k7ZSlr3ys
         lnoVIlJ4cPSJIyUlkl2YETSXsJQRNCpWmTemP0QudGEUW3wfNOs1YPasdrIEtXNj77tj
         fPgN4rRlroCv/S2xKVva2qkC/RgTKwEgaim+SkQosqtFhyPsvNdHBCntNloc3nxc85Mu
         N7KYdbJ5D0OTawRm7uaIoNOyzTZibs6JzLqVgM+OpVbh8STza2kEpSOxmi5V6mc58ZKJ
         gyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kzfA3V2BRXY7M3UYMpxXRdWNZwZ/rVVjcPcXuDVxMPI=;
        b=abq6yakdF9KlpwYp6cQbGIMsqg/rY6ZpJf1zQXm/n4JRTs3+oqGC7+VJTbpwhtJYtz
         dav1m6WeAQ4QkUJsTy2NKUSES6N199kZtswShxBwYdtJN6i3jvKn12yVCsRxJl6mYm7R
         QEEh5K0FTMPFAOIKBb1aJke6T6IKp7Jp7yf1S8FQYQP8xJ2ELzTKsWdBYL0x3sQkhY6A
         zsmksQ+8+nZ65HZRo01Xx9ctx9PH4HvWTT3bXzV2LwVOda4ZWZOBvIU0Jme++SzGb0mU
         H94vP+LKSdHJ5RL7ofub9pO/fwPCJ/NPWVQwWPBseCKtWPOXLrwgtQoDcwmb5HtHq7HU
         m1NQ==
X-Gm-Message-State: AOAM53308LozgKFKztQmY42T1x3DknOm8AVnef81o8C10qa2rd/ctC8A
	c3nFpVr/o6uB7ytR++t/lpTZxXwnvGpw7MJs/Hd1J71J9z0=
X-Google-Smtp-Source: 
 ABdhPJxVzECrhGwc+TjXvhshuk1FYnYEwVhBL4NiHQoLel2TZ0FM+Sh+7vuZSWjW6HcYOqDbzPG5f7vfPbkEgnchfzg=
X-Received: by 2002:a05:620a:172b:b0:6a0:2734:a947 with SMTP id
 az43-20020a05620a172b00b006a02734a947mr12939542qkb.149.1653273262292; Sun, 22
 May 2022 19:34:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220523022014.1203675-1-jiaqing.zhao@linux.intel.com>
In-Reply-To: <20220523022014.1203675-1-jiaqing.zhao@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 22 May 2022 19:33:56 -0700
Message-ID: 
 <CAMKF1sobD1EPHK3gQ+OcmC6c9F91U-KZkW5xdNgrDs8B7nQeYw@mail.gmail.com>
Subject: Re: [oe-core] [PATCH v2 0/4] systemd: Update patches
To: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 02:34:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165994

On Sun, May 22, 2022 at 7:20 PM Jiaqing Zhao
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
>   systemd: Correct path returned in sd_path_lookup()
>
> v2: Update description fot the sd_path_lookup patch.
>

Thanks, have you tested these patches with musl ?

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
> View/Reply Online (#165988): https://lists.openembedded.org/g/openembedded-core/message/165988
> Mute This Topic: https://lists.openembedded.org/mt/91280598/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

