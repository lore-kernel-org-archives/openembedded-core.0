Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9651C43334
	for <webhook@archiver.kernel.org>; Sun, 12 Jun 2022 12:02:38 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.14865.1655035348208970997
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jun 2022 05:02:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=lXOAhiNo;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id n18so2883629plg.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jun 2022 05:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=uATyHstcNuGQG0X2yPaK48j2en0V27D/WL5JmEhqBPY=;
        b=lXOAhiNovXmauVmaLcKTite2DSYEpi1ey8Cf/ZDESlidTBGboOBpdQA/xSUjDzAYqf
         5ji2QpQlCFFhcjEgWfikKzxBS7mxp4hlQh2gNtWuD5/7xu5D2PNyf+Kj5lMgN3i0B+rY
         cJdEq0nrdXfhMcAQtIsXIJ5vxyWq6CSLdnmE8ouCwL88tbBC+tjmXHw+hF8fSKqE0I8f
         YxiKMRyyOhhqISReTAqXQJ4omJ//ZkvnzHqS0Mju9Fvu/e36T88dSwiqT09/HOCzWmK/
         DwNH8od9kS0Jp75mcI5aipzvXGfj7cNhU5CvZHLgtfHgOIAe9sDXLA1abRV32QfDwHc+
         MnWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=uATyHstcNuGQG0X2yPaK48j2en0V27D/WL5JmEhqBPY=;
        b=tsRClKKrIOTLwYPxCBcwPbJNUgNfDFnRXWz6+2kj6jZUw6I2C0TqpkzOGCuMnEPO9K
         kjhWTV4CrYBTaInUF/dm09Zl+jDqWvANO3D1rMfiNdqHZMHDpD+4+hIWlf0yeRs6th2x
         Csh2wNVzfvp31938IcQcPm99nLm6NZzkmSI0xjptaDhPM8D+s7ipCUSpgzuiv/Sbx8mp
         A0KHP9U2R7YXbiD2QPzZ15/iHE3d8D2UbRhmw5VOqnqAE/xQ/uY8MGdLMzP+Lo0hn8HG
         Yi9QSPvGgb5it+QHKsuxCv/8yD6SNwsxrGxQk+l5/a9gtGdGOdtBDdiYmfn0h6cwYJuJ
         L6Ow==
X-Gm-Message-State: AOAM530nJOWoxpuSsSIgIbypvNy8nuBwwYMGcDUapawoqrAN9bNQ+rAK
	Xh5P6fVyAoQDABT0Auzm/lXv+7WokklQpOLe
X-Google-Smtp-Source: 
 ABdhPJzOd0qZIXkD2+X8qDQ0c8UwiVGDIk0fiSC9c6VCUfvJXeahhl9tJ/af9H1F/uW3QvSPBMZNIg==
X-Received: by 2002:a17:902:cec2:b0:163:e44a:c678 with SMTP id
 d2-20020a170902cec200b00163e44ac678mr52996129plg.137.1655035346943;
        Sun, 12 Jun 2022 05:02:26 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 2-20020a620602000000b0051844f3f637sm3148033pfg.40.2022.06.12.05.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jun 2022 05:02:26 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 4629B96054A; Sun, 12 Jun 2022 02:02:24 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 12 Jun 2022 02:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220612120224.4629B96054A@nuc.router0800d9.com>
Date: Sun, 12 Jun 2022 02:02:24 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jun 2022 12:02:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166822

Branch: master

New this week: 3 CVEs
CVE-2022-1927 (CVSS3: 9.8 CRITICAL): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1927 *
CVE-2022-1942 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1942 *
CVE-2022-26691 (CVSS3: 6.7 MEDIUM): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26691 *

Removed this week: 0 CVEs

Full list:  Found 10 unpatched CVEs
CVE-2019-12067 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974 (CVSS3: 3.3 LOW): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2022-0529 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-1927 (CVSS3: 9.8 CRITICAL): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1927 *
CVE-2022-1942 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1942 *
CVE-2022-26691 (CVSS3: 6.7 MEDIUM): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26691 *
CVE-2022-29458 (CVSS3: 7.1 HIGH): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29458 *
CVE-2022-30065 (CVSS3: 7.8 HIGH): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30065 *


