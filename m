Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web12.11453.1629036221813599489
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Aug 2021 07:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=IG8Kbz4c;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.42, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f42.google.com with SMTP id r16-20020a0568304190b02904f26cead745so17904499otu.10
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Aug 2021 07:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=o2/sXtFu7kRRjbDDg2gvlOqx7rFqskjst3BuGxkQSsQ=;
        b=IG8Kbz4c+V4AkWAgbkryrWyeua88hSxaD2Y5oZG+ZQEEm0PJkq08+gcSb5F4dEmhYu
         bg44IzYxMY1UvgjmySm4oqjsgSlcpYKvJ/GlXvtmMFp8o8B5vUdrEFRCvyM80t7wWO5J
         qK8MzrFSdaXYs+jWhtq4Z6AuErY9sAw/V2/Cd6SyxV2zpvGlShCW8UTDRD6Kh8fvfPUi
         zBuXjTINg3IGcSmvbSl0HEBauosCGqnHS7/PeCEpPAj9xfiFQuhInHLRr8VMeLShCqkE
         nCjNlzqJO2cXFr0uvLPiTw2WcRAtFO4tK1Qg/wfCVvgI/upwdzm/M4KrQXYPw7rWbHDW
         j+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=o2/sXtFu7kRRjbDDg2gvlOqx7rFqskjst3BuGxkQSsQ=;
        b=Omo4FQhhU85v/Un5o2A4AW6Qnl5Gr51EZCHVBM8BTQu2POjMg0xTrczFvRTXKK9NGG
         qve8LUGtIl+ny7uqJnJkqxZvhdkcBmsd9ZVG1xQcbG5oz4GX39bO6rHASdp5eqFXRhur
         lZDIO+SEx5OLFbtmWoAaQGevqZftvFW/vr11Z1hlNgZ5Vjz6NIkgh54jli3uBeGrwfkt
         18BGRJser2a7aeWYFgmdub4IGdsSl4ZwkX6eytOGOKA13HP5GlKlC89Qciizyp5AHNFf
         Qr/SpCGucql6lCpkBAeDrj9amfzP/ep44jdqJ46IhSygFk+YA3v/xdAG7/6g5RQtmFl+
         u0uQ==
X-Gm-Message-State: AOAM5321oASbRUIm1u6kteiUznXCQvz3TlZx/XdXD22x1DNq1lT6fdZT
	6lfpjHOfBKNj2B1LCVlR9yI6+p8HrZa/khc1
X-Google-Smtp-Source: ABdhPJwDHuJCE04qTZa9Jf8gKaqLRvVKbpK7/wvcYtrgT/noi+RzE7u47Q3PPwzJLjP5KPtB0j+5ZQ==
X-Received: by 2002:a9d:70c9:: with SMTP id w9mr9795336otj.104.1629036220447;
        Sun, 15 Aug 2021 07:03:40 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id m15sm1680474otj.47.2021.08.15.07.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 07:03:39 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 317FC960346; Sun, 15 Aug 2021 04:03:30 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 15 Aug 2021 04:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210815140330.317FC960346@nuc.router0800d9.com>
Date: Sun, 15 Aug 2021 04:03:30 -1000 (HST)

Branch: master

New this week: 3 CVEs
CVE-2021-32803: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-32803 *
CVE-2021-32804: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-32804 *
CVE-2021-3682: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3682 *

Removed this week: 1 CVEs
CVE-2021-35942: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35942 *

Full list:  Found 13 unpatched CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2019-6293: flex:flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2020-27748: xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27748 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-32803: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-32803 *
CVE-2021-32804: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-32804 *
CVE-2021-34558: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-34558 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-35331: tcl:tcl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35331 *
CVE-2021-3682: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3682 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
