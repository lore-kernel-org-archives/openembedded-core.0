Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC82C433EF
	for <webhook@archiver.kernel.org>; Sun, 20 Mar 2022 18:22:24 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web08.21099.1647800542794113966
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Mar 2022 11:22:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=yzwMznsc;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id bc27so8810843pgb.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Mar 2022 11:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=ez3lT8Ri/l3iT0eYH6XQpSXMo6sxrdBarw8hpmQKN84=;
        b=yzwMznscyp7oo+55pEqvq/4RGW+fhyqDicqxg5Eb/DG32k0GixvkT4v9nKYymasuxh
         xiNRpsO+e0FCwYFhka3oZOLvFALjQfHaALLpbtdgL+c2j6fPcw3amAjG5/7GTdcnwMdc
         PAUmRhRM1dbCnfh4HhachxuhyTf161lZlG35lhEpnJ4XG5G4pnx4EPJkH//riLEIMbzZ
         XWCp0T6DiEOgqSMP1nhO1WSIMpM1YrviQvMix02OEmRG6xqNKgV2dOUi33tDWq43PJE4
         0Hen67xSbtLPb9BiB+MbgrTfh7in2PgnwoTEUp+KrxW7acpft+vOngU3oloaD+zYkxqc
         tS/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=ez3lT8Ri/l3iT0eYH6XQpSXMo6sxrdBarw8hpmQKN84=;
        b=0ToY48m2Rz/wDJ2kqBj0zSSnUGgYvGsh1ktGBHLL/xp/XFgwzadYcpHbKPn7XkrdZl
         1YqJIJz3O0SW/GmynGnlroOwQRhKDnU+6zqWs7719qcwTW2h383aOBkq/MTWFyxZHFFH
         WvRRqUpjRdlNcTHOS7c3mKBRfJvLBHp5RhiYLXNohe9vzJnd+BLJ/WZzOCETc/vKXsOu
         vx2U0Q0Zp59UjrXlyLH6SSIMYA6xF92UCSiNx841Vw9WHQrgEEaxsfyialzpdUkNZgdg
         2aOgcuL6s9tzfkpDLBJBa14gDXIC8sW9IoG7k7aHMGQq+6iT2xEPo4K98V78whWSq0Jp
         xB/w==
X-Gm-Message-State: AOAM5320Ql+H+mZqggO2P8hIdREkfTU84aB07Bf8u/vyDI4lkeOBggHt
	MeCw0Uaaxo0zchRMIydEPrs2j9G4SsFgAXgmlPM=
X-Google-Smtp-Source: 
 ABdhPJyhEJsTCLPYZCEMHJQ6omJdC7wyaGoKnZCNpZLrC+XSuhWrlLDJiMi5JQ/uxaaD76ebeYW/cA==
X-Received: by 2002:a63:6b83:0:b0:380:102:8779 with SMTP id
 g125-20020a636b83000000b0038001028779mr15648289pgc.42.1647800541869;
        Sun, 20 Mar 2022 11:22:21 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h6-20020a636c06000000b00363a2533b17sm12408096pgc.8.2022.03.20.11.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 11:22:20 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 369AB9604A1; Sun, 20 Mar 2022 08:13:36 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 20 Mar 2022 08:12:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220320181336.369AB9604A1@nuc.router0800d9.com>
Date: Sun, 20 Mar 2022 08:13:36 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Mar 2022 18:22:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163484

Branch: master

New this week: 7 CVEs
CVE-2022-0865: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0865 *
CVE-2022-0891: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0891 *
CVE-2022-0907: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0907 *
CVE-2022-0908: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0908 *
CVE-2022-0909: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0909 *
CVE-2022-0924: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0924 *
CVE-2022-26488: python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26488 *

Removed this week: 0 CVEs

Full list:  Found 14 unpatched CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-44647: lua:lua-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44647 *
CVE-2022-0529: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-0865: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0865 *
CVE-2022-0891: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0891 *
CVE-2022-0907: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0907 *
CVE-2022-0908: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0908 *
CVE-2022-0909: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0909 *
CVE-2022-0924: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0924 *
CVE-2022-24975: git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24975 *
CVE-2022-26488: python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26488 *

