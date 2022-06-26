Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27369C433EF
	for <webhook@archiver.kernel.org>; Sun, 26 Jun 2022 12:02:41 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web10.29331.1656244952499779878
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jun 2022 05:02:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=DxjyEbBQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.178,
 mailfrom: steve@sakoman.com)
Received: by mail-oi1-f178.google.com with SMTP id w83so9531504oiw.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jun 2022 05:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=BpitIO/ClZa4PFkz7Sm46W56TzUgwB+xixKU8nIIlpk=;
        b=DxjyEbBQPLgJfjTgA47F83BxGYeq7IlM7WPq/nj3DC0IyLdulGcR/NoivKebVbOAO2
         F0sS3j9b7xM1XfJ7dPa+H0sUosWGx05M/boGmmkt1PS320XZROYKCs75ehnILFWplUXc
         Kp3xTv6z7bXOxJ/IA9YE4Uxtg0SmmQh+RhTGZVIx4ftXg2RE9XI9yPSiJBwWocKJyXXI
         Z/AuLOHUOVpzCpEBGmXDClQtfbmWJFF97rx8ReTcTeITmd+GEj05Il+8IioZ7wflv/m+
         VvFPWTuG9yC6jeBoZVKueE5sCu3sDyVbDdKWneNbUNc9czuMnyfR74fgH+EGBCV7WeHK
         5Abg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=BpitIO/ClZa4PFkz7Sm46W56TzUgwB+xixKU8nIIlpk=;
        b=ZerhpQKOx5bo+WnjF5peftZ2lhyy92CfYx2xGYJ/oipAUDMkCPmA+mQGEKBj7KlH6h
         zhd+MC8qAj1xhNL6xsRZhOowJ+AYkGGNx1CFUAk8gj+64+S1TeDd+v8Pz2D1UX/NW1vU
         +QRauadTTgIiTDhJuc7yWA/aj6MI6LWeSObi7bi7m9WkQb9VhXQNUkJXpMx3mx5LjrEv
         gVcx8oHbPL7M+yJc6vzuRWzP24tb9RfavmkeXmYzeOEUwcTLqytchCmx8Gy9tUDnTXQX
         2mdNjE63q5EViAyyJhBbqpxBog3rmjf7PB3U5gU8xVB6JvoC3Se8rXxBwXLTWcxwM18w
         sm0Q==
X-Gm-Message-State: AJIora+GB6BWCnPgZkM0B0EVXvAOx2WG/yW6Vx0ygewk8fsAMQEj+Pfg
	DabWTmVyBpueJOeFeG1P6bce0O5fUIJRa/4W
X-Google-Smtp-Source: 
 AGRyM1ueeDkVPbBsJiM1h1jneeieGSVJpwC8ksUXICkUpWiiv6i7y8K3AzWznkrA3QvxnIdcRei+BQ==
X-Received: by 2002:a05:6808:150e:b0:335:4516:7e9 with SMTP id
 u14-20020a056808150e00b00335451607e9mr5178788oiw.187.1656244951080;
        Sun, 26 Jun 2022 05:02:31 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 g13-20020a05683030ad00b0060afaae0e34sm4618118ots.0.2022.06.26.05.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jun 2022 05:02:30 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 42794962544; Sun, 26 Jun 2022 02:02:28 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 26 Jun 2022 02:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220626120228.42794962544@nuc.router0800d9.com>
Date: Sun, 26 Jun 2022 02:02:28 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jun 2022 12:02:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167309

Branch: master

New this week: 0 CVEs

Removed this week: 2 CVEs
CVE-2022-0529 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *

Full list:  Found 6 unpatched CVEs
CVE-2019-12067 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974 (CVSS3: 3.3 LOW): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2022-26691 (CVSS3: 6.7 MEDIUM): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26691 *
CVE-2022-29458 (CVSS3: 7.1 HIGH): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29458 *
CVE-2022-30065 (CVSS3: 7.8 HIGH): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30065 *


