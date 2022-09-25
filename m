Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E207C54EE9
	for <webhook@archiver.kernel.org>; Sun, 25 Sep 2022 15:03:51 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web08.17691.1664118225812434915
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 08:03:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=VnatMljl;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id rt12so4214737pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 08:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date;
        bh=4ADn4/Mm1UPRr/tVcCAuHVOvxX8PfF5Iv2b45JQDsBg=;
        b=VnatMljlZL1WgVge6TralCRn+kTqUuNyCqPobcZz6rXrbCmUi+y9vrYo3mvW+tCEag
         OhvfBXJkLkTr5RDy592tFTr1CCImCCXkXBr9amANEEcWyVwjKvX2m9a1OJgF1S7JlQ8J
         tWO4BqRnlZmGGqhWdzDytqQ/ZgpnkKQt/S8nsgrWW5a7u5LGbU5hygbxeSDAUrxR6ZbD
         BUkiP004L+m4smffDmDnkV2E4mirWGoPrbNsJCckzMiyuwr57LGDJmy0+0HOQyfuzwHd
         0NAP6/8doKPVhy3YrAba0bFJlSbTldGnhdP7n3pyBIylMpSYGUvU3gI1CwSSdiAl89xP
         1bRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date;
        bh=4ADn4/Mm1UPRr/tVcCAuHVOvxX8PfF5Iv2b45JQDsBg=;
        b=kWqQlq9QJTnKMwtEi9V1ZjjMMl0JY7luyLbx7AAWNgVySzIg/wkh/A/1C78kD5kNAE
         JLRup80wpHMFT66z+05CpLWMVCTubq+a4OoreReLLefg19B0uy7bTilgrTdIQHJV8g2g
         nTQET7xYv/ZUpGgvzczb2XJ6v7n9C+q+L1yBjiZjmzcOBjWoZqzD+RHtksDHYh4l+jD/
         ZTMbptVUmajHtnt1xDEn5Y4aP+JiuNwpJhplSuIYP8sHpGe49LFirHd98eJBlSV/4pM2
         yAzVjpy27idoU3coQi4apOw0o1CXU9vRRvD4KTQnk6EFM16vD7Bb+/ZYNi2qMxYTdXwe
         AdiA==
X-Gm-Message-State: ACrzQf2P6sIGd0m82AQtJ1uHd7BUG36rx49oI08GKavWoHql1Squ44xF
	MHbUyqRMf9aUgIx6GBopLDHF0Wu8FDlzq2Ba
X-Google-Smtp-Source: 
 AMsMyM7FsYpTaKPq+CdoF+ZxgCUg0fIddO9KeWO2AzveH0hg2vP8ABAC9CVT22PCO9f+iG2B9nksZw==
X-Received: by 2002:a17:903:2282:b0:177:faeb:3606 with SMTP id
 b2-20020a170903228200b00177faeb3606mr17906312plh.135.1664118224492;
        Sun, 25 Sep 2022 08:03:44 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i63-20020a17090a3dc500b001fdcb792181sm4867244pjc.43.2022.09.25.08.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 08:03:43 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id DAB769607F6; Sun, 25 Sep 2022 05:03:41 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 25 Sep 2022 05:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220925150341.DAB769607F6@nuc.router0800d9.com>
Date: Sun, 25 Sep 2022 05:03:41 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Sep 2022 15:03:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171012

Branch: kirkstone

New this week: 8 CVEs
CVE-2022-2795 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2795 *
CVE-2022-2881 (CVSS3: 8.2 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2881 *
CVE-2022-2906 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2906 *
CVE-2022-2962 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2962 *
CVE-2022-3080 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3080 *
CVE-2022-3234 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3234 *
CVE-2022-3235 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3235 *
CVE-2022-3256 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3256 *

Removed this week: 1 CVEs
CVE-2020-35538 (CVSS3: 5.5 MEDIUM): libjpeg-turbo:libjpeg-turbo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35538 *

Full list:  Found 23 unpatched CVEs
CVE-2018-25032 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-25032 *
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 7.8 HIGH): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 7.8 HIGH): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2021-3611 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3611 *
CVE-2021-3750 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3750 *
CVE-2022-27664 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27664 *
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
CVE-2022-3234 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3234 *
CVE-2022-3235 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3235 *
CVE-2022-3256 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3256 *
CVE-2022-32893 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32893 *
CVE-2022-39028 (CVSS3: 7.5 HIGH): inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39028 *
CVE-2022-40674 (CVSS3: 9.8 CRITICAL): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40674 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

