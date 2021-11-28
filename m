Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA793C433EF
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 15:02:38 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web08.48768.1638111757929088304
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 07:02:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=oFkboLOh;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id s137so13245468pgs.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 07:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=ipnLc8nf+7rkxsA++pdkQ5/Lf725Dakq+AriYti198k=;
        b=oFkboLOhZnJ/DicoyQ8OxfYfpvZru4SVcs/oSY3Ma7YOHnv+vc2ZUdHe/w+f4b1T0b
         /4dVDX8lhU8JDiMYXHWEW194g/axR2pbhxcEM0S09WnK0hmR6qbWjT7jfrhKVBhy8QBN
         oQHnPfVXN4bPoVN4FfLmxmIPsp564O9RuDZx1RVMhbGtH1XZ9nAlahqP1iilR47OnEXt
         rZ79d17hNk4uOi6TRVru/hqoAkkNL4NJ/VdZooYK/dpgwPJ5Mgz8nftJ9TIPF6MciryU
         TGEJXQos7hLCg5hjObOtB7zCWwJsM6mAPrPh1EUR4BV6LxHQ1U6StcTu0dABwzTCQJ5Y
         IEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=ipnLc8nf+7rkxsA++pdkQ5/Lf725Dakq+AriYti198k=;
        b=vELVO1r4OPIZ7NrUgvC7l91C8hUe+4CaQRylqf3REkNTiqNXLQ5LsXaSv6nntHgikQ
         kxHUk9lt1VuNeODQFIR6ZrjbdTvrIEaxmWUfoe5rxZ5ehD2nI3G57/eLB/8ea68CPvNk
         P0+wCXqP70HCVj2iCeF+6fgJNxsCwEn/3K4gbLP6SaUkTWutLLuWsbvUJ3w2JiyRM0hE
         imjCDTrrQZKkIprhnAh6nyWHbWryUkqWBFmj0E5FM46yn5PxpXU1akj9roNbkQh3d7pO
         FrwsXxf9CA2jlzqGGAURvJIbcm4bMUVcAuUVM/4S+idyubHc1dtU5OL2n27K0Nrn03jc
         eyJg==
X-Gm-Message-State: AOAM530l9g4tHvJCVjysoTN62OlzJ83yl3afRGH/qP75kdmFFe/LPRfG
	YD92ZQJ07Vtp70YXKugS4FHiJYvRwbIvZZ3qH4I=
X-Google-Smtp-Source: 
 ABdhPJxj7XASwoqRW7Mht5wMvuDRK7nlLmQX7Wr/0ihwjDSEXQKxAjnoweLlDiBz+9DnRma9u2VDVg==
X-Received: by 2002:a63:b11:: with SMTP id 17mr30634328pgl.51.1638111756809;
        Sun, 28 Nov 2021 07:02:36 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y7sm9527176pge.44.2021.11.28.07.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 07:02:36 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 53A129603CD; Sun, 28 Nov 2021 05:02:34 -1000 (HST)
Subject: OE-core CVE metrics for hardknott on Sun 28 Nov 2021 05:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20211128150234.53A129603CD@nuc.router0800d9.com>
Date: Sun, 28 Nov 2021 05:02:34 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 15:02:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158879

Branch: hardknott

New this week: 4 CVEs
CVE-2021-37322: gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:gcc-source-10.2.0:libgcc:libgcc-initial https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-37322 *
CVE-2021-3968: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3968 *
CVE-2021-3973: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3973 *
CVE-2021-3974: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3974 *

Removed this week: 7 CVEs
CVE-2021-25219: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25219 *
CVE-2021-3872: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3872 *
CVE-2021-3875: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3875 *
CVE-2021-3903: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3903 *
CVE-2021-3927: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3927 *
CVE-2021-3928: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3928 *
CVE-2021-40491: inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-40491 *

Full list:  Found 55 unpatched CVEs
CVE-2013-0340: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0340 *
CVE-2016-20012: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-20012 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2020-29623: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29623 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-1765: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1765 *
CVE-2021-1789: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1789 *
CVE-2021-1799: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1799 *
CVE-2021-1801: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1801 *
CVE-2021-1870: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1870 *
CVE-2021-20196: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20196 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-22922: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22922 *
CVE-2021-22923: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22923 *
CVE-2021-22945: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22945 *
CVE-2021-22946: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22946 *
CVE-2021-22947: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22947 *
CVE-2021-27645: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27645 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-33574: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33574 *
CVE-2021-33833: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33833 *
CVE-2021-33928: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33928 *
CVE-2021-33929: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33929 *
CVE-2021-33930: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33930 *
CVE-2021-33938: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33938 *
CVE-2021-3445: libdnf https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3445 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-36976: libarchive https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-37322: gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:gcc-source-10.2.0:libgcc:libgcc-initial https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-37322 *
CVE-2021-38297: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38297 *
CVE-2021-38604: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38604 *
CVE-2021-3968: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3968 *
CVE-2021-3973: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3973 *
CVE-2021-3974: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3974 *
CVE-2021-40528: libgcrypt:libgcrypt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-40528 *
CVE-2021-41771: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41771 *
CVE-2021-41772: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41772 *
CVE-2021-42373: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42373 *
CVE-2021-42374: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42374 *
CVE-2021-42375: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42375 *
CVE-2021-42376: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42376 *
CVE-2021-42377: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42377 *
CVE-2021-42378: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42378 *
CVE-2021-42379: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42379 *
CVE-2021-42380: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42380 *
CVE-2021-42381: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42381 *
CVE-2021-42382: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42382 *
CVE-2021-42383: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42383 *
CVE-2021-42384: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42384 *
CVE-2021-42385: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42385 *
CVE-2021-42386: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42386 *
CVE-2021-42762: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42762 *
CVE-2021-43618: gmp:gmp-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-43618 *

