Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E7EEC433F5
	for <webhook@archiver.kernel.org>; Sun, 20 Mar 2022 18:20:40 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.20976.1647800438752508173
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Mar 2022 11:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=V4wS4XIn;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id
 o68-20020a17090a0a4a00b001c686a48263so6142209pjo.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Mar 2022 11:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=ez3lT8Ri/l3iT0eYH6XQpSXMo6sxrdBarw8hpmQKN84=;
        b=V4wS4XInst24iSvTq/TU/rEbz1ff0PSJTXeFDFvA9JgsZprcehNR3QKEBqnhWajbr7
         rUXbc3Gp6Rt+hBpburlKBF7n8+IA7eCo2CX7hFXVWrXe2+G4CJJbtJIbDEPFLavsH9N5
         QocVgBNE6HqZK2Uqm3vhqGWTn7WW2omHLDdvKcSSIDhVRsr2sQPdayescuhJoaag7MSe
         TZP7wxKsAyY3UH/HeCOIgeZ/vh3gf1S9xJYg4+sGcJmZso2jAjPjg0kkxJCWOZXngYdh
         TUCh/rw589HfSmiWMMSdij/YKmt1hqmL/hoaJJusn5WYV0uTsWG+80+bonBJjhlLdFya
         cOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=ez3lT8Ri/l3iT0eYH6XQpSXMo6sxrdBarw8hpmQKN84=;
        b=TEveit8f/0It8aa+O6Bww6Bp1UupaTIoUv4nysVxrfEwcF4LaODSLw+IQ03dqY85K+
         LAwsf/lkAbQKLORb2xlWUkoJoWRX21fBdoQgRxON0AHwOZfxHJudrNDdE+nblgVBlk4e
         7OHRsCdHHOVrdFmay6NTSBIidWtn+cL3ks/lhfNCf2QRsTL+LtnTK8MaGeXbbst5fC23
         yUleYNrdZXUNWsVyF8xXPgSDqb1Glbk/AojqS/+UXG4a2EUjQqJQd/qT/Qvlbr5xL/Q/
         9Nii+sjarF9py94eZyWaTmLTdqDOJk7zChPGgKM/r0hblDbcSQNTtkFZf/DT6++IyXO4
         SJAQ==
X-Gm-Message-State: AOAM533z+jV+Xr5MM0GqK+qF7meRThmHYLSApjTZaWQglGczk2AtVhri
	zsiZgrIBLzhhr67Xov68cW+3YVzv/iecrkPoxw4=
X-Google-Smtp-Source: 
 ABdhPJwvZmXBHwdaKlPgwuvZE6kLTR4I51fcFG7Z+cS8QCwnN6QKqbwaQlqrvVSuC+Omp/I+m6QQUg==
X-Received: by 2002:a17:90a:ab17:b0:1b9:b61a:aadb with SMTP id
 m23-20020a17090aab1700b001b9b61aaadbmr21910325pjq.77.1647800437923;
        Sun, 20 Mar 2022 11:20:37 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 j11-20020a056a00234b00b004f7463022absm16552774pfj.208.2022.03.20.11.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 11:20:37 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 8394696049B; Sun, 20 Mar 2022 08:20:35 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 20 Mar 2022 08:19:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220320182035.8394696049B@nuc.router0800d9.com>
Date: Sun, 20 Mar 2022 08:20:35 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Mar 2022 18:20:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163483

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

