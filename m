Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A28C433EF
	for <webhook@archiver.kernel.org>; Sun, 27 Mar 2022 17:34:18 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web12.1284.1648402457102307297
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Mar 2022 10:34:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=grBE5V62;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id j13so12912158plj.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Mar 2022 10:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=Gf79swwFa7hrhGsjW3Q9w4eZn2s8gbpifVxzxkyUUr4=;
        b=grBE5V62uo6Bjh8wkKsenGooQR9XeUZoSACLrkrcVZ+sox2kUqXcjUJnYo5IEb4HJb
         wsqcyZ6iyg5jdm/RYZ+9hiD0qTDI4m1gUtGSlvB4Qd81ZCQXFuCEE5SeKjzXNnatzByK
         hXLfw5pVLj0LQN7ZU12ddN0O1l+AH/zfTMc3vC3xZWqj3/5Fte6I8Rv75+T4AjwBMyNF
         tickOjdZJn326BfSxMb2T3EFDx6l65F1AlEkEKK6jUd16sO76BYA4Rolhg68r8MhkNgT
         xmhyeZiDlax2faKvKf4CImgAm0nhGc4hBL94sf78tlfuj92VUT2RefRZDiq4mtr7+lyS
         fpkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=Gf79swwFa7hrhGsjW3Q9w4eZn2s8gbpifVxzxkyUUr4=;
        b=bU2M2yAgnB3xMPoACqrKzEOEGE3pD70SmOAG7dySxJT/sJSEX5YL5Ha6nlM+8o4brE
         C57TSXz89bpGlcMjQ4DrYshQPHn/VeFclLNIHCe0XiqiFqAwU8IEopvS9XKN3H0eYgpB
         oljAa5/ekyQTz8yM2wm4Nvfv0OcTP/T7P7s0jnq3lHF6FRUXg38prDTGwq4G2AKtxPiR
         cVADoJUYijIS/+aMEaowU5e8L+A4MTkRg23YRngAlCLu+tERe1B47y//9wAH3/w2dHW6
         PoWKiiTCs7OSFsaG44n7CrwZx0FLuIX98NANsAAh9VNfNBUeiH5ChXwPDu6/YogGXNuL
         iP7w==
X-Gm-Message-State: AOAM531RwTG8atRCxLLtuACXZL4mKE/lAuCvpHyCp0YhHavswu1AI1on
	QcPgtIxIvo05NNK/ewmqN+fBX/oJqcUe49lkg00=
X-Google-Smtp-Source: 
 ABdhPJydvTNNgVLI/9tYQExK5AOCSlmZ0tlqv/fbUuzmO2i0gCOHxwvj4Bv+T8f/AIY5EFqJ9O48+g==
X-Received: by 2002:a17:90a:2c0c:b0:1b9:fa47:1caf with SMTP id
 m12-20020a17090a2c0c00b001b9fa471cafmr24963880pjd.34.1648402456135;
        Sun, 27 Mar 2022 10:34:16 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 d18-20020a056a0010d200b004fa2e13ce80sm13532301pfu.76.2022.03.27.10.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Mar 2022 10:34:15 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 6613D9627AB; Sun, 27 Mar 2022 07:34:13 -1000 (HST)
Subject: OE-core CVE metrics for honister on Sun 27 Mar 2022 07:30:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220327173413.6613D9627AB@nuc.router0800d9.com>
Date: Sun, 27 Mar 2022 07:34:13 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Mar 2022 17:34:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163678

Branch: honister

New this week: 6 CVEs
CVE-2021-20257: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20257 *
CVE-2021-46705: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-46705 *
CVE-2022-0778: openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0778 *
CVE-2022-0943: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0943 *
CVE-2022-26354: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26354 *
CVE-2022-27191: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27191 *

Removed this week: 5 CVEs
CVE-2021-3781: ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3781 *
CVE-2022-23772: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23772 *
CVE-2022-23773: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23773 *
CVE-2022-23806: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23806 *
CVE-2022-24921: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24921 *

Full list:  Found 44 unpatched CVEs
CVE-2016-20012: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-20012 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-20257: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20257 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-3607: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3607 *
CVE-2021-3608: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3608 *
CVE-2021-36368: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36368 *
CVE-2021-3638: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3638 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-3930: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3930 *
CVE-2021-3947: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3947 *
CVE-2021-4160: openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4160 *
CVE-2021-42762: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42762 *
CVE-2021-43400: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-43400 *
CVE-2021-45481: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45481 *
CVE-2021-45482: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45482 *
CVE-2021-45483: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45483 *
CVE-2021-46705: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-46705 *
CVE-2022-0204: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0204 *
CVE-2022-0529: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-0778: openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0778 *
CVE-2022-0865: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0865 *
CVE-2022-0891: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0891 *
CVE-2022-0907: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0907 *
CVE-2022-0908: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0908 *
CVE-2022-0909: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0909 *
CVE-2022-0924: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0924 *
CVE-2022-0943: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0943 *
CVE-2022-21658: rust-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-21658 *
CVE-2022-23096: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23096 *
CVE-2022-23097: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23097 *
CVE-2022-23098: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23098 *
CVE-2022-23303: wpa-supplicant https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23303 *
CVE-2022-23304: wpa-supplicant https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23304 *
CVE-2022-23308: libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23308 *
CVE-2022-24975: git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24975 *
CVE-2022-26354: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26354 *
CVE-2022-26488: python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26488 *
CVE-2022-27191: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27191 *

