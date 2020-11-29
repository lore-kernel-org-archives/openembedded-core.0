Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web08.48801.1606673912550564996
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Nov 2020 10:18:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=G8PCLRGa;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.52, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f52.google.com with SMTP id l36so9281352ota.4
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Nov 2020 10:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=kdmZcFkSgb2XZnFe01QAnWW77VwszID7YxHpiTuKwaI=;
        b=G8PCLRGaE3tizhmIqlCxGU/a42HSXw+VvJNU9WvalGqha92vQ5GYyBivyc04LfE5V2
         LTuGtRadEjX1f3p94rW9UTDUvF6OBraHSii9KAT14IXSzeOsPZzsYQiRJwNpuMxS5ROO
         DiGGi3StApg1avXwvoe6kuiaOULeyYwBmVWFhsNbu4Qou68dBJuRSCYBO2BHTSCOzppL
         zg4TwVZ3gouonUfmqkd4/DDeKbizcN4dYZmHRhqGlOWiaoam/iQpiBsTROfhKetbi4/V
         dYNBtZGhCJgb0S89lczjw0/8n9FgibNN0a9Me7UDnMphafJamuastzk1/xtLuR9y40vJ
         ZTnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=kdmZcFkSgb2XZnFe01QAnWW77VwszID7YxHpiTuKwaI=;
        b=IN6SQiF0bL8FowWhP1RiEKJNzOTIymSXfkfsuCReCzzouOI8xsJSTSpSTZrJKOxhsv
         JUHZD+Cc/klcTyFBkWQ5R+NZHdmCrUHszRaEyv+WC5fcDjw1Qs0BfPB/ofUAzm5eTWXP
         gjsGFgrLPXxfDu/CwgtiOxBfobqQX+8URZV+NHaOWQt5o8a+khUaoszW4mUvqrIeT571
         dgeOc6m7E60SO4Hcvh3ZYc6MJhCd7S0w0136l8XtomVAXVV3p1t4yDkerxl+xnnHFexE
         DslLIktcvUp8v4FdCyhSs7G5sBgA2yv8GXKUACe4SO4P6If614PtCLGNin+AngXD8/1f
         a3fg==
X-Gm-Message-State: AOAM531rSdSPOW0UgMSHQFsRaMSjbg/cF0yUraNLagoJ6KQaULd49OlG
	kgXDO5XY6yFKZFONmBd1QDGtnGp7ATIjzj3j
X-Google-Smtp-Source: ABdhPJxdPtykErUDJAfvXYL88fFHZ2AO+cszRapH68WWEYo7oeN48QHCxuMy89KZLFMQUtmZMe3Ykw==
X-Received: by 2002:a9d:6189:: with SMTP id g9mr14050655otk.231.1606673911425;
        Sun, 29 Nov 2020 10:18:31 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k20sm8415779ots.53.2020.11.29.10.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Nov 2020 10:18:30 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id DF18A960251; Sun, 29 Nov 2020 08:18:27 -1000 (HST)
Subject: OE-core CVE metrics for gatesgarth on Sun 29 Nov 2020 08:15:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <steve@sakoman.com>,<openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20201129181827.DF18A960251@nuc.router0800d9.com>
Date: Sun, 29 Nov 2020 08:18:27 -1000 (HST)

Branch: gatesgarth

New this week:

Removed this week:
CVE-2020-24352: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-24352 *
CVE-2020-26154: libproxy https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-26154 *
CVE-2020-27153: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27153 *
CVE-2020-27619: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27619 *

Full list:  Found 48 unpatched CVEs
CVE-2013-0800: cairo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0800 *
CVE-2013-4235: shadow-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4235 *
CVE-2013-4342: xinetd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4342 *
CVE-2013-6629: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-6629 *
CVE-2013-7381: libnotify https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-7381 *
CVE-2015-7313: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-7313 *
CVE-2015-8345: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8345 *
CVE-2015-8619: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8619 *
CVE-2016-4002: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4002 *
CVE-2016-6328: libexif https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6328 *
CVE-2016-9101: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9101 *
CVE-2016-9907: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9907 *
CVE-2016-9908: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9908 *
CVE-2016-9911: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9911 *
CVE-2016-9912: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9912 *
CVE-2016-9921: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9921 *
CVE-2016-9923: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9923 *
CVE-2017-3139: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-3139 *
CVE-2017-5957: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-5957 *
CVE-2018-1000041: librsvg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-1000041 *
CVE-2018-12433: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12433 *
CVE-2018-12437: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12437 *
CVE-2018-12438: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12438 *
CVE-2018-13410: zip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13410 *
CVE-2018-13684: zip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13684 *
CVE-2018-18438: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-18438 *
CVE-2018-6553: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-6553 *
CVE-2019-1010022: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010022 *
CVE-2019-1010023: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010023 *
CVE-2019-1010024: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010024 *
CVE-2019-1010025: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010025 *
CVE-2019-14865: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14865 *
CVE-2019-20446: librsvg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20446 *
CVE-2019-20633: patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20633 *
CVE-2019-6293: flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2019-6470: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6470 *
CVE-2020-12825: libcroco https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12825 *
CVE-2020-14310: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14310 *
CVE-2020-15705: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
CVE-2020-15863: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15863 *
CVE-2020-15900: ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15900 *
CVE-2020-1752: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1752 *
CVE-2020-25742: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25742 *
CVE-2020-25743: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25743 *
CVE-2020-28362: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-28362 *
CVE-2020-28366: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-28366 *
CVE-2020-28367: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-28367 *
CVE-2020-3810: apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-3810 *
