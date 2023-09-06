Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34644EB8FDF
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 14:39:24 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.10558.1694011162371754883
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 07:39:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=cr/AAZ3d;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2bbbda48904so61665451fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 07:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694011160; x=1694615960; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F14DHW8ALX0Gf2tWkO1QgQSLr8kmdpIgylW+3/kGaU4=;
        b=cr/AAZ3dtx02xwihPm8IoxkjPRfbBLkHjSvkhYXaYetxvJeqBIOoQcEnHn53WnsBTo
         EGWrxFmX0Z4BvOHrkNQEq/mzQfLK3uf0NQQvomNsgLfMYTy0TQbud9Y4a4uQk83MUnf1
         tHVeknesrO0PDmfetiTtFHmL86F8JVHCKnFPrDG5GWREvSDdOtXTTm2eOS+fArU4OTn0
         Trr3t5EWUKxb5tKU4oAzxs4nKvEoYmp/aApY8mgD1bafr1EdzVShTL104gVjpzi0GIkR
         8qSY+D+IXq5nsyWrihPd5Exq8XELJSnkmibSgA2U0dYyTJQRdEtMvXkKAhZfnKtY+du+
         IGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694011160; x=1694615960;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F14DHW8ALX0Gf2tWkO1QgQSLr8kmdpIgylW+3/kGaU4=;
        b=Dt9cKW0Hn5N5jb6eTq9J9FxokzL9lASGeZYywvVuno6+Ff1h6qQm2GlVC4/VNrdAhR
         OX+H38QW8Ca/xevz8ymfvgMTONk2gNw/Z0U7yNKb2VJkRx5Y55WYHVeGdrZJgYgXjAQz
         JT1fmkbPDhGnw9g7LU0SCCxr1sfKOzYD0pmtckjqeknvL6uMLj27urYimJE7XojyEdSu
         aCXBaXn2r6s/o1AxboGu6cyiOKZ/Nf77clN3EPS1xvylyKl2/2iLKsGkWLcMufQzV7tH
         TXf0Rs3P0Xk2pye9MC/u6AS1Pn2q9o6Om1wCBFd71tt8iPGpJdTEOAwYOZ3QEr6yJm7u
         RLrA==
X-Gm-Message-State: AOJu0YyKibi9i0md6ep0ixhUrTYR20oa7mPMtKZDsftxiGR9JO/ItxzY
	d0iA68xUuXQedYReWKAPNTeumOrCRsYs6WalvdM=
X-Google-Smtp-Source: AGHT+IHnpUjAoibAH2bdGNgzHR95+4Xa28AQPnCV9g4LlGuFx6TJZR6tLD0u4UT74IHJjPSsZqHEc9RTMgS665Eb2WQ=
X-Received: by 2002:a2e:9e8d:0:b0:2be:58f3:ccee with SMTP id
 f13-20020a2e9e8d000000b002be58f3cceemr2349170ljk.41.1694011160260; Wed, 06
 Sep 2023 07:39:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230906142909.1978104-1-mikko.rapeli@linaro.org>
In-Reply-To: <20230906142909.1978104-1-mikko.rapeli@linaro.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 6 Sep 2023 16:39:08 +0200
Message-ID: <CANNYZj-JHxfdFOuJVY4KLhKgomMO+-eyMCDcBuUSkCXA63pY_A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] openssh: capture ptest regression test
 failure logs
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 14:39:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187318

Thanks!

Alex

On Wed, 6 Sept 2023 at 16:29, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
>
> When tests fail, capture the sshd and ssh client logs from
> the failing test run. These are needed to investigate
> the root cause.
>
> Reference: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15178
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  ...ss-Makefile-print-logs-if-test-fails.patch | 34 +++++++++++++++++++
>  .../openssh/openssh_9.4p1.bb                  |  1 +
>  2 files changed, 35 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-openssh-regress-Makefile-print-logs-if-test-fails.patch
>
> v2: Upstream-Status from Pending to Submitted, https://github.com/openssh/openssh-portable/pull/437
>
> v1: https://lists.openembedded.org/g/openembedded-core/message/187315
>
> diff --git a/meta/recipes-connectivity/openssh/openssh/0001-openssh-regress-Makefile-print-logs-if-test-fails.patch b/meta/recipes-connectivity/openssh/openssh/0001-openssh-regress-Makefile-print-logs-if-test-fails.patch
> new file mode 100644
> index 0000000000..baa68dc6ff
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh/0001-openssh-regress-Makefile-print-logs-if-test-fails.patch
> @@ -0,0 +1,34 @@
> +From 554f7baed050f89ffc2a7192d3071e8c5420f6d3 Mon Sep 17 00:00:00 2001
> +From: Mikko Rapeli <mikko.rapeli@linaro.org>
> +Date: Fri, 25 Aug 2023 10:35:28 +0000
> +Subject: [PATCH] openssh regress/Makefile: print logs if test fails
> +
> +Some tests are failing in CI runs and reproduction has failed. Print
> +the captured sshd and ssh client logs if test fails. This should
> +help to fix the root causes.
> +
> +Reference: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15178
> +
> +Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> +---
> + regress/Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +Upstream-Status: Submitted [https://github.com/openssh/openssh-portable/pull/437]
> +
> +diff --git a/regress/Makefile b/regress/Makefile
> +index d80bf59..a972dff 100644
> +--- a/regress/Makefile
> ++++ b/regress/Makefile
> +@@ -229,7 +229,7 @@ t-exec:    ${LTESTS:=.sh}
> +               done; \
> +               if [ "x$${skip}" = "xno" ]; then \
> +                       echo "run test $${TEST}" ... 1>&2; \
> +-                      (env SUDO="${SUDO}" TEST_ENV=${TEST_ENV} ${TEST_SHELL} ${.CURDIR}/test-exec.sh ${.OBJDIR} ${.CURDIR}/$${TEST}) || exit $$?; \
> ++                      (env SUDO="${SUDO}" TEST_ENV=${TEST_ENV} ${TEST_SHELL} ${.CURDIR}/test-exec.sh ${.OBJDIR} ${.CURDIR}/$${TEST}) || (echo return value: $$?; echo capturing logs; cat *.log; exit 1); \
> +               else \
> +                       echo skip test $${TEST} 1>&2; \
> +               fi; \
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-connectivity/openssh/openssh_9.4p1.bb b/meta/recipes-connectivity/openssh/openssh_9.4p1.bb
> index 3f232a839d..2c85780e4d 100644
> --- a/meta/recipes-connectivity/openssh/openssh_9.4p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_9.4p1.bb
> @@ -24,6 +24,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
>             file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
>             file://sshd_check_keys \
>             file://add-test-support-for-busybox.patch \
> +           file://0001-openssh-regress-Makefile-print-logs-if-test-fails.patch \
>             "
>  SRC_URI[sha256sum] = "3608fd9088db2163ceb3e600c85ab79d0de3d221e59192ea1923e23263866a85"
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187317): https://lists.openembedded.org/g/openembedded-core/message/187317
> Mute This Topic: https://lists.openembedded.org/mt/101193789/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

