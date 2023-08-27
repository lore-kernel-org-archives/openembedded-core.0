Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F05ECC83F01
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 11:33:42 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.25493.1693136021486014038
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Aug 2023 04:33:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=J+h+Sga7;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.52, mailfrom: steve@sakoman.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-64914f08c65so16429086d6.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 04:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1693136020; x=1693740820;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMHIzlHuf7bAtnHOvwNdq1tsXaRdgibZo4P4/jxVFtI=;
        b=J+h+Sga7E2Q2MaSpxDn6ybmuziMJjiM6ZrGowJoxPMMcnbRLWQ7qk5gb8o4SRzozA6
         b4rP/EJU+MPEmdd30e5jDR2RiQg2Xil2Copw1BiNT0IOE80MBjQMGkdpZO/xfC3w0t1m
         bW2njFFjRikcx9ge5YosfO0iCha4iekF69vMKEKgWzO997SgtoBt+grJa6SZxpMHe2F7
         SUcHpum5KgC6shRmAF9l3VPNutk1uVHC9FLgsWmPxMtzVED7u4FiEQfdRK4zeV+Vg73a
         J79+mwtyCImzzRVaIhGxWBQNRcnnGtoq/fOkmJM5qC+Y4XGB97ulwesGg8hjFEaZi55t
         G0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693136020; x=1693740820;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZMHIzlHuf7bAtnHOvwNdq1tsXaRdgibZo4P4/jxVFtI=;
        b=dCVBYKii9yye9eSQAntsRS9Ahym0HTfqM/CkFvh8C0zPRI2SimskVulA+SJXQ0118X
         xma2QVik74rhAWAYjLsuj3XXg2O6dPkt4AHdaMbs/SZt9XC+2NlQDfMwWF8x2+oeBPOJ
         I61bCearaJZbAn89zv2lazaNRt4dGlFpkeHEmdBankzf1bBlSfGmVe0RUcDKL4fRpPAk
         3Kksa09XyH5xCS0XNmxFoQa+144rxgc7NnlCCuOZdDnXLNJCp5uTJzGkCOQPWE0JJuzx
         jVvORXvCx95KycO3CIWqwQRg8iv7c+AF5Eoo0YYNJOc0ZedbgkRgV8cmR9hQ11vqTJNH
         25GQ==
X-Gm-Message-State: AOJu0YyczGXFKSaEQlDnykzT5MKY5Gt7dvu9WAqTsAJJZGTPtRU5OTY+
	rg1b0cbtkjhBHevfbQTM6E7hTWMhNb5Ycp++fGKbtA==
X-Google-Smtp-Source: AGHT+IEWsJy4fGpB/Z+z11yaCV+g7huBgTp2FnQQMJXN84t6ETvxeaFAJEiv0jCktQVKKpTAPtTtUQ==
X-Received: by 2002:a05:620a:12c3:b0:76f:338:27a2 with SMTP id e3-20020a05620a12c300b0076f033827a2mr4284963qkl.32.1693136019880;
        Sun, 27 Aug 2023 04:33:39 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id s28-20020a05620a031c00b0076d74da4481sm1705130qkm.23.2023.08.27.04.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 04:33:39 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id B60BE106C2A; Sun, 27 Aug 2023 01:33:37 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 27 Aug 2023 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 27 Aug 2023 01:33:37 -1000
Message-Id: <20230827113337.B60BE106C2A@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 11:33:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186770

Branch: master

New this week: 4 CVEs
CVE-2023-28736 (CVSS3: 6.7 MEDIUM): mdadm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28736 *
CVE-2023-28938 (CVSS3: 4.4 MEDIUM): mdadm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28938 *
CVE-2023-40303 (CVSS3: 7.8 HIGH): inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40303 *
CVE-2023-40360 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40360 *

Removed this week: 5 CVEs
CVE-2023-1206 (CVSS3: 5.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1206 *
CVE-2023-36632 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-36632 *
CVE-2023-4004 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4004 *
CVE-2023-4016 (CVSS3: 5.5 MEDIUM): procps https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4016 *
CVE-2023-4147 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4147 *

Full list:  Found 28 unpatched CVEs
CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-33065 (CVSS3: 7.8 HIGH): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-33065 *
CVE-2022-36402 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36402 *
CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46456 *
CVE-2023-0687 (CVSS3: 9.8 CRITICAL): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0687 *
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-28736 (CVSS3: 6.7 MEDIUM): mdadm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28736 *
CVE-2023-28938 (CVSS3: 4.4 MEDIUM): mdadm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28938 *
CVE-2023-3019 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3019 *
CVE-2023-3180 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3180 *
CVE-2023-3354 (CVSS3: 7.5 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3354 *
CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-36664 (CVSS3: 7.8 HIGH): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-36664 *
CVE-2023-3772 (CVSS3: 4.4 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3772 *
CVE-2023-3773 (CVSS3: 4.4 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3773 *
CVE-2023-37769 (CVSS3: 6.5 MEDIUM): pixman:pixman-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-37769 *
CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-40303 (CVSS3: 7.8 HIGH): inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40303 *
CVE-2023-40360 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40360 *
CVE-2023-4128 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4128 *
CVE-2023-4135 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4135 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

