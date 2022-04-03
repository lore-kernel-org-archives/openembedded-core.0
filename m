Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0C0BC47096
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:42 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.24423.1649000804511236606
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Apr 2022 08:46:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=qGM0MV9P;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id
 mr5-20020a17090b238500b001c67366ae93so9341342pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Apr 2022 08:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=n5Sp4J97Nn6tS8qgOCL34cQaDLuBinAIxQq9qgXfJ9k=;
        b=qGM0MV9PzhYYNwYHF7wH9hlkgjYAvtv/CLS4divilOz4fVQx1cAw4rYxsXo7VlGdL1
         o0WwDlJ0PoyFlmThQCALUCPVLDVl1NsJbypyMFygXKyH55QgmwJp5Xb408L2brJO3dsr
         PU21mH/r317LJzrC0brS9QIWNXdlSiI/9BxWPNOU5BMSngDgKSrAWkF8WV+9U8m0QGg6
         NR0oOTv1Uq5sENUCokO+e1yQtqbU0NGAqG03oMhtIiV47PIb2Z1+78ld7CAJk0InjdIY
         b7XypHklxfKxj1vFrdbJSbKg6kGwcuyR83H2rdAV2Lfz4J3lCABRHkvUqCF4wg+qg6cd
         PoMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=n5Sp4J97Nn6tS8qgOCL34cQaDLuBinAIxQq9qgXfJ9k=;
        b=Afdl8C3OqbUOVSRBTRkAysILeHooSiQUGWc5hcrb0Tk83aQrvV0ZDPZmENt6FBvyWC
         OKPDhcz806Kzwl2ocvVMTdG29dz98VIWrHtkTC90V1NyEbd35Ad/btBsjYbgHbIyCpBs
         ywvKhnRxSl62FadkljlI0gYsE7h90WiLwsAvckWSdjvDwAbZGjyqcSOOUwjzF6+ZTYKB
         l1oGSYtff9tyf7jk9aGIyFuKzxjw90DYTMWNijGkPzISx7h9M1KcRQL7WUw3OgJB2mQI
         tL+zNZOXKHWhjS3VwcO2MxCrHRJKmSt6VBIJFmTy9r4y7FvzaGvf5UIygqXtIkbCuy1x
         GEAg==
X-Gm-Message-State: AOAM532rUet10z1L5tk9BAAWN/l01nob50hJ4cG128+gY5q6r9D8uA0u
	1w+FTHYFg69l9Rxb6G2IT5T4Mo7xesfpGjVtcUc=
X-Google-Smtp-Source: 
 ABdhPJx/ryrfOaVhRX1Wb2TbDdJN9lu55yd2bpEXtyWgy5jT6k/25cd4ADfFlFbSXNUMUumRnDoE4A==
X-Received: by 2002:a17:902:b488:b0:156:509c:5c42 with SMTP id
 y8-20020a170902b48800b00156509c5c42mr19366403plr.2.1649000803548;
        Sun, 03 Apr 2022 08:46:43 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p13-20020a056a000b4d00b004faecee6e89sm9443175pfo.208.2022.04.03.08.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 08:46:43 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 47A7396277B; Sun,  3 Apr 2022 05:46:41 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 03 Apr 2022 05:44:57 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220403154641.47A7396277B@nuc.router0800d9.com>
Date: Sun,  3 Apr 2022 05:46:41 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163964

Branch: master

New this week: 0 CVEs

Removed this week: 3 CVEs
CVE-2021-46705: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-46705 *
CVE-2022-26353: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26353 *
CVE-2022-26354: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26354 *

Full list:  Found 9 unpatched CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-44647: lua:lua-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44647 *
CVE-2022-0529: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-0943: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0943 *
CVE-2022-24975: git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24975 *
CVE-2022-27191: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27191 *

