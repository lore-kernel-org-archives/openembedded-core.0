Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 920F4C433FE
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 13:33:41 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.16283.1667741615482737434
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 05:33:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=JYlaqqtn;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id h14so8300605pjv.4
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 05:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iKHCIZeye6PUP4wLGB/AqBahSV0fovBwejMwAxlSAws=;
        b=JYlaqqtnSrynFCALFcMaNAHjavVUNKbjxuJYO2n5jsJCLyzrCIkIMG3uvkTSLAIjqy
         usEV1Sv1lFWVjJv9UmU0PVBC27tv0Cqrw/N/P9K3gyZpW6abkamQSc85ezMp73uSCM3K
         cAAENb1N3nyCOQwtwKkRWk+hBhhrJPXtqvIR2FqBehxgSM1Bu5kbfOQnIZdyyX6QFO3d
         PCVrULjkZstJ5aPxgXjnntvZybIiQ7BRq9Lf9/xEJArWQrqIk4PzPvIsuRbEw26prBlb
         eFpSH3U//YgANv+OzlnHDHoZ8uSQ5A0E/Go1NooHJ6t8J/Ay6rpOsor7Pf7p5bbnkj2q
         xrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iKHCIZeye6PUP4wLGB/AqBahSV0fovBwejMwAxlSAws=;
        b=ZJY7CEtl7BgDtFULrpu4K51N3S5a7lZ45EIqx5HfSBL1N2KD7l+xitJy1O3Vlv5N0X
         asKdprpSvkWGws+GLfmqr5jPvsAE56cAKKE768CBrgjxCKeOA+aXrKmg1tLEZMr71Xcs
         u9u9j+EKqe/yZ7yIIuiZ1nKMj34XejUZW0pIwyH7hIOIOV9k5fxgr4S0mywoyAHrGgub
         zpOBA9Gj/cq69sOlFy/KjXa2X2n84wOY48QynDuNku3FselPO0Y2xXsxWugv7rA8MUCy
         AlaFNakgoBbNlzHpHV0V8XxoSl5BNMshpEuxo8s1aARPV2Ul30p9V/fFxrYs0cxFt2FA
         lyJw==
X-Gm-Message-State: ACrzQf3rBE5M2n9CKFbDOeL0do+wGyjguZctGNy0KvOj2EWB6u3YIzaI
	fFC/XfatfPJDdm9S22BKn4ZMtn6dJXgSxeqx
X-Google-Smtp-Source: AMsMyM63/JbohKYoLPN62JiqXETSqMt3hnGQN6DCj0hysdH7UCR1iEWsTyuH/SGR3/FLMz2LCYh/WA==
X-Received: by 2002:a17:90b:2d8e:b0:213:d517:f40f with SMTP id sj14-20020a17090b2d8e00b00213d517f40fmr38562899pjb.5.1667741614309;
        Sun, 06 Nov 2022 05:33:34 -0800 (PST)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id n3-20020aa79843000000b0056c814a501dsm2729629pfq.10.2022.11.06.05.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 05:33:33 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 29EC69602D6; Sun,  6 Nov 2022 03:33:32 -1000 (HST)
Subject: OE-core CVE metrics for langdale on Sun 06 Nov 2022 03:30:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20221106133332.29EC69602D6@nuc.router0800d9.com>
Date: Sun,  6 Nov 2022 03:33:32 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 13:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172766

Branch: langdale

New this week: 5 CVEs
CVE-2022-41716 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41716 *
CVE-2022-42915 (CVSS3: 9.8 CRITICAL): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42915 *
CVE-2022-42916 (CVSS3: 7.5 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42916 *
CVE-2022-43995 (CVSS3: 7.1 HIGH): sudo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-43995 *
CVE-2022-44638 (CVSS3: 8.8 HIGH): pixman:pixman-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-44638 *

Removed this week: 13 CVEs
CVE-2022-3165 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3165 *
CVE-2022-3352 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3352 *
CVE-2022-3358 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3358 *
CVE-2022-3550 (CVSS3: 9.8 CRITICAL): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3550 *
CVE-2022-3551 (CVSS3: 7.5 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3551 *
CVE-2022-3553 (CVSS3: 7.5 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3553 *
CVE-2022-3554 (CVSS3: N/A): libx11:libx11-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3554 *
CVE-2022-3570 (CVSS3: 9.8 CRITICAL): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3570 *
CVE-2022-3597 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3597 *
CVE-2022-3598 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3598 *
CVE-2022-3599 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3599 *
CVE-2022-3626 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3626 *
CVE-2022-3627 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3627 *

Full list:  Found 12 unpatched CVEs
CVE-2022-2879 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2879 *
CVE-2022-2880 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2880 *
CVE-2022-3705 (CVSS3: 7.5 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3705 *
CVE-2022-39253 (CVSS3: 5.5 MEDIUM): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39253 *
CVE-2022-39260 (CVSS3: 8.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39260 *
CVE-2022-41715 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41715 *
CVE-2022-41716 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41716 *
CVE-2022-42915 (CVSS3: 9.8 CRITICAL): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42915 *
CVE-2022-42916 (CVSS3: 7.5 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42916 *
CVE-2022-43680 (CVSS3: 7.5 HIGH): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-43680 *
CVE-2022-43995 (CVSS3: 7.1 HIGH): sudo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-43995 *
CVE-2022-44638 (CVSS3: 8.8 HIGH): pixman:pixman-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-44638 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

