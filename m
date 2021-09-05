Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.10011.1630850526379696060
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Sep 2021 07:02:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=NSZchXQp;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id q3so2373509plx.4
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Sep 2021 07:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=Ktk1vNPindb2pKjrJcmaITfSh2LM6oO23q3if5nUEyw=;
        b=NSZchXQpqM8lf6bLzmE2vwnB6yzv/RyqI9e5Gf5X93LGfXrHr8c9OBSovZoAi4Jx32
         XgzOlPzd+2wZXzw+ns3G+HhBxzILu6n2CKpSK/EGd99Dj4fa20k5cs3s3SpXK8qqp465
         KbTzFW5VtyNohCBDX/CmU9i07NSd80WWLtsqkFpIdW1siwu2LpOdBZ/5E7nMHMBiH0Ci
         /3f7/+V8TsxlWmsz7QyN51M7z84cbpZnXRJjihLS0c2bsgKD22a63c65h2vIeVauTVsF
         4SdBCbWSUSdbLwf2cprMmoTLsH3sapZqphV3vehtxUX5LcTh4hwTzesJ2QkZoj7wT/ma
         hPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=Ktk1vNPindb2pKjrJcmaITfSh2LM6oO23q3if5nUEyw=;
        b=DWwOEYHXKaGDGCR9r8Sju/ToAxy5yR6By+sld4eCjOCNSp3uJHN0KvK357B0Ihj4LL
         kGYSSkFS8epgBHLueajw5+4a2sENvawjO1BrUIA0W1ud39+t/8p9CbJZIYtYDyfEr0f8
         oSi48kDvpqLg/za3Bs5Pq93tUErn1BxNaf2EeDgVOZGUFWTX7mploYdYOkqC46PKkK7v
         8/3jyfgVQyp4gEFs7JJEDsvrNOCfPz4U2iH8Tyit5jzLJbo7hFR4JWPAmqHhRw1Aqyh4
         TwFsxBxzdV6Ov2XoHH6799Hnl3S/bAqI0LjP48tBqwZPyXh7SllUe++FAAR8XVz3Xm7T
         p6Ww==
X-Gm-Message-State: AOAM5330awefLwX+JVy/VOwPBR3ekPyLHZnF5WCFqPd3+zebZ9z9Adz2
	S78WAvwfZA2WY9mJiBEEZgJDFKQ9apdP2SGH
X-Google-Smtp-Source: ABdhPJx8DDPAV/zMh3yITl6HfltFluyq39mVonZIfSTBtn7LrKdFF6UbIX/p6pOFYl7goovhg+UCwA==
X-Received: by 2002:a17:902:d2d0:b0:138:d2ac:42c with SMTP id n16-20020a170902d2d000b00138d2ac042cmr6950029plc.67.1630850525016;
        Sun, 05 Sep 2021 07:02:05 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id n3sm4734966pfo.101.2021.09.05.07.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 07:02:04 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id D2FFC96025F; Sun,  5 Sep 2021 04:01:54 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 05 Sep 2021 04:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210905140154.D2FFC96025F@nuc.router0800d9.com>
Date: Sun,  5 Sep 2021 04:01:54 -1000 (HST)

Branch: master

New this week: 0 CVEs

Removed this week: 5 CVEs
CVE-2020-27748: xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27748 *
CVE-2021-34558: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-34558 *
CVE-2021-35331: tcl:tcl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35331 *
CVE-2021-36221: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36221 *
CVE-2021-38185: cpio https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38185 *

Full list:  Found 8 unpatched CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2019-6293: flex:flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-29923: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-29923 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
