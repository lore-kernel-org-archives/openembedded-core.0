Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D477AC47095
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:42 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.24167.1648999203089000445
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Apr 2022 08:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=uXi0tJy8;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id f10so6251390plr.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Apr 2022 08:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=9nNbFUQ7PnXJ3qo3p/UO2U/4BYmrj/Po3gyTZqGFvXw=;
        b=uXi0tJy82pwy/DDSh6nzEkKE/MDiEB9Hry9nyYEz3HkYfGZBeOywiP6VUtjBrVi0Rh
         ZRQicW/0ozvVegOlvAfRV6Z6wGTeh37WF4QIES21TXwR4O1mLscYEpzKMI5o3pAmPZXd
         Dw1N1MBusH8sujUCwA3IXKf2mwQaH7Ec09mmtX/JjqycUq7ZweafY5Sh/rV1UilyxoxE
         m2cr70828VTEaYpw7YyMXvlxQU4i37bo09M+CZcPS2paUWUH+99NHy3Pey0OeY9u/xha
         uCA8MwX0g51bzKwyKZ0rz0zKwmi1nHjWTvxgss8nFpLhJn7Z4enXQzTZgmNW3B5nYT0f
         bvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=9nNbFUQ7PnXJ3qo3p/UO2U/4BYmrj/Po3gyTZqGFvXw=;
        b=RwFZzRPsBDtffuosqyYthYkSKm7ymPUT+sM+9MZTCOw2QjKHhjYW+Fh3xpa1Gesgw1
         VmNKsRjUYF+XfhzBVTQvNN7SliLc6p2D1b/9kkej57ddBuxCQO8yV5zMyUy3n1dfg7SR
         uOwX2QNcIkijI719L11yO1TChobbzuolFbgYLNHZwiwRYqvlmJeEnGApXXdQddtSMb8q
         JkTeIaakKXS/luD4p5hrwUiuaktGC2eRJmBs4LiC+MUksYedLf4YMD3MZyeyMhmNBNj6
         EKb6BDqJuuzX4R89LgL5Vm7r4DagEorTou5zSZFSLFFN1BOha9nn4SG+M/0GQ7QMkzrW
         uZPA==
X-Gm-Message-State: AOAM531JsZOF1Wr6AT/4GUPkjX/Caa0FAg436pgPHzHt48+g7ADmMwra
	V9j+xCSZACXaACFw2MmrnoMyFCbKhqmEv4faGpA=
X-Google-Smtp-Source: 
 ABdhPJwhHJi8wPvgCZs7DCX58f/31lPfMHfC7SYc4C0qGxhDgqLWy8FLXYdeIJCalOcRL2COINmrtg==
X-Received: by 2002:a17:902:c2d8:b0:154:b384:917b with SMTP id
 c24-20020a170902c2d800b00154b384917bmr19613213pla.58.1648999202024;
        Sun, 03 Apr 2022 08:20:02 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 z23-20020aa79497000000b004fdc6ecd157sm9991675pfk.99.2022.04.03.08.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 08:20:01 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 8493396277B; Sun,  3 Apr 2022 05:19:59 -1000 (HST)
Subject: OE-core CVE metrics for honister on Sun 03 Apr 2022 05:18:39 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220403151959.8493396277B@nuc.router0800d9.com>
Date: Sun,  3 Apr 2022 05:19:59 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163962

Branch: honister

New this week: 5 CVEs
CVE-2018-25032: zlib:zlib-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-25032 *
CVE-2021-25220: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25220 *
CVE-2021-3748: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3748 *
CVE-2022-0396: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0396 *
CVE-2022-22623: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22623 *

Removed this week: 0 CVEs

Full list:  Found 49 unpatched CVEs
CVE-2016-20012: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-20012 *
CVE-2018-25032: zlib:zlib-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-25032 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-20257: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20257 *
CVE-2021-25220: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25220 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-3607: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3607 *
CVE-2021-3608: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3608 *
CVE-2021-36368: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36368 *
CVE-2021-3638: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3638 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-3748: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3748 *
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
CVE-2022-0396: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0396 *
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
CVE-2022-22623: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22623 *
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

