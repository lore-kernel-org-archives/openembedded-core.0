Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web09.4001.1630245886364236521
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Aug 2021 07:04:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=qesNgZ6E;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id t1so10810708pgv.3
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Aug 2021 07:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=z1GEzle9WIQ6titGEPssMXxp50UxxpDEbFqYbLY1sfE=;
        b=qesNgZ6EdCtR25G3AqwIOZxkc4k6SdRumR6oGDtKwdqlf37kvyqVWw5BTCD+Z/PBnh
         frnxTPhtYYbO5rShb7KRfO6P9y+ALf85wp7XF8jWX15qpI6aFomS+nIvauydOQ7WtSoA
         0U4TevjMT0fX64WmUrJv5S80CkzkrgCI3vtcs8P7jlsJfki/xKmfb9TDVnQi3OtBjTv4
         kGM/jXFlytjNMUIJfn8uUgc4teD860+Rhkfqic/wfLmGWG1H+o/N9rI5u+CvIyFuVezU
         /zPedIJnvmcVncx2/9VkuBjx6pJ5TkzTKSv+XtXshQ6Z3/MYXNE0vy9rnBEq++6CtuXO
         z+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=z1GEzle9WIQ6titGEPssMXxp50UxxpDEbFqYbLY1sfE=;
        b=gizD6xALC/LdKxLUbaARm94hWsQ1HMNo7+sw49lXEdkAEDM+Qu8WPFyA5aDBEJxbBX
         15f5l9xxZ/8EEavKNd9xD2WtZVQB0IPeLIMctDQLZzXFV/60tP9asvLxqKq3zDJxAzC6
         7o6Js/Exi1oonl9E7Fhm88h0GcimPqtkI/m150MTrqZd12SKL5jvA4VLBV3co3KsCMms
         FkSVrxK9gEyupsnV4SeMk+wf+TA05jg9rz9b2bGNQQcgypi6UQVIyRiiKwszszB6fhhf
         ugo35EYIbGWU6LnZJY5FrgpY9PMswC6qB5kakF5Be4PFFgN0x+BkLgUjaITUYqtblNB1
         z2OA==
X-Gm-Message-State: AOAM531kkwMth4ya4Ht62RY1TtZD9Adi4g7LFJ3bY0NDNWVad4pbZmFh
	Jwwu/cBSzeomi/6bVpSNuK/MQve09d76P3iL
X-Google-Smtp-Source: ABdhPJxJ0XVWUjrT6LnGLD0KQZodbGf2wFW28U9+7pU7yqpAgnhfjw89d2OidvJi4+15IxzTJJoHuQ==
X-Received: by 2002:a05:6a00:1881:b0:3fa:7d56:c611 with SMTP id x1-20020a056a00188100b003fa7d56c611mr6868337pfh.8.1630245884650;
        Sun, 29 Aug 2021 07:04:44 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id a10sm11428928pfn.48.2021.08.29.07.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 07:04:44 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 0ED6F960371; Sun, 29 Aug 2021 04:04:35 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 29 Aug 2021 04:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210829140435.0ED6F960371@nuc.router0800d9.com>
Date: Sun, 29 Aug 2021 04:04:35 -1000 (HST)

Branch: master

New this week: 0 CVEs

Removed this week: 0 CVEs

Full list:  Found 13 unpatched CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2019-6293: flex:flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2020-27748: xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27748 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-29923: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-29923 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-34558: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-34558 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-35331: tcl:tcl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35331 *
CVE-2021-36221: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36221 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-38185: cpio https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38185 *
