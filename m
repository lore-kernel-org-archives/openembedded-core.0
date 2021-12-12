Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10BE7C433EF
	for <webhook@archiver.kernel.org>; Sun, 12 Dec 2021 15:32:09 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web08.35395.1639323127682408539
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Dec 2021 07:32:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=hB6zmM9U;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id l10so1407333pgm.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Dec 2021 07:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=04ts1gcwe9ue0LgC5vvTTD6w7OrsjPBoVJOtwvmVdpw=;
        b=hB6zmM9U+J0jYIVOFyRB5PM0iOLV8Yd5UolwFsXE4NFpAIfjR4QNHkrr5HgfSny97Z
         IAIYY2LCHkNFzqFfCLWOeOS9TlFUZ/yB0UShMLNWBvU31czAs6s8XPtt+9oZ/Xlc3o0P
         3/ymBDCLwDplea6aSgae7tmKoN87AldKaNPtq8Pb7gZH2n5fdj9aa772Vpsy0ELSlkjm
         pmvyWLCfyswOvzoVfCKtrhC1n5/s8p/orCFkiLzRm7Myk9AU4W3OeCg1NeI91fc1NaIO
         rj79GFMQtALPkzsgsJTrcVsY/VQ2Vz/YtO1JszI+yAr4g5cOSUMVXVnlWL6oAVScSMVt
         nxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=04ts1gcwe9ue0LgC5vvTTD6w7OrsjPBoVJOtwvmVdpw=;
        b=eLbXGioQwkvkBzr+Dd85F9kZO5nblklU1e2016hEhaYMk4Pi9MkzK32T7CxdLbTcz2
         4CgOZLLo6mnRpDmLwaQ3lyzGOFEa9slkEPz+yjzFaTJmFYulsLIydh16SEkQCF6cYqmP
         O4brZJmSnTVz8mWCN9561Gqgtgeqxx51o0UcqiY4+JTrueC4ZV1O/MMrP8lq0RsAG1OR
         qhHfRhUM4SgfBUovvZ8xPAM7hg9PbfJOXiVFEb+n7VfYgnRmLqmDk6hEODNzlVZ6dpio
         9lCQFhY7+cdy9CXWk76zgoWfOKt5dkB7+ohoH592FrgWdNkfPBuPIqEttkfNuYXPmWAO
         Vdkg==
X-Gm-Message-State: AOAM530OB764cUACQ6HlTsUzQ2gxtldFbHS2jpYPcwFmR66mGtXX/YbR
	aiO/8QKDX6hD1hDR8zvtGII/niahRPP2FhUx
X-Google-Smtp-Source: 
 ABdhPJwHqIL/F5fIVCjTgCi9d/PjKTnDGvOPGW/AfCCxf+AvhA40cYw0fKpdTvdAEtF+rSXj6G+hDQ==
X-Received: by 2002:a63:e4f:: with SMTP id 15mr48217671pgo.336.1639323126620;
        Sun, 12 Dec 2021 07:32:06 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 p43sm9031165pfw.4.2021.12.12.07.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Dec 2021 07:32:06 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 1A784962CA0; Sun, 12 Dec 2021 05:32:04 -1000 (HST)
Subject: OE-core CVE metrics for honister on Sun 12 Dec 2021 05:30:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20211212153204.1A784962CA0@nuc.router0800d9.com>
Date: Sun, 12 Dec 2021 05:32:04 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Dec 2021 15:32:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159587

Branch: honister

New this week: 1 CVEs
CVE-2021-4069: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4069 *

Removed this week: 0 CVEs

Full list:  Found 26 unpatched CVEs
CVE-2016-20012: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-20012 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-25219: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25219 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-37322: gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:gcc-source-11.2.0:libgcc:libgcc-initial https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-37322 *
CVE-2021-38297: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38297 *
CVE-2021-3927: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3927 *
CVE-2021-3928: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3928 *
CVE-2021-39537: ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-39537 *
CVE-2021-3973: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3973 *
CVE-2021-3974: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3974 *
CVE-2021-3984: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3984 *
CVE-2021-4019: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4019 *
CVE-2021-4069: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4069 *
CVE-2021-41617: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41617 *
CVE-2021-41771: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41771 *
CVE-2021-41772: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41772 *
CVE-2021-42762: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42762 *
CVE-2021-43400: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-43400 *
CVE-2021-43618: gmp:gmp-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-43618 *

