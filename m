Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F1F9C3DA78
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 13:32:59 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.139788.1673789575572386400
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 05:32:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=HQ+VMmvr;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id v13-20020a17090a6b0d00b00219c3be9830so28711668pjj.4
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L+YCzcUwk1p7G3X194XPbGk5BJZOXsgAfeE5f6KsgnE=;
        b=HQ+VMmvr+Eur4PjyDqGCmqgkhLG8Id5cnUdZ48Yzv5g8imuWiNtGm9sx/cAXHGr+NZ
         fOW7cQ7zjYjMt0Qu/s9lmfBc/OQbkVKo6GNi/bWAVk+BWfDGn1+Yax+Kt5saZoLkEt5q
         2GmYIpYCvFpXWd9Fq1Cc4ZDjnC+FdoJv+k33DUczAl61L4qSEQ3t7T89hGtOtfTCsUce
         OjkO/KRZQQVC7NYrTYfmeihoL0RdyXSc0sZkrewdZ+F398zlQfv3dTtXeTZ+iwtu63zY
         N50gueSogbaCNViLSyieTx5WSiqbE3Bgq/qK0djk7j0joZexSXc3wu19tETRGNWK9tQx
         0qbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L+YCzcUwk1p7G3X194XPbGk5BJZOXsgAfeE5f6KsgnE=;
        b=7ZYKh4IxW5nFODqL/nwzs+aMEKrltO+J7EP2Qj6PvA0kkV65jCsNKQMPEziWCc6X90
         kHt1D/0zj4kDvU59pUUVT12xtFnQhFgruakLNiBN0lL+JtA5mvI5HbKW/VQPppIcgDfy
         GEz/6dJYMiBu9DfpYdrrp1cd1BUWfh6CLkKkblBZGQR4M4Ll2nWdaFW7Kcq3CSXqG6CC
         lHS9OZDvwVhR7ndCXa09FXuYkJaCtjenihoEs29be5ufexWSHTITyn5Q2D/r4kb5zVHT
         Ytqup+/pQ/Kr9a0okXlHYHcmY+3YpORbwrS6vVHo3RtdHGnIeYit4fabaw+w3l2GKdit
         gmXA==
X-Gm-Message-State: AFqh2kr6NGKh6sLyrnfkh62EEncMuJYR/lh/XJ4bNNSPP5wgBE08EC5S
	P49RDksny3Hcc+zfyptDsrzjlTKSdCMgrJuPP/Q=
X-Google-Smtp-Source: AMrXdXvt1bMY8Dy4QiU6fPUzpuzukWS6lf8sSpiAnc5sTdyLCsxpkNpaXiMZ8LXu0G2t0MQjTg/vgw==
X-Received: by 2002:a05:6a21:3a45:b0:9d:efbe:e607 with SMTP id zu5-20020a056a213a4500b0009defbee607mr101352870pzb.35.1673789574345;
        Sun, 15 Jan 2023 05:32:54 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q145-20020a632a97000000b004a4f24fbce9sm14159876pgq.5.2023.01.15.05.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 05:32:53 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 8E22E9602D3; Sun, 15 Jan 2023 03:32:50 -1000 (HST)
Subject: OE-core CVE metrics for langdale on Sun 15 Jan 2023 03:30:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20230115133250.8E22E9602D3@nuc.router0800d9.com>
Date: Sun, 15 Jan 2023 03:32:50 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 13:32:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175885

Branch: langdale

New this week: 3 CVEs
CVE-2023-0049 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0049 *
CVE-2023-0051 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0051 *
CVE-2023-0054 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0054 *

Removed this week: 7 CVEs
CVE-2022-2601 (CVSS3: 8.6 HIGH): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2601 *
CVE-2022-3775 (CVSS3: 7.1 HIGH): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3775 *
CVE-2022-41717 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41717 *
CVE-2022-41720 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41720 *
CVE-2022-42010 (CVSS3: 6.5 MEDIUM): dbus:dbus-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42010 *
CVE-2022-42011 (CVSS3: 6.5 MEDIUM): dbus:dbus-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42011 *
CVE-2022-42012 (CVSS3: 6.5 MEDIUM): dbus:dbus-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42012 *

Full list:  Found 19 unpatched CVEs
CVE-2022-37454 (CVSS3: 9.8 CRITICAL): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-37454 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-39253 (CVSS3: 5.5 MEDIUM): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39253 *
CVE-2022-39260 (CVSS3: 8.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39260 *
CVE-2022-3996 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3996 *
CVE-2022-40303 (CVSS3: 7.5 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40303 *
CVE-2022-40304 (CVSS3: 7.8 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40304 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-40897 (CVSS3: 5.9 MEDIUM): python3-setuptools:python3-setuptools-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40897 *
CVE-2022-4144 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4144 *
CVE-2022-42919 (CVSS3: 7.8 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42919 *
CVE-2022-43551 (CVSS3: 7.5 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-43551 *
CVE-2022-45061 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-45061 *
CVE-2022-4603 (CVSS3: 8.8 HIGH): ppp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4603 *
CVE-2022-46908 (CVSS3: 7.3 HIGH): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46908 *
CVE-2022-47629 (CVSS3: 9.8 CRITICAL): libksba:libksba-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-47629 *
CVE-2023-0049 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0049 *
CVE-2023-0051 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0051 *
CVE-2023-0054 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0054 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

