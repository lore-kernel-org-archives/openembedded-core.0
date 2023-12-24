Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B6E7C46CD2
	for <webhook@archiver.kernel.org>; Sun, 24 Dec 2023 14:18:38 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.27112.1703427515826213208
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Dec 2023 06:18:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZMxPHqtk;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.173, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-78104f6f692so248348885a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Dec 2023 06:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703427514; x=1704032314; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLgKV/3R640To9tbDTPVc7hyVUkt+ciuUVYbeihSOJc=;
        b=ZMxPHqtkWH/nzGi3RfPvTWYo2tk8FfR/9Rw05/B7evMSC94xxrIBoxrJOUK1DGM6W5
         8ntF7qGe4xvZXEzPCtVIxvCiRLPU07swd8zQQcHWl5em/DAnrxWd6kTLHFKeIRSUkz5H
         dKXJmSkDJpFxguTf4DWA515SsGC9rpET6FIAR6UUDcScns2ukrhfUy6QODI5nFWAxe+s
         Lo5fchzeGfDenteSZhtJnYoJboGJpxyxIxXR7G7zSqJ60x4S73WEdOqvVcXWYvjuTBQz
         LcnXmiVPox2S9bvyslfqZRobJ5EDZt/FrQIUWSA247mWeztBAbe0c/62HUGclQRwtGVD
         diwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703427514; x=1704032314;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KLgKV/3R640To9tbDTPVc7hyVUkt+ciuUVYbeihSOJc=;
        b=Bv8itzWLyFLxJQx9iDK0cFRGTTGz+IPRvNWUkj/TL6gtIKtrvhObQMfdOj4JD9U20h
         LO6qBf9xFOW64rGpFGFN2WyEbDkonLSsw3BZjldC4r4oyLfonJmeUc6bh1y8bEb3MlrD
         YMkoaV+CtetgFfNNxGIXLCpGKfEPvaimiltjvc88VLppvhVhl6G4tbTN4J5iDQ1AMMCI
         0Q6azhG6I2sCL/S4DwIsNEeC7VbYlFw2v00TjvHfB+bhq4+uUmatSdn39/ZZfSadad0Z
         n0uuCI6D5C6ZKoebLHUzgx/HygIix8rnybsD9Yu+WFRdqf0evHyaFom86tYCXyOHJFSa
         54UA==
X-Gm-Message-State: AOJu0Yxa2y6Fwjmk9+QbrRlhCz177ZXnw1bD5TcdJWY26JlqpqerfyzL
	2qWPdNwSuXf4vGkZJTSrDFPbhgP4QH8+Epyc3OqnNDfQHDFf0A==
X-Google-Smtp-Source: AGHT+IHtYoXxV/yiNfSSoA0p3fhEfadPV/hXg1W8/os286WObwd3h+cNGe6nETuwb16l6WU7nSa4kQ==
X-Received: by 2002:a05:620a:1923:b0:77e:fbba:6466 with SMTP id bj35-20020a05620a192300b0077efbba6466mr8851694qkb.69.1703427514043;
        Sun, 24 Dec 2023 06:18:34 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id g27-20020a05620a13db00b007788bb0ab8esm2782358qkl.19.2023.12.24.06.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Dec 2023 06:18:33 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 77EA81069D1; Sun, 24 Dec 2023 04:18:32 -1000 (HST)
Subject: OE-core CVE metrics for nanbield on Sun 24 Dec 2023 04:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 24 Dec 2023 04:18:32 -1000
Message-Id: <20231224141832.77EA81069D1@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Dec 2023 14:18:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192894

Branch: nanbield

New this week: 5 CVEs
CVE-2023-51384 (CVSS3: 5.5 MEDIUM): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51384 *
CVE-2023-51385 (CVSS3: 9.8 CRITICAL): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51385 *
CVE-2023-5574 (CVSS3: 7.0 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5574 *
CVE-2023-6377 (CVSS3: 7.8 HIGH): xserver-xorg:xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6377 *
CVE-2023-6478 (CVSS3: 7.5 HIGH): xserver-xorg:xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6478 *

Removed this week: 5 CVEs
CVE-2023-38473 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38473 *
CVE-2023-46218 (CVSS3: 6.5 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-46218 *
CVE-2023-46751 (CVSS3: 7.5 HIGH): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-46751 *
CVE-2023-4692 (CVSS3: 7.8 HIGH): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4692 *
CVE-2023-4693 (CVSS3: 4.6 MEDIUM): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4693 *

Full list:  Found 63 unpatched CVEs
CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-36402 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36402 *
CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46456 *
CVE-2023-0687 (CVSS3: 9.8 CRITICAL): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0687 *
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-25584 (CVSS3: 7.1 HIGH): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25584 *
CVE-2023-3019 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3019 *
CVE-2023-3397 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-38559 (CVSS3: 5.5 MEDIUM): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38559 *
CVE-2023-39189 (CVSS3: 6.0 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39189 *
CVE-2023-39192 (CVSS3: 6.0 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39192 *
CVE-2023-39193 (CVSS3: 6.0 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39193 *
CVE-2023-39326 (CVSS3: 5.3 MEDIUM): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39326 *
CVE-2023-39928 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39928 *
CVE-2023-40030 (CVSS3: 6.1 MEDIUM): rust:rust-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40030 *
CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-4039 (CVSS3: 4.8 MEDIUM): gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:libgcc:libgcc-initial https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4039 *
CVE-2023-42363 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42363 *
CVE-2023-42364 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42364 *
CVE-2023-42365 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42365 *
CVE-2023-42366 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42366 *
CVE-2023-42753 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42753 *
CVE-2023-42754 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42754 *
CVE-2023-42756 (CVSS3: 4.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42756 *
CVE-2023-45283 (CVSS3: 7.5 HIGH): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45283 *
CVE-2023-45284 (CVSS3: 5.3 MEDIUM): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45284 *
CVE-2023-45285 (CVSS3: 7.5 HIGH): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45285 *
CVE-2023-46219 (CVSS3: 5.3 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-46219 *
CVE-2023-4623 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4623 *
CVE-2023-46407 (CVSS3: 5.5 MEDIUM): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-46407 *
CVE-2023-47470 (CVSS3: 7.8 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-47470 *
CVE-2023-4921 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4921 *
CVE-2023-49292 (CVSS3: 4.8 MEDIUM): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-49292 *
CVE-2023-50431 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-50431 *
CVE-2023-5088 (CVSS3: 7.0 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5088 *
CVE-2023-51384 (CVSS3: 5.5 MEDIUM): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51384 *
CVE-2023-51385 (CVSS3: 9.8 CRITICAL): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51385 *
CVE-2023-5156 (CVSS3: 7.5 HIGH): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5156 *
CVE-2023-5178 (CVSS3: 8.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5178 *
CVE-2023-5197 (CVSS3: 6.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5197 *
CVE-2023-5345 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5345 *
CVE-2023-5574 (CVSS3: 7.0 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5574 *
CVE-2023-5633 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5633 *
CVE-2023-5678 (CVSS3: 5.3 MEDIUM): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5678 *
CVE-2023-5717 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5717 *
CVE-2023-6238 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6277 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6277 *
CVE-2023-6377 (CVSS3: 7.8 HIGH): xserver-xorg:xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6377 *
CVE-2023-6478 (CVSS3: 7.5 HIGH): xserver-xorg:xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6478 *
CVE-2023-6560 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6560 *
CVE-2023-6606 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6606 *
CVE-2023-6610 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6610 *
CVE-2023-6622 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6622 *
CVE-2023-6679 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6679 *
CVE-2023-6817 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6817 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

