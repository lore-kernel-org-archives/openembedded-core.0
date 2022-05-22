Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A20C433F5
	for <webhook@archiver.kernel.org>; Sun, 22 May 2022 12:03:37 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.15601.1653221009348818881
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 May 2022 05:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=jY4F6eN5;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id
 o13-20020a17090a9f8d00b001df3fc52ea7so15154990pjp.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 22 May 2022 05:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=ppsi/8YLh/1KBWSsadYeV2nZG/de7fz8/2Fe5UDWMjE=;
        b=jY4F6eN5/V3mJYLxKpniJwEo+15HN6J9Kz9PEx6Q1COfhKulzgEztWUcLLKPGP2k/p
         g6Flx97WBEqV+L+KOf5aO4Fyj1Atpppps0wTgLKxqPcljMM8mUOH8WMZmJSHmSLpoQSK
         K33nKM3jr9q/j8qy0liCiDB+4EE/QIhHwGnZpdZAprWMIQKWlab5jQgL7MngSS2VE3AU
         MabFmYP/F8pgV6QuUySzUJ7ZFLb18+Zu0n5gZiIHfQaQwsr/Xdzr9hccFokRN7KUytB0
         Juugl2leuzwR+wU2AKsdpwEYEKnzAlznZ0+Fm4IXTiPSd+YQ8D3Kz4hmrOOwEyO/Biqa
         BExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=ppsi/8YLh/1KBWSsadYeV2nZG/de7fz8/2Fe5UDWMjE=;
        b=M3qXw2Uynin3IkappBz0vlkA+kZtIlQUgC5XCXewzsSEzfSXnk2Ww3af8KXHycf3X6
         ZW5ryFiLvsb6odqGBtL6QYLtHBrtoC/AWq9s5IZM8AGwtUOYqa7L4PF6LZMIhmXZhK71
         XXOB0C3UDNYyuQTXKj3qXlcjViemjOYjNBjuvs04X40NTmZYOwu8WKl5C2G4OPTfDPPT
         ZVnfWimPamPCxztQNPCKuhUP0Vk9qY5notw+gPGO7P6UdbJ6PMAwyKW+v7nBpltqXixi
         CjBmehf6OiCBzI+ciFFddwo935WKaVNXvlnT+lsKkUr3HUzd/vzWmmuuKHIXNgfyaq6d
         DXPg==
X-Gm-Message-State: AOAM531EnU+TcoS9yJIDTplX69e++X1obabFv1ISCYEhS+N+eO42OIU+
	kxLskKEBWiuDR7WlMTsA6PqItQNfeMT+NUYq
X-Google-Smtp-Source: 
 ABdhPJwKzom/Rq46vwcLfZ2JWY5Xzbg0EfWsa2PWrkjcC6KWSVz0s/yONHt7Ay4qpHW8PT06Fj8aBA==
X-Received: by 2002:a17:90b:350d:b0:1e0:436a:d553 with SMTP id
 ls13-20020a17090b350d00b001e0436ad553mr1842855pjb.147.1653221007926;
        Sun, 22 May 2022 05:03:27 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 jc17-20020a17090325d100b0015e8d4eb2e8sm2973371plb.306.2022.05.22.05.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 May 2022 05:03:26 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 7044C96266D; Sun, 22 May 2022 02:03:24 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 22 May 2022 02:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220522120324.7044C96266D@nuc.router0800d9.com>
Date: Sun, 22 May 2022 02:03:24 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 May 2022 12:03:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165975

Branch: master

New this week: 4 CVEs
CVE-2022-1621 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1621 *
CVE-2022-1622 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1622 *
CVE-2022-1623 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1623 *
CVE-2022-1629 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1629 *

Removed this week: 0 CVEs

Full list:  Found 12 unpatched CVEs
CVE-2019-12067 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974 (CVSS3: 3.3 LOW): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2022-0529 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-1210 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1210 *
CVE-2022-1621 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1621 *
CVE-2022-1622 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1622 *
CVE-2022-1623 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1623 *
CVE-2022-1629 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1629 *
CVE-2022-29458 (CVSS3: 7.1 HIGH): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29458 *
CVE-2022-29824 (CVSS3: 6.5 MEDIUM): libxslt:libxslt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29824 *


