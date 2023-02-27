Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B253BC64ED8
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 09:24:01 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.86280.1677489838858530664
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 01:23:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=noTDRjQR;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id b10so5762159ljr.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 01:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677489837;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DOVMkeVHLSvPVr6Ielur3Xoe4XGXokXGkJLyNK6eTrE=;
        b=noTDRjQRLWOEwnnP5nMIWTjKD2t7cYZw4NbmosGVP/jfZYOAk0Dgg1G6zpaau6o5OX
         Nq3icf7FUYntYGKmbWNnBPtLg3fz2INLd1hxvjse1YU4115A7b77ZfO4xBKHqXw8Qjyd
         tAu91qZaFGSsGQgQJye+ctgSbh6Q8QKa0MR+FGysHG3qBSGtJbZ3S+1k9+WBsT5O8Jqm
         yIRE69WvKPC+0FhpkBH7Ik38/2I5iwsDsV2EbYCn4vhk9eGNMyZfFi+L9/E+TbWz5R1P
         jolfc5P1FoC/V6nCeDQNAvH5dXbfkb3+iiDzCI2DT3w9Hv8umOdeg4AKwbIabR7Jtsbw
         lrvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677489837;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DOVMkeVHLSvPVr6Ielur3Xoe4XGXokXGkJLyNK6eTrE=;
        b=04D3R5XFPCzP2Z6OGhVay4EdBypaq674baNY8yoUG0lKJcAiji88otncyj7JNMbXqw
         Qrg8wlYwzb5ZbuavqPY9c6JUof0h3OMlsVGku2xQkvtR6ke8heixgSr0YYTRf7jBGBEU
         Kj008qOJVhIBLfGZ8toKgQpOmQuDDt0QkCigt1EXJKTRKx0OWZwCrnhhzcdFbvPuoXov
         BOiWRJ2xFrt8Se9gaEj4G3tyQE8JDEY4/tNEWbU/dmA6xw0UggDgN8VFTdBW6lfgPgNS
         Kae0fnnSkuIiJsV+Mkj7QBbPcJw5kixk1njS4cKOSfVZ5fviSUsylVB6uXyVDi2vyPdM
         2PZg==
X-Gm-Message-State: AO0yUKVcmN486eeetvUd3XeKr/a93bZlmQQX96cHraPw8X4P+JUDGpSg
	zyVdbHonxZuZ3hLtQ6d68dqkOXifuGSNCVJglsbDDWst
X-Google-Smtp-Source: AK7set+QpposqHg6tXfsSZULfzCaDLEMSb8aS3cJwXq8oj6NvRZ+TcQf+LcCSSBNJ/EXaZ+zG/vreNr/JKq3cTvH/2k=
X-Received: by 2002:a2e:a4c3:0:b0:295:93eb:e790 with SMTP id
 p3-20020a2ea4c3000000b0029593ebe790mr5679135ljm.5.1677489837017; Mon, 27 Feb
 2023 01:23:57 -0800 (PST)
MIME-Version: 1.0
References: <20230227050040.12943-1-twoerner@gmail.com>
In-Reply-To: <20230227050040.12943-1-twoerner@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 27 Feb 2023 10:23:45 +0100
Message-ID: <CANNYZj_3f23wDNnxqLHDA8aQUS9u3HC00wk8t3O=+Y56iAhQ3A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] VOLATILE_TMP_DIR: add
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 09:24:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177780

Do we need tests for this?

Alex

On Mon, 27 Feb 2023 at 06:00, Trevor Woerner <twoerner@gmail.com> wrote:
>
> Provide a mechanism to allow users to choose whether the /tmp directory
> is on persistent storage (non-volatile) or a RAM-based tmpfs (volatile).
> The default is volatile.
>
> Works for both sysvinit-based and systemd-based systems.
>
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  meta/conf/bitbake.conf                           | 4 ++++
>  meta/recipes-core/initscripts/initscripts_1.0.bb | 3 +++
>  meta/recipes-core/systemd/systemd_252.5.bb       | 7 +++++++
>  3 files changed, 14 insertions(+)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index dcf6ce99d138..afd9e2f5527f 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -90,6 +90,10 @@ ROOT_HOME ??= "/home/root"
>  # If set to boolean false ('no', 'n', 'false', 'f', '0'), /var/log is on persistent storage.
>  VOLATILE_LOG_DIR ?= "yes"
>
> +# if set to 'yes': /tmp links to /var/tmp which links to /var/volatile/tmp
> +# otherwise:       /tmp is on persistent storage
> +VOLATILE_TMP_DIR ?= "yes"
> +
>  BB_RENAMED_VARIABLES[PNBLACKLIST] = "SKIP_RECIPE"
>  BB_RENAMED_VARIABLES[CVE_CHECK_PN_WHITELIST] = "CVE_CHECK_SKIP_RECIPE"
>  BB_RENAMED_VARIABLES[CVE_CHECK_WHITELIST] = "CVE_CHECK_IGNORE"
> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
> index 7c9d9ca4f107..4dc477bb8d69 100644
> --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
> @@ -108,6 +108,9 @@ do_install () {
>                 sed -i -e '\@^d root root 0755 /var/volatile/log none$@ a\l root root 0755 /var/log /var/volatile/log' \
>                         ${D}${sysconfdir}/default/volatiles/00_core
>         fi
> +       if [ "${VOLATILE_TMP_DIR}" != "yes" ]; then
> +               sed -i -e "/\<tmp\>/d" ${D}${sysconfdir}/default/volatiles/00_core
> +       fi
>         install -m 0755    ${WORKDIR}/dmesg.sh          ${D}${sysconfdir}/init.d
>         install -m 0644    ${WORKDIR}/logrotate-dmesg.conf ${D}${sysconfdir}/
>
> diff --git a/meta/recipes-core/systemd/systemd_252.5.bb b/meta/recipes-core/systemd/systemd_252.5.bb
> index ea468da150ce..8b92b2cf425c 100644
> --- a/meta/recipes-core/systemd/systemd_252.5.bb
> +++ b/meta/recipes-core/systemd/systemd_252.5.bb
> @@ -288,6 +288,13 @@ do_install() {
>                 rm -rf ${D}${localstatedir}/log/journal/remote
>         fi
>
> +       # if the user requests /tmp be on persistent storage (i.e. not volatile)
> +       # then don't use a tmpfs for /tmp
> +       if [ "${VOLATILE_TMP_DIR}" != "yes" ]; then
> +               rm -f ${D}${rootlibdir}/systemd/system/tmp.mount
> +               rm -f ${D}${rootlibdir}/systemd/system/local-fs.target.wants/tmp.mount
> +       fi
> +
>         install -d ${D}${systemd_system_unitdir}/graphical.target.wants
>         install -d ${D}${systemd_system_unitdir}/multi-user.target.wants
>         install -d ${D}${systemd_system_unitdir}/poweroff.target.wants
> --
> 2.36.0.rc2.17.g4027e30c53
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177772): https://lists.openembedded.org/g/openembedded-core/message/177772
> Mute This Topic: https://lists.openembedded.org/mt/97260351/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

