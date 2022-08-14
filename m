Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92EA4C25B06
	for <webhook@archiver.kernel.org>; Sun, 14 Aug 2022 12:03:44 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web08.4307.1660478615544200426
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 05:03:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=h29fAuNq;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id x23so4311402pll.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 05:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc;
        bh=MBJ0kO0jg/sNdMgZMe5NQrlARsvLm0OGtcH8WHuhIpw=;
        b=h29fAuNqwy9KQngL838rhSlB1LsmmyEeEAFQVthKgNE++LIVbLJu6EPzPhyDUo0ao1
         BRFZmJlpFES6ER+KHHO7AW9gpmYsQaNpSqDmQNHcthlNCa3rd2Jj6Csiojv5iIfNIwfm
         SRKZXqu+Ys20g+wsKBAEuqPKs/Q+iuiT0NT142XnKLLqARH2lJqwQDigEMDePA5/1G9u
         bVsKYmv7GmY3tbeyY0fvQGHCcgyOTgMYBp434ZTDAAe6HkJBYjPBW4osO7gAg+f+XdT1
         04LfuBBSXcOi+pNBmNv+z5Gyrt6YyecifkhujJC0MwBUF1Y0FHic8x0Z3qgyJU86q8Gw
         O+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc;
        bh=MBJ0kO0jg/sNdMgZMe5NQrlARsvLm0OGtcH8WHuhIpw=;
        b=uzuodo4Kuo6si9NeuvJExe9hJnaDBhQnhrEZgTqUYuuQAkEwG64PMqZ0qc2R3wr/68
         2K76OlnbFDpfBywpQ6Fnyh6AysdYKNuSBmSOOiCrpUF5P40GfiwvCFW1k9R56ZUIrmj0
         E61qEsbUvU2E/WqvgYLATBMTFxmp69riF8cJ0kFuk/iQPKKRlAQcjA9N1RVe8sNSHoeN
         6d2WPQgljD3hPcrh2QyMz4ALib0gHrH/3NdGj4D9BmJ+bsQTGzVBR40n9oUAIaklGdWm
         YyAqOBwEghgBQf9y6iQEhHlenENIvYgWLHbsRxhmpbODnjkOs7qYfP5CkukL/uBRJEhN
         Iw3A==
X-Gm-Message-State: ACgBeo0dyNLpo9B/9LFRY7L1OXHnNXCdKqorjph0R9fK7pMjmRnDv2os
	PGNnf82X/dhrl+KgrjgsZcNqk1Tn+zDynabm
X-Google-Smtp-Source: 
 AA6agR7sKr8fCQJPN86Rr4jnFuqPawZ30OvcAi3L2JcSenF2Z59W3V8KNzn1I3gA/hrVAJWYwlyNog==
X-Received: by 2002:a17:902:7845:b0:16e:ea31:3354 with SMTP id
 e5-20020a170902784500b0016eea313354mr12017511pln.17.1660478614315;
        Sun, 14 Aug 2022 05:03:34 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 n1-20020a639701000000b0041c8e489cc2sm4355866pge.19.2022.08.14.05.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 05:03:33 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id A69DF96247C; Sun, 14 Aug 2022 02:03:31 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 14 Aug 2022 02:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220814120331.A69DF96247C@nuc.router0800d9.com>
Date: Sun, 14 Aug 2022 02:03:31 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Aug 2022 12:03:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169320

Branch: master

New this week: 4 CVEs
CVE-2022-29154 (CVSS3: 7.4 HIGH): rsync:rsync-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29154 *
CVE-2022-32292 (CVSS3: 9.8 CRITICAL): connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32292 *
CVE-2022-32293 (CVSS3: 8.1 HIGH): connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32293 *
CVE-2022-37434 (CVSS3: 9.8 CRITICAL): zlib:zlib-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-37434 *

Removed this week: 2 CVEs
CVE-2022-2294 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2294 *
CVE-2022-2509 (CVSS3: 7.5 HIGH): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2509 *

Full list:  Found 7 unpatched CVEs
CVE-2016-3709 (CVSS3: 6.1 MEDIUM): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3709 *
CVE-2021-46828 (CVSS3: 7.5 HIGH): libtirpc:libtirpc-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-46828 *
CVE-2022-29154 (CVSS3: 7.4 HIGH): rsync:rsync-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29154 *
CVE-2022-32292 (CVSS3: 9.8 CRITICAL): connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32292 *
CVE-2022-32293 (CVSS3: 8.1 HIGH): connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32293 *
CVE-2022-34526 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-34526 *
CVE-2022-37434 (CVSS3: 9.8 CRITICAL): zlib:zlib-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-37434 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

