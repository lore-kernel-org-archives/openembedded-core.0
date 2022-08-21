Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFFF1C00140
	for <webhook@archiver.kernel.org>; Sun, 21 Aug 2022 13:03:48 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.6377.1661087027656117984
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Aug 2022 06:03:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=za/1596+;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id 2so7774539pll.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Aug 2022 06:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc;
        bh=3O6qRwK5ebEepZ7ryTxKoVHTzXw5G+bNbNuP/J7l4BY=;
        b=za/1596+djaD8ERuFPbuGmydhgShcSxt09HcInHkd2+TYtnHHjKHFoK/+tr8o6+jVh
         GfJRbIXl6XvrWuV2rJxml82KL2PDeWY3o/jbzMLMNgcHxqEfs6EQjdWy5C2HAiaMqRqt
         MP1zqtZtKDdUyq17CTq+e1jumy32VQER0Y3EiVivJTMBtmg5sDzx9h15NdcgwZfY/yL/
         FoP938l7g+zlJvYf1da90ZGaQSFaJ/psfXx4xOHKNybdAiXF/LpNV8U2uMteJgKjINZr
         oARuY6QrPeCAvPgVsQvvC0+C5cvH1j1r+RgpxxnP707W0iH7fBYJ1qNlCROBdbjT8KJQ
         IlyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc;
        bh=3O6qRwK5ebEepZ7ryTxKoVHTzXw5G+bNbNuP/J7l4BY=;
        b=fhPZP5YwU3vGPksK/fjl3CTxG9CxHA5tMuyM+iEKjZ9C5VNoiDVRC1pWl/XD3VSAwv
         pNqbTVQy/sSrs0UMj53Xn7LEPt6p9pSy9LlJaRkjq8lDY5Ws/tUXgTSVYXO+JER8RbN4
         cXEYK67bw7qoXnFjOK6zKuZKetF4ObmJ48plFgcX0IJ4JSutwzs1ERJTp+GBaxtFlSYC
         DNfrQNPpksLN8VR5lfTrAe2k7BzHnxmx3F7gr3hLjzYOHqm4K6Cl2VGjyLbcDa5fl12/
         3dTvnVfw3sK6kviotfJJznxwdaMbllR5e4WbaAVwi/rNNBazyN6lW2WJMa7Pyhbl1Em8
         b4uw==
X-Gm-Message-State: ACgBeo0h9KC9XTq+Ey8a+8DNIcWdVnfGNSm1mBc04d3Tp+rTlT9Rn6FX
	NhZoJIxTE3RUl0+Nfd6Of7AUa/iIVPtWjKBE
X-Google-Smtp-Source: 
 AA6agR46lRdYp//NJmElIx7zhUVZ6q9Nr9oOt5Qhq0V1R//qgsLZ/2Ieg0Pz5YbQV0/E62pAkjKJLw==
X-Received: by 2002:a17:903:514:b0:172:dab0:b228 with SMTP id
 jn20-20020a170903051400b00172dab0b228mr4568527plb.170.1661087026478;
        Sun, 21 Aug 2022 06:03:46 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 p16-20020a170902e75000b0016ee3d7220esm3074316plf.24.2022.08.21.06.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Aug 2022 06:03:45 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id E6AB796070D; Sun, 21 Aug 2022 03:03:43 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 21 Aug 2022 03:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220821130343.E6AB796070D@nuc.router0800d9.com>
Date: Sun, 21 Aug 2022 03:03:43 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Aug 2022 13:03:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169654

Branch: kirkstone

New this week: 13 CVEs
CVE-2018-25032 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-25032 *
CVE-2022-2816 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2816 *
CVE-2022-2817 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2817 *
CVE-2022-2819 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2819 *
CVE-2022-2845 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2845 *
CVE-2022-2849 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2849 *
CVE-2022-2862 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2862 *
CVE-2022-2867 (CVSS3: 8.8 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2867 *
CVE-2022-2868 (CVSS3: 8.1 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2868 *
CVE-2022-2869 (CVSS3: 8.8 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2869 *
CVE-2022-2874 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2874 *
CVE-2022-2889 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2889 *
CVE-2022-32189 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32189 *

Removed this week: 0 CVEs

Full list:  Found 28 unpatched CVEs
CVE-2016-3709 (CVSS3: 6.1 MEDIUM): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3709 *
CVE-2018-25032 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-25032 *
CVE-2021-3611 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3611 *
CVE-2021-3750 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3750 *
CVE-2021-46829 (CVSS3: 7.8 HIGH): gdk-pixbuf:gdk-pixbuf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-46829 *
CVE-2022-2294 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2294 *
CVE-2022-2509 (CVSS3: 7.5 HIGH): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2509 *
CVE-2022-2571 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2571 *
CVE-2022-2580 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2580 *
CVE-2022-2581 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2581 *
CVE-2022-2598 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2598 *
CVE-2022-2816 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2816 *
CVE-2022-2817 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2817 *
CVE-2022-2819 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2819 *
CVE-2022-2845 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2845 *
CVE-2022-2849 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2849 *
CVE-2022-2862 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2862 *
CVE-2022-2867 (CVSS3: 8.8 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2867 *
CVE-2022-2868 (CVSS3: 8.1 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2868 *
CVE-2022-2869 (CVSS3: 8.8 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2869 *
CVE-2022-2874 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2874 *
CVE-2022-2889 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2889 *
CVE-2022-29154 (CVSS3: 7.4 HIGH): rsync:rsync-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29154 *
CVE-2022-32189 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32189 *
CVE-2022-32292 (CVSS3: 9.8 CRITICAL): connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32292 *
CVE-2022-32293 (CVSS3: 8.1 HIGH): connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32293 *
CVE-2022-35737 (CVSS3: 7.5 HIGH): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-35737 *
CVE-2022-37434 (CVSS3: 9.8 CRITICAL): zlib:zlib-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-37434 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

