Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web09.7380.1627826569416737642
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Aug 2021 07:02:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=mD8stJmD;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id ds11-20020a17090b08cbb0290172f971883bso27840777pjb.1
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Aug 2021 07:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=5gvgKwimCadXf1JTxTH7rBLeNrxLf4ACeqJfsG6OVqM=;
        b=mD8stJmDK+nYBNK3gUR4UPia0LGLwrPFE18gljAUwoHjYlIHQizp2yuFf/zWMkp184
         xJCjuZWbsC84TvxvcvyS/RGsJRnb/LCfD7dc6c/ANKzpS2PTmamNLeO5pG/aLdb8BREy
         YiQbIr25EC+/MGqjXQz4DjO9vnO2Nf503Kq6nvZgnoWk32CmAsLF25QRI4P4SY+bEV/q
         bNcX9mmsyZ/Hf+Cq2GGDBIKrHfpK1G7PQAIuoViHiOV1z65DYLHRe708zyOiaE2dL3A3
         YTtVN3L1voeGJUcwHw4UpXNIdruZYx3OPOQAzKOteJZ7T4QUc9ovFqsX2bbd/1my5fXk
         3+HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=5gvgKwimCadXf1JTxTH7rBLeNrxLf4ACeqJfsG6OVqM=;
        b=AQO1w/weUYKhJ/ueLs0KTIyd4xqbpb/R63RWobGvGfGcTqemF3FEH9WjWyBsTK0GCK
         SypNHSshbv7cJbtF1SWNrKYRFWppd+G6IRkOMqBKHl4An3bo2C4G7PRnYMzg+jXI4+JJ
         S28FPFVA/TjhZ3I6Sh2ZqlKDE4W8e1VNj3/ULB9pCV08ED/umYbgmpNKRB8XVZ80Y7Bb
         4GINPf1ViEX7Rq/f1elxO79mEY1pekrWNB3T9snVtFiVZU8h5NRLUC2I6qtUC5B27R6z
         Y6gdhGyl2CLmt+iTWN2oKq0OXm1K5S9zs9S8mWU3zLHVfABezOj504Y+RCf7YaJfQdXc
         71Kg==
X-Gm-Message-State: AOAM5319UFnL2MmNBhbZ7gK4goEkKa8PJjnmJg25T/kCshHDamBAMBOF
	LQJ2Dg/LhgNqMb/ZdCqAC0u+3D93iFyzqrb5
X-Google-Smtp-Source: ABdhPJwH0R9Xvli/ZUjYcMgn7pucNy/UMg1s+eYFus+18/hdQqB5bJ9C0PaE8Bhbs9XjJ6r3TFnbeA==
X-Received: by 2002:a62:54c5:0:b029:3a9:d3d9:4fe8 with SMTP id i188-20020a6254c50000b02903a9d3d94fe8mr12324328pfb.36.1627826568308;
        Sun, 01 Aug 2021 07:02:48 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y7sm7660939pjb.52.2021.08.01.07.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 07:02:47 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 2786F960402; Sun,  1 Aug 2021 04:02:45 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 01 Aug 2021 04:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210801140245.2786F960402@nuc.router0800d9.com>
Date: Sun,  1 Aug 2021 04:02:45 -1000 (HST)

Branch: master

New this week: 3 CVEs
CVE-2019-25051: aspell https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-25051 *
CVE-2021-34558: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-34558 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *

Removed this week: 1 CVEs
CVE-2021-33574: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33574 *

Full list:  Found 11 unpatched CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2019-25051: aspell https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-25051 *
CVE-2019-6293: flex:flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2020-27748: xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27748 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-34558: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-34558 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-35331: tcl:tcl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35331 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
