Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.27176.1620000260722269760
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 May 2021 17:04:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=usgr35qv;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.51, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qv1-f51.google.com with SMTP id r13so1824471qvm.7
        for <openembedded-core@lists.openembedded.org>; Sun, 02 May 2021 17:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:date:message-id:subject:to;
        bh=4EVPJdqSEU0gqDDSuNkXNx1N21j4TNykndYbZhdLVgQ=;
        b=usgr35qvFQP3lk8ud4Kvo9kwfgbchltNngubRpA2fOhcFyLSxjzx4Zp1fqDw1flG3+
         YtjmyGcQzCeLcYt8zwsS3JgOiQQy2pNFS0EaM2+ekURhSuxYprx+RfMOLjW7nA4KvaKi
         mTHu3wijkxbJPNTO05Q2/KnElU1dq8RDZWXPD6IHpPHQk3FbhImpNcz1vOW4WapiudWH
         5KUORy9XbEvrX5Gn5uG6RBS+8VD0YyqGAIxEyA1ZQAEDst/amQbyQeVZ+r/E951dBmjH
         uoduZUK8xcEex97PZyajmiqyQPaK1FxUDJgXDuJg0bIVasWThgWaYJNX1yBHuC1IEoE2
         pbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:date:message-id:subject:to;
        bh=4EVPJdqSEU0gqDDSuNkXNx1N21j4TNykndYbZhdLVgQ=;
        b=RY4GdrrNMzJNRjv++XX5nKIvQgvO+G1AEPS4fBzSiJV2h5OUc5/omlC9Nm6vb9UwIw
         XUu5cbSF/Cjr3HXA2BNuDCFDubGuW0FavgkpEjR/SmOIk5Gwv0eRmtYQS3KJgNLnl4dp
         y1DEy3sjnUE4xEWaia1Wg+n71Vd6tCPMSzqOw1BiMMjy5DeO2/AvU2t1B30qXeV/j64z
         /sVlQTUv3weFe1aaN7ki7NyJtpnkY+pBYfI9s64u2YrqGxZocbDaY3SwC9za57BJnapG
         9tBf9PCd43PHcxWjfM7+jzHG8UNmBc3+6dLIZNSKzEiAvbc40tRnGl4X3BmMNMSIg7u6
         DpMg==
X-Gm-Message-State: AOAM530Vw8CptdGE3H8XUZWRW3OgF3P1VKKPiitkst491QDxAujgSvS6
	ZDbNSMa9+gV4U0Svzr04i4b/33vOr6HgYtLx
X-Google-Smtp-Source: ABdhPJwC5OgGjaSAfzBiUm378Tr3Cfv5R6VlKxGPSwPIlSMoc1eXSFRlECy3EX834XM01Ivbz4b4bA==
X-Received: by 2002:ad4:4f82:: with SMTP id em2mr16871949qvb.55.1620000259683;
        Sun, 02 May 2021 17:04:19 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com. [209.85.219.45])
        by smtp.gmail.com with ESMTPSA id h65sm7145497qkc.128.2021.05.02.17.04.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 May 2021 17:04:19 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qv1-f45.google.com with SMTP id h3so1807661qve.13
        for <openembedded-core@lists.openembedded.org>; Sun, 02 May 2021 17:04:19 -0700 (PDT)
X-Received: by 2002:a0c:f3d0:: with SMTP id f16mr12826318qvm.1.1620000258821;
 Sun, 02 May 2021 17:04:18 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 2 May 2021 21:04:07 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqJhiss1VOz8KF-cfQ5Hpq2MvOddMyd7ARvxBo6qkccYA@mail.gmail.com>
Message-ID: <CAP9ODKqJhiss1VOz8KF-cfQ5Hpq2MvOddMyd7ARvxBo6qkccYA@mail.gmail.com>
Subject: OpenEmbedded generated toolchain fail to build latest Linux
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	Andrey Zhizhikin <andrey.z@gmail.com>, "Purdie, Richard" <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Hello all,

While doing the upgrade of our Linux recipe to 5.12[1] we found that
we are unable to fully build it using the generated toolchain.

1. https://github.com/Freescale/meta-freescale/pull/756

We could improve it, adding the nativesdk-gmp and nativesdk-gmp-dev to
the toolchain however I ended facing another issue:

cc1: error: cannot load plugin
./scripts/gcc-plugins/arm_ssp_per_task_plugin.so:
./scripts/gcc-plugins/arm_ssp_per_task_plugin.so: undefined symbol:
_ZN8opt_pass14set_pass_paramEjb
cc1: error: cannot load plugin
./scripts/gcc-plugins/arm_ssp_per_task_plugin.so:
./scripts/gcc-plugins/arm_ssp_per_task_plugin.so: undefined symbol:
_ZN8opt_pass14set_pass_paramEjb
make[1]: *** [scripts/Makefile.build:271: scripts/mod/empty.o] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: *** [scripts/Makefile.build:116:
scripts/mod/devicetable-offsets.s] Error 1
make: *** [Makefile:1234: prepare0] Error 2

I tried that on an Ubuntu 20.04 and an Arch Linux system and it failed
on both cases. For now, I ended disabling the GCC_PLUGIN support and
moved on but it does not seem to be a good long term solution.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
