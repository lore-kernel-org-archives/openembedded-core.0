Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.5405.1624802625850502187
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 07:03:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=lyhUvH7J;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id gd24-20020a17090b0fd8b02901702bcb0d90so4290172pjb.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 07:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=ZOlNFzl9iBquqZXfbzsXj8mHzd99FXbb2Zvn+bHl198=;
        b=lyhUvH7JtDZ/+WhOIUsNX5GEyBtYfrHXBkQI23OrylGWQczyz5AV9wLw+DC6NlcrwV
         6YOl+UMGXl3Qp5XEBNrdrj3PS44zUQ9gZWkcxYZDCztzHM9S7mhtZeBcYc2SceTh3llz
         xStOT7QZ6+zJDbf2cxHG8Oa1tvFWSwiEUvPmhSNxasBZ2uEJHDb83xwow9oDK3GTbUs4
         +Rxpo76rSjJusTohfsiAgSRcfax+rpVmTabesv/R5lv8z7oFit1AWx7usDBynlfmMaC9
         1i4znsVK6rMWwOcvOeVTTeH2DnzeOEF0AOlE1RYbu1dMjvZMQ7DVkU/k+V+XVBsD0h9O
         7kaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=ZOlNFzl9iBquqZXfbzsXj8mHzd99FXbb2Zvn+bHl198=;
        b=ESGLJo7AjLslcPDTHVQLSvddfQ0yEh1ssyzkQQGjLqcii2erFf5f6P1BGGYTNOml68
         6bbb+9RYL+AkuAIok8IgRrz2curCnuI2X9JyaPNYlP7AYmrqJ3a8QtfZ5XJcb/aV+dVN
         +058eYfTQZfK9qUn4P7mJvS80/wBin1RpplNy3ru5wP4Eyr0l93i+3rJxP8vW5ywqGe6
         3ak6TEiF3hSLvrSYr0W1AEyNJapugumUQEGdn0m75m0DpwWHqHVtKD8ULVNnxV3hsYEh
         xzD3/gZdKQupLEQimq7Gg3yVIDaCIMoT4M7lTXL8T3AfvOhbw/mW5ipmQSc66bKU6IoZ
         qxXQ==
X-Gm-Message-State: AOAM533yeP4ETSTU7m3HrBWpgedaQaY4dmE6vwBlxRMICyDZ/9zIvNHF
	sLLx4grecrlqBlN5d5z0bPzRkAYeoHyosnz+bkI=
X-Google-Smtp-Source: ABdhPJym68sq9LUs6uChAInL9gOK/Yufbwj54VPO3U4EvDwGgiivXafuvqTCt37SpZVQZu5GbhILYA==
X-Received: by 2002:a17:903:2283:b029:128:4c7c:8676 with SMTP id b3-20020a1709032283b02901284c7c8676mr12445764plh.60.1624802624600;
        Sun, 27 Jun 2021 07:03:44 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id k13sm11060034pfu.57.2021.06.27.07.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 07:03:44 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 586A7960334; Sun, 27 Jun 2021 04:03:34 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 27 Jun 2021 04:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210627140334.586A7960334@nuc.router0800d9.com>
Date: Sun, 27 Jun 2021 04:03:34 -1000 (HST)

Branch: master

New this week: 0 CVEs

Removed this week: 1 CVEs
CVE-2021-3527: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3527 *

Full list:  Found 9 unpatched CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2019-6293: flex:flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2020-27748: xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27748 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-33574: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33574 *
CVE-2021-3421: rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3421 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
