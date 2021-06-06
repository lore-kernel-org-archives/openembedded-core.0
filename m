Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web08.23525.1622988262835817303
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 07:04:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=HNnAevnO;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.54, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f54.google.com with SMTP id x22-20020a4a62160000b0290245cf6b7feeso3477375ooc.13
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Jun 2021 07:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=QYtwncDYoIgBrKFv1HwTbnes/7Gk8/V5eGScEgryr/8=;
        b=HNnAevnOUnY39vIFj3BRqO7IHZ4xmtWgidxKYxU0ajO+jfdr+evNoa0Eh1IJ58C4pG
         R7fNkc3XuGukOugq/6WPEY4dWxOR0uV+4je1kK2wTMA6xuFapdC+V7njOPhxmxA1w/QI
         E2o8HX6RpKgCgPHLszTLrHbfJTTKlCd3yiO+jxN95FqrLmbQoX+eiRvcBlpR3iNVsvb4
         5TkTQJ99KhyLgM1XPjzLWGpkf2t3wLZwvRRTcYmr3E9Uj8l4xoQg0Pmi39+efeK+U3rZ
         WiXNWt0FH3tntEg/DFArCOe0TkNqA0uWVTWf7R+Z5CsVdO6aw9dIEVVOg5oQgPazOwC/
         f0HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=QYtwncDYoIgBrKFv1HwTbnes/7Gk8/V5eGScEgryr/8=;
        b=bym/V1juJG7xK2ygsL4d9JWkzrDFZGh4LjW7oVnHzh7rcvu7KgyF+Ej+McUSBXFAub
         HRKe1bpXAlMSlxQ4xKEVHaW1qDJSR21ZqpHRz2oHpYawG/CTXBJ3SMX8WREDzJrKFp1m
         SNo+n6bMTOBcfusOu/treckIqDXdCQGqY7FWoZA3DdZu5kBZgvAe9UWmzaHAQjsWiTZi
         KJauRWnY2BjPgLK2VV7A7F9+1RKS370kqopOJoLv2mugSEyZ2e9nZ27A2grYaGQ1SIbN
         R8cJKEXjZW58jJU0f5TJuc/rWWxMu1MKs0oPUfkWEQRaY9uyNJ7y6krzzT4pC+fjxsmp
         wPXg==
X-Gm-Message-State: AOAM531BQ0sSZUEd9QdheVjrLUPhKgolGKerX7ce059gUIeRjkZrpebS
	A/BdLWE8spZzKXyDF7kNsRmR3reTkgBA+JCHQ7Q=
X-Google-Smtp-Source: ABdhPJxdeLVmvvjsnr5T9H+PxnSydgsi6rHUN4NwHIiEKLcFZg6fpLLrZiaLs30nfa7JuFlee+LKcA==
X-Received: by 2002:a4a:5182:: with SMTP id s124mr82972ooa.34.1622988261592;
        Sun, 06 Jun 2021 07:04:21 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id k9sm1666019oif.47.2021.06.06.07.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jun 2021 07:04:21 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 6E07D96038F; Sun,  6 Jun 2021 04:04:12 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 06 Jun 2021 04:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210606140412.6E07D96038F@nuc.router0800d9.com>
Date: Sun,  6 Jun 2021 04:04:12 -1000 (HST)

Branch: master

New this week: 3 CVEs
CVE-2021-33574: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33574 *
CVE-2021-3421: rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3421 *
CVE-2021-3527: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3527 *

Removed this week: 2 CVEs
CVE-2021-20231: gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20231 *
CVE-2021-22876: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22876 *

Full list:  Found 7 unpatched CVEs
CVE-2019-6293: flex:flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-33574: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33574 *
CVE-2021-3421: rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3421 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-3527: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3527 *
