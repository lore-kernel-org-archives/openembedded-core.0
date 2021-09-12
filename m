Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web10.16763.1631458892714744609
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Sep 2021 08:01:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=vo2bpszi;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.174, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f174.google.com with SMTP id c79so10618293oib.11
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Sep 2021 08:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=CodvuULR1bWT0tQGB+CXcRiDSLlhsuA1uZ7REX6UxOw=;
        b=vo2bpsziqwqsv5R0diKcSt7XasQdKcgKIw8hpoNZgrwEDAkgMbjkfTbFuwbNfYGHfO
         Q5QJahn8ISUVMXAjITk/tYaJ8NY59OWsLNmBUmc+jewuGuM1wHk43zip+5LyYcpgIXsO
         D+MVXToAN1m4HMxgAWNep86sNC9fl3QsgPBcTWyRhg6M1cnFrKrN78EIpeffwoscY03Y
         zPgdNRRmEfUwnXNkP4BDumybScBe7KF0MGLreYKcamc5Od2YePjqCHGZh5whwQViPTWr
         FDoCqbBpZRH3HaFRmkJmTfitzv5v5hJMnBDWPXYxkkX1TVPcKTNAnNRLSfLc+KxyTPwJ
         Plsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=CodvuULR1bWT0tQGB+CXcRiDSLlhsuA1uZ7REX6UxOw=;
        b=3iTk8ZP2/V760MvpY1DqudfG9/ByuGKMjxXDOd5qT7uOoqfaIubMri9fjZUureCUAm
         UaR+pzCTkAppO+2JsGEz+KwpbWHeHECcTRtlHq+lYweFANDo6vdhGHj19ikzTFSFYrUO
         lRv6e6Zi4dmv/KDRXpccD4xwD20l8xM10p42QV2567VsKAG0T2XfZAVZ71C+tilHAv0s
         B9ltO8SeAQ4L0fcFgjpRwpBBiNywPxRhgAvOCZNOldIvayu/1w7SaGAwsUM+F3znwFpC
         tlWVMtGh4lgyn7dzymhOiKMHRpqBuOUT/hFDikZQ/r31TGDB3hgNEBUpHlbvKehiuEuK
         VtXA==
X-Gm-Message-State: AOAM530OHwYk9Wfx3Cm/j+IFbZNN+YO/NqBlLoexKDC44D0ekqiYrVdD
	Y3UnL2DXL0TEv8iAjGYimMjPW4W071mUBAzK
X-Google-Smtp-Source: ABdhPJyjihhJ6FCK+639sS1RXvjOvevfKV5EiZqw4DXw+OPy56mPf+tHE7t51ubiJ6feQ1ySpLgg+g==
X-Received: by 2002:aca:918:: with SMTP id 24mr4817172oij.58.1631458891391;
        Sun, 12 Sep 2021 08:01:31 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id l4sm1168142oth.4.2021.09.12.08.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Sep 2021 08:01:30 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 8237296032A; Sun, 12 Sep 2021 05:01:21 -1000 (HST)
Subject: OE-core CVE metrics for hardknott on Sun 12 Sep 2021 05:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210912150121.8237296032A@nuc.router0800d9.com>
Date: Sun, 12 Sep 2021 05:01:21 -1000 (HST)

Branch: hardknott

New this week: 0 CVEs

Removed this week: 2 CVEs
CVE-2020-27748: xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27748 *
CVE-2021-38185: cpio https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38185 *

Full list:  Found 27 unpatched CVEs
CVE-2013-0340: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0340 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2019-6293: flex:flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2019-6470: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6470 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2020-29623: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29623 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-0129: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-0129 *
CVE-2021-1765: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1765 *
CVE-2021-1789: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1789 *
CVE-2021-1799: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1799 *
CVE-2021-1801: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1801 *
CVE-2021-1870: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1870 *
CVE-2021-20196: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20196 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-22922: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22922 *
CVE-2021-22923: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22923 *
CVE-2021-29923: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-29923 *
CVE-2021-31810: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31810 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-32066: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-32066 *
CVE-2021-3445: libdnf https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3445 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-35331: tcl:tcl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35331 *
CVE-2021-3682: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3682 *
CVE-2021-36976: libarchive https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
