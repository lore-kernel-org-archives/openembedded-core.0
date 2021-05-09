Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web09.19798.1620572646173531437
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 May 2021 08:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=CpXOCwMz;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.172, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f172.google.com with SMTP id m13so13498391oiw.13
        for <openembedded-core@lists.openembedded.org>; Sun, 09 May 2021 08:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=0m7y7ZY6h83GeomCRZkd5JUke44gM/Aqp+WG3Sd/nyE=;
        b=CpXOCwMz2LbcBXMac+2rDAy+Wns7rL09Wt6qu09G/Qmhri9vdswnPNRJZzlgKDjANt
         Ws5YytH6W5cIwc9FIZYLGJp0YUPVLOA7rK2rfT6Q9NWD8ST69ELcOJEvxpeoWrc5V7We
         hdsjfvPMxobDOnkL+t8aiZSXjPPv2v1fFveQsKg3brzJaZXUTnn4+w1EeTafXvg3hOm5
         Wkaa3QncMmaVgKO/v29THKVRMJ6a5ORpOKDMyG7cfshrDZkbmAWcMoy/mkelLjWKMeBF
         2JYWSV7EKviVKYclTlQmzPEhffPoXQqbpbJhGLSuvv3eAe33MwXvKfdNJCFiMR0hfrL+
         XWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=0m7y7ZY6h83GeomCRZkd5JUke44gM/Aqp+WG3Sd/nyE=;
        b=UGunFX98ImENhGzTASSZvUOZj4z63AADS1SwN0V1yhu7ZW5jSu/6lP/rvrWEOES3uR
         Hm6DMYJXhAsTvO0Kdvktf5Nn4LpNVVgHqcfINZkyAdf9+HbPRmPi4aU58zp95VxyUQ6d
         2Z1ny4Ctrr6fGrP3zz2H70OGCtQou2bGevU8xb6HfnRhF723oPL/E/Hfp/tOS0/ablVS
         w+Kn8gmlWCIMAmpk977AMKieFVl0Yptz3Y51uFaseW46WaeBPRZKW8LSoU7OYbYSG5U/
         LyszwFTfZdO5Ytj+BC/c/8vNAubfq3GIvP+lUfH0nGHMtcKW3Jl5g9ZKQTs0U/ii8I/8
         jUYg==
X-Gm-Message-State: AOAM531vG4aBNwz6F7/Adf3VcN/LpSzNnhfXQSdjnYbPsJVrJ56pMZ7w
	UyyPn+tyivKZDnR4wQj87vEKOr/x7xR40szp
X-Google-Smtp-Source: ABdhPJzzOGgBdkOwyj56Afo8SofPwDBui3h51JMsPuv8B0NTBYXqFBw8E3ruyX9p0txlDPl38ahVtA==
X-Received: by 2002:aca:ab02:: with SMTP id u2mr22846440oie.49.1620572644708;
        Sun, 09 May 2021 08:04:04 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id v79sm449902oia.14.2021.05.09.08.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 May 2021 08:04:04 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 2F80A96031E; Sun,  9 May 2021 05:03:56 -1000 (HST)
Subject: OE-core CVE metrics for gatesgarth on Sun 09 May 2021 05:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <steve@sakoman.com>,<openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210509150356.2F80A96031E@nuc.router0800d9.com>
Date: Sun,  9 May 2021 05:03:56 -1000 (HST)

Branch: gatesgarth

New this week: 3 CVEs
CVE-2021-20294: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20294 *
CVE-2021-25215: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25215 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *

Removed this week: 1 CVEs
CVE-2020-35492: cairo:cairo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35492 *

Full list:  Found 88 unpatched CVEs
CVE-2000-0006: strace https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0006 *
CVE-2000-0803: groff:groff-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0803 *
CVE-2005-0238: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2005-0238 *
CVE-2007-0998: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-0998 *
CVE-2007-2379: jquery https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-2379 *
CVE-2007-2768: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-2768 *
CVE-2007-4476: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-4476 *
CVE-2008-0888: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-0888 *
CVE-2008-3844: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-3844 *
CVE-2008-4178: builder https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-4178 *
CVE-2008-4539: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-4539 *
CVE-2010-4226: cpio https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-4226 *
CVE-2010-4756: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-4756 *
CVE-2011-1548: logrotate https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-1548 *
CVE-2011-1549: logrotate https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-1549 *
CVE-2011-1550: logrotate https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-1550 *
CVE-2013-0221: coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0221 *
CVE-2013-0222: coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0222 *
CVE-2013-0223: coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0223 *
CVE-2013-4342: xinetd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4342 *
CVE-2013-6629: ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-6629 *
CVE-2013-7381: libnotify https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-7381 *
CVE-2015-7313: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-7313 *
CVE-2016-2781: coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-2781 *
CVE-2016-6328: libexif https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6328 *
CVE-2017-3139: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-3139 *
CVE-2017-5957: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-5957 *
CVE-2018-1000041: librsvg:librsvg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-1000041 *
CVE-2018-18438: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-18438 *
CVE-2019-1010022: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010022 *
CVE-2019-1010023: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010023 *
CVE-2019-1010024: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010024 *
CVE-2019-1010025: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010025 *
CVE-2019-14865: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14865 *
CVE-2019-6293: flex:flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2019-6470: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6470 *
CVE-2020-12352: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12352 *
CVE-2020-14372: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14372 *
CVE-2020-15705: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
CVE-2020-15900: ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15900 *
CVE-2020-17525: subversion https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-17525 *
CVE-2020-24490: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-24490 *
CVE-2020-25632: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25632 *
CVE-2020-25647: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25647 *
CVE-2020-25742: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25742 *
CVE-2020-25743: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25743 *
CVE-2020-27749: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27749 *
CVE-2020-27779: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27779 *
CVE-2020-27821: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27821 *
CVE-2020-28493: python3-jinja2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-28493 *
CVE-2020-29509: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29509 *
CVE-2020-29511: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29511 *
CVE-2020-35521: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35521 *
CVE-2020-35522: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35522 *
CVE-2020-35523: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35523 *
CVE-2020-35524: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35524 *
CVE-2020-3810: apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-3810 *
CVE-2021-20193: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20193 *
CVE-2021-20225: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20225 *
CVE-2021-20227: sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20227 *
CVE-2021-20231: gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20231 *
CVE-2021-20232: gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20232 *
CVE-2021-20233: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20233 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-20263: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20263 *
CVE-2021-20271: rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20271 *
CVE-2021-20284: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20284 *
CVE-2021-20294: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20294 *
CVE-2021-20305: nettle:nettle-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20305 *
CVE-2021-22876: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22876 *
CVE-2021-22890: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22890 *
CVE-2021-25215: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25215 *
CVE-2021-26720: avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-26720 *
CVE-2021-27097: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27097 *
CVE-2021-27138: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27138 *
CVE-2021-27218: glib-2.0:glib-2.0-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27218 *
CVE-2021-27918: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27918 *
CVE-2021-28041: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-28041 *
CVE-2021-28153: glib-2.0:glib-2.0-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-28153 *
CVE-2021-28965: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-28965 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-3392: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3392 *
CVE-2021-3409: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3409 *
CVE-2021-3416: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3416 *
CVE-2021-3418: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3418 *
CVE-2021-3487: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3487 *
CVE-2021-3497: gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3497 *
CVE-2021-3498: gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3498 *
