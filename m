Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5473C25B06
	for <webhook@archiver.kernel.org>; Sun, 14 Aug 2022 13:02:34 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.4740.1660482149942001572
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 06:02:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=QnvDWjwF;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id
 h21-20020a17090aa89500b001f31a61b91dso12299368pjq.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 06:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc;
        bh=R0hxmPmYo2zIwir4o0WjKRGuOHoddJO0rOVZWf2Sn1M=;
        b=QnvDWjwFwTR96XRDa00bx+eggzHHmQZOqtGzE9gDJWjb1zwFvCr6GqrC54Fe0i9cej
         iXzGpAju7FxqMCwTVHvvjgEVS6RJwuX+Y+Iar+cgLionOdzEV56AUu9VMJ2Zn5RmX7mW
         tzTswPdU4nWz7m6ISM5bfvfHGXdCWCPmfXb7jiMNPdzinDQwsqvKe6bn8/xQP+AkzEog
         OSdF4+kFX6i9v2Ink+fHKeuiA1wuxwkA+POtAgCFrzYQmtERFMJDOIRxRAOREbXRXOSD
         60LlvnyjcKrZHEbUv7KcaxhDmk/ei49Jho49f6gr7q4jvOdPeSfAGeRNJ2UMDCAToGTy
         ZogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc;
        bh=R0hxmPmYo2zIwir4o0WjKRGuOHoddJO0rOVZWf2Sn1M=;
        b=XBh+TllDiRPbiAGpqJaazx4rCNN5AqbwK76vmmYC+Ek8QamMlAcAjyFPrbiKzhFqZ0
         Or2QYJg1HKPsvH1in++uvQ1Zqjv3jykpSPHMG+sKOrUELPR5MkXaY2fY/lb93KSVNCZC
         y76HLcrBpXNhJ+2EnBcG3Kbkd9rfNtED/fDB84UYOcMG6BEY3NogClwBnBJ300nV8A2j
         ikLynidWzq1gf+f4ISJ5+2TlPFr7+6Pk6GvCXQwLEMm59vLnaGt/uvlzU1QYfmnRVYMB
         gih0vhcnCJOK5iTw/VHy35F3ZxWxwdFvRElvBVDyY8XF8ugT7LYww8nux9qYj6iDBDss
         hrDg==
X-Gm-Message-State: ACgBeo3+iIygA7h8GwyGtcjYaeHSxyh9aMBa6tshg/omi193FmNzLHUh
	nTncTP2CJJ5zEBV1JFrBIqMsJ69xt/3DMT4w
X-Google-Smtp-Source: 
 AA6agR6E1Go78Y1BL1f8nr1X38gkYcg8ZZAxW6QjPhvuVmD3swPkwyArG4peMaP/t163p4SOF4qQNA==
X-Received: by 2002:a17:90a:c690:b0:1f5:858e:f538 with SMTP id
 n16-20020a17090ac69000b001f5858ef538mr22794480pjt.10.1660482148786;
        Sun, 14 Aug 2022 06:02:28 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 e10-20020a170902784a00b0015ee60ef65bsm5287903pln.260.2022.08.14.06.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 06:02:28 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 30BBD96247C; Sun, 14 Aug 2022 03:02:26 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 14 Aug 2022 03:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220814130226.30BBD96247C@nuc.router0800d9.com>
Date: Sun, 14 Aug 2022 03:02:26 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Aug 2022 13:02:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169323

Branch: kirkstone

New this week: 5 CVEs
CVE-2022-29154 (CVSS3: 7.4 HIGH): rsync:rsync-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29154 *
CVE-2022-32292 (CVSS3: 9.8 CRITICAL): connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32292 *
CVE-2022-32293 (CVSS3: 8.1 HIGH): connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32293 *
CVE-2022-35737 (CVSS3: 7.5 HIGH): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-35737 *
CVE-2022-37434 (CVSS3: 9.8 CRITICAL): zlib:zlib-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-37434 *

Removed this week: 0 CVEs

Full list:  Found 15 unpatched CVEs
CVE-2016-3709 (CVSS3: 6.1 MEDIUM): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3709 *
CVE-2021-3611 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3611 *
CVE-2021-3750 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3750 *
CVE-2021-46829 (CVSS3: 7.8 HIGH): gdk-pixbuf:gdk-pixbuf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-46829 *
CVE-2022-2294 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2294 *
CVE-2022-2509 (CVSS3: 7.5 HIGH): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2509 *
CVE-2022-2571 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2571 *
CVE-2022-2580 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2580 *
CVE-2022-2581 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2581 *
CVE-2022-2598 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2598 *
CVE-2022-29154 (CVSS3: 7.4 HIGH): rsync:rsync-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29154 *
CVE-2022-32292 (CVSS3: 9.8 CRITICAL): connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32292 *
CVE-2022-32293 (CVSS3: 8.1 HIGH): connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32293 *
CVE-2022-35737 (CVSS3: 7.5 HIGH): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-35737 *
CVE-2022-37434 (CVSS3: 9.8 CRITICAL): zlib:zlib-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-37434 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

