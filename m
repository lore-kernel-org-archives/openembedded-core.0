Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8386C433EF
	for <webhook@archiver.kernel.org>; Sun,  5 Dec 2021 14:02:59 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web08.37654.1638712979198430211
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Dec 2021 06:02:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=IRUzkzrw;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id o14so5359275plg.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Dec 2021 06:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=MHh+/wE2UeyJvYK7rGvE9554ny9TAOxht0DnSx2uS+w=;
        b=IRUzkzrw3SQ4Z4QgkJOyi5jf0csMfhMo796X6ViWQo/9fK3N3hgUY0v18ZWtFZww1t
         ZqyuSxCw024uTfRSK68B4o6I5oEMUHs0gaV7gylUajHSS9kC9Py7hp+yY2GwlRO/g19d
         hBCu2q0Gynao2aQLUNck3UqHwpBmWQLAwtUCMBfCyZ7RgvfFMX+tv+AqLQGcKRx6fEIr
         nKpPNJ05aqT2+74ZQ1Lwm+em/gpjimg+i8eu9bO5UucujC3KQznPZFNleNT8LtK3athP
         uBEPD48xmVtG+JAS8RCwqV3wc/1VKfZFqsGgIAZogT/1oFS6+sM27ToEGuTCjsCxJ+1r
         h3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=MHh+/wE2UeyJvYK7rGvE9554ny9TAOxht0DnSx2uS+w=;
        b=eSTJ/DoRv2YKC2ODhsA7RatEo9VaugjlSVg3nYY5uEk4bE3Blaps3UwPArG4z71Mp1
         PoKe3c+dgp81W1WdG7RFAIGXKxsk3575Klckkdfvy27hv0vMcoSBnSAo99gESWlb8eY5
         iSJ+aoFcPw+3Iqn79Z95ReFQcPJDPU+yu/bvz90RBJluyQNfMTrprFbvMorRF+1mgQ9k
         sggcytjPlkZS+ZSfwJRtCNp+0y0ygtX916BYqAQr1+Yyj8C5+csxpX/yBbNynXIKjDzd
         joLCZr5XCyspS2jCv1hmpuzroaOQEBQsmN1C/w7k7nbemKEXZzy1Q0eg3JMkJ7n9FDO+
         a85g==
X-Gm-Message-State: AOAM532y1Nu9jHCQcg27OKZ80KsfP4PzKPKSRfmYKmycJutzfojFL8t/
	HGzRcGBqkMTnT5PvEbh/21/TcdTDNiPHiFW2xAs=
X-Google-Smtp-Source: 
 ABdhPJwQAOZg1UlstUfnsbKfMNa5u3+i0pFueKMvsX6IiimHAZUN2vnxlOS/N1qM254qXxxLIzuo/Q==
X-Received: by 2002:a17:902:b20a:b0:143:7add:5ab7 with SMTP id
 t10-20020a170902b20a00b001437add5ab7mr36646384plr.71.1638712977864;
        Sun, 05 Dec 2021 06:02:57 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 i198sm9449088pfe.81.2021.12.05.06.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 06:02:57 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 50B9D9604A6; Sun,  5 Dec 2021 04:02:54 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 05 Dec 2021 04:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20211205140254.50B9D9604A6@nuc.router0800d9.com>
Date: Sun,  5 Dec 2021 04:02:54 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Dec 2021 14:02:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159192

Branch: master

New this week: 1 CVEs
CVE-2021-3984: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3984 *

Removed this week: 1 CVEs
CVE-2021-3968: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3968 *

Full list:  Found 10 unpatched CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-3682: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3682 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-37322: gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:gcc-source-11.2.0:libgcc:libgcc-initial https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-37322 *
CVE-2021-3974: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3974 *
CVE-2021-3984: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3984 *
CVE-2021-4019: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4019 *

