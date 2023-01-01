Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E27EDC4332F
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 13:33:14 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.10930.1672579989602688793
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 05:33:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=OwtHVGar;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id p4so27374711pjk.2
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 05:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gd4YdeSnze/zAkn/8bUYOJxxoS/SxFPT5HsQ9t+BOuY=;
        b=OwtHVGargKXyNIhNVWcpJti4d7O0txHWVbq+ngWznS5V1RGBJKGkvCPAdsERl8jSIA
         s9PUKnhGor9bNfMnhlHzzsrqb3JPWuXvnRB53XNTIpku6RIKdINEHTI+5npQ6f9qB4m2
         S0BPBLr41chRBznzjtx8xzEKhJaIiziwfGVq736qLVrozE5ZVrBGpdML/93VqiWYJ2hd
         UvhzkrxVZmw8AgojqlC3AZv7Cp1oVP83MAQcS3J4KZ4ep+Q8IFdqb9Vs9EWTOOtDT7lR
         nuURSZcCslMn7CrzHphv4z9oBeRnSb4Yw1HR+4krEmzUiMwOz7adrBBkx8JES+OAbHD1
         4nAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gd4YdeSnze/zAkn/8bUYOJxxoS/SxFPT5HsQ9t+BOuY=;
        b=bqZ8sxIuZcJcaVnTQFG0Cwm0BIMK4oM24IP1WYb/MRpiRDvEX9M9O4JGTH+IRJWPuB
         NWZI7cg6oIlH5G8mqn+Vj/X2tZJZfT1drcMY9PlTUeWkfLxt6XtVfpljiuNdz5q8U7a/
         CMHwYaufJEq2dwBcGwdCb9HkUw4h5XxUw9yd2qBT7mvvjvwvbkLx44Dj31Fw/oBT8G/S
         rT+rCirWwNowG6tsYCr0zOS05fhSVqzjmyfqAOvh6bLv8ciDhP3uAqyv3KzBTzaRknLR
         p4FfljNIdZE8kRb2TwiYEMWV7xxQBZhW7uowoOr4Wy0m5CXSpRZK8mttMVGMdmbbxtRI
         xNSg==
X-Gm-Message-State: AFqh2komEfMAa5KMpY/Ah67UbFEpX3M7whbjH1d5BHFiBuALSFQWa7B6
	q6oDa8l0Hutz5LZXgavTZhDewdMJpWAQZcIaP5c=
X-Google-Smtp-Source: AMrXdXvdBdSCWFNbUrtPLfn0XeNmDRP+NwWDAE1iRGwyva/ID1i6mZt1TWmNWd+PdFqTLe0mQIZB9g==
X-Received: by 2002:a17:902:6ac6:b0:192:cd8a:f358 with SMTP id i6-20020a1709026ac600b00192cd8af358mr314889plt.69.1672579988523;
        Sun, 01 Jan 2023 05:33:08 -0800 (PST)
Received: from nuc.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id j9-20020a170902758900b00189c9f7fac1sm18281687pll.62.2023.01.01.05.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 05:33:08 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 6B524960350; Sun,  1 Jan 2023 03:33:06 -1000 (HST)
Subject: OE-core CVE metrics for langdale on Sun 01 Jan 2023 03:30:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20230101133306.6B524960350@nuc.router0800d9.com>
Date: Sun,  1 Jan 2023 03:33:06 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 13:33:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175186

Branch: langdale

New this week: 2 CVEs
CVE-2022-3775 (CVSS3: 7.1 HIGH): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3775 *
CVE-2022-40897 (CVSS3: 7.5 HIGH): python3-setuptools:python3-setuptools-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40897 *

Removed this week: 0 CVEs

Full list:  Found 21 unpatched CVEs
CVE-2022-2601 (CVSS3: 8.6 HIGH): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2601 *
CVE-2022-37454 (CVSS3: 9.8 CRITICAL): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-37454 *
CVE-2022-3775 (CVSS3: 7.1 HIGH): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3775 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-39253 (CVSS3: 5.5 MEDIUM): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39253 *
CVE-2022-39260 (CVSS3: 8.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39260 *
CVE-2022-3996 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3996 *
CVE-2022-40303 (CVSS3: 7.5 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40303 *
CVE-2022-40304 (CVSS3: 7.8 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40304 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-40897 (CVSS3: 7.5 HIGH): python3-setuptools:python3-setuptools-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40897 *
CVE-2022-4144 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4144 *
CVE-2022-41717 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41717 *
CVE-2022-41720 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41720 *
CVE-2022-42010 (CVSS3: 6.5 MEDIUM): dbus:dbus-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42010 *
CVE-2022-42011 (CVSS3: 6.5 MEDIUM): dbus:dbus-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42011 *
CVE-2022-42012 (CVSS3: 6.5 MEDIUM): dbus:dbus-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42012 *
CVE-2022-42919 (CVSS3: 7.8 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42919 *
CVE-2022-45061 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-45061 *
CVE-2022-4603 (CVSS3: 8.8 HIGH): ppp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4603 *
CVE-2022-46908 (CVSS3: 7.3 HIGH): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46908 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

