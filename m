Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E738C433F5
	for <webhook@archiver.kernel.org>; Sun,  2 Oct 2022 12:03:33 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.6903.1664712205262555485
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Oct 2022 05:03:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=i8TEUsHH;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id
 v10-20020a17090a634a00b00205e48cf845so12997019pjs.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Oct 2022 05:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date;
        bh=Rsan3mkd5lGJVDnnbCIJI18jTwLTsP0moOlV6WR+VIE=;
        b=i8TEUsHHdOSZYre13FcuzlT2rUbi3MniJzVoKXShAAiIL8iv0B4fq6GC6SZhmwKDFo
         nm+aXbjjD/4Q8gx8Nj7GuryYppMB1rLpOdCmYkgRJ786lFc2Sb83+EcUw3GM4dxKffpe
         ShhSN5UZ5ZF+/GQySIIAnWE9goWpgRdYghGBZPWMQWb9SVQ5P14XfelnWPJBUEAc5NJ8
         jP4HjKyCWWrPsaGKv9XVkbJjHqtcII7UAafRoWN5gZRVbc3Xc8ilcJJmKrT+gND5Grg7
         TbsrqTWh1n+ZGkrg4yTxjDjIYsVWwcdWo/rfRUTrszZZUwmDqGyEJWLLRLpdvYZeccH/
         Zpog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Rsan3mkd5lGJVDnnbCIJI18jTwLTsP0moOlV6WR+VIE=;
        b=Lssd1+f7RqBOSZErs2rsrLLxMpKH5yv8Uy26F9dfUwEkU7SsUayi0sMA4yfG7heiaN
         ndBQf3ObYNqGUEFY2I4+xWkPD92z49GLbbb4DD2/XX+BC0PFU44d2sSsbqGdQifRxU3t
         Xtn1RI8G/g6IiGyNpig+PfpETtTraljcs1M/dCwUsnFLAY7BB4U3CWUU2k5ov+FfSQTb
         gdJlzpD/wuUVW1I6833XX2D8OZuH7QfS1mD4bOUMyIYA/HSPive3n4vnQCh2IQtfA/Zm
         7o1hK6+bJ+7zvAw71mcv69qqMzqqCZoKZOM3JC5BNpXs19Psd1sy871IY+/MUjEPWiul
         wIdQ==
X-Gm-Message-State: ACrzQf3wu2aVvtqIRRWDEYvfhR1HBw3/XiCFsmvd1ld8USpJ20FzZxxt
	SzMjhsfIVnsS2PEm/wQy7YpPhs0P8tAuhpSn
X-Google-Smtp-Source: 
 AMsMyM42gCUVI42bTHIyLSPsVjGgCk//pNQa9CiiVmk60ou6aJY8ctYdTgUpnMsjQbCGDOjYldafsg==
X-Received: by 2002:a17:90a:8906:b0:202:d763:72ab with SMTP id
 u6-20020a17090a890600b00202d76372abmr7144715pjn.56.1664712203939;
        Sun, 02 Oct 2022 05:03:23 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 v126-20020a622f84000000b00550724f8ea0sm5271519pfv.128.2022.10.02.05.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Oct 2022 05:03:23 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 5232A962332; Sun,  2 Oct 2022 02:03:21 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 02 Oct 2022 02:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20221002120321.5232A962332@nuc.router0800d9.com>
Date: Sun,  2 Oct 2022 02:03:21 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Oct 2022 12:03:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171351

Branch: master

New this week: 1 CVEs
CVE-2022-3352 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3352 *

Removed this week: 4 CVEs
CVE-2022-2795 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2795 *
CVE-2022-2881 (CVSS3: 8.2 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2881 *
CVE-2022-2906 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2906 *
CVE-2022-3080 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3080 *

Full list:  Found 1 unpatched CVEs
CVE-2022-3352 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3352 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

