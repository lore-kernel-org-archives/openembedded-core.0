Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 917F2C433EF
	for <webhook@archiver.kernel.org>; Sun, 10 Jul 2022 12:02:43 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web12.16159.1657454559903251039
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Jul 2022 05:02:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=UtMic9gS;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id y18so2331016plb.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Jul 2022 05:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=5xvmM/phOjzLIIlpbTKSD1pqUPpGnN3OKPYlsZamLKc=;
        b=UtMic9gSlZ2jurYElqyBM2z25vKJsOz47dWKneMxvr0GZYLwpP/SVxFNq4HQHUsho/
         RnXYoCpvXdRBbYv9f98VzXcRq6aqTE5gvYmOvNgwvv3wew4i5bQxy8uE5nrgbnaqJrO8
         KDVnDxHiczPx11reTUe1O/afG9Yy8tmLuzQ5hBe3CBKT8uGoeG/xDhj93qPpjU35YDji
         rxowCGF399TuyFTccvI3hJUWvD5g9fUjPFmTXFJWIAtQE9UOBeSig0UbylBvUH3sN8b8
         B3TbBFqWxSJrsvPJGtmCoogNr13gj7csIFW1Ym/K3usEAFS4Dq4fhv9LpxYzd9aOmvPz
         baQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=5xvmM/phOjzLIIlpbTKSD1pqUPpGnN3OKPYlsZamLKc=;
        b=vylDS0N4Ym+rA1qwqR4VBnZ2yRtMYpEbbwN+0KEUfMT/rQTsPg4XIaNN6dwg5HNXXm
         gqhpiu8QsEv3iPk5l26BZ+fWeHdkK/fUvFjlGH/4Igz84dZfHf4/C8m96GS/cg4oayCw
         87hQ93HSc6M6+RxOWEZqGFOLBJc22D6Bo6eon8IaEwsawmUTeZ6xEiyOPWSWff8nqrJv
         djl2N2f9vdQLnpfs3TUv7x/aeREOXf5LhyAl/wFAG7XnDm5dRYUqoaGYpM7UIYF9BVAD
         XQw+1XuodqSWLDCMzMjF6guAq3P19a9d/XF2s3Vdo2GKGW5w296JvPuCw1nuw8dWdiRx
         aTug==
X-Gm-Message-State: AJIora+/qIZmO5lLJWt5iQF2yZtjVLbD5vLZ25j0sTjov9nj5UjToD1V
	qJMxfKAOILQNBcQbMD9A+qmxWXqA9xNmUkSn
X-Google-Smtp-Source: 
 AGRyM1sa9W1+f0J1M6haRbEWiP4Se53gKOw+7hxAqfWqtS6Gz3APLtUAQCXJ0QBVtBRwgece4KAL3w==
X-Received: by 2002:a17:90b:4c4b:b0:1f0:21c3:652a with SMTP id
 np11-20020a17090b4c4b00b001f021c3652amr5857796pjb.231.1657454558248;
        Sun, 10 Jul 2022 05:02:38 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 w19-20020a170902ca1300b0016bedecdd65sm2614277pld.159.2022.07.10.05.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 05:02:37 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 7DC989624F0; Sun, 10 Jul 2022 02:02:35 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 10 Jul 2022 02:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220710120235.7DC989624F0@nuc.router0800d9.com>
Date: Sun, 10 Jul 2022 02:02:35 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Jul 2022 12:02:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167844

Branch: master

New this week: 9 CVEs
CVE-2022-2056 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2056 *
CVE-2022-2057 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2057 *
CVE-2022-2058 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2058 *
CVE-2022-2257 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2257 *
CVE-2022-2264 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2264 *
CVE-2022-2284 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2284 *
CVE-2022-2285 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2285 *
CVE-2022-2286 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2286 *
CVE-2022-2287 (CVSS3: 7.1 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2287 *

Removed this week: 0 CVEs

Full list:  Found 9 unpatched CVEs
CVE-2022-2056 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2056 *
CVE-2022-2057 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2057 *
CVE-2022-2058 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2058 *
CVE-2022-2257 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2257 *
CVE-2022-2264 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2264 *
CVE-2022-2284 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2284 *
CVE-2022-2285 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2285 *
CVE-2022-2286 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2286 *
CVE-2022-2287 (CVSS3: 7.1 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2287 *


