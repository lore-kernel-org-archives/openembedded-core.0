Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D91CC4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 10:20:30 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web09.9508.1667557224561680398
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Nov 2022 03:20:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=HPGZ1dfM;
 spf=pass (domain: linaro.org, ip: 209.85.208.170, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f170.google.com with SMTP id t10so5735953ljj.0
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 03:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=23dFXBeFd/l6QqofSUumnp+v3YOZMRTAEJowqVH0Uno=;
        b=HPGZ1dfMjHyn7/x6MfkmN4PIQp2Y6MC2KK3cXh8f8dj4AbpnGZNf7VaEXXtiTKQepB
         JoT61coPOgdaElc4UaQgnyJKKUQo8We+DIXSeaE22Y5F9r7uNu+8Fpv3t8CcqVTnklsa
         Rjs7AOxe1iI8tzvv3fpsD0LWb6HOmeW8NZIAhmSqDenJhnVJ4TYzH/Jm97+Y8W5mTkig
         7cafoXI7pGNyJw07CKrEGAElCLjbalDF8CR071auqqhMcq5eZy2JuP1gmqcaT6/LQuWa
         W/O58JgTfb7sFiNAFeE8s9WWNRvH/uW9Q3Bj0Zf3Vksh2NCtwg0Os3EHowC+vvO+thB2
         4q3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23dFXBeFd/l6QqofSUumnp+v3YOZMRTAEJowqVH0Uno=;
        b=RY2LKljHs/WcBkBQCCnZ1/d8pW0n3dhUF2mVhSJB9juOoO1wBSi0kWLkMUsYoHPjE9
         X/fQJJJO/AvmqYnHbvSDK+YcR73Sf+RUZyvBYQhFXCODQc0R1cK3wE3zCoCFjNApyg/2
         gYacMfzmr518VN942/EowJarKDiUiZFtYM9MRUH/EG2tkspCaS+Rk476SRF/EnqvH4yU
         bkulyoCqZTnbr/hRxqkK8VdeaNxw17SjRQXRmzYHYU/IoYkh6dvlEDuftpRG2oWDKR3d
         mSo6PiCz0zfJTNscrNHkcqj+kYaV9au/FNzuTTYb2martqNx4gXorne4GO3QZ1GEdjM0
         UAyA==
X-Gm-Message-State: ACrzQf3PF4Vk3HHI/3+9D+HRP/NIBMhNDZYQ/TfPub0qyoMRYfHZK/3+
	ldcFxXeSn1N9YQhhqFMvrRunfQ==
X-Google-Smtp-Source: AMsMyM4m1qfGFaNDAZpty2ZvOc/LP4aGOwRGheFvPlERY39GEDx1A153SuwRnMXTLRL+zOmqw8hYKA==
X-Received: by 2002:a2e:9982:0:b0:277:5ecb:1e20 with SMTP id w2-20020a2e9982000000b002775ecb1e20mr1788113lji.15.1667557222230;
        Fri, 04 Nov 2022 03:20:22 -0700 (PDT)
Received: from nuoska (dsl-olubng12-54fa1d-36.dhcp.inet.fi. [84.250.29.36])
        by smtp.gmail.com with ESMTPSA id o16-20020ac24e90000000b0049ad315cfc3sm413717lfr.162.2022.11.04.03.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 03:20:21 -0700 (PDT)
Date: Fri, 4 Nov 2022 12:20:19 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Chase Qi <chase.qi@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] libc-test: add libc testsuite for musl
Message-ID: <Y2TnY7I2mllJTkox@nuoska>
References: <20221104100140.976337-1-chase.qi@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221104100140.976337-1-chase.qi@linaro.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 10:20:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172707

On Fri, Nov 04, 2022 at 10:01:40AM +0000, Chase Qi wrote:
> libc-test is a collection of unit test to measure the correctness and
> robustness of a C/POSIX standard library implementation. It is developed
> as part of the musl project.
> 
> Signed-off-by: Chase Qi <chase.qi@linaro.org>
> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  meta/recipes-core/musl/libc-test/run-ptest    | 17 +++++++
>  meta/recipes-core/musl/libc-test_git.bb       | 50 +++++++++++++++++++
>  3 files changed, 68 insertions(+)
>  create mode 100644 meta/recipes-core/musl/libc-test/run-ptest
>  create mode 100644 meta/recipes-core/musl/libc-test_git.bb
> 
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> index 32b0e5297a..3c9ff43bd9 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -105,6 +105,7 @@ PTESTS_SLOW = "\
>  
>  PTESTS_SLOW:remove:riscv64 = "valgrind-ptest"
>  PTESTS_PROBLEMS:append:riscv64 = "valgrind-ptest"
> +PTESTS_SLOW:append:libc-musl = " libc-test-ptest"
>  
>  #    ruby-ptest \ # Timeout
>  #    lz4-ptest \ # Needs a rewrite
> diff --git a/meta/recipes-core/musl/libc-test/run-ptest b/meta/recipes-core/musl/libc-test/run-ptest
> new file mode 100644
> index 0000000000..a30cee590e
> --- /dev/null
> +++ b/meta/recipes-core/musl/libc-test/run-ptest
> @@ -0,0 +1,17 @@
> +#!/bin/sh
> +

Please use at least "set -e" to capture errors of failing
commands.

> +cd /opt/libc-test
> +make cleanall
> +make run | tee libc-test.log

Depending how this handles errors, the return value from
"make run" may need to be discarded, but I'd prefer
this to be explicit if "set -e" is used.

> +echo ""
> +echo "--- ptest result ---"
> +if grep -q '^FAIL src.*\.exe.*' libc-test.log; then
> +    # Consolidate output format.
> +    # e.g. "FAIL src/api/main.exe [status 1]" -> "FAIL: api_main"
> +    grep '^FAIL src.*\.exe.*' libc-test.log \
> +        | sed 's|^FAIL src/|FAIL: |;s|/|_|;s|\.exe.*\]||'
> +    exit 1
> +else
> +    echo "PASS: libc-test"

Would be nice if something would check that tests were actually
executed.

Cheers,

-Mikko

