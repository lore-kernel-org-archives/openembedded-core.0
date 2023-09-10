Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73237EE14D8
	for <webhook@archiver.kernel.org>; Sun, 10 Sep 2023 13:17:28 +0000 (UTC)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
 by mx.groups.io with SMTP id smtpd.web10.35743.1694351845664660462
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Sep 2023 06:17:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Pm4rst2C;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.171, mailfrom: steve@sakoman.com)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-49334907238so1276557e0c.3
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Sep 2023 06:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694351844; x=1694956644; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vc54pI71cg08lS5LrlI9U0Bn2kUef9IvzZPBIZrLKfY=;
        b=Pm4rst2CA0y4lTC5gBkjxG+7yaRwcyjkTSnp5uQvPcAolYJT/pTHshek5Ozqem1taP
         PITVd56lJpJLMiSUOOWo1waG6vX7XRuIqkPFHO7ZlVKn+H19UAbHvk/qL2amCC5/5vmg
         MvxykWj/aOHOMUrUHWlns+rOHXTWPYi4K6SnDUB82ybAO/2JhNVOqUQgWXIUBcoGRQiP
         60+RTa/pEE3OY55/hysr5mJEtdmp7ZdWUparM2Z8w93ZwtFXbX1obbcvSR+SACH5v4jY
         X9ho/FuPMyW+9eKGX76/QRJ7jD0krMHNLWwakgPjzMWFLH6jX/V8H/nEk7vo//GxC878
         W2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694351844; x=1694956644;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vc54pI71cg08lS5LrlI9U0Bn2kUef9IvzZPBIZrLKfY=;
        b=A7O6YA1QUNiDxK5q8q2dxO9xumJYYqAFSUQNZf4oOu04faUWgqaXLQJjK4ATMA1e4S
         tXe+Dy8a6Fw4wLWxNiS36XprIQj6+5bkwUe5O7VXXpfht+VVqPzulwKRN3bHUiF0ueN/
         rDRCwR0Siaz/FHhPlLoCfaQ1+DYD4nNlqFWVMl0tXyW7sjWmU73SFnwfbIoP0lxQCm83
         KMEIz7mo3DRzFPKr4JYwYpNZk2Tx++fhJIY1aZa4PEr8J7msebREUmXM+fGggQdxIDPs
         5GMP9SUsRlEUrxWBYJC3UzjioqugK3SpN321LRkHiYjZgK2oDsHzO74kJ6tbnMFKVuOC
         kA0A==
X-Gm-Message-State: AOJu0YzEUvAFn7HJm6YgWsViStwiGXjAGjq+nU+FbdeHxM+DrubHeZWI
	NaWfSUeE/bs/O3QE6RomiJihJWxWeYwqiwXqPR6YwA==
X-Google-Smtp-Source: AGHT+IFW9GI8AouFfyTp27fWDM5KiWhn5wmK+eGwCRTJi7ImbMbLKLcUM552lKruGgqE8sHwhtHhxQ==
X-Received: by 2002:a1f:48c7:0:b0:48d:1fcd:9760 with SMTP id v190-20020a1f48c7000000b0048d1fcd9760mr4709603vka.10.1694351844153;
        Sun, 10 Sep 2023 06:17:24 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id z17-20020ac84551000000b004108f6788a6sm1956428qtn.41.2023.09.10.06.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Sep 2023 06:17:23 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 828D6106A8C; Sun, 10 Sep 2023 03:17:22 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 10 Sep 2023 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 10 Sep 2023 03:17:22 -1000
Message-Id: <20230910131722.828D6106A8C@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Sep 2023 13:17:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187454

Branch: kirkstone

New this week: 8 CVEs
CVE-2023-4733 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4733 *
CVE-2023-4734 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4734 *
CVE-2023-4735 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4735 *
CVE-2023-4736 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4736 *
CVE-2023-4738 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4738 *
CVE-2023-4750 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4750 *
CVE-2023-4752 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4752 *
CVE-2023-4781 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4781 *

Removed this week: 9 CVEs
CVE-2020-22218 (CVSS3: 7.5 HIGH): libssh2:libssh2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-22218 *
CVE-2021-32292 (CVSS3: 9.8 CRITICAL): json-c https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-32292 *
CVE-2022-48554 (CVSS3: 5.5 MEDIUM): file:file-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48554 *
CVE-2023-2908 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2908 *
CVE-2023-29491 (CVSS3: 7.8 HIGH): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29491 *
CVE-2023-3316 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3316 *
CVE-2023-3618 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3618 *
CVE-2023-40217 (CVSS3: 5.3 MEDIUM): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40217 *
CVE-2023-40303 (CVSS3: 7.8 HIGH): inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40303 *

Full list:  Found 51 unpatched CVEs
CVE-2020-22219 (CVSS3: 7.8 HIGH): flac https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-22219 *
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-33065 (CVSS3: 7.8 HIGH): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-33065 *
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2022-3553 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3553 *
CVE-2022-3563 (CVSS3: 5.7 MEDIUM): bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3563 *
CVE-2022-3637 (CVSS3: 5.5 MEDIUM): bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3637 *
CVE-2022-36648 (CVSS3: 10.0 CRITICAL): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36648 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-3964 (CVSS3: 8.1 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3964 *
CVE-2022-3965 (CVSS3: 8.1 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3965 *
CVE-2022-40090 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40090 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-44840 (CVSS3: 7.8 HIGH): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-44840 *
CVE-2022-45703 (CVSS3: 7.8 HIGH): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-45703 *
CVE-2022-47007 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-47007 *
CVE-2022-47008 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-47008 *
CVE-2022-47010 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-47010 *
CVE-2022-47011 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-47011 *
CVE-2022-47673 (CVSS3: 7.8 HIGH): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-47673 *
CVE-2022-47695 (CVSS3: 7.8 HIGH): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-47695 *
CVE-2022-47696 (CVSS3: 7.8 HIGH): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-47696 *
CVE-2022-48063 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48063 *
CVE-2022-48064 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48064 *
CVE-2022-48065 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48065 *
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-1544 (CVSS3: 6.3 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1544 *
CVE-2023-1916 (CVSS3: 6.1 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1916 *
CVE-2023-24532 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24532 *
CVE-2023-27043 (CVSS3: 5.3 MEDIUM): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27043 *
CVE-2023-2731 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2731 *
CVE-2023-28736 (CVSS3: 6.7 MEDIUM): mdadm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28736 *
CVE-2023-28938 (CVSS3: 4.4 MEDIUM): mdadm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28938 *
CVE-2023-29403 (CVSS3: 7.8 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29403 *
CVE-2023-3019 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3019 *
CVE-2023-37769 (CVSS3: 6.5 MEDIUM): pixman:pixman-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-37769 *
CVE-2023-38560 (CVSS3: 5.5 MEDIUM): ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38560 *
CVE-2023-39533 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39533 *
CVE-2023-40360 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40360 *
CVE-2023-4135 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4135 *
CVE-2023-4733 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4733 *
CVE-2023-4734 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4734 *
CVE-2023-4735 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4735 *
CVE-2023-4736 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4736 *
CVE-2023-4738 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4738 *
CVE-2023-4750 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4750 *
CVE-2023-4752 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4752 *
CVE-2023-4781 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4781 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

