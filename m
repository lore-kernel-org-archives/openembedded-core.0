Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F745C00140
	for <webhook@archiver.kernel.org>; Sun, 31 Jul 2022 13:02:21 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.12907.1659272540248195309
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Jul 2022 06:02:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=OI/67B8m;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id b133so8317928pfb.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Jul 2022 06:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=4UXtLXTrEaTio9ch3v8/Rwup4/5DZUIbIGR5q/W/1Bk=;
        b=OI/67B8mAQTmhb0hTuEORH3IEMVEl2Rn+IhXGiEizCScauhEliHrpbZy3eYhL6UdvY
         6+NPA96hIZv+zpTlwMQKhh/HmvbPrHq4omo2gBXu2wjm0gYIjAGrfWbKc4qqbHhuVteU
         T1297XwZFz1JzkbC+ScctiTKslb4RcgJ287zRR+tpR4Fd2AddVFiBKQIpl5ERNjpVu2j
         nrw+Nis6h6z2/wYsubF8FlQZlCZh19Ie7GJhzpaX4vsJ5Ob8ealXSQe+jm6lWmUZKRgs
         RRrv9/+9fOlp2PTLzbzXFbxgjrNUKnoRqjKzNfZQMMi+GSNab+4EkCkdjtiDWQ4/HmJL
         hEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=4UXtLXTrEaTio9ch3v8/Rwup4/5DZUIbIGR5q/W/1Bk=;
        b=SFg8SOar8OR6RpKwFSJKPlz5lw6to85MQoOdG8ntcG89GXuFlmdjFI+GXHwAfCEcY/
         ZxQU+p9hZ7zvV/4fAIFrou5it5wWWc4PuQMW2r4anUkn9eBluNS0UEtOXrga2KFk5BCu
         4+O2l/+Bax6xCPVi+WQRwJ6NLx7nYDOFbXIcI2nlW8trLej2gA2d8/aE5agGv+OAy2Qr
         lD1J7Fmkx7o84wE9Aa2yubbMRSYVKtKnVerS6trUAQ3kOHJVXdnSEAJuaFDFDIJqs6cM
         S8dJcIyJiO+ZODYk8XvbWdq9sBH6O2EP9jz6Oj4dWG+iPabg+tHflpO1CHhp2dC02Dx9
         fGqQ==
X-Gm-Message-State: ACgBeo32is4lvDwoQRyeTy98kgAJERWea1vPaj8VTFbH/0hrsS0uBPcF
	x/Qx7K3gxg1gz9phWxETUazboK8Qi9dpkMzm
X-Google-Smtp-Source: 
 AA6agR5R+YLLG+pAXwr0UMjYI2iD8JxxP5MsUrLntvT1aG6vxRjIJTCBN6b9U+FGW1gEKEHiKhSmKQ==
X-Received: by 2002:a63:8142:0:b0:41b:d0dc:aa8e with SMTP id
 t63-20020a638142000000b0041bd0dcaa8emr4438226pgd.90.1659272538907;
        Sun, 31 Jul 2022 06:02:18 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 h14-20020a17090a604e00b001f4f40763b1sm1088562pjm.29.2022.07.31.06.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jul 2022 06:02:17 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 6BF0F9609AE; Sun, 31 Jul 2022 03:02:15 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 31 Jul 2022 03:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220731130215.6BF0F9609AE@nuc.router0800d9.com>
Date: Sun, 31 Jul 2022 03:02:15 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Jul 2022 13:02:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168689

Branch: kirkstone

New this week: 1 CVEs
CVE-2022-2522 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2522 *

Removed this week: 4 CVEs
CVE-2022-32205 (CVSS3: 4.3 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32205 *
CVE-2022-32206 (CVSS3: 6.5 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32206 *
CVE-2022-32207 (CVSS3: 9.8 CRITICAL): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32207 *
CVE-2022-32208 (CVSS3: 5.9 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32208 *

Full list:  Found 16 unpatched CVEs
CVE-2021-3611 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3611 *
CVE-2021-3750 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3750 *
CVE-2022-1183 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1183 *
CVE-2022-1664 (CVSS3: 9.8 CRITICAL): dpkg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1664 *
CVE-2022-2288 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2288 *
CVE-2022-2289 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2289 *
CVE-2022-2304 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2304 *
CVE-2022-2343 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2343 *
CVE-2022-2344 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2344 *
CVE-2022-2345 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2345 *
CVE-2022-2522 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2522 *
CVE-2022-29187 (CVSS3: 7.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29187 *
CVE-2022-30634 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30634 *
CVE-2022-33099 (CVSS3: 7.5 HIGH): lua:lua-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-33099 *
CVE-2022-34903 (CVSS3: 6.5 MEDIUM): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-34903 *
CVE-2022-35414 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-35414 *

\nFor further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

