Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web12.22341.1607883594574393835
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Dec 2020 10:19:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=S14BGcfl;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id t8so10584795pfg.8
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Dec 2020 10:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=YSHB+GmTOX4dYAcuYQEaB3DoyyqME3XHRLJYm674W00=;
        b=S14BGcflTpir0BiSnmvx3DQ7CLBGNym2ZnsF8ZSFYugs1g1j0KKQfSzP+PqXj8LDa+
         yFH8puZHIcW2M9E/7ADN1bt84J41va/oTWq4NJflgO3+eER/LzpPjazcRc716HQcDXbC
         BtcOeVqylzKJjELMsXc3yRTcvZBrosBXFXkPYKNl9Nvt7gC+VudueWJPCqoCsKZ/LaWi
         hVf46b+VOUWvAixBQDpmBqE0RVe7EtAeAD5X7htHZD0oCVULtqZsXOmXeC3YJyYsI64n
         tEzw7sM5MvqTqNZjrhfTJhZMos4+MBKsTrHTtFN+v5VteCXEOCqudYYmNq6gB7wsol08
         uwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=YSHB+GmTOX4dYAcuYQEaB3DoyyqME3XHRLJYm674W00=;
        b=HkyiLgJEiEc9Z+9EwUCxfDcl41Us3Nz0CHYEyHT9XLygZrDu8gVPMtF5+//VyKx9E7
         XaIhvhndxIROA/fnq4rB5h7YImPM5qMZIReHPVPcepW9oHq1r0s9dg6ELyBesLxGzdan
         M0IrYpPRc9gNjjriy3dO7kRXREPbsZz+uzWM+Q9ag1JU0/yvQMs5+DJFGa4RyYG8GSpZ
         VLS6nBvlz/ynW/NjEV+gIA+DKnByLGadArBg7+BRKjXXqejGygAYcgR6U4be804g19P9
         MSk/C/aLxMHIkjt7ybvvlnn2vIln6sh73UfwEfjjpz4Kfdzxxj4epw679Vm/K6CtMNvn
         7V3A==
X-Gm-Message-State: AOAM533voSCb1IMIsFhLiuiD7Y1XcZSNKpvb83y7gMo+rmqmVWxndYPO
	tSdEZmMUzHPFLKiswOmehBYfDfoWpih306/Q
X-Google-Smtp-Source: ABdhPJwAaJSAN43WtqgI44xOIkJl3jciOuixOn3D/mDzAv7kIbwBcSX3tBypked2ZRiHX6OUIZkqUg==
X-Received: by 2002:a63:887:: with SMTP id 129mr20960360pgi.383.1607883593404;
        Sun, 13 Dec 2020 10:19:53 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id a31sm11490309pgb.93.2020.12.13.10.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Dec 2020 10:19:52 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 3931196021A; Sun, 13 Dec 2020 08:19:50 -1000 (HST)
Subject: OE-core CVE metrics for gatesgarth on Sun 13 Dec 2020 08:15:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <steve@sakoman.com>,<openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20201213181950.3931196021A@nuc.router0800d9.com>
Date: Sun, 13 Dec 2020 08:19:50 -1000 (HST)

Branch: gatesgarth

New this week:
CVE-2020-1971: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1971 *
CVE-2020-25723: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25723 *
CVE-2020-27821: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27821 *
CVE-2020-29562: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29562 *

Removed this week:

Full list:  Found 54 unpatched CVEs
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
CVE-2020-12351: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12351 *
CVE-2020-12352: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12352 *
CVE-2020-12825: libcroco https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12825 *
CVE-2020-14310: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14310 *
CVE-2020-15705: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
CVE-2020-15863: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15863 *
CVE-2020-15900: ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15900 *
CVE-2020-1752: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1752 *
CVE-2020-1971: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1971 *
CVE-2020-25723: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25723 *
CVE-2020-25742: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25742 *
CVE-2020-25743: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25743 *
CVE-2020-27821: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27821 *
CVE-2020-28362: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-28362 *
CVE-2020-28366: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-28366 *
CVE-2020-28367: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-28367 *
CVE-2020-29562: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29562 *
CVE-2020-3810: apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-3810 *
