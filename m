Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A608C433F5
	for <webhook@archiver.kernel.org>; Sun,  6 Mar 2022 15:34:14 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web09.16256.1646580853604444565
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Mar 2022 07:34:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ORijjvPq;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id
 gj15-20020a17090b108f00b001bef86c67c1so11897061pjb.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Mar 2022 07:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=4hILH/hfT1UkU38jAXnBEjSirnD7CyMHtSqAzJ3bWuA=;
        b=ORijjvPqKzCKieENDbgS7URl+AbTZRXhT8UWfGK3kOQEOslxrs+JcQISpA73BhE4LL
         YnAwD3k7zKiyXyRYOujuSqzrd1u0LYWNW+03AF2P/H6zkU/cmU9g+xD0xIJ6YMlPaOKO
         AI3WOPmch4v4vMjBzzM1Wl1ObDzjjW+FMKTMyYHwx+Hv8HEH7TMr4hsvPnvrNe8cwQCz
         6oFbfYKXKZsrmCDUNZ40y/LOVihtgUC5Ni4o2cAMF5RraGKKdzg/zutfxT4wAYppLjeJ
         3CcZ+u/4397SZWPkc/XB0Ne9Bdb/6xP0qPtLt/PnDTyOflxEdbp8ilfgW3N1635aPT5b
         3uPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=4hILH/hfT1UkU38jAXnBEjSirnD7CyMHtSqAzJ3bWuA=;
        b=0RtDWz1pdPQJWWtkzPDACL5EdW3Cc59iquKphpvSYuBbKKrH1FX6X8edLT1Tg66VDb
         zocyJsFuyfuOZlGRHtyQBgUtAfTw8Im7mkzTWoaBZCLyr0y0CDtyfms9F5TMPeG95gLP
         hfOioHnwcLH/Zc57efrTgLk3MziT18PEBAmE4Z9CwC//jqR0LXT/dtuFXaej2bGXSCoQ
         vRH3/uj4i1EqJN576DTsgKFwubCG/PgYTQFcGcUrMYQB4Z0MTVwBEH0VPXCBuucHoTy1
         vcC/IE8MtiPPwldolMeovTML2IdlRqHa32O9L7IE8czxVWLf+Pi2gVCHrUgSHUiWwp5O
         dVZA==
X-Gm-Message-State: AOAM531h1JgbvfuYFrMnYhUhqsHy6HP2sE8a1pIdNphcY6kRE6et6xee
	chCd6Q+yXvFBS+dra9ECxWJNvxMG2fyLUWgnFcg=
X-Google-Smtp-Source: 
 ABdhPJylTN78rG43PqYtJQ1akpEbSveWqJTi3DeQAnDMf/b+D3H+F+zOqOQyFNQbYftmOakuJyu6WA==
X-Received: by 2002:a17:90b:1bc5:b0:1bf:1c96:66ac with SMTP id
 oa5-20020a17090b1bc500b001bf1c9666acmr16044734pjb.167.1646580852398;
        Sun, 06 Mar 2022 07:34:12 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 w21-20020a634755000000b00368f3ba336dsm9469142pgk.88.2022.03.06.07.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Mar 2022 07:34:11 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id D4857961F2E; Sun,  6 Mar 2022 05:34:09 -1000 (HST)
Subject: OE-core CVE metrics for honister on Sun 06 Mar 2022 05:30:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220306153409.D4857961F2E@nuc.router0800d9.com>
Date: Sun,  6 Mar 2022 05:34:09 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Mar 2022 15:34:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162789

Branch: honister

New this week: 15 CVEs
CVE-2021-3607: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3607 *
CVE-2021-3608: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3608 *
CVE-2021-3781: ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3781 *
CVE-2021-3930: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3930 *
CVE-2021-3947: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3947 *
CVE-2021-44568: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44568 *
CVE-2021-44571: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44571 *
CVE-2021-44573: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44573 *
CVE-2021-44574: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44574 *
CVE-2021-44575: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44575 *
CVE-2021-44576: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44576 *
CVE-2021-44577: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44577 *
CVE-2022-0696: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0696 *
CVE-2022-0714: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0714 *
CVE-2022-0729: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0729 *

Removed this week: 0 CVEs

Full list:  Found 47 unpatched CVEs
CVE-2016-20012: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-20012 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-3607: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3607 *
CVE-2021-3608: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3608 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-3781: ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3781 *
CVE-2021-3930: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3930 *
CVE-2021-3947: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3947 *
CVE-2021-4145: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4145 *
CVE-2021-4160: openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4160 *
CVE-2021-41817: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41817 *
CVE-2021-41819: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41819 *
CVE-2021-42762: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42762 *
CVE-2021-43400: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-43400 *
CVE-2021-44568: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44568 *
CVE-2021-44571: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44571 *
CVE-2021-44573: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44573 *
CVE-2021-44574: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44574 *
CVE-2021-44575: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44575 *
CVE-2021-44576: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44576 *
CVE-2021-44577: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44577 *
CVE-2021-45481: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45481 *
CVE-2021-45482: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45482 *
CVE-2021-45483: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45483 *
CVE-2021-45931: harfbuzz:harfbuzz-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45931 *
CVE-2021-45949: ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45949 *
CVE-2022-0529: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-0696: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0696 *
CVE-2022-0714: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0714 *
CVE-2022-0729: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0729 *
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

