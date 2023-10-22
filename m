Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59094C001DF
	for <webhook@archiver.kernel.org>; Sun, 22 Oct 2023 14:18:44 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web10.99378.1697984321861411954
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Oct 2023 07:18:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JWSav6Dd;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.54, mailfrom: steve@sakoman.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1e9db321ed1so1718372fac.3
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Oct 2023 07:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697984321; x=1698589121; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cn9C+evcrbnmyvnkOwxov/U9OP7hRhuTYb+q1c1g7hQ=;
        b=JWSav6DdmrGkz1looKJeR1YhxcvFLjISsp82dE//cJMCgaRngLmaa5MX0nEvVVTMUV
         XeZGDWdgp8TZ8xgie9MNvAxvFVhvZfeuoKVXWr20VKNMThL8gWiBEZWapWhE2VBRoKx3
         4/e987POOGqTWv92gTWZJ5aQ6xSzmUaimyyK1GxAAi0h5U37SoyTa36F8uC+P6OEVsYa
         5p8IVyBOvfuS+vlPss+RSWJKW4qtASTydSSKKbi93N4Fz/x0A1Zs/UDsPMY/SxYLbbS4
         VzQF/Ws31E5bdk40Mh/FjIR0IsF+iZPvy93khOx/NIavVRxrrz0B2OXj41xRJQW5WnAT
         nJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697984321; x=1698589121;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cn9C+evcrbnmyvnkOwxov/U9OP7hRhuTYb+q1c1g7hQ=;
        b=Lz1cYUKb/7DNSO+wBpTpd+Ingfidpuh0ulk/wrE32VDDeE3BANQN0C8LNfs44Uz9mg
         8r6u3CzYS3h4yQlU5kimGT6gPUA1H0UBdtbmQ8sWzLNPrSZqch21dQvwLkHLelOXSrQ1
         GGuIBoNbXfMxjl1yWTaM4BCjn1tXRXh6XXun5REVZNLgy5ALInsnEVFcLrkwxqClLs2S
         FoOrLrPpuyjLiDwatccXmcC65GJEUmTKCIw+UD6hylwsMrGVJGgsCGIs4WPk+fO5WD/n
         QSrDhsjZSeDroAMsmeP3lxy/NsidGTbjuMGnyQm67+uBcHPk2XkIvPEOvy3gXMehkNSm
         w1DA==
X-Gm-Message-State: AOJu0YxzCoX1PguzaFbTQQ+uQ4izq5iyoM9EXzewFLa2MEbq2qFBPIga
	YBXQ5s9SEy8BTf2DEgF3HUnqLzlv+aGEbNCQLcal5A==
X-Google-Smtp-Source: AGHT+IH5WJfO7t9I91GVj5WtabzAuI+EaUgX9jd6n+83XCPQHb8Z2nkmMVZncyL+Qh1XRRL38OOkbA==
X-Received: by 2002:a05:6870:9a87:b0:1e9:a3e1:c388 with SMTP id hp7-20020a0568709a8700b001e9a3e1c388mr8773532oab.41.1697984320651;
        Sun, 22 Oct 2023 07:18:40 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id f7-20020ad45587000000b0066d1b4ce863sm2197433qvx.31.2023.10.22.07.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 07:18:40 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 2077F106ADE; Sun, 22 Oct 2023 04:18:39 -1000 (HST)
Subject: OE-core CVE metrics for mickledore on Sun 22 Oct 2023 04:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 22 Oct 2023 04:18:39 -1000
Message-Id: <20231022141839.2077F106ADE@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Oct 2023 14:18:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189605

Branch: mickledore

New this week: 9 CVEs
CVE-2023-40791 (CVSS3: 9.1 CRITICAL): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40791 *
CVE-2023-43789 (CVSS3: 5.5 MEDIUM): libxpm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-43789 *
CVE-2023-44487 (CVSS3: 7.5 HIGH): go:go-binary-native:go-cross-core2-64:go-runtime:nghttp2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-44487 *
CVE-2023-45853 (CVSS3: 9.8 CRITICAL): zlib:zlib-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45853 *
CVE-2023-45862 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45862 *
CVE-2023-45863 (CVSS3: 6.4 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45863 *
CVE-2023-45871 (CVSS3: 9.8 CRITICAL): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45871 *
CVE-2023-45898 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45898 *
CVE-2023-5535 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5535 *

Removed this week: 5 CVEs
CVE-2023-40745 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40745 *
CVE-2023-41175 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-41175 *
CVE-2023-43115 (CVSS3: 9.8 CRITICAL): ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-43115 *
CVE-2023-5344 (CVSS3: 7.5 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5344 *
CVE-2023-5441 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5441 *

Full list:  Found 77 unpatched CVEs
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
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-1544 (CVSS3: 6.3 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1544 *
CVE-2023-2176 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2176 *
CVE-2023-23039 (CVSS3: 5.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-23039 *
CVE-2023-25584 (CVSS3: 7.1 HIGH): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25584 *
CVE-2023-25585 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25585 *
CVE-2023-25588 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25588 *
CVE-2023-2680 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2680 *
CVE-2023-28198 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28198 *
CVE-2023-3019 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3019 *
CVE-2023-32370 (CVSS3: 5.3 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-32370 *
CVE-2023-32643 (CVSS3: 7.8 HIGH): glib-2.0:glib-2.0-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-32643 *
CVE-2023-35827 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-35827 *
CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-37454 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-37454 *
CVE-2023-37769 (CVSS3: 6.5 MEDIUM): pixman:pixman-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-37769 *
CVE-2023-38039 (CVSS3: 7.5 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38039 *
CVE-2023-38560 (CVSS3: 5.5 MEDIUM): ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38560 *
CVE-2023-39189 (CVSS3: 6.0 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39189 *
CVE-2023-39191 (CVSS3: 8.2 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39191 *
CVE-2023-39192 (CVSS3: 6.0 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39192 *
CVE-2023-39193 (CVSS3: 6.0 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39193 *
CVE-2023-39194 (CVSS3: 4.4 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39194 *
CVE-2023-39318 (CVSS3: 6.1 MEDIUM): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39318 *
CVE-2023-39319 (CVSS3: 6.1 MEDIUM): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39319 *
CVE-2023-39323 (CVSS3: 9.8 CRITICAL): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39323 *
CVE-2023-40030 (CVSS3: 6.1 MEDIUM): rust:rust-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40030 *
CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-40360 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40360 *
CVE-2023-4039 (CVSS3: 4.8 MEDIUM): gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:libgcc:libgcc-initial https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4039 *
CVE-2023-40397 (CVSS3: 9.8 CRITICAL): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40397 *
CVE-2023-40791 (CVSS3: 9.1 CRITICAL): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40791 *
CVE-2023-4133 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4133 *
CVE-2023-4135 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4135 *
CVE-2023-4244 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4244 *
CVE-2023-42754 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42754 *
CVE-2023-42755 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42755 *
CVE-2023-42756 (CVSS3: 4.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42756 *
CVE-2023-43785 (CVSS3: 5.5 MEDIUM): libx11:libx11-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-43785 *
CVE-2023-43786 (CVSS3: 5.5 MEDIUM): libx11:libx11-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-43786 *
CVE-2023-43787 (CVSS3: 7.8 HIGH): libx11:libx11-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-43787 *
CVE-2023-43788 (CVSS3: 5.5 MEDIUM): libxpm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-43788 *
CVE-2023-43789 (CVSS3: 5.5 MEDIUM): libxpm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-43789 *
CVE-2023-43804 (CVSS3: 8.1 HIGH): python3-urllib3 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-43804 *
CVE-2023-44466 (CVSS3: 8.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-44466 *
CVE-2023-44487 (CVSS3: 7.5 HIGH): go:go-binary-native:go-cross-core2-64:go-runtime:nghttp2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-44487 *
CVE-2023-4504 (CVSS3: 7.8 HIGH): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4504 *
CVE-2023-4527 (CVSS3: 6.5 MEDIUM): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4527 *
CVE-2023-45322 (CVSS3: 6.5 MEDIUM): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45322 *
CVE-2023-45853 (CVSS3: 9.8 CRITICAL): zlib:zlib-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45853 *
CVE-2023-45862 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45862 *
CVE-2023-45863 (CVSS3: 6.4 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45863 *
CVE-2023-45871 (CVSS3: 9.8 CRITICAL): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45871 *
CVE-2023-45898 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45898 *
CVE-2023-4622 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4622 *
CVE-2023-4863 (CVSS3: 8.8 HIGH): libwebp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4863 *
CVE-2023-4911 (CVSS3: 7.8 HIGH): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4911 *
CVE-2023-4921 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4921 *
CVE-2023-5156 (CVSS3: 7.5 HIGH): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5156 *
CVE-2023-5197 (CVSS3: 6.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5197 *
CVE-2023-5345 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5345 *
CVE-2023-5535 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5535 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

