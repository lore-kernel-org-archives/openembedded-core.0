Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40838C05027
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 21:30:32 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web10.223.1676410227781031648
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 13:30:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oH51n+O6;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id bh15so14151912oib.4
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 13:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v+fiIZZFjSoQryhcmhRG204oSLJMT2JSt606mZ3Rfoc=;
        b=oH51n+O6THg3jZSCK2ZxODIttr0vzcVBGPnHPhRfgqYM0MtVVcN6nkNdpg86ROgeU9
         a+oaNUZzonYoaUf7UaAIYDlPRthc/yLTnmJw4XxjXNpiZ8fGfdw8qC8uoxYbh17xKpuY
         SjeW+v1dEDo2P0qbkqn0SJME37bTdT02fHmkEOzcQAfS7koXX6XSmkZJCTJ2AHXsrZnm
         Mwrv+NIgWq7npM56Vz0iJ45mchyxy8UilTrZwpldx1lMxLyly1mJpMlSBalqDQgu2VVD
         tcGgCOzbG/lCr9jAXFTgwL8kGrMiWCO6k3G9VwbJXOmoySZrjKlVh1mZAcEjSwD5NxOZ
         U+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v+fiIZZFjSoQryhcmhRG204oSLJMT2JSt606mZ3Rfoc=;
        b=G4M9lLDVg211vhU6znmsnG1hs+tBENvFa5u2jjUhqAp5P5xJxRoHcV3PtCtyfJBmZp
         vFLOvwUzhcwURPHJn4DvbYv9QtmShsFRdAiB0WtkeQvL5APkEw2rg0lT6v7mO2oW8jIb
         Zs3yBFR3nkiHN9Hm/HJymDfv5CJsXcIeinbtM3KijM9NVZx1zNilg3+wpbz+66ckajWL
         cxA7MilBgjIwZXq2uT/l3bUs3mKkitkSYlu3BWWuCTHqnFLUjgrbH/9rTtazYT8CTXrS
         Ldi4nFH9W/p1N38GW4cGwcxM7Q5NszyaHidkL7dbJ8HSd26POOO8a6u+CUzXvc0tNpRc
         ntAA==
X-Gm-Message-State: AO0yUKXIkZ0tgKTltfEQ3Z3+94RqTHTLOCQoMwHZdV7QMI+jVMKeL/KZ
	xPcAilYF/fy5/UZrqsHBxUIheb6ABHZcOUFn5ow=
X-Google-Smtp-Source: AK7set/c13Ri0sjYZ2u5zKiBA0gwbJhC3X5mj8VqWenloCyRgqfyjReIcI5w+zzHjtgghVKLj9ruw4mHlcnUUR4CMMo=
X-Received: by 2002:a05:6808:19a8:b0:37b:592b:ec39 with SMTP id
 bj40-20020a05680819a800b0037b592bec39mr70994oib.262.1676410226706; Tue, 14
 Feb 2023 13:30:26 -0800 (PST)
MIME-Version: 1.0
References: <20230214155603.2390194-1-ross.burton@arm.com> <20230214155603.2390194-2-ross.burton@arm.com>
In-Reply-To: <20230214155603.2390194-2-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Feb 2023 13:30:00 -0800
Message-ID: <CAMKF1sq_-tqcFGM8d=7ZU8g9O5cbzSt-Kv5tzT+qCVu4QfDGuQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] site: remove at-spi2-core values
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 21:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177175

these would need some testing, I wonder if there are other autotooled
recipes which indirectly are using these cached values.

On Tue, Feb 14, 2023 at 7:56 AM Ross Burton <ross.burton@arm.com> wrote:
>
> at-spi2-core is built with Meson now, so these values are not needed.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/site/arm-32         | 10 ----------
>  meta/site/arm-64         |  9 ---------
>  meta/site/ix86-common    | 10 ----------
>  meta/site/mips-common    | 10 ----------
>  meta/site/powerpc-common |  9 ---------
>  meta/site/x86_64-linux   | 10 ----------
>  6 files changed, 58 deletions(-)
>  delete mode 100644 meta/site/powerpc-common
>
> diff --git a/meta/site/arm-32 b/meta/site/arm-32
> index c6af852354e..be741617b67 100644
> --- a/meta/site/arm-32
> +++ b/meta/site/arm-32
> @@ -6,13 +6,3 @@ ac_cv_sizeof_ssize_t=${ac_cv_sizeof_ssize_t=4}
>
>  # jikes
>  ac_cv_sizeof_wchar_t=4
> -
> -# at-spi2-core
> -ac_cv_alignof_char=1
> -ac_cv_alignof_dbind_pointer=4
> -ac_cv_alignof_dbind_struct=1
> -ac_cv_alignof_dbus_bool_t=4
> -ac_cv_alignof_dbus_int16_t=2
> -ac_cv_alignof_dbus_int32_t=4
> -ac_cv_alignof_dbus_int64_t=8
> -ac_cv_alignof_double=8
> diff --git a/meta/site/arm-64 b/meta/site/arm-64
> index 79c10dab0e8..f4eae88471e 100644
> --- a/meta/site/arm-64
> +++ b/meta/site/arm-64
> @@ -6,12 +6,3 @@ ac_cv_sizeof_size_t=8
>  ac_cv_sizeof_ssize_t=8
>  ac_cv_alignof_char=1
>  ac_cv_alignof_double=8
> -
> -# at-spi2-core
> -ac_cv_alignof_dbind_pointer=8
> -ac_cv_alignof_dbind_struct=1
> -ac_cv_alignof_dbus_bool_t=4
> -ac_cv_alignof_dbus_int16_t=2
> -ac_cv_alignof_dbus_int32_t=4
> -ac_cv_alignof_dbus_int64_t=8
> -
> diff --git a/meta/site/ix86-common b/meta/site/ix86-common
> index b97b2e3f60c..eae5670d937 100644
> --- a/meta/site/ix86-common
> +++ b/meta/site/ix86-common
> @@ -170,13 +170,3 @@ ac_cv_lib_c_signalfd=${ac_cv_lib_c_signalfd=yes}
>  nfsd_cv_broken_setfsuid=${nfsd_cv_broken_setfsuid=0}
>  nfsd_cv_func_statfs=${nfsd_cv_func_statfs=statfs2_bsize}
>  nfsd_cv_bsd_signals=${nfsd_cv_bsd_signals=yes}
> -
> -# at-spi2-core
> -ac_cv_alignof_char=1
> -ac_cv_alignof_dbind_pointer=4
> -ac_cv_alignof_dbind_struct=1
> -ac_cv_alignof_dbus_bool_t=4
> -ac_cv_alignof_dbus_int16_t=2
> -ac_cv_alignof_dbus_int32_t=4
> -ac_cv_alignof_dbus_int64_t=4
> -ac_cv_alignof_double=4
> diff --git a/meta/site/mips-common b/meta/site/mips-common
> index ff1b7f4e5e0..55dc50beb18 100644
> --- a/meta/site/mips-common
> +++ b/meta/site/mips-common
> @@ -20,13 +20,3 @@ ac_cv_sizeof_ssize_t=${ac_cv_sizeof_ssize_t=4}
>
>  # slrn
>  slrn_cv_va_val_copy=${slrn_cv_va_val_copy=yes}
> -
> -# at-spi2-core
> -ac_cv_alignof_char=1
> -ac_cv_alignof_dbind_pointer=4
> -ac_cv_alignof_dbind_struct=1
> -ac_cv_alignof_dbus_bool_t=4
> -ac_cv_alignof_dbus_int16_t=2
> -ac_cv_alignof_dbus_int32_t=4
> -ac_cv_alignof_dbus_int64_t=8
> -ac_cv_alignof_double=8
> diff --git a/meta/site/powerpc-common b/meta/site/powerpc-common
> deleted file mode 100644
> index 02217c70f94..00000000000
> --- a/meta/site/powerpc-common
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -# at-spi2-core
> -ac_cv_alignof_char=1
> -ac_cv_alignof_dbind_pointer=4
> -ac_cv_alignof_dbind_struct=1
> -ac_cv_alignof_dbus_bool_t=4
> -ac_cv_alignof_dbus_int16_t=2
> -ac_cv_alignof_dbus_int32_t=4
> -ac_cv_alignof_dbus_int64_t=8
> -ac_cv_alignof_double=8
> diff --git a/meta/site/x86_64-linux b/meta/site/x86_64-linux
> index d7b7a530ff5..b9ee141fd5c 100644
> --- a/meta/site/x86_64-linux
> +++ b/meta/site/x86_64-linux
> @@ -83,13 +83,3 @@ ac_cv_func__restgpr_14_x=no
>
>  # cvs
>  cvs_cv_func_printf_ptr=${cvs_cv_func_printf_ptr=yes}
> -
> -# at-spi2-core
> -ac_cv_alignof_char=1
> -ac_cv_alignof_dbind_pointer=8
> -ac_cv_alignof_dbind_struct=1
> -ac_cv_alignof_dbus_bool_t=4
> -ac_cv_alignof_dbus_int16_t=2
> -ac_cv_alignof_dbus_int32_t=4
> -ac_cv_alignof_dbus_int64_t=8
> -ac_cv_alignof_double=8
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177153): https://lists.openembedded.org/g/openembedded-core/message/177153
> Mute This Topic: https://lists.openembedded.org/mt/96962710/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

