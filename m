Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA637C433FE
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 12:04:29 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.11121.1668945860015684077
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 04:04:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=qN56tzfy;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id c203so8952828pfc.11
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 04:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6yezdovGEe/oIlamWoy4kikP4C4enyECKLPFfWx8xdw=;
        b=qN56tzfyAy+dXzsv8Dy4qDcf79M1UJmAEDGsIfYlXcBVnxz2PvnOBlmSkz0PeUzDNL
         vXTAhnSXhE/CTZE3ZxVUdAlYp+nlzt1SKhlzEFfVkOZLtLKQrBxdqN9+X60lqje0Q0ta
         kcYU6Sfil6hOp46+g6kS2CVnhzT8F3VRYoGF5RpAbGd1z0nGJ3DI6Q5Lv1elXlETnUe3
         qGyJNnUIY0HXlhIOjmtU9whctlHRaceduAH4mVtGfXN45jWHe5E18mt8CK/m/7lap87i
         BbmtFK6EwjYCBjYoF65U6wjAzuorz+mmujB0s6GshMOKcF2WIFnzEo51qCNoimlLybVa
         zycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6yezdovGEe/oIlamWoy4kikP4C4enyECKLPFfWx8xdw=;
        b=O0+E6rQIa7sp1XgjnoRzpR2R1kTYjWgfP1WKk3g9eyYPsIanaHm8Gn9W1uRWwhXVKP
         /hYsOL5PpBUWkvJ8z/h69O5QxqnWb0P/etPVjca8B4rAcFOn/osO6NraN2mAHzJNrm0B
         J6dSaIi5YLgFsgrbXCJdPc8x3vSi+bf9ISWtJOyqufu0masEU435TtbRHVAkIzkx1GNd
         DR2ojAsPoPKO866E3i9PRZUmgNih2XzWWvcEn0ZrlHgyQujoSVSKnAxWFyUYOnEkUBdp
         e/3gh8gxMuxzph4nx3serOm7SkzTDqJiwo9UKXc2o9dZi+nP8wkLo4knFP+/IxxHgeUt
         4YQA==
X-Gm-Message-State: ANoB5pnntNCoYcBOQiTa3odbxAGPby1KOce3XHIqISJdiyUvFLPPi0yv
	vf35CI5hOPBUHcyIKV5ufzkEWFSVRA+zDQbjruM=
X-Google-Smtp-Source: AA0mqf5JrBUvv+sfKOzK/6Pbwh+1SOexDNgaiTQL1ifb2BGo13hg9PuRD0n2JMjM+hULLqMuQyc1YA==
X-Received: by 2002:aa7:8513:0:b0:563:3d81:7faf with SMTP id v19-20020aa78513000000b005633d817fafmr15735227pfn.45.1668945858682;
        Sun, 20 Nov 2022 04:04:18 -0800 (PST)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c5-20020a170902c1c500b0017fe9b038fdsm7314638plc.14.2022.11.20.04.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 04:04:18 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 5085C9602C3; Sun, 20 Nov 2022 02:04:16 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 20 Nov 2022 02:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20221120120416.5085C9602C3@nuc.router0800d9.com>
Date: Sun, 20 Nov 2022 02:04:16 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 12:04:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173579

Branch: master

New this week: 2 CVEs
CVE-2022-39377 (CVSS3: 9.8 CRITICAL): sysstat https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39377 *
CVE-2022-3970 (CVSS3: 9.8 CRITICAL): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3970 *

Removed this week: 1 CVEs
CVE-2022-43995 (CVSS3: 7.1 HIGH): sudo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-43995 *

Full list:  Found 4 unpatched CVEs
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-39377 (CVSS3: 9.8 CRITICAL): sysstat https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39377 *
CVE-2022-3970 (CVSS3: 9.8 CRITICAL): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3970 *
CVE-2022-45061 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-45061 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

