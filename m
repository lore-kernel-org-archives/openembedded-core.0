Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F7CC4332F
	for <webhook@archiver.kernel.org>; Sun, 16 Oct 2022 13:02:26 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web09.29718.1665925336206959631
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Oct 2022 06:02:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=3vSLNTmF;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id g28so8868414pfk.8
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Oct 2022 06:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aP7nK4wH+rNt1q37Ueus2bocwK1CPCS3nuLtNftfXnY=;
        b=3vSLNTmFwBONWkzTzDABR8+kz15FRQluGFS6WtzE/2qcagcRfL/gEXpqNcYoQutxqU
         e/xzbjzySoFiRnQ3NJKBOK1UAtPwlO1o8LARoE8I9ER3zVgDbVGMaItKH0SIVHTUJUWX
         PAaMWJK95xzBJOGWRL/vnQN6wRmk5lwb3oBtkdaOl9Z+DSF7WQXltGNwNsJrCeC1wGpM
         DtYim7UurM7/7KfyahH+imPFlNsbRiY5fBVmz6YrF2d3PVj1e00FPoUHQcApLEN+rUX1
         nphTcHIoWSaJTjXGVrMC3d4r5O6nAS5ha5SmDqvtA2hqe71xPg+s9l4ppXWIKcDXkdMD
         694A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aP7nK4wH+rNt1q37Ueus2bocwK1CPCS3nuLtNftfXnY=;
        b=J9M9OgXM+W/Tzuoq8SfYVVAApu0GZ25NR3wqoyVzIlCIqTEKx9zT9IVEwM9eqpGqa9
         V3xSyhaoERTwPzeE7njWsKFKStBUH/SpAfHX1PZG/EZzHMrE5/QFgdgCCHyA1zyCeUlv
         HtpWrUl3lDYFMOvElXMOokE89Of2BUplYg9l3O0RpElZBO+cK5LNKxNpJ9a+oPr9fIiO
         h7mjXI7L7Bs/QYeVI3HSVKMFHS/aCfmwp5R+yZc5PXG1MdB9aSsq4oRjNJ0SSab0Pdmt
         IEhvqlnsvb2iaCthrDQd+YCB6Hp0PUjdXDel6ffuXlmJX8wUzJ8W5yh3pfkBIWvly9n9
         DjVw==
X-Gm-Message-State: ACrzQf3Lkx659c7KeJwrqlst9dUSV06onPqHSN7VytcCInnxVekYdukC
	Nj/0J25F9aPM7jiplWxr+VjxbEVH5B+zb3fg
X-Google-Smtp-Source: AMsMyM5OE7ZxqpGkbfez25YYQvqIioKI9ADYsqJxgqIypAEc/EDb8kptj/6YxtzbRXEUo4JkAO/4lQ==
X-Received: by 2002:a63:455e:0:b0:439:9496:ddd8 with SMTP id u30-20020a63455e000000b004399496ddd8mr6387722pgk.261.1665925334670;
        Sun, 16 Oct 2022 06:02:14 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s6-20020a170902a50600b001767f6f04efsm4741296plq.242.2022.10.16.06.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 06:02:14 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 49E4E9621B3; Sun, 16 Oct 2022 03:02:12 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 16 Oct 2022 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20221016130212.49E4E9621B3@nuc.router0800d9.com>
Date: Sun, 16 Oct 2022 03:02:12 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Oct 2022 13:02:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171895

Branch: kirkstone

New this week: 2 CVEs
CVE-2021-36369 (CVSS3: 7.5 HIGH): dropbear https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36369 *
CVE-2022-3358 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3358 *

Removed this week: 11 CVEs
CVE-2022-2795 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2795 *
CVE-2022-2881 (CVSS3: 8.2 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2881 *
CVE-2022-2906 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2906 *
CVE-2022-29154 (CVSS3: 7.4 HIGH): rsync:rsync-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29154 *
CVE-2022-3080 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3080 *
CVE-2022-3278 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3278 *
CVE-2022-32893 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32893 *
CVE-2022-3296 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3296 *
CVE-2022-3297 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3297 *
CVE-2022-3324 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3324 *
CVE-2022-38127 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38127 *

Full list:  Found 18 unpatched CVEs
CVE-2018-25032 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-25032 *
CVE-2021-28861 (CVSS3: 7.4 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-28861 *
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 7.8 HIGH): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 7.8 HIGH): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2021-3611 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3611 *
CVE-2021-36369 (CVSS3: 7.5 HIGH): dropbear https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36369 *
CVE-2021-3750 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3750 *
CVE-2021-3782 (CVSS3: 9.8 CRITICAL): wayland:wayland-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3782 *
CVE-2022-2867 (CVSS3: 8.8 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2867 *
CVE-2022-2868 (CVSS3: 8.1 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2868 *
CVE-2022-2869 (CVSS3: 8.8 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2869 *
CVE-2022-2953 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2953 *
CVE-2022-2962 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2962 *
CVE-2022-3352 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3352 *
CVE-2022-3358 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3358 *
CVE-2022-38128 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38128 *
CVE-2022-41556 (CVSS3: 7.5 HIGH): lighttpd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41556 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

