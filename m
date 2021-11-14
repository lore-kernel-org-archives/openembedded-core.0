Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DCEEC433F5
	for <webhook@archiver.kernel.org>; Sun, 14 Nov 2021 15:33:29 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.10272.1636904008082941616
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Nov 2021 07:33:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=QCI4TiOa;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id x64so12846847pfd.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Nov 2021 07:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=O0h9g0OBSqrmjJJqbumL8FFxGN+jRFMmKhXDLBfjQXk=;
        b=QCI4TiOaDaeJTQ/dCxjhdUMy9E3KMdCk2x9VSqNKXRl9iA0HTPQLuNBk4W04zIe9Yt
         VZcUNjrupz4MqJ5HE58yWf1o5l3GH658dNgemBkYkOZvbmv+U03wepgSOARJUmoa8oev
         AIqQhMspd+FeUf6JhiLZkyBNNOYWn34r58jsjGp2Q5a14niLpLJuhIcg+MQzvUlKIyAe
         9qVqDJqoV2QDk8vl2O7LDw8R8Om8lCluij0vHY3mo0x0lodW5Ih8cwM3iApYSPGJ+N9R
         ecalI5HQrp0nYuRSNalrH3ic5YNANrTuDsg0Kbk6uYRMZ98SZqEPeMdJi5EK/nxyY+we
         MJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=O0h9g0OBSqrmjJJqbumL8FFxGN+jRFMmKhXDLBfjQXk=;
        b=XyvgikAGOU4eDSDN3dLIC3FWhx1weSkJOsA5OfwFEOIcAOLO4J+5Bp+wLacEAZF56Q
         X7Rs3QxsZhA3NK5JPHHJHzX3igC+hH5RWTjOpi+TcemVOZ2Xlr7nfuVKf7WXfrzVMwQS
         dGRl4UsvT2zz60Oe0SsHFizgAK72ZRbS4/l/rlXu5OsOvDx/xz0XemDymJGG2AIqCjTL
         ah5Z5clBug2D63sazNK8v7brWuuCftZQghQbDQTrThg2fVPPrY42xYzzmCeLgqxDih+A
         RTrozcvA9QyUmcMXVKEe/zf7EQWqgufVWKQ5b9HhDNIpcmhNcdszM+Drd7+mZ4o3vIfG
         5VRA==
X-Gm-Message-State: AOAM532FXvU1TmLX/5J0HPeiKPVBq5zqSFOVOAfUJ17ipKoYfk1nCrs/
	Sa8S1HY1IXb3/rJMPo1ZEAzw8gon1otAZ0nB8f0=
X-Google-Smtp-Source: 
 ABdhPJz3b8H2dGyrAv/WlgNiAOPmJ1xek83+fST6PWXoQyU38PCy+tGtypMvfZnNrbrdk8JRcpRMWw==
X-Received: by 2002:a63:42:: with SMTP id 63mr19771562pga.127.1636904006969;
        Sun, 14 Nov 2021 07:33:26 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 i68sm11885881pfc.158.2021.11.14.07.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 07:33:26 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 86C799603EA; Sun, 14 Nov 2021 05:33:24 -1000 (HST)
Subject: OE-core CVE metrics for honister on Sun 14 Nov 2021 05:30:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20211114153324.86C799603EA@nuc.router0800d9.com>
Date: Sun, 14 Nov 2021 05:33:24 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Nov 2021 15:33:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158259

Branch: honister

New this week: 6 CVEs
CVE-2021-3927: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3927 *
CVE-2021-3928: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3928 *
CVE-2021-41771: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41771 *
CVE-2021-41772: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41772 *
CVE-2021-43396: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-43396 *
CVE-2021-43400: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-43400 *

Removed this week: 0 CVEs

Full list:  Found 24 unpatched CVEs
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
CVE-2021-3796: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3796 *
CVE-2021-38297: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38297 *
CVE-2021-3872: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3872 *
CVE-2021-3875: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3875 *
CVE-2021-3903: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3903 *
CVE-2021-3927: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3927 *
CVE-2021-3928: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3928 *
CVE-2021-39537: ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-39537 *
CVE-2021-41617: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41617 *
CVE-2021-41771: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41771 *
CVE-2021-41772: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41772 *
CVE-2021-42762: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42762 *
CVE-2021-43396: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-43396 *
CVE-2021-43400: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-43400 *

