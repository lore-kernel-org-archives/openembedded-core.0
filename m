Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web12.18216.1623596488717360942
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Jun 2021 08:01:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Rup8CJWS;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.171, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f171.google.com with SMTP id r16so11287385oiw.3
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Jun 2021 08:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=xLuRblCZROc558ZR77CsJXyB5frDz6BAix30XCS/IeU=;
        b=Rup8CJWSWygdUfNLzDWRbK3IzYp4x/yYUvvPjnjMU9obFhINP1u6HXTBCUoU9YoTG7
         f4wzPAhiKTtpjYiDcBcBqgEh+Aiu928TyxXLvmJ5G5B5BU55g/WwSTbUDuYXR+5vD0vM
         Smy+5TjNYy5KLDc7JdS12A1Iw8TUZbHNJUY/mvuiDZpuvBnpAeaP7J2KQ5Pk8GpaRGRx
         0GJEvVSRnB99OyCWWNXZM/xfFdbIqquTR3gW4nEBVSTWHpnJz4IPpRFiWE66juLKh2Ev
         aAxuxDBzq5iOcjt0Csq9O1tC8sK/ao4DIpOv2DIFNPemquxb85GQNwwhYnct86GVG70q
         mZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=xLuRblCZROc558ZR77CsJXyB5frDz6BAix30XCS/IeU=;
        b=mzc92WqDcIeatJvhUqecIvrOgwidfl3Y4yMteUz1gQzv0YrhOuN5EagX1AKyXwn5DV
         koopOqPP6h021xJYB/UR9TrBsK/Q55JqZ5uFVLh+dKxKJoL30osxbUIEzoRYux6I77DN
         /bicp6eGHBD/zXy/putlJkRmsqREV5DqGUuW9CT+q0Do2yAgg9So+/3J/D726D4gpFjT
         7XbWReolarLyVnsbWMZOzpKq42iCHuUEcCPFnDgUZWcFnFk4zZ1UH8jpXImCsbk8UIyt
         oRGBgeT47uN5Q7lKJf1hLY3HoFT+JA0R8vUAND14C3iDuNHyjVLmVXSW1smq3z/UrRO5
         Wb7Q==
X-Gm-Message-State: AOAM5310kzT+lBTOe/bEhQZPgdTflgOZSxrQADX7NA2ZEvpYS6X4ZH1+
	q7zvGFnZc4jFg4+SqaXcw40Sr2OA5cOcU/Y+SZk=
X-Google-Smtp-Source: ABdhPJy+e5sY8qfW6S4RA7/QeZH3T0jN3pWiVcLBu5acXn3eAOvIVTLCi+UvCK7/8x38saTOul3BOg==
X-Received: by 2002:aca:aa45:: with SMTP id t66mr18969617oie.103.1623596487500;
        Sun, 13 Jun 2021 08:01:27 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id 30sm2162463ott.78.2021.06.13.08.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jun 2021 08:01:27 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 6C6489602DE; Sun, 13 Jun 2021 05:01:19 -1000 (HST)
Subject: OE-core CVE metrics for hardknott on Sun 13 Jun 2021 05:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210613150119.6C6489602DE@nuc.router0800d9.com>
Date: Sun, 13 Jun 2021 05:01:19 -1000 (HST)

Branch: hardknott

New this week: 0 CVEs

Removed this week: 0 CVEs

Full list:  Found 21 unpatched CVEs
CVE-2013-0340: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0340 *
CVE-2019-6293: flex:flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2019-6470: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6470 *
CVE-2020-29623: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29623 *
CVE-2021-1765: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1765 *
CVE-2021-1789: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1789 *
CVE-2021-1799: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1799 *
CVE-2021-1801: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1801 *
CVE-2021-1870: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1870 *
CVE-2021-20196: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20196 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-22876: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22876 *
CVE-2021-22890: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22890 *
CVE-2021-29921: python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-29921 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-33477: rxvt-unicode https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33477 *
CVE-2021-33574: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33574 *
CVE-2021-3421: rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3421 *
CVE-2021-3445: libdnf https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3445 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-3527: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3527 *
