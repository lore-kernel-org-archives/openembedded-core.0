Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5CBEC433EF
	for <webhook@archiver.kernel.org>; Sun, 13 Feb 2022 15:34:31 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web09.22333.1644766470647493077
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Feb 2022 07:34:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=B9YALIvZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id z17so8647374plb.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Feb 2022 07:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=uVhykMU5VtD7JZX8JlpR8Ptg/TB/Co/KPqMwTU3QyC8=;
        b=B9YALIvZxxE/eUubXwpTi+9XihAP5p3wDyahUxNScPLSmABokZFTr71qIBi/wSb3+q
         gKI9T4OlCcuPIdhwsd+LB51PK7qoGKmmSvQbcqydlXSm5iIjycAGbI252l8Cf/IHLjSg
         UwboVgt1EQd0JXx5USm68TnmG6h5GDc8qaOet5gLcQGnVAicTITXlChraEAnKmMzH8oZ
         hdRjlQSMpi3rIPymCUCFOaF4uw8r/JcsS6M+J8h8yjZsF5atHVZkj/+T85Ab6zJjjBHl
         pfHxc/D1lr25w3rx12F1chjXTgDX5A3rJTHzlGLKR+cUjNDVBeCEexao4Gzv8v+pGrSC
         tRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=uVhykMU5VtD7JZX8JlpR8Ptg/TB/Co/KPqMwTU3QyC8=;
        b=1sekNQkX24u3tSgoV4moD7orcy0tsTQ04fkdKOkVMkV8CpNl7VZDZSfAHgT4q28zBs
         Qr91iJEh5tkyRKd5osk2SIaSLS1akjA8yUKmV6UDLRWsqlzncn+65TzLempG8PRTZYzo
         34rPr4UyjLyyM0uyQGeesjGpFOHp2iFMJYvWh0Hhaq1u6nBF/EFr4SPb+DYuwUbgm1Ha
         CHHMsMsEjLFcu/PUZTD+UR+Ibg0m5i3gn70AxT7hWaBe4i8pXu+CETx6J3aHDV6xV2Qp
         IhUsP/jkhU9JOUrMwM84hEYNcp5wNJWfgHQ6rPWDR/sRqr7nUV/jHHIwdNXoRlQQI5qd
         ie/A==
X-Gm-Message-State: AOAM5328Aoy4ArNoK4gZvDGQN8e4YJ3lNOAh7fOSUb4o+d+Fs98Z5+10
	lCp0thHB0XFRnq165QaOVTpIFuFQuHQAGuy5
X-Google-Smtp-Source: 
 ABdhPJwcD9Y+muIdZqmq/bgReFWYCI+MqhqvZD+2b4cgUuZXRhJrTCvlGR+4nkk9oBSI1oZ9Yjgxdw==
X-Received: by 2002:a17:90b:1d90:: with SMTP id
 pf16mr10205194pjb.245.1644766469496;
        Sun, 13 Feb 2022 07:34:29 -0800 (PST)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 19sm10900512pjb.42.2022.02.13.07.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Feb 2022 07:34:28 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 5BC2196070B; Sun, 13 Feb 2022 05:34:27 -1000 (HST)
Subject: OE-core CVE metrics for honister on Sun 13 Feb 2022 05:30:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220213153427.5BC2196070B@nuc.router0800d9.com>
Date: Sun, 13 Feb 2022 05:34:27 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Feb 2022 15:34:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161686

Branch: honister

New this week: 1 CVEs
CVE-2021-4160: openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4160 *

Removed this week: 15 CVEs
CVE-2022-0261: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0261 *
CVE-2022-0318: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0318 *
CVE-2022-0319: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0319 *
CVE-2022-0359: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0359 *
CVE-2022-0361: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0361 *
CVE-2022-0368: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0368 *
CVE-2022-0392: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0392 *
CVE-2022-0393: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0393 *
CVE-2022-0407: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0407 *
CVE-2022-0408: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0408 *
CVE-2022-0413: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0413 *
CVE-2022-0417: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0417 *
CVE-2022-22844: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22844 *
CVE-2022-23852: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23852 *
CVE-2022-23990: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23990 *

Full list:  Found 28 unpatched CVEs
CVE-2016-20012: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-20012 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-4145: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4145 *
CVE-2021-4160: openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4160 *
CVE-2021-41817: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41817 *
CVE-2021-41819: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41819 *
CVE-2021-42762: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42762 *
CVE-2021-43400: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-43400 *
CVE-2021-45078: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45078 *
CVE-2021-45481: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45481 *
CVE-2021-45482: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45482 *
CVE-2021-45483: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45483 *
CVE-2021-45931: harfbuzz:harfbuzz-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45931 *
CVE-2021-45949: ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45949 *
CVE-2022-0443: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0443 *
CVE-2022-21658: rust-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-21658 *
CVE-2022-23096: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23096 *
CVE-2022-23097: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23097 *
CVE-2022-23098: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23098 *
CVE-2022-23303: wpa-supplicant https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23303 *
CVE-2022-23304: wpa-supplicant https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23304 *

