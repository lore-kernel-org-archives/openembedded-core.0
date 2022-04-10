Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB285C43219
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:57 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.17394.1649597633744277481
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Apr 2022 06:33:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=uIT3u9Vk;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id s8so12334685pfk.12
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Apr 2022 06:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=9j4tiOXslkV8xwkDIlMQ1+vBV6C+qUlIqsdLUBNSESg=;
        b=uIT3u9VkEcQMHGf0tD6WdJ8GyMwCvwHcJVa+UTS+dtWaPT+nqZJh3egniYLM6ZKL8J
         qHczL7IxoY/5QucffeOuQfchZJqeZeY5X088jTF1pOU+qihGIUyDxaLYN8t1b41W6MYI
         X3Ug84IPAnIdsUI9hfzdeR1YyQX1G+paEjEAFNc9/9T2am9bQ1TchofJKoVB6MoANhzo
         Ox/iG2Sy6pBUc9ETSHp+DpFkddviP4TVhLzqwKkkidygp/v0aXLuxibQzoe1LDhW/gpa
         kNkkx7vFUW2taQN1Ov2d6kFZUmTtMPjyIh8Q5zwQO35fyCxseNttv8XYtPtwPoubLYof
         Nc+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=9j4tiOXslkV8xwkDIlMQ1+vBV6C+qUlIqsdLUBNSESg=;
        b=T/eY2/KBXOpBhq/3pog1TeJz+IrbwaIbYxHchDOq2nEYjfgtkt4IleoqTIAmTWfbxq
         CpHOStX54w4nSHtY+ZJpjqseDaC8pfPw67HtsD7b7fLoPrxVk3ThfWGa7okrubrCHgOc
         UXeeaDune11bFD8JZ/ZelkB3TEBIyaJuUzAyIfRZ5zlwL1nLDT2aTnrWCJaEQsa96WA+
         KM+ZtUPm7Dfu77JxUOvRccEbHexljbQ77xDEexHp0HdJgPq0zAb6LQPO2PlhOquCYNGf
         p1/Z9WNTFdHv6EZe5GQZSt/RexYFWZXlxXZynp1a+hF49R0smrM66nLnKUDs5psUWRbc
         zCBQ==
X-Gm-Message-State: AOAM530hWeEMfkK3RfjqtzLaQFUV2WAj9e7KZ+7o6CR/eBD65FhVDxlF
	hmwBD8xHsSLZjoJkVJezKhvj4NA9hfQVi+Z0L6c=
X-Google-Smtp-Source: 
 ABdhPJy8xR8KjrN4zpPHj11ERZv3LzWgV0ZbWwQVlxWhrYXRqPzQPjJBJ1/w2DPH9nyjWmw+lmpq7g==
X-Received: by 2002:a63:6c0a:0:b0:398:6bd2:a16a with SMTP id
 h10-20020a636c0a000000b003986bd2a16amr23234506pgc.191.1649597632586;
        Sun, 10 Apr 2022 06:33:52 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 m2-20020a056a00164200b00505a31a064esm4410410pfc.103.2022.04.10.06.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 06:33:51 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id F310C9627FC; Sun, 10 Apr 2022 03:33:48 -1000 (HST)
Subject: OE-core CVE metrics for honister on Sun 10 Apr 2022 03:30:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220410133348.F310C9627FC@nuc.router0800d9.com>
Date: Sun, 10 Apr 2022 03:33:48 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164202

Branch: honister

New this week: 6 CVEs
CVE-2019-1010238 (CVSS3: 9.8 CRITICAL): pango:pango-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010238 *
CVE-2022-1050 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1050 *
CVE-2022-1056 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1056 *
CVE-2022-1154 (CVSS3: 9.8 CRITICAL): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1154 *
CVE-2022-1160 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1160 *
CVE-2022-23901 (CVSS3: 9.8 CRITICAL): re2c:re2c-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23901 *

Removed this week: 13 CVEs
CVE-2018-25032 (CVSS3: 7.5 HIGH): zlib:zlib-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-25032 *
CVE-2021-45481 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45481 *
CVE-2021-45482 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45482 *
CVE-2021-45483 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45483 *
CVE-2021-46705 (CVSS3: 5.5 MEDIUM): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-46705 *
CVE-2022-0865 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0865 *
CVE-2022-0891 (CVSS3: 7.1 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0891 *
CVE-2022-0907 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0907 *
CVE-2022-0908 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0908 *
CVE-2022-0909 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0909 *
CVE-2022-0924 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0924 *
CVE-2022-22623 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22623 *
CVE-2022-23308 (CVSS3: 7.5 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23308 *

Full list:  Found 42 unpatched CVEs
CVE-2016-20012 (CVSS3: 5.3 MEDIUM): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-20012 *
CVE-2019-1010238 (CVSS3: 9.8 CRITICAL): pango:pango-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010238 *
CVE-2019-12067 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974 (CVSS3: 3.3 LOW): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2020-35503 (CVSS3: 6.0 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-20255 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-20257 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20257 *
CVE-2021-25220 (CVSS3: 8.6 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25220 *
CVE-2021-31879 (CVSS3: 6.1 MEDIUM): wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-3507 (CVSS3: 6.1 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-3607 (CVSS3: 6.0 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3607 *
CVE-2021-3608 (CVSS3: 6.0 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3608 *
CVE-2021-36368 (CVSS3: 3.7 LOW): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36368 *
CVE-2021-3638 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3638 *
CVE-2021-3713 (CVSS3: 7.4 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-3748 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3748 *
CVE-2021-3930 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3930 *
CVE-2021-3947 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3947 *
CVE-2021-4160 (CVSS3: 5.9 MEDIUM): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4160 *
CVE-2021-42762 (CVSS3: 5.3 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42762 *
CVE-2021-43400 (CVSS3: 9.1 CRITICAL): bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-43400 *
CVE-2022-0204 (CVSS3: 8.8 HIGH): bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0204 *
CVE-2022-0396 (CVSS3: 5.3 MEDIUM): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0396 *
CVE-2022-0529 (CVSS3: 7.8 HIGH): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530 (CVSS3: 7.8 HIGH): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-0778 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0778 *
CVE-2022-0943 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0943 *
CVE-2022-1050 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1050 *
CVE-2022-1056 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1056 *
CVE-2022-1154 (CVSS3: 9.8 CRITICAL): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1154 *
CVE-2022-1160 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1160 *
CVE-2022-21658 (CVSS3: 6.3 MEDIUM): rust-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-21658 *
CVE-2022-23096 (CVSS3: 9.1 CRITICAL): connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23096 *
CVE-2022-23097 (CVSS3: 9.1 CRITICAL): connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23097 *
CVE-2022-23098 (CVSS3: 7.5 HIGH): connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23098 *
CVE-2022-23303 (CVSS3: 9.8 CRITICAL): wpa-supplicant https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23303 *
CVE-2022-23304 (CVSS3: 9.8 CRITICAL): wpa-supplicant https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23304 *
CVE-2022-23901 (CVSS3: 9.8 CRITICAL): re2c:re2c-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23901 *
CVE-2022-24975 (CVSS3: 7.5 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24975 *
CVE-2022-26354 (CVSS3: 3.2 LOW): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26354 *
CVE-2022-26488 (CVSS3: 7.0 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26488 *
CVE-2022-27191 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27191 *


