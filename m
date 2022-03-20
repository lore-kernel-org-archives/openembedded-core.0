Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED333C433F5
	for <webhook@archiver.kernel.org>; Sun, 20 Mar 2022 18:17:23 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web09.21180.1647800242913845393
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Mar 2022 11:17:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Ox42LXNl;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d19so13722115pfv.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Mar 2022 11:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=ez3lT8Ri/l3iT0eYH6XQpSXMo6sxrdBarw8hpmQKN84=;
        b=Ox42LXNlybxzJDDFbNIhquUfseTiwUaWuwQC7mW14DWRwrvlLLBOUpWPslcrWPW7+c
         ZL2Hpj84wBcQ94UsAhwmholwJJDyZJAW7ekLxynSsTE0mPU35NtACuoz8I+BH6oH4KQi
         vuQBpLPNrimIzi1hmkZAF0Hf4LUA0FpnhCsVPVGjYJdSLsUgkdflLckCnL4KQ987VO4u
         aXvQP0zEWcTLaOywrbH60Q8w0EU2B9zfz7Fa9QxA0B3oGSslw+rUEkV2iWUD4EO8SA9L
         p/M/ROkk9RZ5WS4Y2/Y2ifB3g2gOGtTwQvpXrlJKJQCJvU6+bHnita4fv2SIm/myx4ga
         CSzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=ez3lT8Ri/l3iT0eYH6XQpSXMo6sxrdBarw8hpmQKN84=;
        b=V7oNk/nBQEbCGA9UCjKZQWaeKVd3xaB8VWqwNCgSCFRM9ScJxexuItJ1Bn5BhpMLpj
         tEHK8gkzfcAtHi9bV6dsBga82kVFLq99wT4dAPk4VBCn6tDJeDbftgttZInrRcIpFDCm
         TFAznbQZAfeEJrZqPy9yZiJHT5wfrn2jc7O8wOwSbYySbv4oc/rYtzi98ecdhwPxBn8l
         CgQ7tskYkaadblG391FYGpPLu7dPUtcYtq9f0DAEQPJ7iiv4Gk0FZnDe7aXVu2DeNA33
         QvYl9tDh1l7YQAMbq0sYi5Tauo1FhdL0usqIHTTSD8kpW9SfA3IJW1y6Z8qgIjsOhE4o
         wtrw==
X-Gm-Message-State: AOAM532wUuwyPWRMqhDZRj8SWe8gUtxG33syrVsnw3gpkRPt4JLd06iR
	D/IZcoaaIFEw7SaodU5ZjQjJceZIGxzPP/bf7PY=
X-Google-Smtp-Source: 
 ABdhPJygAr+rCXzpr3ThLSEYcsTpQDvWXq4D9RRn22jMoiGBJ95dqw3CH0+jISO1hyRIovpGmwdEkw==
X-Received: by 2002:a65:5b43:0:b0:382:1f25:eaef with SMTP id
 y3-20020a655b43000000b003821f25eaefmr12347089pgr.590.1647800241514;
        Sun, 20 Mar 2022 11:17:21 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 m11-20020a17090a3f8b00b001bc299e0aefsm17655505pjc.56.2022.03.20.11.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 11:17:21 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 7F479960418; Sun, 20 Mar 2022 08:01:36 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 20 Mar 2022 08:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220320180136.7F479960418@nuc.router0800d9.com>
Date: Sun, 20 Mar 2022 08:01:36 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Mar 2022 18:17:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163482

Branch: master

New this week: 7 CVEs
CVE-2022-0865: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0865 *
CVE-2022-0891: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0891 *
CVE-2022-0907: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0907 *
CVE-2022-0908: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0908 *
CVE-2022-0909: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0909 *
CVE-2022-0924: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0924 *
CVE-2022-26488: python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26488 *

Removed this week: 0 CVEs

Full list:  Found 14 unpatched CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-44647: lua:lua-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44647 *
CVE-2022-0529: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-0865: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0865 *
CVE-2022-0891: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0891 *
CVE-2022-0907: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0907 *
CVE-2022-0908: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0908 *
CVE-2022-0909: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0909 *
CVE-2022-0924: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0924 *
CVE-2022-24975: git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24975 *
CVE-2022-26488: python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26488 *

