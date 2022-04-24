Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34F8FC4708A
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:12 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.16765.1650801782694282356
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Apr 2022 05:03:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=J8PI9tPS;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id b15so12356662pfm.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Apr 2022 05:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=EaavVbq/+x/x33MbJANag/dWlnCaLiIwAVlCUREKde0=;
        b=J8PI9tPSGazVLzqY3lPq1yUsF+xrV6A4MD7yGkJ+3fHvtRKw3gaUOce662ml1bGuDy
         4C5IpuX24GaEnbCq1uXoFA1KYgQACAkoaMHkHbJ3rr0M7JT7o/aTaUD21Dok5fjxo/S1
         4gT4Z+6syQ2+NbfrXjGJo8stN+wfkc/pwXxzYLoxj9L+R7oHH4eYM1Q1hpnax46EJ67z
         WUM3RU2W1NlCC0Vvd9cKsVtEZCeVmq2k2hCAfFqNaZlV7buZP8eUv4vIF0jYrCKkkyoP
         inG5ePS/qsgdlx2465CfooJr+VUkg8l9ZxNeIt1C8LOjaYjL9KnxtcRtXTHJVojtCSB8
         h78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=EaavVbq/+x/x33MbJANag/dWlnCaLiIwAVlCUREKde0=;
        b=PGd1S9weG0tEEnyh89fhrfbdBxBgOvrjiPa8LEhoDLzhAnNfydf4q+1QoIR4WFIOr/
         1XYXSbY7aVxDHuN1cfUOl4KNdwMB/IOwYNwPefTGzdE7aKM2oh8YauADyHjBsZ3BlKEI
         wc7Za4k88F2T9UoUz/u5kDHuDQXXOtSzIWLgFHhEqyFpJPz30BFbmJ3QXzby94nXXNd8
         2OjQO/2kDrkbQeb57KfyZmrEyHNqHhSNivOTlEv+KZLqs6OPDPFdOsL+TqgE3XZcIfvF
         FRTC+nsXyyn87ybqkQSPWdTj2aCGElC50WI+qLDDA/vu9utEiESLZ8z2RNRkmv/aPFlJ
         i89w==
X-Gm-Message-State: AOAM532JeZZLRdONevQ53CGHNJtJ12rWlXsMWY82/3F6Sa9k/OFjLgkc
	LeCYMgnanspjECYEQelkJoDwQk64wcFVFbG15jU=
X-Google-Smtp-Source: 
 ABdhPJznSoc/Mn80ad/L0MlEyAbr9jtsxlO55vBKC3K43kv5VKtdiGixHVzerpd/cq/9MQGpJUMafQ==
X-Received: by 2002:a63:894a:0:b0:3ab:23c7:33ff with SMTP id
 v71-20020a63894a000000b003ab23c733ffmr1910276pgd.245.1650801781155;
        Sun, 24 Apr 2022 05:03:01 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i66-20020a628745000000b0050d36a5fe70sm1625114pfe.127.2022.04.24.05.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Apr 2022 05:03:00 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 48E1E9627AF; Sun, 24 Apr 2022 02:02:58 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 24 Apr 2022 02:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220424120258.48E1E9627AF@nuc.router0800d9.com>
Date: Sun, 24 Apr 2022 02:02:58 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164804

Branch: master

New this week: 4 CVEs
CVE-2015-20107 (CVSS3: 9.8 CRITICAL): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-20107 *
CVE-2021-28544 (CVSS3: 4.3 MEDIUM): subversion https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-28544 *
CVE-2022-1304 (CVSS3: 7.8 HIGH): e2fsprogs:e2fsprogs-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1304 *
CVE-2022-24070 (CVSS3: 7.5 HIGH): subversion https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24070 *

Removed this week: 3 CVEs
CVE-2022-27191 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27191 *
CVE-2022-28391 (CVSS3: 9.8 CRITICAL): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-28391 *
CVE-2022-28805 (CVSS3: 9.1 CRITICAL): lua:lua-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-28805 *

Full list:  Found 10 unpatched CVEs
CVE-2015-20107 (CVSS3: 9.8 CRITICAL): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-20107 *
CVE-2019-12067 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974 (CVSS3: 3.3 LOW): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-28544 (CVSS3: 4.3 MEDIUM): subversion https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-28544 *
CVE-2022-0529 (CVSS3: 7.8 HIGH): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530 (CVSS3: 7.8 HIGH): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-1210 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1210 *
CVE-2022-1304 (CVSS3: 7.8 HIGH): e2fsprogs:e2fsprogs-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1304 *
CVE-2022-24070 (CVSS3: 7.5 HIGH): subversion https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24070 *


