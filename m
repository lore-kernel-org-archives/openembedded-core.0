Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D059C05027
	for <webhook@archiver.kernel.org>; Sun, 29 Jan 2023 13:33:41 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.15768.1674999215203832561
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Jan 2023 05:33:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=I6GRjVAB;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 143so5941833pgg.6
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Jan 2023 05:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=StBeoO+tqr7aJTI9wReWWEA9762z2dJbm4u59pfHXFM=;
        b=I6GRjVABMMBgyrmMf/SuHSWwJJFvAwUFZtG47Nzp2wqeXSm7KurPHATF9E8aJ96lgU
         xeNdBtjiobT8LWItrABeeOb0LddIN+gEv7kbFODvLmtkzCDlGF1VeJH7d53Mr36arHbI
         Bm+MTMAacjGxzCBc4sdsgCbPc+h+VHRuQ9dGMGwLhP9GoWypi/F+9BTE2qM5tq6yICLS
         GggBPlREXpc7H5Ri4WXPt1bdA5wspH9T9uI78xcUVHy8+MtPs3qSNYfNDMsMuDWks7+7
         mtjqolLpYifpNhFIsIAnx5sFol3BJICYA12LFj6uegKZtcm9l5FVV1bJejJT41Up7Lut
         cJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=StBeoO+tqr7aJTI9wReWWEA9762z2dJbm4u59pfHXFM=;
        b=QgbZEyXZq1yQTo6Diw6/AWyDEKFpOMpsYwJr5vm1LkLGkmKzEJi7iOAjCf30U/rww3
         aKAYkdyrghZ4ByKx+IXlL8UtntS6OExGCbl0C7lraPVNttQE83V4KqOBrbtKM+tum816
         1u4um1uyhbkYIx5kz369bytBIaM4+hsY/WQLfeHXrtq1syBKdhUovbAIehYKQOqV32BE
         bIqYAjyfj0W6/r4yb5Fyc5kobAJTcz0/WYM3VjSn+Xf46z9nzcKtMzzqI4fMClNRTjJ9
         bOAy0ED35SI8na42rNA7EOv0EJGAZPp9kirLyiSH/hfuZH4SA0AWaYSiE6gipn3Gtj3Y
         x85g==
X-Gm-Message-State: AFqh2kobrov2GagUsJ0QJSbk7u73jD2RLmNuCgZeQ0IgV0U6lkKAz/MW
	gi5kHKdEPuzyXe0gm8Ct0Nqmasr9y2sagOLpdOk=
X-Google-Smtp-Source: AMrXdXsVl+QvORdhyFzzOUGOWZD4pPgUeFNuZePJPeuk/gJyfxOTpRsIDBSrXkmguTpxWiZZm8lZQw==
X-Received: by 2002:a62:6144:0:b0:583:9b05:d1f0 with SMTP id v65-20020a626144000000b005839b05d1f0mr41153940pfb.33.1674999213866;
        Sun, 29 Jan 2023 05:33:33 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x2-20020aa793a2000000b00592591d1634sm5065860pff.97.2023.01.29.05.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 05:33:33 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 48B4A960377; Sun, 29 Jan 2023 03:33:31 -1000 (HST)
Subject: OE-core CVE metrics for langdale on Sun 29 Jan 2023 03:30:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20230129133331.48B4A960377@nuc.router0800d9.com>
Date: Sun, 29 Jan 2023 03:33:31 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Jan 2023 13:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176475

Branch: langdale

New this week: 7 CVEs
CVE-2022-23521 (CVSS3: 9.8 CRITICAL): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23521 *
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2022-3550 (CVSS3: 8.8 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3550 *
CVE-2022-3551 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3551 *
CVE-2022-41903 (CVSS3: 9.8 CRITICAL): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41903 *
CVE-2022-41953 (CVSS3: 7.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41953 *
CVE-2022-4743 (CVSS3: 7.5 HIGH): libsdl2:libsdl2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4743 *

Removed this week: 9 CVEs
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native:libksba:libksba-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2022-39253 (CVSS3: 5.5 MEDIUM): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39253 *
CVE-2022-39260 (CVSS3: 8.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39260 *
CVE-2022-43551 (CVSS3: 7.5 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-43551 *
CVE-2022-47629 (CVSS3: 9.8 CRITICAL): libksba:libksba-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-47629 *
CVE-2023-0049 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0049 *
CVE-2023-0051 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0051 *
CVE-2023-0054 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0054 *
CVE-2023-0288 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0288 *

Full list:  Found 20 unpatched CVEs
CVE-2020-10735 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10735 *
CVE-2022-23521 (CVSS3: 9.8 CRITICAL): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23521 *
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2022-3550 (CVSS3: 8.8 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3550 *
CVE-2022-3551 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3551 *
CVE-2022-37454 (CVSS3: 9.8 CRITICAL): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-37454 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-3996 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3996 *
CVE-2022-40303 (CVSS3: 7.5 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40303 *
CVE-2022-40304 (CVSS3: 7.8 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40304 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-40897 (CVSS3: 5.9 MEDIUM): python3-setuptools:python3-setuptools-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40897 *
CVE-2022-4144 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4144 *
CVE-2022-41903 (CVSS3: 9.8 CRITICAL): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41903 *
CVE-2022-41953 (CVSS3: 7.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41953 *
CVE-2022-42919 (CVSS3: 7.8 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42919 *
CVE-2022-45061 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-45061 *
CVE-2022-4603 (CVSS3: 8.8 HIGH): ppp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4603 *
CVE-2022-46908 (CVSS3: 7.3 HIGH): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46908 *
CVE-2022-4743 (CVSS3: 7.5 HIGH): libsdl2:libsdl2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4743 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

