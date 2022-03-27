Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B5E4C433F5
	for <webhook@archiver.kernel.org>; Sun, 27 Mar 2022 16:03:19 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web12.340.1648396998479309350
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Mar 2022 09:03:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=mRyrKFzV;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id y10so7152122pfa.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Mar 2022 09:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=IDzh3+rYAopnhamKxW2WbKnFdW4z+12In17tSWy29Gc=;
        b=mRyrKFzVW1nmdqkRXbGcp8GzDQwMtSFFUhAWOnojZ2RiTA3NIFiPx4B8mnC3cmn1xh
         srCMoh0j9LfPy51zyHmoa2yfEBjcti2QByXh48eumO0lMxQIcHqtpe7+fCAD1N0FpwN6
         fyVk9AJrSHWSJZm4xsuF19MJxA4wQrmr81+GMnKjDpWJWei3isSJFzWE0zaVseNj9icJ
         gjvU7zcv/fm1Hhoszhda3Gs/9t2kTLtryqkAs3CsRj0wrDSvk/8ipe5j2mhRFjgbSqS1
         T1LwnCKOYZyglIH52mwPz5hchc1oyJGW0wZjX86uxbhMPxDmxHbrqeLmMsaJeXxISiw5
         ER3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=IDzh3+rYAopnhamKxW2WbKnFdW4z+12In17tSWy29Gc=;
        b=3/QN4HtQwgBzHSA5DvmEdx5A3mfB1HaMf4/wn22srypIquECIrR0tV6aMU17phyQBK
         RASJGVS2q0BnXDLVkTVkmVqFTWXEk3oCxd1zJz3T5m2LBfQBOK6I2WSvZ+lp4/IQkSgn
         5SiQazNB8Ydyq/Zs8ZyjyCeCYl9YoqVTmFzvqKUyqbjx2DcPPVLXyeg8/O9hIbttWTha
         Y/bngP1NAD36TlkBn7T27t/zEjnQZ5kCnILcVGSyWPWjK+d+qEnIQH1Q3LaE8sTRPfCm
         Uk+C8xBq0YuCfl37Z9KqFpEehP3sxhhiPnL0/5YS8TCCcLFN3oMnoopEJ6W6z41N3sJO
         tiLg==
X-Gm-Message-State: AOAM5339v/2mpjZBeQBXSzX383fzY2CI6A338FwiWpPshIYnEVYMKGg6
	WXr2r/gR+JO3EK0Yl6jzwReGpZWxqv2STJGOd7Y=
X-Google-Smtp-Source: 
 ABdhPJwT+APNm8mHEzHUBgH3ZYY/pBXDfTb3ZYG225cysCqZ/juRSQDs0o7asuY4MvBqSFOPIwfgxg==
X-Received: by 2002:a65:6a08:0:b0:382:1af5:a4cb with SMTP id
 m8-20020a656a08000000b003821af5a4cbmr7044967pgu.398.1648396997396;
        Sun, 27 Mar 2022 09:03:17 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 w13-20020a17090a5e0d00b001c7d4099670sm9373644pjf.28.2022.03.27.09.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Mar 2022 09:03:16 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id A143B9627A8; Sun, 27 Mar 2022 06:03:14 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 27 Mar 2022 06:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220327160314.A143B9627A8@nuc.router0800d9.com>
Date: Sun, 27 Mar 2022 06:03:14 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Mar 2022 16:03:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163664

Branch: master

New this week: 5 CVEs
CVE-2021-46705: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-46705 *
CVE-2022-0943: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0943 *
CVE-2022-26353: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26353 *
CVE-2022-26354: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26354 *
CVE-2022-27191: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27191 *

Removed this week: 7 CVEs
CVE-2022-0865: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0865 *
CVE-2022-0891: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0891 *
CVE-2022-0907: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0907 *
CVE-2022-0908: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0908 *
CVE-2022-0909: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0909 *
CVE-2022-0924: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0924 *
CVE-2022-26488: python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26488 *

Full list:  Found 12 unpatched CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-44647: lua:lua-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44647 *
CVE-2021-46705: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-46705 *
CVE-2022-0529: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-0943: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0943 *
CVE-2022-24975: git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24975 *
CVE-2022-26353: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26353 *
CVE-2022-26354: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26354 *
CVE-2022-27191: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27191 *

