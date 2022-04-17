Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C55CC63719
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:00 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.28816.1650200745508062781
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Apr 2022 06:05:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=h0Fhm9ps;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id t13so14355538pgn.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Apr 2022 06:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=D8rfpEp1zEXRwMwVv6YP7FXD6e3jrth6gJBmfLGQFv8=;
        b=h0Fhm9psMG9a7U0QaLkHma+X+d23bQiVpw9fXazJ5mJEpR2ZKR82IPjNdyPHcvgMEb
         uUr4IxrDlF31e9GcuVUMTxrtuWyeNVjCaeeKnPcyPPMXsTB9N0MeRe7jes6L6Ckp0zpZ
         RwKUutI1WzLLzSUs2Z6lVckF14QDIOcy5nwQzWGY4WT8xfjP+gcUJnZzZG6aqCveVS1Q
         BTUaBFnhYyi2n6Tjg57UwcgbdPvxfcjPMmB93BsI6EPrtOOKwLNpCz2T6pk8w0KSLSZE
         Ay660iJEp49Mrtec3SI2VdnoNJwXJ2RwvH32wQAubrEvxqg6HWCU9rEnM3fN+hqvugK4
         W35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=D8rfpEp1zEXRwMwVv6YP7FXD6e3jrth6gJBmfLGQFv8=;
        b=Ana7d55JSkwPai3rpoqGve3PufhCbpNbs7z5VhbAUFzK/bm4A21snHN38aWpXE37fd
         wTVtW4edF3SwP8sg7nCAHT3ow4OKANfAEZnpGNMWjO8tETeq4U8C3PTXPMXJvtCuMopr
         JVWFVml0AZwxoFwKqQCyqvMbnDV+CCdjMnj2VNQXTHxJtKUCE6qzWvh51/mk7j396v5a
         Z1WEHzK8+N0JvYG0o4TgR8+pDd79sV9gXND1l1GqMKdLJFpzVCe7feGLKvRJrwBjqWlb
         Zp/jB+c+AB3BvkZib9FPNiiR2gN60dcbjUcTppDcyssb046ickW8KVynKHtOgNvR7FQL
         R/tg==
X-Gm-Message-State: AOAM532+pIjKVroFrvFCMJU5h+m3T+43vdZcE6uozeycueFIbL3MILAv
	GeGt9d6MEAb+11TZCfp/otpOA5miRcybKUgL900=
X-Google-Smtp-Source: 
 ABdhPJxKIUOB24UtSO5vDJFgiznjADYPeK3UKqVhDR1M58iJZADtPxAkxOjGnuPOktzk8ENjZhBchg==
X-Received: by 2002:a05:6a00:178e:b0:508:2073:f635 with SMTP id
 s14-20020a056a00178e00b005082073f635mr7562532pfg.10.1650200744379;
        Sun, 17 Apr 2022 06:05:44 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 nh11-20020a17090b364b00b001cb65949c66sm10252020pjb.37.2022.04.17.06.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Apr 2022 06:05:43 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 59A45960780; Sun, 17 Apr 2022 03:05:41 -1000 (HST)
Subject: OE-core CVE metrics for hardknott on Sun 17 Apr 2022 03:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220417130541.59A45960780@nuc.router0800d9.com>
Date: Sun, 17 Apr 2022 03:05:41 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164573

Branch: hardknott

New this week: 2 CVEs
CVE-2021-33657 (CVSS3: 8.8 HIGH): libsdl2:libsdl2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33657 *
CVE-2022-28391 (CVSS3: 9.8 CRITICAL): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-28391 *

Removed this week: 1 CVEs
CVE-2019-1010238 (CVSS3: 9.8 CRITICAL): pango:pango-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010238 *

Full list:  Found 55 unpatched CVEs
CVE-2013-0340 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0340 *
CVE-2016-20012 (CVSS3: 5.3 MEDIUM): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-20012 *
CVE-2019-12067 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974 (CVSS3: 3.3 LOW): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2020-35503 (CVSS3: 6.0 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-20255 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-25220 (CVSS3: 8.6 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25220 *
CVE-2021-27645 (CVSS3: 2.5 LOW): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27645 *
CVE-2021-31879 (CVSS3: 6.1 MEDIUM): wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-33574 (CVSS3: 9.8 CRITICAL): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33574 *
CVE-2021-33657 (CVSS3: 8.8 HIGH): libsdl2:libsdl2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33657 *
CVE-2021-33833 (CVSS3: 9.8 CRITICAL): connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33833 *
CVE-2021-33928 (CVSS3: 7.5 HIGH): libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33928 *
CVE-2021-33929 (CVSS3: 7.5 HIGH): libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33929 *
CVE-2021-33930 (CVSS3: 7.5 HIGH): libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33930 *
CVE-2021-33938 (CVSS3: 7.5 HIGH): libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33938 *
CVE-2021-3445 (CVSS3: 7.5 HIGH): libdnf https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3445 *
CVE-2021-3507 (CVSS3: 6.1 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-36368 (CVSS3: 3.7 LOW): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36368 *
CVE-2021-3638 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3638 *
CVE-2021-38604 (CVSS3: 7.5 HIGH): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38604 *
CVE-2021-3947 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3947 *
CVE-2021-42376 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42376 *
CVE-2021-45481 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45481 *
CVE-2021-45482 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45482 *
CVE-2021-45483 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45483 *
CVE-2021-45944 (CVSS3: 5.5 MEDIUM): ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45944 *
CVE-2021-46705 (CVSS3: 5.5 MEDIUM): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-46705 *
CVE-2022-0204 (CVSS3: 8.8 HIGH): bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0204 *
CVE-2022-0396 (CVSS3: 5.3 MEDIUM): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0396 *
CVE-2022-0529 (CVSS3: 7.8 HIGH): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530 (CVSS3: 7.8 HIGH): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-0561 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0561 *
CVE-2022-0562 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0562 *
CVE-2022-0563 (CVSS3: 5.5 MEDIUM): util-linux:util-linux-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0563 *
CVE-2022-0891 (CVSS3: 7.1 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0891 *
CVE-2022-0943 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0943 *
CVE-2022-1050 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1050 *
CVE-2022-1154 (CVSS3: 9.8 CRITICAL): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1154 *
CVE-2022-1160 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1160 *
CVE-2022-23096 (CVSS3: 9.1 CRITICAL): connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23096 *
CVE-2022-23097 (CVSS3: 9.1 CRITICAL): connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23097 *
CVE-2022-23098 (CVSS3: 7.5 HIGH): connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23098 *
CVE-2022-23218 (CVSS3: 9.8 CRITICAL): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23218 *
CVE-2022-23219 (CVSS3: 9.8 CRITICAL): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23219 *
CVE-2022-23303 (CVSS3: 9.8 CRITICAL): wpa-supplicant https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23303 *
CVE-2022-23304 (CVSS3: 9.8 CRITICAL): wpa-supplicant https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23304 *
CVE-2022-24975 (CVSS3: 7.5 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24975 *
CVE-2022-25313 (CVSS3: 6.5 MEDIUM): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-25313 *
CVE-2022-25314 (CVSS3: 7.5 HIGH): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-25314 *
CVE-2022-25315 (CVSS3: 9.8 CRITICAL): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-25315 *
CVE-2022-26354 (CVSS3: 3.2 LOW): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26354 *
CVE-2022-26488 (CVSS3: 7.0 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26488 *
CVE-2022-27191 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27191 *
CVE-2022-28391 (CVSS3: 9.8 CRITICAL): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-28391 *


