Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 232CFC433EF
	for <webhook@archiver.kernel.org>; Sun, 13 Mar 2022 14:02:00 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.15378.1647180119266043158
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Mar 2022 07:01:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Kj8fK3oK;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id n18so8811259plg.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Mar 2022 07:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=Pf4uDnKfa6hemnbVoR0AVdZ56WzBEm0wXr4oHxlTOEs=;
        b=Kj8fK3oK32KR+qwaKP3r44gqNhDghYCO9fdXRdMi8cXD2DbNl0S9nkgpz5veOaAyQ/
         0CaUNVBxXIIpIKzVwRhEvpi9V872tKfWSUXkke5MyslwAul0o3iM9Zg9AIV/qcV5O2lv
         hpS6yngmKmUnrRJho7Tolrjt7F6fuQq1YrdTZkqWjlRd3BRYTB0749372lNwlxTNGzOq
         8M2cMeZYRTFWYS0j7RQYhH5Aq9DKHq1L9x+OBVM5h7+YbOKgeaDOw89NdnHQVaHMEYoR
         H3MgNzuEqyVUDKsrnDLRXI+MyO1UqLU3nDYcdMH9YWvwKCfvdXr2PiPR469ABxcBTyPH
         qp5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=Pf4uDnKfa6hemnbVoR0AVdZ56WzBEm0wXr4oHxlTOEs=;
        b=OUbs9mw+mQsjUf4vRcBtP7g2Ct1tr3K5Yl4gLiDnP8wUSRyT6sunOxYLB3sU/sA8Wl
         aenIgJKx/I9tMN3OcRiXHkC6LsbVJh28l7wOsDlYEt67R+xnrjcQ8cmWV5zP73CAZB2Z
         oIIMjAqXNsVVT9I+UMWYNZp4KGZ1jnKiv9uhAOvN8luSzL0cOHp+jXRnbdcoxl8W+XqS
         hk5HwFtwVGx/ui1JWPvR30I1SXUxyh2pLK9T38OI4RGUYBMR9ETh9Hl0ksEIix2sLSEn
         QlqDDAVRNPxzxeTBS3ggr6FLoYIapP/7ehJtCHXTGcRpZNoNR3mo22k3I1YytGPs2j4E
         ZmkA==
X-Gm-Message-State: AOAM533q3wI0RA4VsXBpYjolaV6N1DnHSGUT5Vc0dqKgTbGkFIeSAYCl
	lkVpNpaKWY9654D6xv0j+SjN/UZBH2j1cXwjn9w=
X-Google-Smtp-Source: 
 ABdhPJxkVLX1tQDBaAGwv6pImpgvJFkAzAv7EChPHuJK/jyjBGV7YftVknB4rSIFJNWkV2jIwkTpYg==
X-Received: by 2002:a17:902:7fc1:b0:150:1ae7:94c5 with SMTP id
 t1-20020a1709027fc100b001501ae794c5mr19059086plb.45.1647180118067;
        Sun, 13 Mar 2022 07:01:58 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 m17-20020a639411000000b0038011819be9sm13828785pge.41.2022.03.13.07.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Mar 2022 07:01:57 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 46C57962B4E; Sun, 13 Mar 2022 04:01:55 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 13 Mar 2022 04:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220313140155.46C57962B4E@nuc.router0800d9.com>
Date: Sun, 13 Mar 2022 04:01:55 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Mar 2022 14:02:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163109

Branch: master

New this week: 0 CVEs

Removed this week: 13 CVEs
CVE-2021-3930: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3930 *
CVE-2021-3947: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3947 *
CVE-2021-44568: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44568 *
CVE-2021-44571: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44571 *
CVE-2021-44573: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44573 *
CVE-2021-44574: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44574 *
CVE-2021-44575: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44575 *
CVE-2021-44576: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44576 *
CVE-2021-44577: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44577 *
CVE-2022-0696: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0696 *
CVE-2022-0714: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0714 *
CVE-2022-0729: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0729 *
CVE-2022-25643: seatd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-25643 *

Full list:  Found 7 unpatched CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-44647: lua:lua-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44647 *
CVE-2022-0529: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-24975: git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24975 *

