Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ADFBCD37B4
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 14:17:52 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web10.30375.1694960267733034831
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 07:17:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=3QBFnn9m;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.177, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3aca0934e74so2122179b6e.0
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 07:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694960266; x=1695565066; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uu08LfO3yimFP+sbG81qmU55xziGWYzw0MyHZN1yejw=;
        b=3QBFnn9mfpKQvKHNagTkiIzkvuB9RMcNV14Ku+95hOWPddM9pO+WilFehZuU18B9v+
         dFcP8O2Zo6xJEl9JPMS12utk3nQT5ohYgk8eM4amuYBeOuRTBr2xnxVX6gPneEapPMc9
         0dl+2w0WaUY56Gbyek6WAZ9Q/L5uVq9N/pOu9HThRNC3nofGnpUv0XtzzIuTXC3bno9J
         7dBUAKbXhoh+O+3semREQypoO7cNHEGA9AqplArSLndb5M5H4aTrqkBbbCpS+SJGBvWh
         g1YbhKiMUyrjSm6TS/l9FaBrTsiUVcVo3peakPxKEZAoz03kkuzhGB7/azo/fFudoMar
         F8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694960266; x=1695565066;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Uu08LfO3yimFP+sbG81qmU55xziGWYzw0MyHZN1yejw=;
        b=Nrikjiiu5c1VVmw9TnVF1ltvppFrXPoXk+qZZ2GVA+dQTKbn12oxdtUhg3+X2X2UCJ
         B0zmImZK4qMU83PJQE+FshhDd91vRPXQ5QVKpsxZdq2I4GxWLOGCX4zqAK9FlgGfX1jZ
         gKje/ZmBK7WOuDMUJOt7A+4w5TE0/myfTs1ih8GQ8bIkTwMhp1d11ARTcflIU9CaoXiI
         hx/ArI5mg1Ll0wGeFZ9bijJYanKNPmcApbE7ZA4cyce8/9sKV0vFsKR1PfE1bMRDQNGR
         6tPkyVSDIyH8EXHXmcOZ+adCZNqs6GueCpl7FzwMoTFQ8l8GQtiCX0E+A0AS3y0gYgnU
         3knQ==
X-Gm-Message-State: AOJu0YyenwXz6tqAeoQMDYoPaS4pAuWo8dw3+Gk3WS5V7DkHizNBRyXf
	VCU9TpNII8iYt9wOPicszdrlH8O5Mz7jaZwnRN8PyQ==
X-Google-Smtp-Source: AGHT+IG78j40qMGoq8GuEPhQE38D7IUqyHm/IMtGgqiEciM91Vx3pNYbRaHpMp83pVEuibADB4SCjw==
X-Received: by 2002:a05:6870:8984:b0:1b0:e98:163b with SMTP id f4-20020a056870898400b001b00e98163bmr7284463oaq.21.1694960266485;
        Sun, 17 Sep 2023 07:17:46 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id dr9-20020a05621408e900b0064910f273aesm2111308qvb.146.2023.09.17.07.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 07:17:46 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 7E7F7106A8A; Sun, 17 Sep 2023 04:17:43 -1000 (HST)
Subject: OE-core CVE metrics for mickledore on Sun 17 Sep 2023 04:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 17 Sep 2023 04:17:43 -1000
Message-Id: <20230917141743.7E7F7106A8A@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 14:17:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187807

Branch: mickledore

New this week: 14 CVEs
CVE-2023-3777 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3777 *
CVE-2023-39318 (CVSS3: 6.1 MEDIUM): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39318 *
CVE-2023-39319 (CVSS3: 6.1 MEDIUM): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39319 *
CVE-2023-4015 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4015 *
CVE-2023-4039 (CVSS3: 4.8 MEDIUM): gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:gcc-source-12.3.0:libgcc:libgcc-initial https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4039 *
CVE-2023-4206 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4206 *
CVE-2023-4207 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4207 *
CVE-2023-4208 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4208 *
CVE-2023-4244 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4244 *
CVE-2023-42467 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42467 *
CVE-2023-4622 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4622 *
CVE-2023-4807 (CVSS3: 7.8 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4807 *
CVE-2023-4881 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4881 *
CVE-2023-4921 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4921 *

Removed this week: 6 CVEs
CVE-2020-22218 (CVSS3: 7.5 HIGH): libssh2:libssh2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-22218 *
CVE-2023-24329 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24329 *
CVE-2023-29409 (CVSS3: 5.3 MEDIUM): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29409 *
CVE-2023-39533 (CVSS3: 7.5 HIGH): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39533 *
CVE-2023-40217 (CVSS3: 5.3 MEDIUM): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40217 *
CVE-2023-41105 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-41105 *

Full list:  Found 76 unpatched CVEs
CVE-2020-11935 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11935 *
CVE-2021-3714 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-33065 (CVSS3: 7.8 HIGH): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-33065 *
CVE-2022-3533 (CVSS3: 5.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3533 *
CVE-2022-3606 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3606 *
CVE-2022-36402 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36402 *
CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-3964 (CVSS3: 8.1 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3964 *
CVE-2022-3965 (CVSS3: 8.1 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3965 *
CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46456 *
CVE-2022-48502 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48502 *
CVE-2023-0160 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0160 *
CVE-2023-1206 (CVSS3: 5.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1206 *
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-1544 (CVSS3: 6.3 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1544 *
CVE-2023-2176 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2176 *
CVE-2023-23039 (CVSS3: 5.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-23039 *
CVE-2023-2430 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2430 *
CVE-2023-28736 (CVSS3: 6.7 MEDIUM): mdadm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28736 *
CVE-2023-28938 (CVSS3: 4.4 MEDIUM): mdadm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28938 *
CVE-2023-2898 (CVSS3: 4.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2898 *
CVE-2023-3019 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3019 *
CVE-2023-3180 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3180 *
CVE-2023-3354 (CVSS3: 7.5 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3354 *
CVE-2023-35827 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-35827 *
CVE-2023-3611 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3611 *
CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-37453 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-37453 *
CVE-2023-37454 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-37454 *
CVE-2023-3772 (CVSS3: 4.4 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3772 *
CVE-2023-3773 (CVSS3: 4.4 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3773 *
CVE-2023-3776 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3776 *
CVE-2023-37769 (CVSS3: 6.5 MEDIUM): pixman:pixman-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-37769 *
CVE-2023-3777 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3777 *
CVE-2023-38560 (CVSS3: 5.5 MEDIUM): ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38560 *
CVE-2023-3863 (CVSS3: 4.1 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3863 *
CVE-2023-39318 (CVSS3: 6.1 MEDIUM): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39318 *
CVE-2023-39319 (CVSS3: 6.1 MEDIUM): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39319 *
CVE-2023-40030 (CVSS3: 6.1 MEDIUM): rust:rust-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40030 *
CVE-2023-4004 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4004 *
CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-4015 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4015 *
CVE-2023-40283 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40283 *
CVE-2023-40360 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40360 *
CVE-2023-4039 (CVSS3: 4.8 MEDIUM): gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:gcc-source-12.3.0:libgcc:libgcc-initial https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4039 *
CVE-2023-4128 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4128 *
CVE-2023-4132 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4132 *
CVE-2023-4133 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4133 *
CVE-2023-4135 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4135 *
CVE-2023-4147 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4147 *
CVE-2023-4194 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4194 *
CVE-2023-4206 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4206 *
CVE-2023-4207 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4207 *
CVE-2023-4208 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4208 *
CVE-2023-4244 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4244 *
CVE-2023-42467 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42467 *
CVE-2023-4273 (CVSS3: 6.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4273 *
CVE-2023-4569 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4569 *
CVE-2023-4611 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4611 *
CVE-2023-4622 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4622 *
CVE-2023-4733 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4733 *
CVE-2023-4734 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4734 *
CVE-2023-4735 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4735 *
CVE-2023-4736 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4736 *
CVE-2023-4738 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4738 *
CVE-2023-4750 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4750 *
CVE-2023-4752 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4752 *
CVE-2023-4781 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4781 *
CVE-2023-4807 (CVSS3: 7.8 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4807 *
CVE-2023-4881 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4881 *
CVE-2023-4921 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4921 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

