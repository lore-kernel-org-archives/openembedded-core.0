Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABC10C64ED6
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 13:33:05 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.65241.1677418384928318773
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Feb 2023 05:33:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=c9KXot/H;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id l15so4136665pls.1
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 05:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CywqQPPhfZokBTntzf4NDarhU4ExCoi1Ifb+7vE2GgI=;
        b=c9KXot/HESZGU+Uw390nhOtS7txaX3xx5IlaHk+dIMuUz38YNswXz1eNrgMSRJ6Urd
         8HkXDdYQ9JBObtCEx9rWZdj0zIEkNGqJfQADqFK61lQlV8zPB5kgDqpu1NJ7QZgOObNw
         B/o6dNtdl5PfN5ZbC4Jh3erpBnegHwFQCVdtwIRAGIM4yqHKrpYS+NYuZRR94uMfBGee
         0tFWt9bWKO8Fr/ISll8lnNwtZo6x0eatuycfbMhKMKvK73zqeSBiy1TKJz4CgRTILoM9
         UOggiI8AdnxZoHoxgn5bHZKSUR4fCTQ+OL3RHqjg9Dw2th+MCNJ/nmdJY78osH9HJ52Z
         Se5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CywqQPPhfZokBTntzf4NDarhU4ExCoi1Ifb+7vE2GgI=;
        b=XS2seBg4w1eyFwMKezjqb6cilNzyxt4AErA/7IXGvg3kLjGc4uV+EC+/CtZfOY9/Ex
         GXUAE+OnTd6qsgNnqFqQyror+VJyCj6ZIUNsrj+hHBxLlVnG6ZsW5Bg232/ilKxno88p
         zsu7XCYyJtrDADi2aj9ACjENnxInseuXJPgUQIWF8RUiKXtqULRgA2UzTtYU16+t/XDp
         yKUio7Nrs0IzVKf7swbZFdRdghPND1x3/gSUo482tiPbHv7qRNrOmoqlVcMJj6yVsoq5
         /KWvqhFfdMkEpKM6L+7BSbsdKv5nlcr7NEAhjit1kiA0knDjWRAnlTtW/Rbgj4NeEfha
         NZUw==
X-Gm-Message-State: AO0yUKUKmwmJkRVUm8QH+DZZPlAppaVy0pTUu+WpsM7rSV1pk+S4eFFq
	XjEb34icYKDV8fAA73Lcu4je3Pv1w6xs4pbGPQI=
X-Google-Smtp-Source: AK7set8ySSj+zpx6Jkt16N1L+jM5M9cSijbEoSVdsT9nqeqC+yuhPKIY/p+jO8AgCXaJ+0c8kQUTdQ==
X-Received: by 2002:a17:902:d506:b0:199:4d25:6a4d with SMTP id b6-20020a170902d50600b001994d256a4dmr5580481plg.10.1677418383708;
        Sun, 26 Feb 2023 05:33:03 -0800 (PST)
Received: from nuc.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id jn9-20020a170903050900b0019cc3d0e1basm2691455plb.112.2023.02.26.05.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 05:33:03 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 196BE9632FC; Sun, 26 Feb 2023 03:33:02 -1000 (HST)
Subject: OE-core CVE metrics for langdale on Sun 26 Feb 2023 03:30:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 26 Feb 2023 03:33:02 -1000
Message-Id: <20230226133302.196BE9632FC@nuc.router0800d9.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 13:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177736

Branch: langdale

New this week: 2 CVEs
CVE-2022-4304 (CVSS3: 5.9 MEDIUM): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4304 *
CVE-2023-22743 (CVSS3: 7.3 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-22743 *

Removed this week: 5 CVEs
CVE-2022-3094 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3094 *
CVE-2022-3736 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3736 *
CVE-2022-3924 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3924 *
CVE-2022-48303 (CVSS3: 7.8 HIGH): tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48303 *
CVE-2023-22742 (CVSS3: 5.9 MEDIUM): libgit2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-22742 *

Full list:  Found 40 unpatched CVEs
CVE-2020-10735 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10735 *
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2022-37454 (CVSS3: 9.8 CRITICAL): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-37454 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-40303 (CVSS3: 7.5 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40303 *
CVE-2022-40304 (CVSS3: 7.8 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40304 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-40897 (CVSS3: 5.9 MEDIUM): python3-setuptools:python3-setuptools-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40897 *
CVE-2022-4144 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4144 *
CVE-2022-42919 (CVSS3: 7.8 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42919 *
CVE-2022-4304 (CVSS3: 5.9 MEDIUM): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4304 *
CVE-2022-4450 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4450 *
CVE-2022-44617 (CVSS3: 7.5 HIGH): libxpm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-44617 *
CVE-2022-45061 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-45061 *
CVE-2022-46285 (CVSS3: 7.5 HIGH): libxpm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46285 *
CVE-2022-46663 (CVSS3: 7.5 HIGH): less https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46663 *
CVE-2022-46908 (CVSS3: 7.3 HIGH): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46908 *
CVE-2022-4743 (CVSS3: 7.5 HIGH): libsdl2:libsdl2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4743 *
CVE-2022-48281 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48281 *
CVE-2022-4883 (CVSS3: 8.8 HIGH): libxpm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4883 *
CVE-2023-0215 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0215 *
CVE-2023-0216 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0216 *
CVE-2023-0217 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0217 *
CVE-2023-0286 (CVSS3: 7.4 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0286 *
CVE-2023-0401 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0401 *
CVE-2023-0433 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0433 *
CVE-2023-0512 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0512 *
CVE-2023-0795 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0795 *
CVE-2023-0796 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0796 *
CVE-2023-0797 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0797 *
CVE-2023-0798 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0798 *
CVE-2023-0799 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0799 *
CVE-2023-0800 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0800 *
CVE-2023-0801 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0801 *
CVE-2023-0802 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0802 *
CVE-2023-0803 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0803 *
CVE-2023-0804 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0804 *
CVE-2023-22743 (CVSS3: 7.3 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-22743 *
CVE-2023-22795 (CVSS3: 7.5 HIGH): ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-22795 *
CVE-2023-25193 (CVSS3: 7.5 HIGH): harfbuzz:harfbuzz-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25193 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

