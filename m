Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.14553.1629662125255846404
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 12:55:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Ee5CJSSp;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id n18so14638767pgm.12
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 12:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=1y1a/BYlzFHUlkmIV1XSa8d1PjFK8vNXibzAOhpKUn8=;
        b=Ee5CJSSphakHUC6M8p1m5NDJli+AfuCZYNEglYjOFCsY03BDe0YYiUF8Brybcsm6vR
         geohlgPODICxiwdSQa1u2jhkhbRygURw32u4eVCz2mzjCk2o1XbHHw0Kb3Df3CisrfJy
         xpBiEhmPPCwhVq3O893oit5SPGuFco8BawBlnK/Wi7O7JTWxxjcq7gKlDb7uAcfIkqXP
         dPwNwGDGI9dgUZmZzlCw8FzGKysGx33+SFz+fYXFsRpQPL1AXw6ElKNSFWfxB/4ugdz1
         NeoAWYNejciVhSswDUFz5DVHi8m6m7IulqoD1f2M6BbyWGqVr0pEhPSby2GCNROXdALb
         W/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=1y1a/BYlzFHUlkmIV1XSa8d1PjFK8vNXibzAOhpKUn8=;
        b=EqIh0f5EEusfv87DzgsL+J0qa0VKIXSFcaz61zwawDgy0/rDb4sNT5XqNFsQmLS3L3
         Uh4CrUIYdD+38b8oMROz3cszyJwQFNMkh/DLZOBkdRQH2Bn/l6CIUum/sUpaflwwem/f
         JyNVPA1o3UMBx7WSLegyc+i0dpEStCW6z178SNUtvlnhnV8iGIOg9Txj25hZP09FvikR
         0XAmcbtoPGhoAARbhF/79dYpKKNJXIaF/WPNEPhTrOoBozfBpPWsLHntSmcv0xlE5Nau
         wYwhPCqVpnc//sA/Y+elsUaz8DiQyvhswjOPbhTUoEr2SGdlq73GAL0YjpQPL2kHBRQo
         iMuw==
X-Gm-Message-State: AOAM5308iquifvSPiDAGzdQcsf1BOLnOQ2txwplQfcF6zI2toLWQ9Rj3
	mBOW64D7ctC7BYesttCbup3G4rcyQIQZzzCj
X-Google-Smtp-Source: ABdhPJw1ehSTlUZK5Ewq46fb8VMexAXWNBg6Wd5wMvu65vlfoHMBoS3zw07hhhB2Ak+C34b4vV+YRA==
X-Received: by 2002:a65:6283:: with SMTP id f3mr28701895pgv.369.1629662124177;
        Sun, 22 Aug 2021 12:55:24 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id 129sm13738292pfg.50.2021.08.22.12.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 12:55:23 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 6F673960344; Sun, 22 Aug 2021 09:55:14 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 22 Aug 2021 09:51:56 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210822195514.6F673960344@nuc.router0800d9.com>
Date: Sun, 22 Aug 2021 09:55:14 -1000 (HST)

Branch: master

New this week: 2 CVEs
CVE-2021-29923: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-29923 *
CVE-2021-36221: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36221 *

Removed this week: 2 CVEs
CVE-2021-32803: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-32803 *
CVE-2021-32804: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-32804 *

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
