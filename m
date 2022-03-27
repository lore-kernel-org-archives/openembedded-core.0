Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D13A3C433F5
	for <webhook@archiver.kernel.org>; Sun, 27 Mar 2022 17:04:54 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web12.977.1648400693865443267
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Mar 2022 10:04:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=BYHi/yXe;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id w4so12859732ply.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Mar 2022 10:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=/2w2VNiC+f+KdIEBCXPW2osxYQW7V1FpKsPY9yqjkqk=;
        b=BYHi/yXezt5z9Au4rZ9XjztjjvF99WDFpOUNJKKg45KHIkOSBGPvAiXil/dAjYOyGC
         6vGlP/yeXEdijqXsK+Fq6HCdl9CLWlDb5hSob8j672Mz381NQfKjlJk/vSv4mIVZlWSQ
         cNIlc+5663+sxUjicPEdkoQi3s9hKd2mv1wLVUxjOVBXGagFeycRcEg0lGAA8qC6uot1
         NbTg62RN9I/tqj4x0X60LatnJGPdRj8QA9o/lyemE8Dq1r9xO3fpAYQRnbvP2Hty71b4
         VV48VxQw5HcfoULVAptSvG9dvI9RBRE4s4ti7c93Amsyy9phC7aHAzKO87Nx5J8HGT52
         JnyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=/2w2VNiC+f+KdIEBCXPW2osxYQW7V1FpKsPY9yqjkqk=;
        b=zWaLcDgpiInTN3dSlJerD+PcIiiYI/oEUQzhyiOo0OAVANnPPGF+xTnrzZ7z1htWCg
         KasqFJ9PBo76Lq7YUGMcDL65K0pk116YswwrIZXMOiKGZtJkdkGoLP/GSNTWoWa4focz
         TGQ8M2kXgwlmuy6jBCXAbtFz9mHRXeFmvHXwVjsr9L13XnMsEjw9UMSwNJVnyf5ILvQI
         WImSC07SpuNBoxrewPI9mivKhdT/UufpQU/N0/kq7R37HHmOsu/RgALFN/k2uInZ1c5y
         MuhtjL5bLb51UnoU8JhnEaJ9ZgWi9p+vdjUNhieNqk3G6lCQ9LCCWH4J4YuxRKllHIWm
         Rj7A==
X-Gm-Message-State: AOAM530kn1nVs623is+p2HA3MmhEBmZYdbxFpTDPgQXznKilXCMiIc+v
	9cvIy+SbfUdsiLgCe76JcPJcMo/lv/hLQijNeaM=
X-Google-Smtp-Source: 
 ABdhPJwBUOTpUDXCG/KhgeBCNgToYQjb1ZrljvRAOfskn4q/OQq+pozayDY1lfVetArN8QDwujGzqQ==
X-Received: by 2002:a17:903:2309:b0:156:137b:8ba5 with SMTP id
 d9-20020a170903230900b00156137b8ba5mr1062320plh.84.1648400692741;
        Sun, 27 Mar 2022 10:04:52 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 l185-20020a6388c2000000b0038614ed80c0sm11261208pgd.41.2022.03.27.10.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Mar 2022 10:04:52 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 890359627A8; Sun, 27 Mar 2022 07:04:50 -1000 (HST)
Subject: OE-core CVE metrics for hardknott on Sun 27 Mar 2022 07:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220327170450.890359627A8@nuc.router0800d9.com>
Date: Sun, 27 Mar 2022 07:04:50 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Mar 2022 17:04:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163677

Branch: hardknott

New this week: 4 CVEs
CVE-2021-46705: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-46705 *
CVE-2022-0778: openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0778 *
CVE-2022-0943: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0943 *
CVE-2022-26354: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26354 *

Removed this week: 4 CVEs
CVE-2022-0696: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0696 *
CVE-2022-0714: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0714 *
CVE-2022-0729: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0729 *
CVE-2022-25235: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-25235 *

Full list:  Found 62 unpatched CVEs
CVE-2013-0340: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0340 *
CVE-2016-20012: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-20012 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2020-29623: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29623 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-1765: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1765 *
CVE-2021-1789: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1789 *
CVE-2021-1799: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1799 *
CVE-2021-1801: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1801 *
CVE-2021-1870: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1870 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-27645: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27645 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-33574: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33574 *
CVE-2021-33833: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33833 *
CVE-2021-33928: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33928 *
CVE-2021-33929: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33929 *
CVE-2021-33930: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33930 *
CVE-2021-33938: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33938 *
CVE-2021-3445: libdnf https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3445 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-36368: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36368 *
CVE-2021-3638: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3638 *
CVE-2021-38604: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38604 *
CVE-2021-3947: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3947 *
CVE-2021-4160: openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4160 *
CVE-2021-42376: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42376 *
CVE-2021-45085: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45085 *
CVE-2021-45086: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45086 *
CVE-2021-45087: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45087 *
CVE-2021-45088: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45088 *
CVE-2021-45481: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45481 *
CVE-2021-45482: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45482 *
CVE-2021-45483: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45483 *
CVE-2021-45944: ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45944 *
CVE-2021-46705: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-46705 *
CVE-2022-0204: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0204 *
CVE-2022-0529: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-0561: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0561 *
CVE-2022-0562: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0562 *
CVE-2022-0563: util-linux:util-linux-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0563 *
CVE-2022-0778: openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0778 *
CVE-2022-0891: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0891 *
CVE-2022-0943: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0943 *
CVE-2022-23096: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23096 *
CVE-2022-23097: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23097 *
CVE-2022-23098: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23098 *
CVE-2022-23218: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23218 *
CVE-2022-23219: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23219 *
CVE-2022-23303: wpa-supplicant https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23303 *
CVE-2022-23304: wpa-supplicant https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23304 *
CVE-2022-23308: libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23308 *
CVE-2022-24921: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24921 *
CVE-2022-24975: git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24975 *
CVE-2022-25313: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-25313 *
CVE-2022-25314: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-25314 *
CVE-2022-25315: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-25315 *
CVE-2022-26354: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26354 *
CVE-2022-26488: python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26488 *
CVE-2022-27191: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27191 *

