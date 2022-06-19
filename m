Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D03DDC433EF
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 12:03:05 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web08.18393.1655640175900826048
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 05:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=U5sO9LTq;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id g186so7925842pgc.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 05:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=X4gq5IlQvQuo1g5AB6D1CPxZfFMC9LoRT3jJ7r+SjUQ=;
        b=U5sO9LTqijctXP84cWYVgiZSOq293HnKY4hX6rE6dmQZqipYha0ro0A+If/fgYWJrB
         4H1h73fjc/jhy6kv8BGSdfUY1WVWgCzCvXaGWCtazvk8luJEzhQYVdiebr5Cmx3kHLvq
         kwWF+bZzHwfBtTfQX6F+U6Jb7ok8ob6yp1gydArIdRuVrriXpx5pzrDitBnxoB4VXABv
         +3skY0h6isRDpw37pxNPf+3zgJcLFj+3e6yfKTblNMvaowpIS/nALUYauladQCbc4+Q0
         CRgJoJ1ZKeWKF/DUO9FlsCNbLXCSdtO9lahEJ2hsQ/2bd8phcAZXglbr2xPzBDYwD/fM
         VH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=X4gq5IlQvQuo1g5AB6D1CPxZfFMC9LoRT3jJ7r+SjUQ=;
        b=dKCS9EKtzhMLaWv75fyMQFmlva/ZTaN1Np9TTZgRS9dqcOjBHYdnkVCIw4RUti5mMf
         JtWtjpBA+SYl1lKhBPAovk6NlwYPYPNzdveIPKdA8m1kTfKP0+3qwQqi36qxkfsDPNrU
         OLWrwEcB3Wrh4KrFX0PPi2/3xjMMriW+gs5AmkvEe5BsnpMNpqFSUHxRlPuoUKrZhg7z
         VVsjyKtkTZp5/ZrrUZwGVbWXrdOgoetGo7tERKqLi9vHilfOoPgNT5BKh7AujHTz19HW
         akNStodd5XK+U5osn+OfpFBaaXZPfhdBJhP1bG/1lAAuEsbTagykSI9oN8Z9XHrXlTHx
         XHQw==
X-Gm-Message-State: AJIora8epJMV98DYdaII66gx7EQdgT+lKJjI36fGMmoevJIuS9hU9Pbn
	5YjczuQ4D/r0NOr/V9G/k+Z2LtMzoqg56ie4
X-Google-Smtp-Source: 
 AGRyM1uuqvxn++PexHxASFZqZtSce8y8s8gmmp1fHY5hsWSBKpqdQ1KLLH/SRacOz4LmMoCn2UXewA==
X-Received: by 2002:a05:6a00:2181:b0:51b:560b:dd30 with SMTP id
 h1-20020a056a00218100b0051b560bdd30mr19562226pfi.44.1655640174607;
        Sun, 19 Jun 2022 05:02:54 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 nk10-20020a17090b194a00b001e2f53e1042sm8667898pjb.7.2022.06.19.05.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 05:02:54 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id E3D33962583; Sun, 19 Jun 2022 02:02:51 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 19 Jun 2022 02:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220619120251.E3D33962583@nuc.router0800d9.com>
Date: Sun, 19 Jun 2022 02:02:51 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jun 2022 12:03:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167034

Branch: master

New this week: 0 CVEs

Removed this week: 2 CVEs
CVE-2022-1927 (CVSS3: 9.8 CRITICAL): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1927 *
CVE-2022-1942 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1942 *

Full list:  Found 8 unpatched CVEs
CVE-2019-12067 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974 (CVSS3: 3.3 LOW): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2022-0529 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-26691 (CVSS3: 6.7 MEDIUM): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26691 *
CVE-2022-29458 (CVSS3: 7.1 HIGH): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29458 *
CVE-2022-30065 (CVSS3: 7.8 HIGH): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30065 *


