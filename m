Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.15239.1626617011497494151
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jul 2021 07:03:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=sTE5bVS+;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 70so12599266pgh.2
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Jul 2021 07:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=zC/NzU9s7xRnz7wcq9OQEGStyKOS9H4U5ETS2J4kefI=;
        b=sTE5bVS+MBQ3KX2hin0E/9n96WB9YLfQSF6EXmrwjVYT2KLP9uhUWFLUgRBo+mC23q
         eNvUgfmJEHpU/z6elsozAQVnbbyobnhSa/ii8qnuVsuq0wfizJzrRAz52BpkzHf3shmk
         3kfZrOJOZllunPCa/4tsMSThAEn8IIKqzsLIN+u8uknha5xWg6rA/DgxJ5YUhhhQbetd
         Pj2mkKAZ3cJ+ISbi1o0EHAQRnsriBrx2LuunZVgcCaxZp3cftRdsAcaWtSsxtVkwOFvC
         MncOaU+/KLEEw7H7MeDMvavgrugFNkYvGozZ/36UlIl+QZE3sffDFtpBu7Som4OGeUpm
         v51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=zC/NzU9s7xRnz7wcq9OQEGStyKOS9H4U5ETS2J4kefI=;
        b=NjyM9pYHA+XAn7i35XjbdKNWU16Spr0FXJbmey6xj7hHODu4sUfwRFTlUwd5OP96GK
         0+024HkOnKnAadS0JR+1uZ5Sx8Ryk4L3Kw4U1D5jJSgzTKSggs5LD0yKE0AdR94b245U
         2Qf4tAzhj4/MiiIeZrnM1aQjcjUa4hIN5h9pu+zqKYuBZltzX5ffW0dLUgm1YeNu7+3n
         s9YXCcRPQYcLIrXJWw0U0ARxcWz3HA7FVeBPFTEYW1xHFOrlA2qr1y2nnuR070RMNd4X
         4kAWfsnN9QQX37VvCL6O6DvwX+RTHwGSF0klpDn3iJ2TMT5U0O08vZ3NvbxDOnpp57EK
         aq5w==
X-Gm-Message-State: AOAM531/sZa2xe01vfEmF/ENuIjrqdFuYuwmN0HeMdC7djOrl3NIq4DD
	ILXu5Kk9N8OYmwtR0nMC4U2WHBwgggF5vAQh
X-Google-Smtp-Source: ABdhPJzd9vxoXt7EZnPG03XOHL/sI9JfF6cFmMUcQRY/PEngB+Pced2fKf17/LWMDZFTjQuQGYXkwQ==
X-Received: by 2002:aa7:8244:0:b029:2ec:968d:c1b4 with SMTP id e4-20020aa782440000b02902ec968dc1b4mr20909945pfn.32.1626617010274;
        Sun, 18 Jul 2021 07:03:30 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id j3sm16078178pfc.10.2021.07.18.07.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jul 2021 07:03:29 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 6CDDF960325; Sun, 18 Jul 2021 04:03:27 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 18 Jul 2021 04:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210718140327.6CDDF960325@nuc.router0800d9.com>
Date: Sun, 18 Jul 2021 04:03:27 -1000 (HST)

Branch: master

New this week: 1 CVEs
CVE-2021-36217: avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36217 *

Removed this week: 0 CVEs

Full list:  Found 10 unpatched CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2019-6293: flex:flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2020-27748: xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27748 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-33574: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33574 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-35331: tcl:tcl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35331 *
CVE-2021-36217: avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36217 *
