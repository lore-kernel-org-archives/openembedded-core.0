Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54472C4332F
	for <webhook@archiver.kernel.org>; Sun, 29 Oct 2023 11:18:24 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.70724.1698578295968454903
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Oct 2023 04:18:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=28mnQYKi;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.171, mailfrom: steve@sakoman.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-41cb615c6fbso24579221cf.1
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Oct 2023 04:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1698578294; x=1699183094; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+b4mnwaQjstUIUyL56T7hGee868hzunTMnCemLWMnC0=;
        b=28mnQYKiv+luk6K/QL9GN15xEuQ8maZmHLzuVlU7lG5v6tQKwvoa89MgxWJKvrAkUY
         2u0zu5A9/MR3LJrTZZQey1wsHvZYdawzrMgwOCgApCHVGMEvUtuHMXYqFzZw18BZzh2k
         sciw+hT6Xi8c/5RYfxvPDcbUdIuVD37gtM6ljkGWsycb8Ma8dCdgG7L61KutNu210JCn
         cp1kL5iM/1q4cvEdLrtu6ybYYxkYt2kKw0Id0A9lPqMmLKt4bZJ7URm1fnnd2Mz2cxXQ
         ZIznccFNQZzyJVoLMyue4qWikLaJMRtn056oEqAKmRaRmqz4zljez9LsRxxooysg/595
         AR/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698578294; x=1699183094;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+b4mnwaQjstUIUyL56T7hGee868hzunTMnCemLWMnC0=;
        b=PuHqAxhPvlp+Tn+nEH7TsNWgrOAKvW/NjwcBKQ2g1V7ERzHZhBW0yX+CojmkMp4GVZ
         PkQPHN8i2yeCCuMPcP24gRF6tC1hXqYhL+Vv/Yz6wApMHmjp8qFSa6exbzgLRCycMrFE
         eW+oyq9x/9pcf5PUz6jPCpPUeqQyxf1jVTGGtGiR2BUYYpDCFs8o+3iQDuJbeQBbu1eu
         j2BScK6kr8JBnRks/mk19pJ80tqP+ZSXjQGhr78NZ8bcDt1i8BSnirznRDqSchBR6mjt
         XmVLMJ0MLRkhI1rQb8lWGsJL9mgLqH28hK5PLg07Awpfu0Zhsq8oPxjndv1eDYi08Xt0
         S0Ag==
X-Gm-Message-State: AOJu0YzM3rF050jGm9K5veq5BL/5UXriH/gmXCmFeZfVme1FItdEkF62
	SjGrDlgqs1PUtMIDrEfbM4Hs6RzcqodeGPZeZ6o=
X-Google-Smtp-Source: AGHT+IHNRpfiDwPm7BPO4oOYdvjyJ6MX97oN+aJKBLVd+1lajwu2V8L8Uod2iYnAGGNoIAq/pzJjvw==
X-Received: by 2002:a05:622a:18a4:b0:41e:2423:f0be with SMTP id v36-20020a05622a18a400b0041e2423f0bemr10472101qtc.40.1698578294461;
        Sun, 29 Oct 2023 04:18:14 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id l15-20020ac84ccf000000b004198ae7f841sm2457902qtv.90.2023.10.29.04.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Oct 2023 04:18:13 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 8F66A106A18; Sun, 29 Oct 2023 01:18:12 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 29 Oct 2023 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 29 Oct 2023 01:18:12 -1000
Message-Id: <20231029111812.8F66A106A18@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Oct 2023 11:18:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189772

Branch: master

New this week: 2 CVEs
CVE-2023-45803 (CVSS3: 4.2 MEDIUM): python3-urllib3 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45803 *
CVE-2023-4623 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4623 *

Removed this week: 5 CVEs
CVE-2022-33065 (CVSS3: 7.8 HIGH): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-33065 *
CVE-2023-3354 (CVSS3: 7.5 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3354 *
CVE-2023-37769 (CVSS3: 6.5 MEDIUM): pixman:pixman-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-37769 *
CVE-2023-45322 (CVSS3: 6.5 MEDIUM): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45322 *
CVE-2023-45853 (CVSS3: 9.8 CRITICAL): zlib:zlib-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45853 *

Full list:  Found 35 unpatched CVEs
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
CVE-2023-3180 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3180 *
CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-38559 (CVSS3: 5.5 MEDIUM): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38559 *
CVE-2023-39189 (CVSS3: 6.0 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39189 *
CVE-2023-39192 (CVSS3: 6.0 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39192 *
CVE-2023-39193 (CVSS3: 6.0 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39193 *
CVE-2023-39928 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39928 *
CVE-2023-40030 (CVSS3: 6.1 MEDIUM): rust:rust-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40030 *
CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-4039 (CVSS3: 4.8 MEDIUM): gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:libgcc:libgcc-initial https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4039 *
CVE-2023-4135 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4135 *
CVE-2023-42752 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42752 *
CVE-2023-42753 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42753 *
CVE-2023-42754 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42754 *
CVE-2023-42756 (CVSS3: 4.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42756 *
CVE-2023-45803 (CVSS3: 4.2 MEDIUM): python3-urllib3 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45803 *
CVE-2023-4623 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4623 *
CVE-2023-4921 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4921 *
CVE-2023-5156 (CVSS3: 7.5 HIGH): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5156 *
CVE-2023-5197 (CVSS3: 6.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5197 *
CVE-2023-5345 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5345 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

