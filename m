Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC6D1C433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:57 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web08.16434.1649592158847067114
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Apr 2022 05:02:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=qq2pgVRi;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id 2so12664802pjw.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Apr 2022 05:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=muuO4x20W0txbBwvpx6NIv1bVtaevrGpoPcrnUyt/9A=;
        b=qq2pgVRiZjvx10dWB0IPCd7B8QDIsbtdKoeHM6XHGULbQVc9qA5wjT8kKJqgpGiQoY
         chL3zCJX3ouwjoC99R0ZdRGJ/ls0FR+i32OqP6+LXt4nMEVO2+I50uMPsHvA/CdTGXJW
         Y+ktyHl1Ht9ltDF/dCBj2ccIeaCj0kMzXm+cgf7d30f2uIG01SXZCJNPoPxeAalBJSB1
         tE8yyCDy0PSlSto2fwgIzxyGo885xjaa4U3BXojwpr4fUUXduJIyrlhEQnFk47WH8eKz
         2/YCSAl8yWYclp2CJePsfCIin3F1Zli3IMWDur26Lb1aSWKi9yUV6jlRfa7xJeduaBPt
         oV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=muuO4x20W0txbBwvpx6NIv1bVtaevrGpoPcrnUyt/9A=;
        b=hXe6NdWYEiwWUjXhP840+Q0XpFqEDjOxCtpnoAsQs+bjQY+yRiuOFRReR2xFJxehCh
         T77ESVtcn4brmKY6o3vaH7GFHqhCQQsy0B2mULEFMGOgM630jZ0/OBtWXd/2xe4Qxdl3
         Sq42Z3kiPwPkleqx5rdKP85hPST9nJQLEcBL1jscBilq7Ys/JAho6o4yVRIrpJdhT9r3
         ZMjsMt7j08CwwRKDzkkgmlXqO7FRZ1jI5sjG5fkdBNAzkZn9M+XLXyEhmFCgwuAtFXrj
         Gic7GYfhvbNCG5xQtxiLanJEecMOEIEC8xnHmKVqaZjY89XHpZEHMh4iQkXNBve9vSKT
         lEow==
X-Gm-Message-State: AOAM532fl+lljJf4mGfBYUoX8Oe9MiEO2xuyStgqZroufCXvfGr9vKaA
	CHtybPPMjvgLo1j7loI04biZf2G/vR20uVseeW8=
X-Google-Smtp-Source: 
 ABdhPJyZHBNw09WoTzetJ0i9jTtjI55tmb9ntt6bjzelUx+x3KMc8iizOFmhtfPSltgxvVxtCOUQMw==
X-Received: by 2002:a17:90b:4c44:b0:1c7:1326:ec90 with SMTP id
 np4-20020a17090b4c4400b001c71326ec90mr31038400pjb.87.1649592157465;
        Sun, 10 Apr 2022 05:02:37 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 p9-20020a17090a74c900b001cb8d6b5c47sm1363680pjl.46.2022.04.10.05.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 05:02:36 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id AE7F69627FC; Sun, 10 Apr 2022 02:02:34 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 10 Apr 2022 02:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220410120234.AE7F69627FC@nuc.router0800d9.com>
Date: Sun, 10 Apr 2022 02:02:34 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164197

Branch: master

New this week: 4 CVEs
CVE-2019-1010238 (CVSS3: 9.8 CRITICAL): pango:pango-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010238 *
CVE-2022-1050 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1050 *
CVE-2022-1056 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1056 *
CVE-2022-26280 (CVSS3: 9.1 CRITICAL): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26280 *

Removed this week: 1 CVEs
CVE-2022-0943 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0943 *

Full list:  Found 12 unpatched CVEs
CVE-2019-1010238 (CVSS3: 9.8 CRITICAL): pango:pango-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010238 *
CVE-2019-12067 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974 (CVSS3: 3.3 LOW): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-44647 (CVSS3: 5.5 MEDIUM): lua:lua-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44647 *
CVE-2022-0529 (CVSS3: 7.8 HIGH): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530 (CVSS3: 7.8 HIGH): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-1050 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1050 *
CVE-2022-1056 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1056 *
CVE-2022-24975 (CVSS3: 7.5 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24975 *
CVE-2022-26280 (CVSS3: 9.1 CRITICAL): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26280 *
CVE-2022-27191 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27191 *


