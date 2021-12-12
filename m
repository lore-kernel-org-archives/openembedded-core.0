Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A736C433F5
	for <webhook@archiver.kernel.org>; Sun, 12 Dec 2021 14:03:30 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.34398.1639317809409145624
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Dec 2021 06:03:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=NYRg16I4;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id d11so3599632pgl.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Dec 2021 06:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=05bP2MVm7O3yFQcoOa3G9A5LohCmXMh3K/hI7Ltg6e0=;
        b=NYRg16I4Opgs/CjEhKjXFjB26rjCoERCUtY20VIy6TgFNBsd1Is+2MNAuoVMHppg3i
         FoBs94xIxYlk6e1yZaRFm2O6FFk9pLcTNnRQtCBrL9vLxVaYESw0DEYfkpEFQsh7Ro9d
         6erssib+m54pnJyLJ65l3AD3xTPScwk6e4i3WAhGLm7njya+z/BuPS2FjYMoYDpMqdsv
         Itx4n8WZ85sKYbuTH6UfDz8j7LgQo8BabwciT6f7+WtHjFJ5a2exhoEHP0SIfc6JGpvH
         /wRifujPds4aCeAcVDGkHJ/aLE0ydvHSE0+XNZYTW608StELCESyIb68EHr8O+xtScty
         WMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=05bP2MVm7O3yFQcoOa3G9A5LohCmXMh3K/hI7Ltg6e0=;
        b=V+l8Wv03Z9oQGPmX3lAV453gtlMpfF9LdzhEZP1o/g31zA3UjruPBpa7TXpna7KUhM
         sjDyK7aY4UgtSfy+eolPc+J/lpLBXTp7Rx+w48oKd7WYV4/RxxwTO7gqKpn4sEqNzM7T
         rF3t4ojkR7tMX0HAB4neaj4Fb3qBkL2d+OsVV3m2umRPm+8CQ5W/Vct8A0KAXbnJPV/A
         CIoKXCyIq9+TfRpy6gsvQ9S+BvKuQpZXgN23oY9aT+bbSRCCFAdTbvm17pA/EEByThIV
         wX4Vsfdg3ngLVoC0sf8ew68i8RpJ0kQ0GHuuSF5YoAL3IjtKv/QouOoo6eH7mw4kYGec
         UqcQ==
X-Gm-Message-State: AOAM532m+XiNcLKy6X0mJylaiXOhUTqmNYSLDmo3pka4ESDQJcuKW2iD
	r3LlJYmVk74RyyB59YVrwu/DCkttecTphJKB
X-Google-Smtp-Source: 
 ABdhPJy/CO8yuZYEYRliOmI/Hl7pM3NRQKWzb2GyA3bxiu/T53oWZaBCaqXeyFM5blHCs3M7qtYCaA==
X-Received: by 2002:a63:1f16:: with SMTP id
 f22mr36675002pgf.259.1639317808345;
        Sun, 12 Dec 2021 06:03:28 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y25sm9008292pfa.12.2021.12.12.06.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Dec 2021 06:03:27 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id D67AE962CA0; Sun, 12 Dec 2021 04:03:25 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 12 Dec 2021 04:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20211212140325.D67AE962CA0@nuc.router0800d9.com>
Date: Sun, 12 Dec 2021 04:03:25 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Dec 2021 14:03:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159584

Branch: master

New this week: 0 CVEs

Removed this week: 4 CVEs
CVE-2021-37322: gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:gcc-source-11.2.0:libgcc:libgcc-initial https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-37322 *
CVE-2021-3974: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3974 *
CVE-2021-3984: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3984 *
CVE-2021-4019: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4019 *

Full list:  Found 6 unpatched CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-3682: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3682 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *

