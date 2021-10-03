Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCD95C433F5
	for <webhook@archiver.kernel.org>; Sun,  3 Oct 2021 15:03:26 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web12.23493.1633273405454618931
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 08:03:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=5OAZnsx4;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id s55so11270763pfw.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 08:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=YnIiyG8hsYWUL/+m3eMuaxsBCiYB+6x9vk4DLpQ4xJw=;
        b=5OAZnsx4MpTkuHKWTwgZ6IyKLRIkoUNRUYfjyvTDvWyHpLoY4hZMNRMDdcUenp6TtF
         M2l1JX08mdTIFxPH6PPqBF6fldkI5nVYaBKyGEvHoc5+8fAnUy/yuwd8/qdmHVVFllOT
         b1WhnpSSlpD+pCNB6hBeAEWwwJs9TL9KR1eF706eM4OmthJiL6kDxCqO3/mpuCE62IAe
         cZHxwn4/m0jq6UTjgTFuiIkyeI4HIZmR6eqRZsNtJVxBBAIaTSYsDnPqqun4By6Na9Yo
         CnfOJgwjt0iQTrlREW+1o4U3buktgt3pKWwkjUf1TmHqGF4akcSEiWEezv40srMhLyID
         9iyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=YnIiyG8hsYWUL/+m3eMuaxsBCiYB+6x9vk4DLpQ4xJw=;
        b=KNF+aoeixuYmNbec6CAHFvQw600fA+/0zDnu0CxGcXgFadE/0ui06JoVyeAphOVydo
         X/YydIrzpB+1q8fwa/bldt+QfLs7vRihiZV7bojBCE6IcUCGF4SNSMw60/Oe1PWrXxDn
         indNA0IbinJgJ+XSXT+MDuUkIS46zb5NZWgSqufyNEojBvg6VhmiPEJr8oBCAFKpzWr/
         ncgk7VXmyMf6Fax2eHUFBrxOdOUTrL1wfukmClVFeq0Dk8AN3jllqxu4w7CzR6RXpjGE
         gumXwuNWFuZSlWW+ZinnayUkPBeRrNcnBiGuTOyCCfNqeMVjNeZgnwQTOvLggjYWRkgq
         pbJA==
X-Gm-Message-State: AOAM531U7MQbxYMFi+V+X6MkAErdLf0e+B4evuoz/kSOM8i7ifvzRy2L
	it5i+9aC+yF65b7sjNLG0Sqgajur8Rd3rw/vBOw=
X-Google-Smtp-Source: 
 ABdhPJxrim5aRxR59CnvEZm5eyp5tYIJP6vbJU5K9S6Za6ttYdAEaDMwZrj8DMyHqj2b4ytO9jnB3g==
X-Received: by 2002:a65:6084:: with SMTP id t4mr6944467pgu.25.1633273404218;
        Sun, 03 Oct 2021 08:03:24 -0700 (PDT)
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id
 d5sm10435105pjs.53.2021.10.03.08.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 08:03:23 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 756E7960398; Sun,  3 Oct 2021 05:03:15 -1000 (HST)
Subject: OE-core CVE metrics for hardknott on Sun 03 Oct 2021 05:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20211003150315.756E7960398@nuc.router0800d9.com>
Date: Sun,  3 Oct 2021 05:03:15 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Oct 2021 15:03:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156555

Branch: hardknott

New this week: 4 CVEs
CVE-2016-20012: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-20012 *
CVE-2021-33833: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33833 *
CVE-2021-39537: ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-39537 *
CVE-2021-41617: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41617 *

Removed this week: 1 CVEs
CVE-2021-3778: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3778 *

Full list:  Found 32 unpatched CVEs
CVE-2013-0340: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0340 *
CVE-2016-20012: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-20012 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2019-6470: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6470 *
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
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-33833: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33833 *
CVE-2021-33928: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33928 *
CVE-2021-33929: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33929 *
CVE-2021-33930: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33930 *
CVE-2021-33938: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33938 *
CVE-2021-3445: libdnf https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3445 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-3682: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3682 *
CVE-2021-36976: libarchive https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-3770: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3770 *
CVE-2021-39537: ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-39537 *
CVE-2021-40491: inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-40491 *
CVE-2021-40528: libgcrypt:libgcrypt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-40528 *
CVE-2021-41617: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41617 *

