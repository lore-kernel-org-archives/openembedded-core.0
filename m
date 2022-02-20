Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EA70C433F5
	for <webhook@archiver.kernel.org>; Sun, 20 Feb 2022 15:33:46 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.22664.1645371225408982623
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 07:33:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=CdoRP/PT;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id f8so12150856pgc.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 07:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=SvhB9EQT18U9ml93WffPxPSXyNoE9tmcJKPHYX1fe8w=;
        b=CdoRP/PT7wkmJdBjJ0JKu6dVffnpPyEbpfiR4fcrZ/ELl4IatYRq0vRO0wkB3YxOlD
         vSsJSELtnqkAExFbjXH8PBHB716HEKpHtroLKsmDIZHH2G2Nzf60X6YpqzWAm32wJjPb
         el8LWxvPL++qwlqN4M5O940KJgBHH9vnA7jpfX/SJftpkDZvZbWxIZ6Fte7wYkC+dLir
         QBMUihVvgJMLyBKkN3mOxoaIKPgmhVjP0cuSXW0XHN9GuYFK2+QyyiYRsrsLLO4Vz71u
         tylqBh31PRQX/fEU4z7yGrGhUoQu80/RwSI6CBUD1UtL2HjofOhmk2WcJ/8Mb5LF4/WO
         xU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=SvhB9EQT18U9ml93WffPxPSXyNoE9tmcJKPHYX1fe8w=;
        b=PjPeLVa62oL/ptEIf4NMWhhmVUFDv6FQktLf/WwBbGTTQ5qvV+pscwtaWYo3TMDemE
         u4ElzYa11iYaNvMNoNPv88+5FJNT9VC9VmJBxiBO8nlnm9Ys4pfJZWGYm699ESIGg6pI
         JhGwhCaeZfFujX1Dosraxa4zOBiAE7hFD0zeI3fulgREO9Or1VsiGZ2aTa5bnJsNnXAj
         4MvwtTqQTxYOTp96Q3VNj8at32f9pFLjeYIG7ohRpO94o4XuTTbXe2iCyzjqYWw09X4t
         THFxnt5QpRqVuX6LxCwbmTyBBSgKNRruJHHVJWXqWKpwcI13PuGBUvBbKBZTURs0MZ9W
         xqew==
X-Gm-Message-State: AOAM530BQW6SmZa+UqutWus1JRA3/aWz5/T0/vYf/DglW9jffWAIa3sR
	aIZT4sIOlgGgbVYeDHdkxZO8laguZXugfi8A
X-Google-Smtp-Source: 
 ABdhPJwpCfv8aE44CP1rfnFYwVpBeFijhAX+15f3M5A0r6RkNbjdB50JTuWn9KhEj++RxbZJE7owmw==
X-Received: by 2002:a65:49cc:0:b0:372:a079:cb3a with SMTP id
 t12-20020a6549cc000000b00372a079cb3amr13063524pgs.222.1645371224305;
        Sun, 20 Feb 2022 07:33:44 -0800 (PST)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h21sm9535751pfo.12.2022.02.20.07.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 07:33:43 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id ECA44962C06; Sun, 20 Feb 2022 05:33:41 -1000 (HST)
Subject: OE-core CVE metrics for honister on Sun 20 Feb 2022 05:30:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220220153341.ECA44962C06@nuc.router0800d9.com>
Date: Sun, 20 Feb 2022 05:33:41 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Feb 2022 15:33:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161989

Branch: honister

New this week: 8 CVEs
CVE-2022-0529: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-0554: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0554 *
CVE-2022-0561: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0561 *
CVE-2022-0562: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0562 *
CVE-2022-23772: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23772 *
CVE-2022-23773: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23773 *
CVE-2022-23806: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23806 *

Removed this week: 0 CVEs

Full list:  Found 36 unpatched CVEs
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
CVE-2022-0529: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-0554: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0554 *
CVE-2022-0561: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0561 *
CVE-2022-0562: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0562 *
CVE-2022-21658: rust-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-21658 *
CVE-2022-23096: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23096 *
CVE-2022-23097: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23097 *
CVE-2022-23098: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23098 *
CVE-2022-23303: wpa-supplicant https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23303 *
CVE-2022-23304: wpa-supplicant https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23304 *
CVE-2022-23772: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23772 *
CVE-2022-23773: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23773 *
CVE-2022-23806: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23806 *

