Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C8ACC4829B
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 13:56:59 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.6845.1707746209026950730
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 05:56:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MO+7N2Go;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5116b017503so4355787e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 05:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707746207; x=1708351007; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2+GJ5uzkKIBvcAtz94Km1RhIkET4kMY0REPoPH/8Ro8=;
        b=MO+7N2GoCvD0mmqhF3oyrSIgMZul8FdznZtFMNoPm4EZ20SMw2PG13LLwMx34ZGB0Q
         z6e4/4Y2Xa+izMcV6nRPrTrecquBRd0/9FsmFiRhJ+81W8wCqoNk6PcVdhE+89w/LrmQ
         jRpKT6uv0zmubxQ96B55Y+9Sx4DehfKUwuZM0JWYcYsrd1qWg2BHYqk/jS3DNTvIO931
         t3uLVZIOj3geLLowoXvBYuUgeynHUs8MK3/yPJwjPjVD1kVQWMt0m9tpPeS8uCANboAk
         ePmklPDfVzqdyg6X0O3Nk4zx9BTDSVFVrL9gKmp4o6GteyqnAFmKZxZ9dlBv0Zq8e7qq
         K0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707746207; x=1708351007;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2+GJ5uzkKIBvcAtz94Km1RhIkET4kMY0REPoPH/8Ro8=;
        b=UJDP7hOnt4C5gd+DpRzMoG3F5DfwvQ3ifAL4ABTrVbOEMCZg7JxnsMOrYwIpp1XK0g
         7Diny3NYNICMTQlbWGBIlcC7YzMl564jkPggUmY8qXXxd+AhcqSlGfNemhMYTVmlG19S
         yu86Q7TUHM+vt7SAlt+/FqiGteTuRrMpdzw64/fgfG8R9ApN+4rIGtUBs9ZtCMYZEQ3V
         o6TSSj9qdYcCscqTPfOClhOUPZUYneIMetevbsIWCEMAVIPZPYOq4aHbLJMW3xNYFno4
         Fp6s8MEWNSsXAUGE2y5LwvwAsLkRc/Vfs97GETVYqSHWyFPDp8LBhcslGhm/i+yl61Ca
         RZhg==
X-Gm-Message-State: AOJu0YxaB1K2gWAQVeu1DLYgTvPT1464Iqn0dvHvSGYCKDA7+QHmkuyN
	YcNfod5hHKALXNwZvtxIuxEbDb4R7N014rO69dJJukxkXPmDbPHZKARH39HzGTfoJWXV+iYuwy4
	x9zVpZT2f3V9lpVE+yAJGMeeTcio=
X-Google-Smtp-Source: AGHT+IFu3vnjOrSD2kyeow5AMBTK3IgpxTZe2Oqn3vN+gHx7K9dDxToU/JIMXXCrkviwqmc7qNyFCuTfK6wIR/qBYYU=
X-Received: by 2002:ac2:5dc8:0:b0:511:62ab:5f03 with SMTP id
 x8-20020ac25dc8000000b0051162ab5f03mr4409006lfq.60.1707746206844; Mon, 12 Feb
 2024 05:56:46 -0800 (PST)
MIME-Version: 1.0
References: <20240212134645.7972-1-mail2szahir@gmail.com>
In-Reply-To: <20240212134645.7972-1-mail2szahir@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 12 Feb 2024 14:56:35 +0100
Message-ID: <CANNYZj9Zzhp+Y0sFFOMbNOkocnX45WC+tEV7zZcaG-Uvj9h+Aw@mail.gmail.com>
Subject: Re: [OE-core][master][PATCH] alsa-lib: Enabling ptest for alsa-lib component
To: aszh07 <mail2szahir@gmail.com>
Cc: openembedded-core@lists.openembedded.org, ranjitsinh.rathod@kpit.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 13:56:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195330

This seems *very* incomplete. How was it tested, and can you show the
output of the test that was performed?

Alex

On Mon, 12 Feb 2024 at 14:47, aszh07 <mail2szahir@gmail.com> wrote:
>
> This change adds ptest for alsa-lib.
>
> 1) Adding CFLAGS change for include the header file path for resolving
>  below compilation issue;
>         In file included from ../../../alsa-lib-1.2.1.2/test/lsb/config.c:4:
>         ../../../alsa-lib-1.2.1.2/test/lsb/test.h:5:10: fatal error:
>         alsa/asoundlib.h: No such file or directory
>         5 | #include <alsa/asoundlib.h>
>
> 2) Removed the test suite execution 'make' call using 'sed' command.
>
> 3) Compiled the test directory source code using "oe_runmake check" command.
>
> 4) Copied all the required binaries into PTEST path using do_install_ptest()
>  function.
>
> Signed-off-by: aszh07 <mail2szahir@gmail.com>
> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  .../alsa/alsa-lib_1.2.10.bb                   | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+)
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> index 9057c12b09..78b4920996 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -5,6 +5,7 @@
>  #
>  PTESTS_FAST = "\
>      acl \
> +    alsa-lib-ptest \
>      apr-util \
>      attr \
>      babeltrace \
> diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb
> index 83bc6877d2..f3a4693a45 100644
> --- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb
> @@ -44,3 +44,22 @@ RREPLACES:alsa-conf = "alsa-conf-base"
>  RCONFLICTS:alsa-conf = "alsa-conf-base"
>
>  BBCLASSEXTEND = "native nativesdk"
> +
> +EXTRA_OEMAKE:append = " AM_CPPFLAGS=-I${S}/include"
> +
> +do_compile:append() {
> +        sed -i 's/^.*$(MAKE) $(AM_MAKEFLAGS) check-TESTS.*$/ /' ${S}/test/lsb/Makefile.in
> +        oe_runmake check
> +}
> +
> +do_install_ptest:append() {
> +    for f in control client_event_filter namehint
> +    do
> +        install -m 0755 "${B}/test/.libs/$f" "${D}${PTEST_PATH}";
> +    done
> +
> +    for f in config midi_event
> +    do
> +        install -m 0755 "${B}/test/lsb/.libs/$f" "${D}${PTEST_PATH}";
> +    done
> +}
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195320): https://lists.openembedded.org/g/openembedded-core/message/195320
> Mute This Topic: https://lists.openembedded.org/mt/104311177/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

