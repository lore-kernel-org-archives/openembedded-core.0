Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C52AC6FD1F
	for <webhook@archiver.kernel.org>; Sun, 19 Mar 2023 12:03:01 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.15343.1679227374075015105
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Mar 2023 05:02:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=W+GrZvuj;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id o6-20020a17090a9f8600b0023f32869993so9760131pjp.1
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Mar 2023 05:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679227373;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gp74yHh9U15+UINNvBqwN7vqQW+VOB024iYc2RC96Ug=;
        b=W+GrZvujxmOkDmKA+EHgOiX+aby1LeVgjRgpQd1x0cp/ncekJxaeRrjd0zwUGEDJYw
         5jEoeaP5Qlrfl3HUnoyRy5M7vuB9ZQlNDuB94Trm1AaVRdh5l9Pq+fI6xMyQp3+M7r2a
         lSbSJHYi5v9FYmWcJAfNMhARvHNIKL+nO8eC0wkV+EJFRiDX8lxC+QXNphtLTQs25gCJ
         4qZluGJ9WNTXe+AmW8Sar6GTXgRew9w7w6aPQbHk73BXniLqaIMk/F+n22wxVMxijgn1
         YvoOyrvoJW8ucJ2IbsQVr8d+qfuJ8LKqzgow/pwn+hkMxs6+uz8gvQ9RV/uK2PwPHAGw
         BWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679227373;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gp74yHh9U15+UINNvBqwN7vqQW+VOB024iYc2RC96Ug=;
        b=AF1pVqQgVcNedD8/WrBspebgz1xiE1i7YP6uhNcpllEsW3YBvLXETKDSqnXtb43cqc
         /wlgYti3rb/nTWAix9wYPWa1kdtffcV5uUkjrI+UkbP/krxBoE9Rte5he7F1AeuM2wJ9
         3H9bKoi448HJAfX7OsWCmvZQTa76swwNAEy5XgmTlmBDkxThUYkS40XWSO0cg+vh/AWj
         0sVTvJDNpc909Jfsv5vma7RYVKl64V434ImQ1Gf8XJ3+aWwty3fbYEZS4dXHCYRKqUjP
         DW4x6cNgD1YZujRSDXC7GDCDpEmLuAQEZ/oE/38YnlKdfq6PGZ49U4cjhuuYYYNIt6cE
         X6tA==
X-Gm-Message-State: AO0yUKXvzqJfy25fpQL3oyebnQxlSI11JS2zoIWb6ogIDSg7dS282gYX
	4eAd8VtcauEhgn0uw6o7YwX+uLU2y7XgTbqZz8Q=
X-Google-Smtp-Source: AK7set+TZNl/BXXpb6TT3pQgtla26vZBKXWC2JG/ZV5i6JpVO9PweGKYDKov13hmGIFWpBbqzgdadw==
X-Received: by 2002:a17:903:2350:b0:19f:3797:d8de with SMTP id c16-20020a170903235000b0019f3797d8demr17235551plh.9.1679227372863;
        Sun, 19 Mar 2023 05:02:52 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id o11-20020a170902bccb00b0019adbef6a63sm4619151pls.235.2023.03.19.05.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 05:02:52 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 888E6960474; Sun, 19 Mar 2023 02:02:49 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 19 Mar 2023 02:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 19 Mar 2023 02:02:49 -1000
Message-Id: <20230319120249.888E6960474@nuc.router0800d9.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Mar 2023 12:03:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178793

Branch: master

New this week: 2 CVEs
CVE-2023-0330 (CVSS3: 9.8 CRITICAL): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0330 *
CVE-2023-24532 (CVSS3: 5.3 MEDIUM): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24532 *

Removed this week: 3 CVEs
CVE-2023-1127 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1127 *
CVE-2023-1170 (CVSS3: 6.6 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1170 *
CVE-2023-1175 (CVSS3: 6.6 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1175 *

Full list:  Found 6 unpatched CVEs
CVE-2005-1796 (CVSS3: N/A): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2005-1796 *
CVE-2022-3219 (CVSS3: 5.5 MEDIUM): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46456 *
CVE-2023-0330 (CVSS3: 9.8 CRITICAL): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0330 *
CVE-2023-24532 (CVSS3: 5.3 MEDIUM): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24532 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

