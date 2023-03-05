Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25936C678DB
	for <webhook@archiver.kernel.org>; Sun,  5 Mar 2023 12:03:47 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.7595.1678017822533010248
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Mar 2023 04:03:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=G2YqZ09R;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id c4so4107509pfl.0
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Mar 2023 04:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678017821;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7YXrKcjXZNrs9Haa1QNw2UNmws8xeG2FOklJU9GOeY=;
        b=G2YqZ09RhrTTBReYDNVDI7Ni6QkSJniuMG0ZXBLJBYRDmPu1SirxnJW+WjAK1EIDIZ
         554tvs060vTT5KZIOtJYSGuckQJbjufNyevRvUr9ezEF90+J25XuHatKFLfaIcG4Bijc
         r1GkjwoX6OCMJPl86C8CCUVaVis+jDLcuF4kgYhbQNRi98B8OwTkXfs6Ud7kb0XdRjeT
         vRoI1i4Fjg1d4S5zqV1XWZV1VA9izASKGXPl3AXwUjd55ffUiPCosFtowS2LXYNkZvBR
         mNN3Z2hXi4NsZfjbsRJXVTaxBmmwOAdzOJhCkMIl02bGKC3ymTsWEJ+iGvShhwFd8f4h
         g+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678017821;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w7YXrKcjXZNrs9Haa1QNw2UNmws8xeG2FOklJU9GOeY=;
        b=UP4KSVFnnSzDDDWADDschqkAF5VY20s78uK6iu/02bK1fn2yZAQB/KgvL8BxFnK1tF
         Z7KqD6Og+QSUtYU/1sTXKZMpCMBAQ+8pTurS9mdJw+2KRwtviA7FC4ONYEwt8PV0JbpL
         L0dRev+UYlciFlD5pL4mZy4kt8u7ZmJyUCSNiwebSme5ugbYZE1lOy9BXQoEmqBSnB2v
         sdrfzl0qn3LnppcbzMzi8n4bmzHS9c8GgBqulqCbvWbAjGjljaCEoh6ul/1BmdFCvGWf
         QpE+z+/3XsxPFRp+4G0mC2lFfqFFhfnOTLkvwYlViZxZS9swZSj7T4J4oIR8g23urKHt
         NA/g==
X-Gm-Message-State: AO0yUKW1zYXZdUO5kL+7zBPbmq1rtdlUPhJ+l0U8asjVO3id/ch4tQln
	CBDAPl0ho0/cOvAP3LOBCPKAUDduKPGtrq5si9s=
X-Google-Smtp-Source: AK7set91aKEiYwFzLZ0mBDDqolln5vqCLzu2GW5TbaC+9xmvlOlpffbJIIzX4KzliXRYq2ISPizyCg==
X-Received: by 2002:a62:3808:0:b0:5e1:f4e3:57d4 with SMTP id f8-20020a623808000000b005e1f4e357d4mr6638633pfa.17.1678017821283;
        Sun, 05 Mar 2023 04:03:41 -0800 (PST)
Received: from nuc.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id x12-20020aa784cc000000b0058e08796e98sm4502573pfn.196.2023.03.05.04.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 04:03:40 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 6EC639603C7; Sun,  5 Mar 2023 02:03:39 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 05 Mar 2023 02:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  5 Mar 2023 02:03:39 -1000
Message-Id: <20230305120339.6EC639603C7@nuc.router0800d9.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Mar 2023 12:03:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178041

Branch: master

New this week: 4 CVEs
CVE-2005-1796 (CVSS3: N/A): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2005-1796 *
CVE-2016-15024 (CVSS3: 5.5 MEDIUM): shadow:shadow-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-15024 *
CVE-2022-3219 (CVSS3: 5.5 MEDIUM): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2023-26081 (CVSS3: 7.5 HIGH): epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-26081 *

Removed this week: 1 CVEs
CVE-2023-25139 (CVSS3: 9.8 CRITICAL): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25139 *

Full list:  Found 6 unpatched CVEs
CVE-2005-1796 (CVSS3: N/A): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2005-1796 *
CVE-2016-15024 (CVSS3: 5.5 MEDIUM): shadow:shadow-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-15024 *
CVE-2022-3219 (CVSS3: 5.5 MEDIUM): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46456 *
CVE-2023-26081 (CVSS3: 7.5 HIGH): epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-26081 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

