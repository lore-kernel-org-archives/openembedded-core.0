Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web12.21201.1596967408801378497
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2020 03:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=vgKDFNeb;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.48, mailfrom: steve@sakoman.com)
Received: by mail-io1-f48.google.com with SMTP id z6so6069818iow.6
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2020 03:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=Ng4jarugdcZfnUP+So7QGAAVxoKxRjOtWOnJUmRD0uo=;
        b=vgKDFNebxLfgFotoOotBQbOafjbiu0RsjRL6uE2HIqwlkK+9e6tQvDLu3w3T8pRYQQ
         SYvHURiD22hWUsWROC591aYEyj/HVqaz920A1VfHN46eoXF4C32OuMuneDmQ3BuOYgBy
         98k+5DkNvTQtEGlNFOA4g/pn79sSBkBOQGm0Q7Jb76O5dIl+IkdJnF3OEbCzGIYYvXEn
         GkGFXfZmg3Hq1WzKq+kTpPO3xE9qR/VW4Oc9ZNpb35IvsaBbM3q6xELMItjwhkcmMEph
         s/BisJANZvQYUfZoJZXlY4KmjhqSLRaXITyO7Zc2LmR43jTIWf+NQCbrNxuMUzT0b4kP
         JU3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=Ng4jarugdcZfnUP+So7QGAAVxoKxRjOtWOnJUmRD0uo=;
        b=dmNcgdRbDxvF5yTpcUfG9dJ9y+batNPkSKuYcLMumr0XaOeJmj2D64OnMvSM+62o/A
         JzVs2ghS9gI+AOTtmw9YxUwqL8O70E/BcULEdRB/6HNAeGQ6RsndNYlW1RYPw1Ns+doV
         GR8qzeVOij64rSt4bSW2GCgfU4DP2N0fPKygjbJc3XRDopIMMcJX73vq/YsbHXHL5V0O
         iztA+dCOH0mmZgcO8euT5qOpncowUqva8tslp8jRkcB6OKsFhpMWKYgzGW+BHQPNffLg
         UhvbUjk4f0GTq2UTx5iAkOqds5idMvaRsyOtWjpdv9L+qjAlp7WU//v7QYs4sxWt67q2
         l+2g==
X-Gm-Message-State: AOAM531mrQSSr1J5+zJjBAMky7/g8ooKIUIGLjb7mVenY9hjadn5C5Ak
	ZSHUw7Hs2gcsH0A0xizabV88B1t5XRvz2g==
X-Google-Smtp-Source: ABdhPJzK6cTTUGwcEwbdI1SYdae/XBZYT4cJvoUXC1r+TwCm4ESaaLKateoq6g6TJkd7CmtfrusHlA==
X-Received: by 2002:a05:6638:1413:: with SMTP id k19mr13647083jad.93.1596967407223;
        Sun, 09 Aug 2020 03:03:27 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id e6sm8753449iod.53.2020.08.09.03.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 03:03:26 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 3DEE596293A; Sun,  9 Aug 2020 00:03:16 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 09 Aug 2020 12:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <steve@sakoman.com>,<openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20200809100316.3DEE596293A@nuc.router0800d9.com>
Date: Sun,  9 Aug 2020 00:03:16 -1000 (HST)

Branch: master

New this week:
CVE-2019-14865: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14865 *
CVE-2020-10713: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10713 *
CVE-2020-14308: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14308 *
CVE-2020-14309: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14309 *
CVE-2020-14310: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14310 *
CVE-2020-14311: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14311 *
CVE-2020-14344: libx11 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14344 *
CVE-2020-14347: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14347 *
CVE-2020-15705: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
CVE-2020-15706: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15706 *
CVE-2020-15707: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15707 *
CVE-2020-15900: ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15900 *

Removed this week:
CVE-2011-3193: pango-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-3193 *
CVE-2013-4577: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4577 *
CVE-2016-9085: libwebp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9085 *
CVE-2017-6311: gdk-pixbuf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-6311 *
CVE-2017-6312: gdk-pixbuf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-6312 *
CVE-2017-6313: gdk-pixbuf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-6313 *
CVE-2017-6314: gdk-pixbuf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-6314 *
CVE-2018-1000500: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-1000500 *
CVE-2020-15863: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15863 *
CVE-2020-15900: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15900 *

Full list:  Found 162 unpatched CVEs
CVE-2011-3970: libxslt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-3970 *
CVE-2012-3515: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-3515 *
CVE-2012-4564: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-4564 *
CVE-2012-6075: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-6075 *
CVE-2012-6094: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-6094 *
CVE-2013-0800: cairo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0800 *
CVE-2013-2617: curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-2617 *
CVE-2013-4235: shadow-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4235 *
CVE-2013-4342: xinetd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4342 *
CVE-2013-4344: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4344 *
CVE-2013-6425: cairo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-6425 *
CVE-2013-6629: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-6629 *
CVE-2013-7381: libnotify https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-7381 *
CVE-2014-3539: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-3539 *
CVE-2014-3615: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-3615 *
CVE-2014-3689: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-3689 *
CVE-2014-5388: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-5388 *
CVE-2014-7815: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-7815 *
CVE-2014-7840: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-7840 *
CVE-2014-8166: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-8166 *
CVE-2014-9278: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-9278 *
CVE-2015-1779: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-1779 *
CVE-2015-3209: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-3209 *
CVE-2015-4106: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-4106 *
CVE-2015-5158: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-5158 *
CVE-2015-5224: util-linux-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-5224 *
CVE-2015-6855: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-6855 *
CVE-2015-7295: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-7295 *
CVE-2015-7313: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-7313 *
CVE-2015-7512: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-7512 *
CVE-2015-8345: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8345 *
CVE-2015-8504: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8504 *
CVE-2015-8558: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8558 *
CVE-2015-8567: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8567 *
CVE-2015-8568: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8568 *
CVE-2015-8613: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8613 *
CVE-2015-8619: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8619 *
CVE-2015-8666: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8666 *
CVE-2015-8806: libxml2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8806 *
CVE-2016-10642: cmake-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-10642 *
CVE-2016-1568: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-1568 *
CVE-2016-2381: perl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-2381 *
CVE-2016-2391: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-2391 *
CVE-2016-2857: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-2857 *
CVE-2016-2858: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-2858 *
CVE-2016-4001: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4001 *
CVE-2016-4002: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4002 *
CVE-2016-4020: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4020 *
CVE-2016-4483: libxml2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4483 *
CVE-2016-4614: libxml2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4614 *
CVE-2016-4952: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4952 *
CVE-2016-4964: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4964 *
CVE-2016-5011: util-linux-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-5011 *
CVE-2016-5105: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-5105 *
CVE-2016-5106: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-5106 *
CVE-2016-5107: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-5107 *
CVE-2016-5126: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-5126 *
CVE-2016-5238: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-5238 *
CVE-2016-5337: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-5337 *
CVE-2016-5338: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-5338 *
CVE-2016-6185: perl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6185 *
CVE-2016-6328: libexif https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6328 *
CVE-2016-6351: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6351 *
CVE-2016-6489: nettle https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6489 *
CVE-2016-6490: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6490 *
CVE-2016-6833: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6833 *
CVE-2016-6834: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6834 *
CVE-2016-6835: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6835 *
CVE-2016-6836: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6836 *
CVE-2016-6888: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6888 *
CVE-2016-7116: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7116 *
CVE-2016-7155: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7155 *
CVE-2016-7156: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7156 *
CVE-2016-7157: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7157 *
CVE-2016-7170: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7170 *
CVE-2016-7421: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7421 *
CVE-2016-7422: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7422 *
CVE-2016-7423: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7423 *
CVE-2016-7466: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7466 *
CVE-2016-7994: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7994 *
CVE-2016-7995: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7995 *
CVE-2016-8576: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-8576 *
CVE-2016-8577: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-8577 *
CVE-2016-8578: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-8578 *
CVE-2016-8667: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-8667 *
CVE-2016-8668: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-8668 *
CVE-2016-8669: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-8669 *
CVE-2016-8909: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-8909 *
CVE-2016-8910: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-8910 *
CVE-2016-9101: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9101 *
CVE-2016-9102: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9102 *
CVE-2016-9103: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9103 *
CVE-2016-9104: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9104 *
CVE-2016-9105: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9105 *
CVE-2016-9106: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9106 *
CVE-2016-9401: bash https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9401 *
CVE-2016-9596: libxml2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9596 *
CVE-2016-9598: libxml2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9598 *
CVE-2016-9907: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9907 *
CVE-2016-9908: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9908 *
CVE-2016-9911: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9911 *
CVE-2016-9912: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9912 *
CVE-2016-9921: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9921 *
CVE-2016-9923: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9923 *
CVE-2017-16845: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-16845 *
CVE-2017-18030: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-18030 *
CVE-2017-3139: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-3139 *
CVE-2017-5957: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-5957 *
CVE-2017-6386: virglrenderer-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-6386 *
CVE-2017-7377: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-7377 *
CVE-2017-7471: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-7471 *
CVE-2017-8086: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-8086 *
CVE-2017-8112: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-8112 *
CVE-2017-8309: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-8309 *
CVE-2017-8379: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-8379 *
CVE-2018-1000041: librsvg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-1000041 *
CVE-2018-10844: gnutls https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10844 *
CVE-2018-10845: gnutls https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10845 *
CVE-2018-10846: gnutls https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10846 *
CVE-2018-11806: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-11806 *
CVE-2018-12433: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12433 *
CVE-2018-12437: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12437 *
CVE-2018-12438: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12438 *
CVE-2018-12617: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12617 *
CVE-2018-13410: zip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13410 *
CVE-2018-13684: zip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13684 *
CVE-2018-15746: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-15746 *
CVE-2018-16517: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16517 *
CVE-2018-16868: gnutls https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16868 *
CVE-2018-16869: nettle https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16869 *
CVE-2018-17958: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-17958 *
CVE-2018-18073: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-18073 *
CVE-2018-18438: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-18438 *
CVE-2018-6553: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-6553 *
CVE-2019-1010022: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010022 *
CVE-2019-1010023: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010023 *
CVE-2019-1010024: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010024 *
CVE-2019-1010025: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010025 *
CVE-2019-10216: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-10216 *
CVE-2019-14865: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14865 *
CVE-2019-15847: gcc-source-9.3.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-15847 *
CVE-2019-18276: bash https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-18276 *
CVE-2019-20446: librsvg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20446 *
CVE-2019-20633: patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20633 *
CVE-2019-6293: flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2020-10713: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10713 *
CVE-2020-10717: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10717 *
CVE-2020-12825: libcroco https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12825 *
CVE-2020-14039: go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14039 *
CVE-2020-14308: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14308 *
CVE-2020-14309: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14309 *
CVE-2020-14310: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14310 *
CVE-2020-14311: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14311 *
CVE-2020-14344: libx11 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14344 *
CVE-2020-14347: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14347 *
CVE-2020-15586: go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15586 *
CVE-2020-15705: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
CVE-2020-15706: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15706 *
CVE-2020-15707: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15707 *
CVE-2020-15900: ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15900 *
CVE-2020-1752: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1752 *
CVE-2020-3810: apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-3810 *
