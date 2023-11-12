Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CF96C4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 15:18:42 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.16750.1699802318106973254
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Nov 2023 07:18:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dW3ibDt9;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.182, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-77ba6d5123fso390628885a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Nov 2023 07:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1699802317; x=1700407117; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ocFl5H7BFre2AfQFJxfb72iXi5/VG0WYh+ZrF7Nhpg=;
        b=dW3ibDt9dz5v5Jc5NWSNnRamVU8B3bKdjsANEBBA1UTAGA1nQFyQlfZeA04ZfPuGIa
         XK+FzQvK4Qh5PQFVEVAB1wzooUNRzCa//VgzTnaaN6OPIUNy6IDMSZEteqIwSCD50+QV
         qBpLdT9jyN+jR2jeQj3Hv984sFWWX8cxSnD258XRW9vzqiqlM+f6/6hPGqnM9jAl+oEa
         S4//rsfcEYwtZOehGbF4lMRqKqSOs3ZcUrHXcS2mTJG8dfIUjPkoJ0M8r4Sj4nxlgPos
         76nG3wQZytxzKFw72qaCXZxHhEotaqjJkfYav3yEIbWfPmocF82GMj8KijL5QPzrpD/c
         sLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699802317; x=1700407117;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7ocFl5H7BFre2AfQFJxfb72iXi5/VG0WYh+ZrF7Nhpg=;
        b=PLEL80MPW+/Qjfo7cdRht1+CKZs9lRzNv/WYp4U+NLqydaS7r+zkubnyPSsYoTTxMK
         bow9EEx19pPNCwcOML5HeZht1WALt1whOhUts46QXFwICP8JUnK9jVXoydh/8ZmI4oSU
         AebvQbz1TFLzvh82HMNqvYbZ4cT35AvV5iJLNx+ow3NPt1g8h0hc0PpQHBomrSQE3iAg
         vKxHZDVNXTgCUI+QIEABM7AyHdZ/kIgp8jw7uF47STwb+Ykg4jbSBYriixLV5M+p71my
         cc91xXf5HtPGQRDobYCBpQd5tcgYm3PjF5Tt4vlilQjJ/GbCyIwsQWLG+FzbnzwUC0wi
         /0VQ==
X-Gm-Message-State: AOJu0Yy/6MkJvg4vd9Pu9VoviQsdtQ8SgMO7fzyhG86yRSWCwX0Q6QfO
	jjuIDSyFRFFgg/xv4+xPr30Vs0d9DmqXW+lrx9BQsA==
X-Google-Smtp-Source: AGHT+IGghcRtIT9+O0Hr0l4yVfGo6S5hsEyaKXbWqVZxBQlvXvUbvfsfGp0oFifOSTCPbure+qwavg==
X-Received: by 2002:a05:620a:4014:b0:774:21d8:b0bb with SMTP id h20-20020a05620a401400b0077421d8b0bbmr6486796qko.24.1699802316680;
        Sun, 12 Nov 2023 07:18:36 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id a2-20020a05620a066200b00773fe8971bbsm1200403qkh.90.2023.11.12.07.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 07:18:36 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id ECEF41069E8; Sun, 12 Nov 2023 05:18:34 -1000 (HST)
Subject: OE-core CVE metrics for nanbield on Sun 12 Nov 2023 05:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 12 Nov 2023 05:18:34 -1000
Message-Id: <20231112151834.ECEF41069E8@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Nov 2023 15:18:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190452

Branch: nanbield

New this week: 12 CVEs
CVE-2023-3397 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-38469 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38469 *
CVE-2023-38470 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38470 *
CVE-2023-38471 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38471 *
CVE-2023-38472 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38472 *
CVE-2023-38473 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38473 *
CVE-2023-46246 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-46246 *
CVE-2023-46407 (CVSS3: 5.5 MEDIUM): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-46407 *
CVE-2023-46813 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-46813 *
CVE-2023-46862 (CVSS3: 4.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-46862 *
CVE-2023-5178 (CVSS3: 8.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5178 *
CVE-2023-5363 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5363 *

Removed this week: 2 CVEs
CVE-2023-3180 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3180 *
CVE-2023-4135 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4135 *

Full list:  Found 53 unpatched CVEs
CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-33065 (CVSS3: 7.8 HIGH): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-33065 *
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
CVE-2023-38469 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38469 *
CVE-2023-38470 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38470 *
CVE-2023-38471 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38471 *
CVE-2023-38472 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38472 *
CVE-2023-38473 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38473 *
CVE-2023-38559 (CVSS3: 5.5 MEDIUM): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38559 *
CVE-2023-39189 (CVSS3: 6.0 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39189 *
CVE-2023-39192 (CVSS3: 6.0 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39192 *
CVE-2023-39193 (CVSS3: 6.0 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39193 *
CVE-2023-39928 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39928 *
CVE-2023-40030 (CVSS3: 6.1 MEDIUM): rust:rust-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40030 *
CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-4039 (CVSS3: 4.8 MEDIUM): gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:libgcc:libgcc-initial https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4039 *
CVE-2023-42752 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42752 *
CVE-2023-42753 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42753 *
CVE-2023-42754 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42754 *
CVE-2023-42756 (CVSS3: 4.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42756 *
CVE-2023-45803 (CVSS3: 4.2 MEDIUM): python3-urllib3 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45803 *
CVE-2023-4623 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4623 *
CVE-2023-46246 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-46246 *
CVE-2023-46407 (CVSS3: 5.5 MEDIUM): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-46407 *
CVE-2023-46813 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-46813 *
CVE-2023-46862 (CVSS3: 4.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-46862 *
CVE-2023-4692 (CVSS3: 7.8 HIGH): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4692 *
CVE-2023-4693 (CVSS3: 4.6 MEDIUM): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4693 *
CVE-2023-4921 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4921 *
CVE-2023-5156 (CVSS3: 7.5 HIGH): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5156 *
CVE-2023-5178 (CVSS3: 8.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5178 *
CVE-2023-5197 (CVSS3: 6.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5197 *
CVE-2023-5345 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5345 *
CVE-2023-5363 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5363 *
CVE-2023-5367 (CVSS3: 7.8 HIGH): xserver-xorg:xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5367 *
CVE-2023-5380 (CVSS3: 4.7 MEDIUM): xserver-xorg:xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5380 *
CVE-2023-5574 (CVSS3: 7.0 HIGH): xserver-xorg:xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5574 *
CVE-2023-5633 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5633 *
CVE-2023-5717 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5717 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

