Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web10.16184.1631455419655868819
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Sep 2021 07:03:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=VI6yYXWc;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.52, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f52.google.com with SMTP id c8-20020a9d6c88000000b00517cd06302dso9520500otr.13
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Sep 2021 07:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=ksfSvt0CL5waJsNyRPKoYkDZLyGVxyzAnAO1gr7eTf8=;
        b=VI6yYXWcHv/WrzKEh5JzrCBYzMZv08y8985yq/HmJ/LMcLwF/pcscPCKVgmxj3/fx8
         FL6aUxOfIFiyfpXMMLOrSTyJledE0voAfWN9xGwOl3LPRyQ4Jipl1r9gS5xXVdENh4xj
         GimY7Z+8NwGYMLJ+FpQakxlaP7kkLhx/9UfrgoxDyAHEsvSGG71vgigWS1mKdcc9vJpp
         xTuOXdAjMlc3+YoXouieq28GDc90ADDFxSbp0e9/R75fZc3MvA6sbM5u/G2qZji6OIkH
         NA6C3f+kDy9v35GS4TVWgs2Ulj3kVOyNUQxer+1OyLDf/6j2R7/KUKUVY1oiNqbAeOH6
         hTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=ksfSvt0CL5waJsNyRPKoYkDZLyGVxyzAnAO1gr7eTf8=;
        b=UED6Rknt8eLABrFKiq0cdcEo++h3esG75j/FvQGGHdGG0zNhYjj153VlZR/EdoADnQ
         J9iHbdtBaRR+5a+K1u1wlskLWBgnM0seIitaYN5K9YcjVVZGOkyKRqZUdhc/qETep5eM
         YyhO0xRiOYvNsrm5wi3Ril7XG/iO5DpPciAG+Ym8UW2UasWclFvyvXL3OSpwoClfEEaj
         8OBI81UDHi+9ISPkqW6r6qVWGU7NY4p6CuV6t7ujPmaGdgjZTEW9PLh8R+va3IxurqgG
         tuzfwYnSKiMN+uWQNJSdwAa+36kKaQOdBsdH8reecBYNaDFlyEXGiq7HLYYLWajh+ZRv
         TcQA==
X-Gm-Message-State: AOAM531dUtYjJG9vPng5Gfgr77b6laeSy/JaujNBfCaoy0NomaZ+xHbu
	9Cnlu4TQHITl6itq7nt8ao7MlhczI4pncseo
X-Google-Smtp-Source: ABdhPJwzcRk0fOxQnxI4Nfr6Kc61pTDODVCnsYC13JmZWH0mKaEjpjchcxFpQnDcF/wJ/LKthM1TYQ==
X-Received: by 2002:a05:6830:4411:: with SMTP id q17mr6060876otv.48.1631455418387;
        Sun, 12 Sep 2021 07:03:38 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id k21sm1138724ots.53.2021.09.12.07.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Sep 2021 07:03:37 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id D9A0896032A; Sun, 12 Sep 2021 04:03:27 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 12 Sep 2021 04:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210912140327.D9A0896032A@nuc.router0800d9.com>
Date: Sun, 12 Sep 2021 04:03:27 -1000 (HST)

Branch: master

New this week: 8 CVEs
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-36690: sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36690 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-37701: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-37701 *
CVE-2021-3770: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3770 *
CVE-2021-37712: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-37712 *
CVE-2021-37713: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-37713 *
CVE-2021-40491: inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-40491 *

Removed this week: 2 CVEs
CVE-2019-6293: flex:flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2021-29923: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-29923 *

Full list:  Found 14 unpatched CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-36690: sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36690 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-3770: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3770 *
CVE-2021-37701: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-37701 *
CVE-2021-37712: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-37712 *
CVE-2021-37713: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-37713 *
CVE-2021-40491: inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-40491 *
