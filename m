Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BA1DC433FE
	for <webhook@archiver.kernel.org>; Wed, 16 Nov 2022 06:36:02 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.3890.1668580560976185946
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 22:36:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lCKKKgIw;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id t62so17446471oib.12
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 22:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uXrsSJfSJ6JCduAAZe86tQkeIcIxfTv3DQfxzUBan4I=;
        b=lCKKKgIwb/YsV2CivOW6OXU4ENaKVk/s8HQRMdW9B4HR6+qbXRq00pt866EWVQM2id
         6qsLhcjCOlCDEM1d1HOS7d8IUnfRH3NqnVMl4UHsGI/3YxL7KAy6yaSAL00CDTv1B8S0
         v/Pl8TfV7D3jg0Vdg6AM+7HZ5xRsdFlcPDNKd2NfjmROsx2h0EpLn7oGbJ/s2MKEqOk9
         cuL+Hz+53zzpAEWNreEk9jcEte3cYbOkkNISiMmsZd6ovh+LXE9ptwxLIg5MCQlKCSBG
         gcAMY8TUmFqByXxmDSa24/qowQwOP+947//dQ/YQrJKpKB+jl8sGkNWKaJ30rmBlQXn/
         MzxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uXrsSJfSJ6JCduAAZe86tQkeIcIxfTv3DQfxzUBan4I=;
        b=PkhJr4WJYvqKMt83UtB1R4/HzOCy9dBi9qhTYRIc3oPvZxCC3HJnTusp0IPhJ+q6kr
         Ud4wgrCguH6zhvp2XyHu3aXz3fGc6nIxdcQJF/lFkSSafHb87QMkYuSVkfFpNTS7aTmF
         egiaGUhm68fHJvR2RNIB6Bi0DJiLZpOGB2o11iH8UzFBmRnuq9HZJfqz0vahFvfOK3/o
         pC3cWRuFuKhqDBEBwT+fiVzzD1LK2GxBN1PLbBbJ1889nWjUJLQ/yBjAgOz1UMdrM9bj
         XRaqKKP2CCb2vJaE7Hg5ekYaJA0dQ0LBeJ8DEdnL/8cHJJj5bxbGW1BpwFpQXgcjrFHy
         SVXA==
X-Gm-Message-State: ANoB5pkMq7L+Ww6JlmREaBYkmZoN3X8AmgKOoEUwoO45JyAcKfgwsUH7
	4rX2SEmFw/cKZpJOTUKtlw2TYtzng5VfinTyJOnDugsB
X-Google-Smtp-Source: AA0mqf4ZS0oc6lCrFLyg/w8L36gX0WrDWHL9YO8NEkI8S6itpaoHhSv+H0y6lfyXFSio/azpncY0gWi3iXnVe/8t02s=
X-Received: by 2002:a05:6808:1c1:b0:34f:d32d:cad5 with SMTP id
 x1-20020a05680801c100b0034fd32dcad5mr829244oic.262.1668580559987; Tue, 15 Nov
 2022 22:35:59 -0800 (PST)
MIME-Version: 1.0
References: <20221115134531.34920-1-Qi.Chen@windriver.com>
In-Reply-To: <20221115134531.34920-1-Qi.Chen@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Nov 2022 22:35:33 -0800
Message-ID: <CAMKF1sqVM636L3GnsxUxVx_UkWq5MHceBBYYAnM9Q4BN-fGOog@mail.gmail.com>
Subject: Re: [OE-core][PATCH] resolvconf: make it work
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 06:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173380

On Tue, Nov 15, 2022 at 5:45 AM Chen Qi <Qi.Chen@windriver.com> wrote:
>
> The current resolvconf does not work. Make it work with the
> following changes.
> 1. Install normalize-resolvconf, which is used by resolvconf.
> 2. Add dependencies sed, coreutils, util-linux-flock.
>    util-linux-flock is needed by our busybox does not support '-w'
>    by default. coreutils is needed by the busybox's readlink does
>    not support '-m'. sed is needed because we want to avoid package
>    QA issue complaining sed is needed by no one provides it.

Can we avoid dependency on coreutils ? maybe check why -m is needed
and perhaps just use
absolute link.

>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
> index 94fd2c1a70..3bf5ec6c32 100644
> --- a/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
> +++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
> @@ -9,7 +9,7 @@ LICENSE = "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
>  AUTHOR = "Thomas Hood"
>  HOMEPAGE = "http://packages.debian.org/resolvconf"
> -RDEPENDS:${PN} = "bash"
> +RDEPENDS:${PN} = "bash sed coreutils util-linux-flock"
>
>  SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https;branch=unstable \
>             file://99_resolvconf \
> @@ -39,12 +39,14 @@ do_install () {
>         fi
>         install -d ${D}${base_libdir}/${BPN}
>         install -d ${D}${sysconfdir}/${BPN}
> +       install -d ${D}${nonarch_base_libdir}/${BPN}
>         ln -snf ${localstatedir}/run/${BPN} ${D}${sysconfdir}/${BPN}/run
>         install -d ${D}${sysconfdir} ${D}${base_sbindir}
>         install -d ${D}${mandir}/man8 ${D}${docdir}/${P}
>         cp -pPR etc/resolvconf ${D}${sysconfdir}/
>         chown -R root:root ${D}${sysconfdir}/
>         install -m 0755 bin/resolvconf ${D}${base_sbindir}/
> +       install -m 0755 bin/normalize-resolvconf ${D}${nonarch_base_libdir}/${BPN}
>         install -m 0755 bin/list-records ${D}${base_libdir}/${BPN}
>         install -d ${D}/${sysconfdir}/network/if-up.d
>         install -m 0755 debian/resolvconf.000resolvconf.if-up ${D}/${sysconfdir}/network/if-up.d/000resolvconf
> @@ -64,4 +66,4 @@ pkg_postinst:${PN} () {
>         fi
>  }
>
> -FILES:${PN} += "${base_libdir}/${BPN}"
> +FILES:${PN} += "${base_libdir}/${BPN} ${nonarch_base_libdir}/${BPN}"
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173345): https://lists.openembedded.org/g/openembedded-core/message/173345
> Mute This Topic: https://lists.openembedded.org/mt/95042786/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

