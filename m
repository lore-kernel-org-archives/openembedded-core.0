Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D335FC433FE
	for <webhook@archiver.kernel.org>; Sun,  2 Oct 2022 14:02:03 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.7649.1664719315790156986
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Oct 2022 07:01:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=dHKdlWwg;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id q9so7757194pgq.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Oct 2022 07:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date;
        bh=p33xZiIST0uqNjaPMKLiyX/0HUFndEcVF4lw4rruXb8=;
        b=dHKdlWwgTz1CGCGyDJGQVJOkS0lWBvfel9RhHhfD9SwcNHe9etI9leWvhAYDC9cstp
         PEDSBJ8BUYv1Gv7afC9tPKb1ImPZmJ6Hrg2IJsyj74PaKXKL+QVkwomwAu3Ie6g+9ZLz
         Mfc/EKKaCx+i0aYysGU8oxEx8mYxFMLe6iif4lNPpwl8vfcSb1kEVrT71JmAHWb9EohZ
         FKO/LZc9stiMzO41owoErJX4e8DKVfJpfosCPHaUH0ogrNYtCgBcRbLiedRWyB7QROEp
         X18CGl3Tr+nl6IO5E+78FQ2G9zAFoimMEgt+iL8/oclsUf03Lf2aPLFZdG7FHJZPhbp5
         as/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date;
        bh=p33xZiIST0uqNjaPMKLiyX/0HUFndEcVF4lw4rruXb8=;
        b=iVRJfRoW4TQ7znVeXCR3TBweH7lg3tIC7PWsQi++7sqhJKTHt9dbUDhpknTDvjs0YW
         RctSAsw1shSz5Xng7hsaFKfB11j1TyWfoOWltipSpdKbMVzlZeySk8Y8Z/oJ4Lp0Hk9E
         R4aOWknUYP1MOxv27OeSrXjbX3ZCQ+vsLxV6eSClR9hwjVgJfjqyT3qpVWvHQ4VG5Fbm
         8PCEapoxSsgkNziAFFPdWDnsxutpurO3sqGThWoOI5bV0orc6K8efrSAui21tsxkAZTQ
         3/7+yR/gTW1p2vB+j/tzhZsfXSOcIM38awYmyTBWONrMMT8Zmd1kog6eSOPcT8Dv1jAG
         EOoQ==
X-Gm-Message-State: ACrzQf2fBJQqW2sNBHW/4jrIrsshDuHP9dkZTMO5yUy62V8eSW2mAHoH
	I+p5su8FgDF98+qRYTZMBiwhHg3VpejJiFeu
X-Google-Smtp-Source: 
 AMsMyM6/u7ojL0+YHMjoTRK0tAsyzkoG8ZISQumM+6IrNH85aHivfJKzH2CQ1cJc0bLzq6KpcbodHw==
X-Received: by 2002:aa7:9710:0:b0:561:7692:fa11 with SMTP id
 a16-20020aa79710000000b005617692fa11mr19970pfg.39.1664719314612;
        Sun, 02 Oct 2022 07:01:54 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 q7-20020a17090a304700b00205da989de3sm1568074pjl.17.2022.10.02.07.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Oct 2022 07:01:54 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 34E3B962332; Sun,  2 Oct 2022 04:01:52 -1000 (HST)
Subject: OE-core CVE metrics for langdale on Sun 02 Oct 2022 04:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20221002140152.34E3B962332@nuc.router0800d9.com>
Date: Sun,  2 Oct 2022 04:01:52 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Oct 2022 14:02:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171354

Branch: langdale

New this week: 1 CVEs
CVE-2022-3352 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3352 *

Removed this week: 0 CVEs

Full list:  Found 1 unpatched CVEs
CVE-2022-3352 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3352 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

