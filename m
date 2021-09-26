Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AFE9C433F5
	for <webhook@archiver.kernel.org>; Sun, 26 Sep 2021 15:02:57 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.19313.1632668576213038518
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Sep 2021 08:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=4/Arl2aR;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id y186so3909284pgd.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Sep 2021 08:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=Vj8u6h/YNjg3xtQsqTqEaWMqs5AUgU0aiBe8jUFex0o=;
        b=4/Arl2aRoOSxxjxKhGfX644WZPHB98uJF8/amRFG59BLRUgfwdVHQCwhdO/GcqnXdx
         1fNeYwjXbuiEBPzW4c8N8rMPpiVkDrNuC/vhzN/fwKUh8kuHTxwVsznVeIaKQQEAyF8t
         2L2nlZe+gjovGzPzwPqb+Z+vthSicwlmxB5dJygKuFxZxiMiBcSWuybc1jAhTkm9FBFx
         N/E0KAY5eZ7SZalGwrWNSXkBqKysMpVn7oNVYzZfZ3/8IaT5JzZ6yNJytfbgb6tz0F7O
         hWOEjdoWd+uNb28YoBHkYgP2jo9JZWLj/7z6Jf9s8UGiQIdSOg8uas5iMrg5cUFic7Wi
         fVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=Vj8u6h/YNjg3xtQsqTqEaWMqs5AUgU0aiBe8jUFex0o=;
        b=ZbX9GClvPd/Q4zrcQ23sEl0L5hcTc9PwIuZ3tBWE+5+63n5ZkK+tSkJ9SoXcY3DN/F
         CPn9UyJOIsLHDt2RkBv3rzDzkY7Zb9EdPsC3VRiCsY9pR5SZT7yUmN5kGSkxTqGNKFk5
         10WLwMaHxiUNsnEZgioCH1WaWjrnuBJuFLKdxCLX0DT3gVAqBLiPjlfUxl/UT+4jJHZ1
         wLThN9rk0erpD17p5LfmhuSTfEmHsTgb0qIHoRilNGf/hDfG6IjcRd8RsSpK7mvJZAX3
         G4OXlp02tuASfuf3rDS996DduR4NWh3HMLaE0wxC0wRy/nwA9GW/E6Ip/WPU8Al1xZye
         YNWw==
X-Gm-Message-State: AOAM530jkkSQVMLW8KWMz2bnOH4SmihMOYKlt3g+W2gqq0cO79zZTmNj
	fe7CtW+AqV9r8fid00hMIJaS3UXJJZ8izKgqUy0=
X-Google-Smtp-Source: 
 ABdhPJwbHRtoVdmkP43auySYZYzXSsN5HLVfp2IEZyt0k9db649ZcJD0FEYyCtyqAO7Xn6B0LicNYw==
X-Received: by 2002:aa7:9841:0:b0:439:c4cb:fe9a with SMTP id
 n1-20020aa79841000000b00439c4cbfe9amr19327772pfq.13.1632668574947;
        Sun, 26 Sep 2021 08:02:54 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 g17sm14836034pfo.11.2021.09.26.08.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 08:02:54 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 75F00960222; Sun, 26 Sep 2021 05:02:52 -1000 (HST)
Subject: OE-core CVE metrics for hardknott on Sun 26 Sep 2021 05:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210926150252.75F00960222@nuc.router0800d9.com>
Date: Sun, 26 Sep 2021 05:02:52 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Sep 2021 15:02:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156365

Branch: hardknott

New this week: 1 CVEs
CVE-2021-3778: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3778 *

Removed this week: 3 CVEs
CVE-2021-37701: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-37701 *
CVE-2021-37712: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-37712 *
CVE-2021-37713: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-37713 *

Full list:  Found 29 unpatched CVEs
CVE-2013-0340: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0340 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2019-6470: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6470 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2020-29623: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29623 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-1765: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1765 *
CVE-2021-1789: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1789 *
CVE-2021-1799: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1799 *
CVE-2021-1801: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1801 *
CVE-2021-1870: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1870 *
CVE-2021-20196: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20196 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-22922: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22922 *
CVE-2021-22923: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22923 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-33928: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33928 *
CVE-2021-33929: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33929 *
CVE-2021-33930: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33930 *
CVE-2021-33938: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33938 *
CVE-2021-3445: libdnf https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3445 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-3682: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3682 *
CVE-2021-36976: libarchive https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-3770: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3770 *
CVE-2021-3778: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3778 *
CVE-2021-40491: inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-40491 *
CVE-2021-40528: libgcrypt:libgcrypt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-40528 *

