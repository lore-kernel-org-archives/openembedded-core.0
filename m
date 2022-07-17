Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5651DC43334
	for <webhook@archiver.kernel.org>; Sun, 17 Jul 2022 13:02:55 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web08.15619.1658062970710236089
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 06:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=L/0XOym1;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id x21so6877312plb.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 06:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=3kTKuVxQKCcchV74wE1H2Z6keuwCDmyPLtwK5Z/ra10=;
        b=L/0XOym11cl9IMTiS5LQE0q3+t9QAeAEvpxolueiJd8I/fWzlkD7iXrPSk7YC1PpGU
         Ng5fw1rbWFB5j7Nms+Z0jCwEv+GetmEEwWmaTDL3TcwndnLj9FYn0v/3V9Ml10CRQ4HG
         T5bLkhn1yeR9pKRa0f6zc1KQ24IP6exDvYfKsuA/3B965IWjPD0oIDu9a77pj6ekWulu
         yYPmB8kJW2p43PM5T8BXd9V9SaabH1gVxEYIDhV+Uv3hvjLokxpXFuWA67v8msOBK4JK
         lDcQ5BYnE8dm6n5nzMVwE2vAqVv0aiDduX6fmT0YzqTGMgpfUWxMV+E4gPsvTTUX0RYV
         e1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=3kTKuVxQKCcchV74wE1H2Z6keuwCDmyPLtwK5Z/ra10=;
        b=TxYED27GTLkDONv/XKY96G233KK19qSG2SdgFujsnRoA1rwpZGxobpTBIEbaEK38pl
         midBgGF24d4UD8ye6MPYwAbUdCxBr0u0aatz+PBxL9YUfeIIyS50q+FvBPAGK/a3CXdq
         aVyH11KMBMCCegFg8TO5Y0sDp1G+QvukQc6WvM9WjiFwrZEmO4QdFC1+Oxaue9DEyuU5
         k1p5hTizBqUqQQS+RYItm5MF4NFVd2pbWpstBlNsykZHGfFV9wWH1zIyCGnel+sCjwo+
         M6nCFshy0nAOT60YxyS43aevuKGksH1mo1busZBjx3sxqEeSWAruzJJPNSt+0/7RzrN6
         ll/g==
X-Gm-Message-State: AJIora8ZDJ/Y3x1kS0b0WSrGHIlTESLUv6JX/liSlG0j+GVlvxfZ0Tud
	xHGLL9irEMf0MxdjnUJsNC06S3M8Ezak1lqO
X-Google-Smtp-Source: 
 AGRyM1sOgXtT4lKH0WwyNBWf1WLr/jQP4U+t+Jw9uSiPZHpfBCaGUnaDbfACQC9Jn7C3MVHiTSQTwA==
X-Received: by 2002:a17:90b:1d12:b0:1f1:8d48:abaa with SMTP id
 on18-20020a17090b1d1200b001f18d48abaamr8685274pjb.96.1658062969611;
        Sun, 17 Jul 2022 06:02:49 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 q18-20020a17090311d200b0016a5384071bsm7215528plh.1.2022.07.17.06.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 06:02:48 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id B85329624F3; Sun, 17 Jul 2022 03:02:45 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 17 Jul 2022 03:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220717130245.B85329624F3@nuc.router0800d9.com>
Date: Sun, 17 Jul 2022 03:02:45 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Jul 2022 13:02:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168158

Branch: kirkstone

New this week: 11 CVEs
CVE-2022-2288 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2288 *
CVE-2022-2289 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2289 *
CVE-2022-2304 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2304 *
CVE-2022-2344 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2344 *
CVE-2022-2345 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2345 *
CVE-2022-32205 (CVSS3: 4.3 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32205 *
CVE-2022-32206 (CVSS3: 6.5 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32206 *
CVE-2022-32207 (CVSS3: 9.8 CRITICAL): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32207 *
CVE-2022-32208 (CVSS3: 5.9 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32208 *
CVE-2022-33099 (CVSS3: 7.5 HIGH): lua:lua-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-33099 *
CVE-2022-34903 (CVSS3: 6.5 MEDIUM): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-34903 *

Removed this week: 6 CVEs
CVE-2022-2257 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2257 *
CVE-2022-2264 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2264 *
CVE-2022-2284 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2284 *
CVE-2022-2285 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2285 *
CVE-2022-2286 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2286 *
CVE-2022-2287 (CVSS3: 7.1 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2287 *

Full list:  Found 15 unpatched CVEs
CVE-2021-3611 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3611 *
CVE-2021-3750 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3750 *
CVE-2022-1183 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1183 *
CVE-2022-1664 (CVSS3: 9.8 CRITICAL): dpkg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1664 *
CVE-2022-2288 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2288 *
CVE-2022-2289 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2289 *
CVE-2022-2304 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2304 *
CVE-2022-2344 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2344 *
CVE-2022-2345 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2345 *
CVE-2022-32205 (CVSS3: 4.3 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32205 *
CVE-2022-32206 (CVSS3: 6.5 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32206 *
CVE-2022-32207 (CVSS3: 9.8 CRITICAL): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32207 *
CVE-2022-32208 (CVSS3: 5.9 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32208 *
CVE-2022-33099 (CVSS3: 7.5 HIGH): lua:lua-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-33099 *
CVE-2022-34903 (CVSS3: 6.5 MEDIUM): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-34903 *


