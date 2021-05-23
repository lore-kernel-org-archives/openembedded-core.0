Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web12.10419.1621778607754107245
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 May 2021 07:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ltTGLjHa;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.49, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f49.google.com with SMTP id 36-20020a9d0ba70000b02902e0a0a8fe36so22637426oth.8
        for <openembedded-core@lists.openembedded.org>; Sun, 23 May 2021 07:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=IQzvf+LEH/a0NF1LGoPuUeAJ/YQd+ppz5CJ5p0yNnJk=;
        b=ltTGLjHauqH3YmrcA5Ny9fxHe5K1QuGTV2WAZwRQWZaFtwMbEEDG8COKZm44lL/fV0
         pC9pR78m+ujH7v4/F8RWmZTpmT6e/PfdRwUg4RQdo2VKtqZVK5IxksHMTswFfnnZOEW0
         +4PmtMJI1SUmt0qLLy6U3PnsAf/qlZ/CwYFQkkGlm/jMxgv0m2zMbKZcYPVOBkkTk4FW
         nmx7nnPs9ej8Ky0UV+yGqFXj5H8PrIh828F5Ff9laJ9cwBRwvdG0+gHFRpLPP/5N3Z4u
         6z7K3d5/zi4EqroZbssoipjCmHVpjBpv5WVhbNJAEPriA3StwIX+MYutgDIE7npUJVnW
         kUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=IQzvf+LEH/a0NF1LGoPuUeAJ/YQd+ppz5CJ5p0yNnJk=;
        b=J23VZjmovL5TqZvGRlhDKKj54yJ1yzA8Ns5PtNTQr6mh3ZxKijaG3W37ZSTv8Gea4f
         5eVoIyCv9BHjeHd2aniFa/0HGKPNuhlum/n+W7D9hxr/IloKLZYqnjSCGo7GQYGZhVCu
         SVvZGjiEWXPH/7gvcafBoJqeaVYimuarWx9tdqoc3Tkm1rzBttPOWXz/YAnSGrj9XKLF
         tS1jAf+F2bGDTO/b8rsPanLrLaGHJM+0ifzID5heFtnOtIkToU2bYZbcTZyVwPu/D0po
         JCy+MWmhQ86OFze0v5oumBs3jrdvsjOajeH2a6G6OtdyTI0nyehpqS0J9S+oJEAd29VX
         NfIQ==
X-Gm-Message-State: AOAM533NB2D1oOyulSZmguFSiejMjS6G6I4LiUxBzPma3R0wZ+ZhC8jL
	TcuV1UiDyNOP5g8ycGhM1h4fkyi0IV6BImEyMWo=
X-Google-Smtp-Source: ABdhPJyDKUxE2dgz+Oq+2ur0n9QQJ/HRLUQeTzvkIhMFJfFs5wJuW/eH1JQolQg/eoqeLoRl3WnIpg==
X-Received: by 2002:a05:6830:4103:: with SMTP id w3mr15632428ott.27.1621778606600;
        Sun, 23 May 2021 07:03:26 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id a18sm1985718oiy.24.2021.05.23.07.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 May 2021 07:03:26 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id D37E296035D; Sun, 23 May 2021 04:03:15 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 23 May 2021 04:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210523140315.D37E296035D@nuc.router0800d9.com>
Date: Sun, 23 May 2021 04:03:15 -1000 (HST)

Branch: master

New this week: 1 CVEs
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *

Removed this week: 14 CVEs
CVE-2000-0006: strace https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0006 *
CVE-2005-0238: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2005-0238 *
CVE-2007-4476: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-4476 *
CVE-2010-4756: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-4756 *
CVE-2019-14865: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14865 *
CVE-2020-29509: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29509 *
CVE-2020-29511: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29511 *
CVE-2020-35517: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35517 *
CVE-2021-20266: rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20266 *
CVE-2021-25214: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25214 *
CVE-2021-25215: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25215 *
CVE-2021-25216: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25216 *
CVE-2021-25317: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25317 *
CVE-2021-29921: python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-29921 *

Full list:  Found 5 unpatched CVEs
CVE-2000-0803: groff:groff-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0803 *
CVE-2019-6293: flex:flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
