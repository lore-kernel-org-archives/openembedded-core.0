Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web12.32643.1622386988725976803
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 May 2021 08:03:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ZHfe9y3K;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id e15so3950731plh.1
        for <openembedded-core@lists.openembedded.org>; Sun, 30 May 2021 08:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=nVRS5PlJNY1cv4ulUarhUR9V1Ra8q11ifZMBMNXMhyM=;
        b=ZHfe9y3Kdr2sKr4fCX4ahO5Yud0JNRs9RuPlgN9TEVRAlTtfq9tCNEHcfK+ME8DrmK
         R1itsSlEcX0gvDq+QZdVlCxR0tY6aowEnlRW99z9j7fNj7GwIa1w3r43lY/WfwqjzT35
         tMZHhi3C+QZua4SFqRahElQPO2WYqq7q/cvEquga2EiE3r8qnyG5faVoG/TV1I92MonA
         zSDlVZEmsiQRTvTiZgaeeO+0oicPPxqNtTQIhqTW9rW43hcUbZyvGu0/H1C6Bluqhoij
         7R98DMgonaW8OmhVysVf8fB9oEGf4rJmC1TcGqo0XrIJ3K6l+RL+ziL+LmNGqzimb3UW
         cIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=nVRS5PlJNY1cv4ulUarhUR9V1Ra8q11ifZMBMNXMhyM=;
        b=Z18IdrDfJ7KwIJKXS9e0G5K/wtz3F01J3E7vzb1GHhGO078skdfYv4iRQyHihwnbrg
         IYeUL0hbfxdcUhkw60SnMg4A21GBNu4vcsB8CTboanip3/Vx1Bw6SRtVWeaYjuk1b7CS
         lmxkpvyJQZ3JU5Tx1UTpAo8fgOL+lIfxpe6s75m8uKmBVHxKIO+iJ3tS0/sEUKh8hI7u
         qjj5OIeg2PALU2pIo5A7uuAdcFZKLbmXqlmoy3tWTmCGqS3xxcyPJko9GbyfCniC8euo
         H4xkownUeQCuB/KCG9F0ViWsQQcokRmUpfyJfxFCxftZOupoWMTHGmkGDPmlJxnmLbvY
         px2w==
X-Gm-Message-State: AOAM533hxNwpwxj8DmRk9Cl5cdDB5rl88fbrGqDg0Zsmx355RuZd5OSN
	6Vdc7g/9sKpWwz/8WVt34tZL8HU9yypARSqv3uw=
X-Google-Smtp-Source: ABdhPJzli2wB+46X8gcwz0gh+UMUxEI0fuIEM4Bb8t1W+qbIcdypWiSDopxLxfbbJ8FKi/sUZgvzSA==
X-Received: by 2002:a17:90a:8902:: with SMTP id u2mr14561628pjn.143.1622386987462;
        Sun, 30 May 2021 08:03:07 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id v22sm8605652pff.105.2021.05.30.08.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 08:03:07 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id EDF83960398; Sun, 30 May 2021 05:02:56 -1000 (HST)
Subject: OE-core CVE metrics for hardknott on Sun 30 May 2021 05:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210530150256.EDF83960398@nuc.router0800d9.com>
Date: Sun, 30 May 2021 05:02:56 -1000 (HST)

Branch: hardknott

New this week: 2 CVEs
CVE-2021-20231: gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20231 *
CVE-2021-33477: rxvt-unicode https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33477 *

Removed this week: 23 CVEs
CVE-2000-0006: strace https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0006 *
CVE-2000-0803: groff:groff-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0803 *
CVE-2005-0238: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2005-0238 *
CVE-2010-4756: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-4756 *
CVE-2019-14865: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14865 *
CVE-2020-10713: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10713 *
CVE-2020-14308: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14308 *
CVE-2020-14309: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14309 *
CVE-2020-14310: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14310 *
CVE-2020-14311: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14311 *
CVE-2020-14372: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14372 *
CVE-2020-15705: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
CVE-2020-15706: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15706 *
CVE-2020-15707: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15707 *
CVE-2020-25632: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25632 *
CVE-2020-25647: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25647 *
CVE-2020-27749: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27749 *
CVE-2020-27779: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27779 *
CVE-2020-29509: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29509 *
CVE-2020-29511: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29511 *
CVE-2021-20225: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20225 *
CVE-2021-20233: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20233 *
CVE-2021-3418: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3418 *

Full list:  Found 14 unpatched CVEs
CVE-2013-4342: xinetd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4342 *
CVE-2019-6293: flex:flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2019-6470: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6470 *
CVE-2021-20231: gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20231 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-22876: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22876 *
CVE-2021-22890: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22890 *
CVE-2021-25214: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25214 *
CVE-2021-25215: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25215 *
CVE-2021-25216: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25216 *
CVE-2021-29921: python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-29921 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-33477: rxvt-unicode https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33477 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
