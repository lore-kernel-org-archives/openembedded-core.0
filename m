Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1142AC433EF
	for <webhook@archiver.kernel.org>; Sun, 17 Jul 2022 12:02:55 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web09.14976.1658059367884021701
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 05:02:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=b8/hM0s8;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id
 o31-20020a17090a0a2200b001ef7bd037bbso10220631pjo.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 05:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=DhAaFE13fQXtG9K7oEs4nBMu9YAwxBZiWA/WhbqHRXk=;
        b=b8/hM0s84mXC6T1i+cKpI3s7J2Mw2B5ec+65boguG5diphgyCbIdRPW58u6jBEfZGV
         uf69Fe81YcYL/2tN+tVIymmN7qIrfjWqAA7flxqTLaqn3UXh4DlY8e4UZS3ITji9MzIw
         ZG9iqzKKdyRM5t34XoMIaVrZgjyo1GWRMSj6Z9LzqWQD/RACAUr6YrucVIavh3nB0RQt
         +o6qgT3dRHCsYzY/IR4z0cgeLIRFJCHsg7FimAiVzQPEEyUUElCeyjZJvwK7MPMOXpOg
         3CNixbIrEiRKXH1lNIvxgBKn6gBqn2hiSL6MWE/UaoYDezdvq+hW8WYK31SUA/3nljNd
         ABFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=DhAaFE13fQXtG9K7oEs4nBMu9YAwxBZiWA/WhbqHRXk=;
        b=YgeIAL8/UNZDgV0hGassSr7lIG88Cm/SKlLdO5b844Pp7fwh0TbbPlj8U7bsGoyAqZ
         IdOhAH3uYJUcgKuPlJUK7qHFuH7Z6dQ9HrbVFHIOIIctHHE/CF/TP3NGgD1PXxaFsaIC
         uIdVZM7mDIAYgDzy39v2Q0/KMeKiO90wHtoXQkIqf0a/WJpBsGcVjTyJVP4t6iagPT3q
         iR8XnawSxwPwHkPFX4Qy+yH5+kzZz8gFRKVOzM6t7cGOKhylzr1i0MQSqhf9NSOH9DjT
         YpyP8nyz4OcDZyFnNTYqVmdmK4CjM+NV5rq3zp6L9EK3aKEHjwSQ+icAPKnVApR1QFuL
         LDZA==
X-Gm-Message-State: AJIora8aD8EZzP251BpUCHrWl20D8SVQFeaSV1g4KNBtF9hW/k6l74Bd
	aNVH73w6uL9ALFqh7GsKqicnQ+UJy6256a+B
X-Google-Smtp-Source: 
 AGRyM1up4KLQOGeQm2E8PZsXLxELsyHj2B+QSllwQQBFcEjUPmooa6CR0xX29JQ4QAReMFof1idSWg==
X-Received: by 2002:a17:90b:3688:b0:1f1:6147:cda6 with SMTP id
 mj8-20020a17090b368800b001f16147cda6mr11264085pjb.150.1658059366559;
        Sun, 17 Jul 2022 05:02:46 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 u14-20020a170903124e00b0016bee3caabesm7092111plh.270.2022.07.17.05.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 05:02:35 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 6436E9624F3; Sun, 17 Jul 2022 02:02:31 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 17 Jul 2022 02:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220717120231.6436E9624F3@nuc.router0800d9.com>
Date: Sun, 17 Jul 2022 02:02:31 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Jul 2022 12:02:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168146

Branch: master

New this week: 6 CVEs
CVE-2022-2288 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2288 *
CVE-2022-2289 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2289 *
CVE-2022-2304 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2304 *
CVE-2022-2344 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2344 *
CVE-2022-2345 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2345 *
CVE-2022-33099 (CVSS3: 7.5 HIGH): lua:lua-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-33099 *

Removed this week: 9 CVEs
CVE-2022-2056 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2056 *
CVE-2022-2057 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2057 *
CVE-2022-2058 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2058 *
CVE-2022-2257 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2257 *
CVE-2022-2264 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2264 *
CVE-2022-2284 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2284 *
CVE-2022-2285 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2285 *
CVE-2022-2286 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2286 *
CVE-2022-2287 (CVSS3: 7.1 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2287 *

Full list:  Found 6 unpatched CVEs
CVE-2022-2288 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2288 *
CVE-2022-2289 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2289 *
CVE-2022-2304 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2304 *
CVE-2022-2344 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2344 *
CVE-2022-2345 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2345 *
CVE-2022-33099 (CVSS3: 7.5 HIGH): lua:lua-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-33099 *


