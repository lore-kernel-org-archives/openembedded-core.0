Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6097C433F5
	for <webhook@archiver.kernel.org>; Sun, 20 Feb 2022 14:07:23 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.21831.1645366043080062153
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 06:07:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=huuwiJbr;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id y11so6440721pfa.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 06:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=AtMBZwntkDBrNc1YX5jXUstrjDbgEBeDpirJv7RBpPE=;
        b=huuwiJbr3yz8LCmM9et7DIZR3wTyRLLSqpHxqT4GJ2IPhifH/QaP4TigAObC9+2gj8
         /k2OMnBMibf2pr9A1hnrYrUn5avmh3NAx7XkZtZnvRMGOf24ONt3al4Y/xdlVIiTtiJb
         vhErk35HZLjE/lHDogLMF3N/G95MGqM9XILNzv9P7OHrWhINIJUaBSakH38XNLwtPdRw
         x83K5k+W/ZG9IvKyicKkzPeU+RQyoNY42t2PRiwwSKVz6Sa/pTft4SEdZZFWS0Mkknmc
         llr8/+u3NYprKX0KIw1jcR50RYgmHalcJK6y9MmCOOVGBgDTCxLl1We4ADDHfJKytPWM
         ELJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=AtMBZwntkDBrNc1YX5jXUstrjDbgEBeDpirJv7RBpPE=;
        b=EMebIxi6vSy1zzEKgvP80xU53MTp49ZFlvq03iOprwIW43d7zmAGoRQMk4Hfwm4Iev
         OeEfHpHQaV++H/b4z41SJPS9ZSPSftMhDtrbrX0SWUdbAyjvYOV0JOnE/u3go2+HOHrn
         qevuN7HUz3UAfyEGlg+p1ag8lofXRYJJ2d5+yM2FW4zfpfHxQ3nV4kC1sqTmpeI1Vj20
         7dNsJq6lqh4zeYEbG9qeGSVu7GIFe7EX6kXxfhNTWLx90iRXftrYvxHjx+kabKAT8Ygk
         VjLtSImP6ILjWtqoqFU/dq2WuPAeyb8IBU/Uj0OzkIHEF74iJLsZibPzOEH9ZFScmgS7
         nHPg==
X-Gm-Message-State: AOAM531veojVf3b2bR6mK586P78tVS1+531CP6XSPMyE/hm2N1H4PNA4
	ZOLpO99QXSVlt0E5RZnb0lXf3J6r26UaZhRu
X-Google-Smtp-Source: 
 ABdhPJz9YFgYGr8Hi3yEPX3CLOtq8ibU6sfnwVb6zBMiDLt2fwx0i02kbwHX4VYYNqnpsu/DLZRroQ==
X-Received: by 2002:a05:6a00:1510:b0:4f0:ef18:4992 with SMTP id
 q16-20020a056a00151000b004f0ef184992mr10272465pfu.86.1645366041844;
        Sun, 20 Feb 2022 06:07:21 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 m14sm15868679pgd.75.2022.02.20.06.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 06:07:21 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 2F4B796070E; Sun, 20 Feb 2022 04:07:19 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 20 Feb 2022 04:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220220140719.2F4B796070E@nuc.router0800d9.com>
Date: Sun, 20 Feb 2022 04:07:19 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Feb 2022 14:07:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161981

Branch: master

New this week: 5 CVEs
CVE-2022-0529: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-0554: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0554 *
CVE-2022-0561: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0561 *
CVE-2022-0562: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0562 *

Removed this week: 0 CVEs

Full list:  Found 10 unpatched CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-44647: lua:lua-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44647 *
CVE-2022-0529: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-0554: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0554 *
CVE-2022-0561: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0561 *
CVE-2022-0562: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0562 *

