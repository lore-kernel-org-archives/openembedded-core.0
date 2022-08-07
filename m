Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD85C19F2A
	for <webhook@archiver.kernel.org>; Sun,  7 Aug 2022 13:04:01 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.13484.1659877436503737371
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 06:03:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=hdi09Gi5;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id r186so6427086pgr.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 06:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=QjMFhUF/9u3DZM4U13nxdNhZwGg7hjREWbQ9i7I9xaI=;
        b=hdi09Gi57co26godgWfwcFfWo9oLv/LI3uRWk+M6+JWYjPwsyXc+iVv6mDiTtRD3mK
         ocNP/qiQLKrBesVbZQkGWV8feuqU3GYzrT9yBe5JcCz8aBO0m4vBLPcHJiz7hNgMHV0V
         jtPp+l/5IwK6gay2aDZXXkNu9IwiOvcZ2AwhP0IGhK2jwaTREFHBB0QrlfAiUHLOQuzJ
         TDTqusDmJumyS8/vp6lILCXHCKD0rU2Z7zAHGkWX+7zQze9M3owzls4c5hp4iFC4GuHy
         t9znHtLV918Y82B7UM5JBsC318cGpD9FZFBNHzo2RuoUViaoxXbxXGaoAJhQkD49pXEV
         qufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=QjMFhUF/9u3DZM4U13nxdNhZwGg7hjREWbQ9i7I9xaI=;
        b=ETuCA03owe9OcrsLdZ3cS+7/4n1ZtH+x5n+bvqvMx9rBYdpMaxWJK7LpfQIK/QbAsu
         MKSP0EUIMTKHOER48RHpeJyFjQb2rbf3/M/ylC8Twe4plePQo980Fo0IX7dL1ba0tZAZ
         ucD83lfOTifQaRXaAKC08MP4Z2Fao3Z6OWF5kgr6pOcck+AqL9DSWmlMS7v7c94sHAWv
         4OexwFVhdYmtebjNjJpNT4dCgVUsJgKBn1abS/1FMiLxaoSXR5/LHGNoIYmfUwmcgr/9
         t5SaqFeq5ZmBkJmY0q5McWLyPz/oIEwklELj+ahQ4Oyp+tbfeKogwjpPAbH7VpLCY2rY
         90yQ==
X-Gm-Message-State: ACgBeo2sSxJK4kzAL7mOw5M9fGNu0Ho33aryIoQjAV+iFrKloH0Z96Xf
	/xZvzj2wi9W4Hpy7MepV7aTOREOSyTxzisEK
X-Google-Smtp-Source: 
 AA6agR7lYD6O99wovxpQ06P1GeW/c8gvApUPxyttATeoE8qjvd5DO7uEvj0IPqDZUTouAphtcNV3Yw==
X-Received: by 2002:a63:9042:0:b0:41c:cdd4:ae66 with SMTP id
 a63-20020a639042000000b0041ccdd4ae66mr12111655pge.47.1659877435219;
        Sun, 07 Aug 2022 06:03:55 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 w200-20020a627bd1000000b005281d926733sm6532002pfc.199.2022.08.07.06.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 06:03:54 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 928B296249B; Sun,  7 Aug 2022 03:03:52 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 07 Aug 2022 03:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220807130352.928B296249B@nuc.router0800d9.com>
Date: Sun,  7 Aug 2022 03:03:52 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Aug 2022 13:04:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168991

Branch: kirkstone

New this week: 8 CVEs
CVE-2016-3709 (CVSS3: 6.1 MEDIUM): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3709 *
CVE-2021-46829 (CVSS3: 7.8 HIGH): gdk-pixbuf:gdk-pixbuf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-46829 *
CVE-2022-2294 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2294 *
CVE-2022-2509 (CVSS3: 7.5 HIGH): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2509 *
CVE-2022-2571 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2571 *
CVE-2022-2580 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2580 *
CVE-2022-2581 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2581 *
CVE-2022-2598 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2598 *

Removed this week: 14 CVEs
CVE-2022-1183 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1183 *
CVE-2022-1664 (CVSS3: 9.8 CRITICAL): dpkg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1664 *
CVE-2022-2288 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2288 *
CVE-2022-2289 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2289 *
CVE-2022-2304 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2304 *
CVE-2022-2343 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2343 *
CVE-2022-2344 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2344 *
CVE-2022-2345 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2345 *
CVE-2022-2522 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2522 *
CVE-2022-29187 (CVSS3: 7.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29187 *
CVE-2022-30634 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30634 *
CVE-2022-33099 (CVSS3: 7.5 HIGH): lua:lua-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-33099 *
CVE-2022-34903 (CVSS3: 6.5 MEDIUM): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-34903 *
CVE-2022-35414 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-35414 *

Full list:  Found 10 unpatched CVEs
CVE-2016-3709 (CVSS3: 6.1 MEDIUM): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3709 *
CVE-2021-3611 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3611 *
CVE-2021-3750 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3750 *
CVE-2021-46829 (CVSS3: 7.8 HIGH): gdk-pixbuf:gdk-pixbuf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-46829 *
CVE-2022-2294 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2294 *
CVE-2022-2509 (CVSS3: 7.5 HIGH): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2509 *
CVE-2022-2571 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2571 *
CVE-2022-2580 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2580 *
CVE-2022-2581 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2581 *
CVE-2022-2598 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2598 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

