Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ADA5C433FE
	for <webhook@archiver.kernel.org>; Sun,  9 Oct 2022 13:32:24 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web08.2470.1665322337004389443
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Oct 2022 06:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=G359d2th;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id
 a5-20020a17090aa50500b002008eeb040eso9975167pjq.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Oct 2022 06:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MRwbNL0SIeAKa+xb/90Mrp+B19AnRfN6rxDNxVjqAYY=;
        b=G359d2th/epDEuloLA+eT1CY+IWuu2Wm9EZRrpvHdJRccJxLJSCBp3QpOtlsDP1+vJ
         n99VI5jiCniY0zh+um1dkwoZ4KnY20JtViZjXNAst8Bq5o5gEs+SKdKduoPNkZ4AU7U8
         Zt1Vbuvrnt+Zjegj3w5adUw5zXBmbFy6nqSnC7D6kXxFluCEfvxUeHv+ksNyI9ThTSx4
         pn06aMSdMoTNMgXWubCKv4VsTW8yIpP9zaGS1wmBdS2uuupnW8hGBifk+SIBqUrZg2rA
         Kg4QjW5eOjNhyDxVGA7XqD7zTlvf/33LIYs60s3L5hGTxq4hhB4QigamqcoGFLwvsVsF
         4mmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MRwbNL0SIeAKa+xb/90Mrp+B19AnRfN6rxDNxVjqAYY=;
        b=GK+Faux/cZECrbZug2TtCv6FyTEMujnVfDiGHB80WoEIBeLfVyR1hcr+6v/g4Em16j
         mMIwvVHGaeR8YrxPAMGUjnQAAITGLG6JV+sD/X17o/ZCH3yKW06hbKJxDYQl08HLarm2
         Nhfx11HCwQbfA8QRkXodOhV1qWVwgU4jn0JHp1TrGfBgvQNag6QUNXShEDzISdNjEMuz
         KnXoS3vA/PbxG6F9IM7p7IZJXkTiSVsoVoyAudkfxgEiDjJg43gw9RcnKhz+GyGSamDK
         qrvHrP+Eov36pqiGLBqn5vy6NnUohU/Fq8DyXhsBrb2Hyjd3/zRLQIz3i03+Vra03Uyp
         iPtA==
X-Gm-Message-State: ACrzQf1CC/AcaeXlwLYS3lyfXIopicghAU7I+AX7FH2nhGIF6ASOHSMs
	un6VrbaGB0SBoqyQMnI92g8ndGERbtIjjd32
X-Google-Smtp-Source: 
 AMsMyM5bP0/QUHNlDjb1HrUHlTwL4A+i63zeWHA3MnqCCO9kEGxd0FuQsnkC32v+wsvHfVVY16rIcA==
X-Received: by 2002:a17:902:e843:b0:178:29d3:5544 with SMTP id
 t3-20020a170902e84300b0017829d35544mr14216970plg.99.1665322335898;
        Sun, 09 Oct 2022 06:32:15 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 r25-20020aa79639000000b00562e9f636e0sm3133319pfg.10.2022.10.09.06.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Oct 2022 06:32:15 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 780CF960832; Sun,  9 Oct 2022 03:32:13 -1000 (HST)
Subject: OE-core CVE metrics for langdale on Sun 09 Oct 2022 03:30:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20221009133213.780CF960832@nuc.router0800d9.com>
Date: Sun,  9 Oct 2022 03:32:13 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Oct 2022 13:32:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171552

Branch: langdale

New this week: 1 CVEs
CVE-2022-41556 (CVSS3: 7.5 HIGH): lighttpd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41556 *

Removed this week: 0 CVEs

Full list:  Found 2 unpatched CVEs
CVE-2022-3352 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3352 *
CVE-2022-41556 (CVSS3: 7.5 HIGH): lighttpd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41556 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

