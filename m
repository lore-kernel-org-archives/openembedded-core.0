Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web10.11889.1629039816895253232
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Aug 2021 08:03:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=BJ5AwW/Q;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.169, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f169.google.com with SMTP id t35so23303596oiw.9
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Aug 2021 08:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=Klrl3oIjdmWJoUj56Uwkc8x8HnowHJihDNJkG09j9Co=;
        b=BJ5AwW/QT5xCH6LwdGBL7bcTPbQjVOxysZ+eUTzw4nAigXQqU3mtnYp4uJ1BtbX71I
         1LXRPSM5A5cOXtF9oVgCsu25VKimdk/6yCpLx3nH+wUWMjqU9/aKr+I2V8t4rJTXHBXw
         742ZOyRYEwOpn+MEAOVBNb5D6nb4+IM27WcC8hrYoONBJdu0rsNvF46Ve4W7PNlUYZUV
         TXd3GBvlG0dCHM9kzwG1Cqu9hyknGmNyZqzhEbqw6mgTlNoSrAwjzRrY5y4LeQiPXNwd
         Hm9rf7FWwjE/dHkTVgnmBRqRcY8TYZD0L0K21wSpqHdhbFpj9mv0HoMvlfG02LQsFdpR
         nFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=Klrl3oIjdmWJoUj56Uwkc8x8HnowHJihDNJkG09j9Co=;
        b=sqztiPBpYTcnOCq4anF97fUwzo+t+EqwBiFcCn7dPPP5tgEJ3sO8hXYHUTCfKuYCk6
         yb8x/KaNJGDMxMqi+7JkvZmhK/oqk8+eXvfW/ZeM033MexJ1pAVcs7UJW6KVX66FUm4S
         RRrNP1DmPByHRQxWe0PgymIw9fg7/2gklyXZt2bC28wS0ofYlDYcGYeu6T0bb8rnbLdW
         hWvj7U4ySFGaiqhNeRwG3Sk9M/Zp2QTswRPJlIOwy0HwJKYGezEmgnvSP1C9dgoEeQxx
         L9byhNv51LpV0sKoe5GSUJasyvIaV63GFv4h4W83VGQidoCnxpThDoBlVJeOeFGx+jrL
         NDFA==
X-Gm-Message-State: AOAM533i/P83lr0ca9opafxMW3fkTbNOIwMQgHglqTpbXPZzHzamOz2R
	QDjLUBQ6gliKnGEIRLwcEcXDAKqXWVnfUSve
X-Google-Smtp-Source: ABdhPJxjbUs7zDF+ofiRKLCFlxKQyuCYU39sDEpnpV59rrWEE8mxXO/R5bn0808fZReTMkaZkbzY2A==
X-Received: by 2002:a54:4812:: with SMTP id j18mr556932oij.55.1629039815719;
        Sun, 15 Aug 2021 08:03:35 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id 31sm1649635oti.63.2021.08.15.08.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 08:03:35 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 8700D960346; Sun, 15 Aug 2021 05:03:26 -1000 (HST)
Subject: OE-core CVE metrics for hardknott on Sun 15 Aug 2021 05:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210815150326.8700D960346@nuc.router0800d9.com>
Date: Sun, 15 Aug 2021 05:03:26 -1000 (HST)

Branch: hardknott

New this week: 5 CVEs
CVE-2021-22923: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22923 *
CVE-2021-32066: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-32066 *
CVE-2021-32803: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-32803 *
CVE-2021-32804: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-32804 *
CVE-2021-3682: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3682 *

Removed this week: 6 CVEs
CVE-2019-25051: aspell https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-25051 *
CVE-2021-22901: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22901 *
CVE-2021-3527: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3527 *
CVE-2021-3544: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3544 *
CVE-2021-3545: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3545 *
CVE-2021-3546: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3546 *

Full list:  Found 28 unpatched CVEs
CVE-2013-0340: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0340 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2019-6293: flex:flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2019-6470: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6470 *
CVE-2020-27748: xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27748 *
CVE-2020-29623: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29623 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-0129: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-0129 *
CVE-2021-1765: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1765 *
CVE-2021-1789: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1789 *
CVE-2021-1799: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1799 *
CVE-2021-1801: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1801 *
CVE-2021-1870: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1870 *
CVE-2021-20196: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20196 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-22923: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22923 *
CVE-2021-31810: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31810 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-32066: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-32066 *
CVE-2021-32803: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-32803 *
CVE-2021-32804: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-32804 *
CVE-2021-3445: libdnf https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3445 *
CVE-2021-34558: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-34558 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-35331: tcl:tcl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35331 *
CVE-2021-35942: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35942 *
CVE-2021-3682: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3682 *
CVE-2021-36976: libarchive https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
