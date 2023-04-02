Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91AE2C76196
	for <webhook@archiver.kernel.org>; Sun,  2 Apr 2023 13:32:58 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.44496.1680442369570307314
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Apr 2023 06:32:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=azR2esXP;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id o2so25604256plg.4
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Apr 2023 06:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680442369; x=1683034369;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EyPimM4my/o6L08xXDedm7Dx2ujPfv7Di/zYk1gYUaw=;
        b=azR2esXPlJ7PRZ39tY8yczPeTuXCKWKB1lgVVHgXfgR0cSJj8CFznpWdTSN2wBetIS
         YXXfH4QDAxXPtmZ0cJsLM76Fo8A5mJSY+4koyoBvlIIo9zHlpIoDQn/koYyY1r4bLTXY
         z6y4wwXl1w7qKqi0+Z1/WeTp/50Ayg63M3sROe4gfUQpKyXNn5rsfA+2jmCA0JWgGRkw
         zsftwfTCzyL9AYfIAdDejQ8FD8FzjvneI1qQezVxbBnHHZ6YjzGZZHKOS80OREHi5NJm
         QmVLjIMMs4SVomaTxN94EE2JRgqFsQ23hHD1FhxW6gmhB3RFzo4CFDKY5JYBXN3Fv1n0
         eezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680442369; x=1683034369;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EyPimM4my/o6L08xXDedm7Dx2ujPfv7Di/zYk1gYUaw=;
        b=sIZbZ+bza/fJ7k5U+hw7lO+pVb5WdY0bWym2Ta8Z8B/Zc/bgFmCZdpOYh6GQ2ZuIwh
         p3iJkziCFe4w+DQAVqLBEYZWlTAIo+pPb1eP5ihRRiiHZl6sUogWa7Oj0VhWHMQb01KP
         rdNSJDAa5Y5xHYKMnbohKz+YfrBTo3orZufBysQ0sMR+/mEvyePwqAzCRUsoECOJ4ODH
         NEnO6w+PaHU+j2+sqocGtL0cyZzbUWETz8u+vFirmwYnSki6arfQZLamlqNp1SDe78uJ
         viXXu/H+2059fr8nz5bJ3WAD1jo5mw9zYBXn4tr/iA1xXAl5g+XySKRhc5EtE7XG2OcM
         Rfaw==
X-Gm-Message-State: AAQBX9f3yor8UbDShCGMROltk8tytPzSKyB/5Q/Jlg7gyVrTc68Ij4Ih
	qG08txDU3+5qB+ozqKaBLr60SvfJ9FPM5m4WUuo=
X-Google-Smtp-Source: AKy350bQYmDE6NaJSbPUkm5hhCkPgZ44LYGsSaqdW+wWsRvPPoQjWkCEamk7fVqc4whyNiYB5DvnOg==
X-Received: by 2002:a17:90b:3811:b0:23b:3d6e:1ed with SMTP id mq17-20020a17090b381100b0023b3d6e01edmr36665622pjb.13.1680442368558;
        Sun, 02 Apr 2023 06:32:48 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id cm16-20020a17090afa1000b0024095afa776sm4579321pjb.20.2023.04.02.06.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 06:32:48 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 2F963960320; Sun,  2 Apr 2023 03:32:46 -1000 (HST)
Subject: OE-core CVE metrics for langdale on Sun 02 Apr 2023 03:30:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  2 Apr 2023 03:32:46 -1000
Message-Id: <20230402133246.2F963960320@nuc.router0800d9.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Apr 2023 13:32:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179579

Branch: langdale

New this week: 1 CVEs
CVE-2023-0464 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0464 *

Removed this week: 1 CVEs
CVE-2005-1796 (CVSS3: N/A): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2005-1796 *

Full list:  Found 27 unpatched CVEs
CVE-2020-10735 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10735 *
CVE-2022-3219 (CVSS3: 5.5 MEDIUM): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2022-37454 (CVSS3: 9.8 CRITICAL): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-37454 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-40897 (CVSS3: 5.9 MEDIUM): python3-setuptools:python3-setuptools-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40897 *
CVE-2022-42919 (CVSS3: 7.8 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42919 *
CVE-2022-44617 (CVSS3: 7.5 HIGH): libxpm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-44617 *
CVE-2022-45061 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-45061 *
CVE-2022-46285 (CVSS3: 7.5 HIGH): libxpm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46285 *
CVE-2022-4645 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4645 *
CVE-2022-46908 (CVSS3: 7.3 HIGH): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46908 *
CVE-2022-4743 (CVSS3: 7.5 HIGH): libsdl2:libsdl2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4743 *
CVE-2022-4883 (CVSS3: 8.8 HIGH): libxpm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4883 *
CVE-2023-0464 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0464 *
CVE-2023-1544 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1544 *
CVE-2023-23914 (CVSS3: 9.1 CRITICAL): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-23914 *
CVE-2023-23915 (CVSS3: 6.5 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-23915 *
CVE-2023-23916 (CVSS3: 7.5 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-23916 *
CVE-2023-24329 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24329 *
CVE-2023-25358 (CVSS3: 9.8 CRITICAL): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25358 *
CVE-2023-25360 (CVSS3: 9.8 CRITICAL): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25360 *
CVE-2023-25361 (CVSS3: 9.8 CRITICAL): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25361 *
CVE-2023-25362 (CVSS3: 9.8 CRITICAL): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25362 *
CVE-2023-25363 (CVSS3: 9.8 CRITICAL): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25363 *
CVE-2023-28531 (CVSS3: 9.8 CRITICAL): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28531 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

