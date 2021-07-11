Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web08.7320.1626012178429018647
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jul 2021 07:02:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=X6jilZgn;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id s18so15285752pgg.8
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Jul 2021 07:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=VX1Vn86lB/vf5XNrC8X/N86tGzCdZH8OgJFcRS/WaNY=;
        b=X6jilZgnc238zqK2DWzY8oQ00OmxL0Rjh02OgmL5jbrsWAule5H/T/4IQSleNSlnPJ
         nyTOYjLSHvVElVEmyJz9odKU68YLSESvQkQBQzXrqY1C+j9c8VDWgZERSNxPbwgnYnEQ
         f+E7PKq6rseU6BxbVfnDb7I0+PrYECcgqT9M0fdqAj7tIMjVKSyl4GT9Bb5a1HSYtTwN
         shgJcnLrb3vG7OHUOrOa4bBzuNgSxLVOK2VspjMUSgAYE4XB7jtSode4UqthOf8aruxa
         B0Jc/Yins06GAMz7bAuNOI2el9VQCBSoyxoaeYQSL0ZWXNqDhgixRC/cR4OSsX1UsWUB
         H7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=VX1Vn86lB/vf5XNrC8X/N86tGzCdZH8OgJFcRS/WaNY=;
        b=I6Rzjpl2f5PTenRlADYGOUuQmdmIrCO+ut6eCC19biyGocX9zz1R/Yk3C3elYrNEhJ
         ysY2AVykL8sAX3GN6xhFZ2h2vHXEfMGvVi+zzjSyUHpb8iw5qlvxGWC5uLBhgVWbd7qb
         1I2Tvg99bPt/E0SWhUsW28ImgNqA89r77pA4uHfntD3vkeLZ9YJbKxt3aiC4wBKe25tk
         2SIUDemL+aAoZ4eWTQ7fG2yoG2ilbyJU4+sYXVIadmw89nmBMNCKYtRG5TbhgWUDVN8z
         YS7ZK6JmL+8o2Uh7APaMkK2Nl8e1/6Q6lUI/tp/cDc6E+5rODB5oXo0L+usDlgT/4QNN
         ePVA==
X-Gm-Message-State: AOAM5301PcCukVcF2KEPjqUDSZdkKfGI3L33/DUxlDMRQIC+sn1IEGEW
	5jmQkoS/ggkbudne/SHITGa8BGt05guN72y4
X-Google-Smtp-Source: ABdhPJz9iWt4zH4/bgnrQjd8680U87qC3NF4EmGKht6+bvLADZuDTVzOb6AU5G7MkUqSUGVUH271eg==
X-Received: by 2002:a05:6a00:1390:b029:32a:e2a2:74de with SMTP id t16-20020a056a001390b029032ae2a274demr4073613pfg.6.1626012177470;
        Sun, 11 Jul 2021 07:02:57 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id a18sm1039208pfi.6.2021.07.11.07.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 07:02:57 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 83E35960365; Sun, 11 Jul 2021 04:02:54 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 11 Jul 2021 04:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210711140254.83E35960365@nuc.router0800d9.com>
Date: Sun, 11 Jul 2021 04:02:54 -1000 (HST)

Branch: master

New this week: 0 CVEs

Removed this week: 0 CVEs

Full list:  Found 9 unpatched CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2019-6293: flex:flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2020-27748: xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27748 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-33574: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33574 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-35331: tcl:tcl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35331 *
