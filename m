Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2DBBC433FE
	for <webhook@archiver.kernel.org>; Sun,  2 Oct 2022 13:04:03 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web08.7258.1664715836559559045
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Oct 2022 06:03:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=UTLAWed9;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 129so7709263pgc.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Oct 2022 06:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date;
        bh=x6zSxqkNht5d1hqpYaFHuw3F0aB6sT1HgIPVeUDLbLc=;
        b=UTLAWed9/fv0KfzN5k5hJWdwy8qcypdokoMkkt9WgmP1T8E3Sl/QXFsTk9s739UhBo
         JjR344tilOdOkmuVu0S8UZ215UDNtlpAwXBFXKAy6LrBvPbpxGOvqvPBlBcXaQ1x2PV8
         norFZllc6XWtLPfMT92dMowzNGVWVK+6VyGC8cEgh5r7POvm2VJ4wzWaI+k7KIghVtv6
         RRw9qYMtmw/iGMjJ1vPwwblNzaDcP704F0nH4fkmsLdkSTj3XkV8+J8jUw6h9cW+7Nly
         S9zhIwglgbpJzsTO52ZsKH/BJaHRF0zf/Xpm7KMlVbcU/e9JLup1hiNkBhlg0x4R4rYL
         q12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date;
        bh=x6zSxqkNht5d1hqpYaFHuw3F0aB6sT1HgIPVeUDLbLc=;
        b=xS+zZYSf5RiygVumqwIKlmbYvFVKMzmWVBjPnSTWzlTfsmDZBDJu5kuoV3LeVQ/xzX
         hGNB4NyQQPblRTFjphSfo9UN+3oDiyX0GW6htER1IvcLeNFfVpuby4xY623M70ldCR/+
         J0arbkwQFEeFYZFwyf+3HLktcdF3HKpuNPwQaOU7XApxUFDRpUL8yu7/yiUbSvO2G2jX
         2cE/bMeJfidPh5YckVA4pz127Bef/VjU8R+snj8lLfFIkczXEsk/BFEKsjZMGd95zjZ+
         KexyzANFNItsblpto1ZTgj24vmQs4hwQTtjLXC/t7dgmVgX87T1oQGzo/TGQGhnosRVJ
         J75A==
X-Gm-Message-State: ACrzQf1Tbx6SOgqJE7zUhoH2JQg/ElizSYU7dSexawdSCD/HqTblNr/h
	XNVV4TpLjsIOYB2wOxmbrWPXHjoWwpusEIkC
X-Google-Smtp-Source: 
 AMsMyM6yLpP+OkyihnBJmcVlABoHpVeJkNgVXW9cv0V2u4u65yFeFMqlwdEpxdlBfCRoUygfVpjjbQ==
X-Received: by 2002:a63:4e16:0:b0:43f:3554:ff9c with SMTP id
 c22-20020a634e16000000b0043f3554ff9cmr15151236pgb.578.1664715835546;
        Sun, 02 Oct 2022 06:03:55 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 u125-20020a627983000000b0056076ebb9d2sm1825125pfc.80.2022.10.02.06.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Oct 2022 06:03:55 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 042E7962332; Sun,  2 Oct 2022 03:03:53 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 02 Oct 2022 03:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20221002130353.042E7962332@nuc.router0800d9.com>
Date: Sun,  2 Oct 2022 03:03:53 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Oct 2022 13:04:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171353

Branch: kirkstone

New this week: 8 CVEs
CVE-2021-3782 (CVSS3: 9.8 CRITICAL): wayland:wayland-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3782 *
CVE-2022-3278 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3278 *
CVE-2022-3296 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3296 *
CVE-2022-3297 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3297 *
CVE-2022-3324 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3324 *
CVE-2022-3352 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3352 *
CVE-2022-38127 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38127 *
CVE-2022-38128 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38128 *

Removed this week: 6 CVEs
CVE-2022-27664 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27664 *
CVE-2022-3234 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3234 *
CVE-2022-3235 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3235 *
CVE-2022-3256 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3256 *
CVE-2022-39028 (CVSS3: 7.5 HIGH): inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39028 *
CVE-2022-40674 (CVSS3: 9.8 CRITICAL): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40674 *

Full list:  Found 25 unpatched CVEs
CVE-2018-25032 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-25032 *
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 7.8 HIGH): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 7.8 HIGH): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2021-3611 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3611 *
CVE-2021-3750 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3750 *
CVE-2021-3782 (CVSS3: 9.8 CRITICAL): wayland:wayland-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3782 *
CVE-2022-2795 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2795 *
CVE-2022-2867 (CVSS3: 8.8 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2867 *
CVE-2022-2868 (CVSS3: 8.1 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2868 *
CVE-2022-2869 (CVSS3: 8.8 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2869 *
CVE-2022-2881 (CVSS3: 8.2 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2881 *
CVE-2022-2906 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2906 *
CVE-2022-29154 (CVSS3: 7.4 HIGH): rsync:rsync-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29154 *
CVE-2022-2953 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2953 *
CVE-2022-2962 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2962 *
CVE-2022-3080 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3080 *
CVE-2022-3278 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3278 *
CVE-2022-32893 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32893 *
CVE-2022-3296 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3296 *
CVE-2022-3297 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3297 *
CVE-2022-3324 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3324 *
CVE-2022-3352 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3352 *
CVE-2022-38127 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38127 *
CVE-2022-38128 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38128 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

