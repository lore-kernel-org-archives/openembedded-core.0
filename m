Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADDB4C433F5
	for <webhook@archiver.kernel.org>; Sun,  8 May 2022 12:02:45 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web09.19959.1652011363076660027
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 May 2022 05:02:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=zKJ7lEVG;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id
 gj17-20020a17090b109100b001d8b390f77bso14739726pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 08 May 2022 05:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=qYC1jpy4FOuUfeWO0Y0gQ3xVGNygGvCwQc3D8F+apX8=;
        b=zKJ7lEVGM9MQppNdon/HXFVCLUuQ1G6Gg7nRXUS/xhcmJ/AZHQgmIbcWBAUQdZC43z
         jyDIHQOtYXzKnGfJZ9YcKKqDG2XwjDycFCBsty8m0RoE5YIhXuJQWrchbGsqjZ+pfcme
         7+ts8mxQfx5vz8JleDJSGwUd5EeaumkezJEWDLvo4pHk8/nU4DjKw3xnnQCeT21w5I7V
         3IZK9b95PNaa8/g8NjvXVUeQ7h3atvJj9EeTkQPQgyiAamZxhMhmNV1wsYbM/wWD2/bh
         yhmQBnhveCw7u57Vo5zCypB+XQ12KIWE7TQ9UvO3Fscu2GNZShrXsfdFaaIfwk0PMZBv
         niew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=qYC1jpy4FOuUfeWO0Y0gQ3xVGNygGvCwQc3D8F+apX8=;
        b=oOYLE74vOLJi/elMJdssDokNJcJf73ggrhwjfDsHJtyZjua996rW9EXlm0dz7avbuF
         WbykiIneqI+ZTzV/j5YDK22sCpeALfNNJ6snpCmBdqQfMflf+hR0Z7V8m1+ev5n7u+1Q
         v3qtnJX92N/Fd3pmVlnxyNmvVqM/zkRJFBDfQlaX5xtTk6J60R8uyscwgAR5wWjVHWTa
         Ol302f8i34ZPuSlSM/nEheMtlj3rD7MqY1n4+Vn0lkjPlau3TKC0tDBFvqoCphhpHRZh
         APnf4gNuhA/G84v8Lxl/cOoDfBR878hl1ylVXbzB5ZQHxCuo1ruDW0zmlzMnJNM9KYyv
         EtTw==
X-Gm-Message-State: AOAM532Led8hk7bgRKZIxFicvgvLLdGXycv8ZnuMnGlOOwO3vnF5p2yj
	8Z01/hWBNZr5paqz6EfyvJVcKlE2GPsFuHTk
X-Google-Smtp-Source: 
 ABdhPJxq9AFOTp+d6WEOyV7kqH7OxG8Zxbze6o8pZ/oaBPkPyJr3IvYcPZzrsGLfQ+FnBxYy1jUiJg==
X-Received: by 2002:a17:90b:1c0e:b0:1dc:414c:4927 with SMTP id
 oc14-20020a17090b1c0e00b001dc414c4927mr21460470pjb.144.1652011361636;
        Sun, 08 May 2022 05:02:41 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 a13-20020aa794ad000000b0050dc76281desm6602129pfl.184.2022.05.08.05.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 May 2022 05:02:40 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 8E97096274B; Sun,  8 May 2022 02:02:38 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 08 May 2022 02:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220508120238.8E97096274B@nuc.router0800d9.com>
Date: Sun,  8 May 2022 02:02:38 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 May 2022 12:02:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165368

Branch: master

New this week: 3 CVEs
CVE-2022-27404 (CVSS3: 9.8 CRITICAL): freetype:freetype-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27404 *
CVE-2022-27405 (CVSS3: 7.5 HIGH): freetype:freetype-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27405 *
CVE-2022-27406 (CVSS3: 7.5 HIGH): freetype:freetype-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27406 *

Removed this week: 0 CVEs

Full list:  Found 12 unpatched CVEs
CVE-2019-12067 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974 (CVSS3: 3.3 LOW): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2022-0529 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-1210 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1210 *
CVE-2022-1381 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1381 *
CVE-2022-1420 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1420 *
CVE-2022-27404 (CVSS3: 9.8 CRITICAL): freetype:freetype-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27404 *
CVE-2022-27405 (CVSS3: 7.5 HIGH): freetype:freetype-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27405 *
CVE-2022-27406 (CVSS3: 7.5 HIGH): freetype:freetype-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27406 *
CVE-2022-29458 (CVSS3: 7.1 HIGH): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29458 *


