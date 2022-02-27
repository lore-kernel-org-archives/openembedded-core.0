Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A429C433EF
	for <webhook@archiver.kernel.org>; Sun, 27 Feb 2022 15:34:04 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.9565.1645976043064410100
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Feb 2022 07:34:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=KfzTIU78;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id
 h17-20020a17090acf1100b001bc68ecce4aso12648657pju.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Feb 2022 07:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=TXnBV9GoDUjNw3oOJcag+FvPN8oWluyTzhrs7t0ITWs=;
        b=KfzTIU78wEPmKhDjYOt6TZF0/Ug7cm6CdTi9k5qHJ4Pj9E4sdMx/EfKLBIQxfQwWG9
         VwrumZlW5ZobeyE6zCNJkRRmdydWXBN7NvHUJ5Tm/MFvLpr7IOJ+VirMU7152vn7p+6a
         F/6lhUGgeuz4KnO/28DJEi3qwmbrJdL1mx7WiwqhXcljcLoY9G3tb2kZBFNGv/uOH+yt
         Tq700MPXy7k7FoS9RKaxmUKa4bCljOyBBfVIBifrzcPG6MR1pmNKVuTMvKkT8VpFAypA
         1kJmibNeoN9BNjboWWE656mbcg3dc2P5dtqoJ7JHTCmT/Kfenwo5NCXCOMIZJuGzXh74
         LvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=TXnBV9GoDUjNw3oOJcag+FvPN8oWluyTzhrs7t0ITWs=;
        b=XOaDglwGK9/JdJ4XCiWXvlOq9Xm5OCWwmuT/x3Bgs9tK1VSxDPSMMVPuu9OqllMlG0
         B6pKy7ZKwWv41ztReo3noYiG/3C0rYU4hWRLcxWGHvu9kHM83qRty/gsj5H9myq7+jYG
         ffmQrE6YXkVXrZg8glZu9I87Q5Ns4qIX12YFtMjNRjPdDkWoaFDDvBn3zy4G153kHvHI
         6Gj7GuZRE3w6a69M7mEZwVwPtgzfXfMloJzkQNjCz43FCk6uJf1Nk3gw64VRdAFlrgbU
         MkFGZ5f+ohhZXuZOqZXvZVtBa1WV3dPUKANXukpOO08XNNJTpnl+YLpeKjQYUxnpUiMu
         x/rw==
X-Gm-Message-State: AOAM532YKjLfDOLqO50VyGTJLo5IF9n2iaiqFXo7VK3NONh7FgrEpO1a
	Ctj/xnEoJ8eJ1QgYNLC+jd7j4OP5mMRUQ1mm
X-Google-Smtp-Source: 
 ABdhPJwy+yJtN9Hl59AmRTlaw2cGMTyO1a+PgfLNhNQxMvVQr9yVAES762QynwXSvZJPqkPSvbuNfg==
X-Received: by 2002:a17:902:d345:b0:14f:ee29:5ee6 with SMTP id
 l5-20020a170902d34500b0014fee295ee6mr16057118plk.102.1645976041718;
        Sun, 27 Feb 2022 07:34:01 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 h22-20020aa786d6000000b004f10a5c8ad6sm9687809pfo.121.2022.02.27.07.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Feb 2022 07:34:00 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id C44A2962BE7; Sun, 27 Feb 2022 05:33:58 -1000 (HST)
Subject: OE-core CVE metrics for honister on Sun 27 Feb 2022 05:30:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220227153358.C44A2962BE7@nuc.router0800d9.com>
Date: Sun, 27 Feb 2022 05:33:58 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Feb 2022 15:34:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162438

Branch: honister

New this week: 1 CVEs
CVE-2022-24975: git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24975 *

Removed this week: 5 CVEs
CVE-2021-45078: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45078 *
CVE-2022-0443: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0443 *
CVE-2022-0554: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0554 *
CVE-2022-0561: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0561 *
CVE-2022-0562: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0562 *

Full list:  Found 32 unpatched CVEs
CVE-2016-20012: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-20012 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-4145: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4145 *
CVE-2021-4160: openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4160 *
CVE-2021-41817: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41817 *
CVE-2021-41819: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41819 *
CVE-2021-42762: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42762 *
CVE-2021-43400: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-43400 *
CVE-2021-45481: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45481 *
CVE-2021-45482: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45482 *
CVE-2021-45483: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45483 *
CVE-2021-45931: harfbuzz:harfbuzz-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45931 *
CVE-2021-45949: ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45949 *
CVE-2022-0529: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-21658: rust-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-21658 *
CVE-2022-23096: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23096 *
CVE-2022-23097: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23097 *
CVE-2022-23098: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23098 *
CVE-2022-23303: wpa-supplicant https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23303 *
CVE-2022-23304: wpa-supplicant https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23304 *
CVE-2022-23772: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23772 *
CVE-2022-23773: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23773 *
CVE-2022-23806: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23806 *
CVE-2022-24975: git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24975 *

