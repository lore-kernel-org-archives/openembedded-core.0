Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FC38C433F5
	for <webhook@archiver.kernel.org>; Sun, 23 Jan 2022 14:04:59 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web12.9681.1642946698162768821
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jan 2022 06:04:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=o6MUhcIN;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id e9so12754724pgb.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jan 2022 06:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=p7ELBQPI5gXOYCeNNwhoIPGy+7QPKunlvrzYcGdIHk4=;
        b=o6MUhcINCdSFeeXANJYu33vaV/W6jU5lQe8PcQRmiZq/XHdw+H7LeS8SQhJpEDwNgp
         AyziP6gXgi5jlorEshMJxrvS/u/3LyCLhnQSeuUBGsE9Z22uJfJ73eWjm02Hr4fJI4jk
         GEO0wh/2I5NzHpwUyoKUt0KwaAQASpWmW7CvIM8xbHMrLkhVDQCVgXn7KxmCCH5sZUzu
         NJzm3D7BbHwx9ekWO9M3lb7XZ6LgCAkjlTtyvHfc6Y7acoYIFPQfVb0rEInlSF2DRi4v
         hYAedM/6e+VStj3FuSSAk0+ADcN7JynEbgmJPf7qz260Yr1E/KrHre/USZYuCmK6anIE
         CS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=p7ELBQPI5gXOYCeNNwhoIPGy+7QPKunlvrzYcGdIHk4=;
        b=3tdBXVBKIJ7jnW1aZddjnZalcMslyMZc+aVH4NToU1aZwrCzyw0bTgYoZF5XHuOHQW
         CdJSY5jCck+rnp1VA9V+BfYeovvXsS0pomO1PCbSb32mCfiJzUte0lx6cfsINIYQO/3Q
         xGzrhuKQT6NLM+qtUzczR8vhQAcsvLQUltmBQADayUTwKL5a3zxy199Re8lrdNcYlRfS
         cEmhvBouZ9H1LDEVgIYeHn+wpT2OM7DV1u0CSs2cc+LloX+8k2ZKKujgc7hiUsF/SZsA
         uAx0C0dzMeXkUqVPkUfZ3PjXusRAPLXGajSJsOyxljGkRodBxWz9+R9/K9QGBoqYwncg
         oIxw==
X-Gm-Message-State: AOAM532WMnogO5uPPxEHl7Y0YcWmi5ir+PsLpOrlus4AWVB67PAdjJUv
	W7pCyStU1cj6u+vzHbuQXFSgiChqZU0gEG2VmNk=
X-Google-Smtp-Source: 
 ABdhPJxGbfiTL5HNUB7fYEzIf7qxMJmFdKW2kRVMXesRpsTC3MyCcwhvUGZ05c0+ZNinFzz06qqCcw==
X-Received: by 2002:a05:6a00:1144:b0:4c4:8072:e588 with SMTP id
 b4-20020a056a00114400b004c48072e588mr10503004pfm.11.1642946696876;
        Sun, 23 Jan 2022 06:04:56 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 mg17sm10760490pjb.19.2022.01.23.06.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 06:04:56 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 1C7A4962C85; Sun, 23 Jan 2022 04:04:54 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 23 Jan 2022 04:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220123140454.1C7A4962C85@nuc.router0800d9.com>
Date: Sun, 23 Jan 2022 04:04:54 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Jan 2022 14:04:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160863

Branch: master

New this week: 1 CVEs
CVE-2022-22844: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22844 *

Removed this week: 18 CVEs
CVE-2021-4136: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4136 *
CVE-2021-4166: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4166 *
CVE-2021-4173: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4173 *
CVE-2021-4187: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4187 *
CVE-2021-4192: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4192 *
CVE-2021-4193: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4193 *
CVE-2021-45960: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45960 *
CVE-2021-46143: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-46143 *
CVE-2022-0128: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0128 *
CVE-2022-0156: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0156 *
CVE-2022-0158: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0158 *
CVE-2022-22707: lighttpd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22707 *
CVE-2022-22822: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22822 *
CVE-2022-22823: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22823 *
CVE-2022-22824: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22824 *
CVE-2022-22825: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22825 *
CVE-2022-22826: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22826 *
CVE-2022-22827: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22827 *

Full list:  Found 6 unpatched CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-45078: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45078 *
CVE-2022-22844: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22844 *

