Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web10.172017.1598177770947071564
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 03:16:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=qELHEy90;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.45, mailfrom: steve@sakoman.com)
Received: by mail-io1-f45.google.com with SMTP id t187so4395173iod.7
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2020 03:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=w+f/2QhYRdQ2yhElMOu7EmOrUGwBbvmZ6MJ/t1MgEHE=;
        b=qELHEy90hB7vxSd6l2PIyQliMdQrKCXtlzfdUhLF9ZXrpDE39XVshu2aBHSaEybFKd
         Co0JsuxjF3pGWcNHtwqDWXgo4uc9RirJAOEoD9jEKLVEFrJ7om3htWe6lZap2h9HJY+N
         IUDM/DReCoyKGWrzkx5+XSZvvEf5dtvBKhW/3jLpDfD95Y+0fvXqBkU530SRz6wKxWOd
         GiULngwVGK7L9z+rjLI3ifNRUiQn3QM4q/YDHsHixpzr7WG6wVXdwHCq0G9DIWaQBjGQ
         i2p5a2yKrjOewPq8hj/QPsG7/aaB1JUkikOBhYPrpd7GU1Zcm+DrQdmba7RK4rgtcGHa
         9XOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=w+f/2QhYRdQ2yhElMOu7EmOrUGwBbvmZ6MJ/t1MgEHE=;
        b=CJlUTxth5bOiurWlb0wOgT7FYQyNVPj8RD+79lFKKUNIiY29RhsVPcKMTdH8urxDJE
         SgmmAl6h7FuJpQF+hh7XpClG1U8tipQXeXERnEAan9Eayx2DQnptCuRCaJzprYdrjDpe
         IywiO1u00LYn43o0JT5NcRZITHM9wD2jszKJeMW58TeJOF72RJm3s5+QHXi18UmmyN8B
         Bcz4z+hshPcGNiZ1Xa/S19A8U8iI8+RgxfHjX1bX/Uzv2iQPkt0d6Xtg6WcZUQE0qUCT
         EbKppnJdLA/wCI9cXSSt63r5QJ9zm/wDZP/K7DeNRKaoIA/TohZBVsQaQNpCWLPjVWF/
         o2cQ==
X-Gm-Message-State: AOAM530YxP6JrtdcDNvHB71vA3E+/R6rebjfNS8c8Wb12JpUbpvijK8v
	OFp+et3nKlKi94ct+yI17KAWzMIsGTfUYHjYpug=
X-Google-Smtp-Source: ABdhPJygqyAeWC+NHfhciDZZJc8o6arJ+ArVfcGzpLt1LaNs+mAYobqb9+oBzv1b3JZUdLhlNIHLQw==
X-Received: by 2002:a02:c842:: with SMTP id r2mr765375jao.87.1598177769211;
        Sun, 23 Aug 2020 03:16:09 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id s143sm5254237ilc.14.2020.08.23.03.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 03:16:08 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 799C1962035; Sun, 23 Aug 2020 00:15:58 -1000 (HST)
Subject: OE-core CVE metrics for dunfell on Sun 23 Aug 2020 12:15:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <steve@sakoman.com>,<openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20200823101558.799C1962035@nuc.router0800d9.com>
Date: Sun, 23 Aug 2020 00:15:58 -1000 (HST)

Branch: dunfell

New this week:
CVE-2018-1000205: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-1000205 *
CVE-2020-16306: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16306 *
CVE-2020-16307: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16307 *
CVE-2020-16310: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16310 *

Removed this week:
CVE-2019-15847: libgcc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-15847 *
CVE-2020-14039: go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14039 *
CVE-2020-15586: go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15586 *
CVE-2020-16845: go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16845 *
CVE-2020-1752: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1752 *

Full list:  Found 201 unpatched CVEs
CVE-2011-3970: libxslt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-3970 *
CVE-2012-4564: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-4564 *
CVE-2012-6094: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-6094 *
CVE-2013-0800: cairo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0800 *
CVE-2013-2617: curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-2617 *
CVE-2013-4235: shadow-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4235 *
CVE-2013-6425: cairo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-6425 *
CVE-2013-6629: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-6629 *
CVE-2013-7381: libnotify https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-7381 *
CVE-2014-3539: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-3539 *
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
CVE-2018-1000205: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-1000205 *
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
CVE-2018-19665: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-19665 *
CVE-2018-21232: re2c https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-21232 *
CVE-2018-6553: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-6553 *
CVE-2019-1010022: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010022 *
CVE-2019-1010023: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010023 *
CVE-2019-1010024: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010024 *
CVE-2019-1010025: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010025 *
CVE-2019-10216: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-10216 *
CVE-2019-14865: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14865 *
CVE-2019-18276: bash https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-18276 *
CVE-2019-20175: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20175 *
CVE-2019-20334: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20334 *
CVE-2019-20446: librsvg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20446 *
CVE-2019-20633: patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20633 *
CVE-2019-20907: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20907 *
CVE-2019-6290: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6290 *
CVE-2019-6291: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6291 *
CVE-2019-6293: flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2019-8343: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-8343 *
CVE-2020-10713: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10713 *
CVE-2020-11022: jquery https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11022 *
CVE-2020-11023: jquery https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11023 *
CVE-2020-12723: perl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12723 *
CVE-2020-12762: json-c https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12762 *
CVE-2020-12825: libcroco https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12825 *
CVE-2020-13253: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13253 *
CVE-2020-13434: sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13434 *
CVE-2020-13435: sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13435 *
CVE-2020-13630: sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13630 *
CVE-2020-13631: sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13631 *
CVE-2020-13632: sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13632 *
CVE-2020-13645: glib-networking https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13645 *
CVE-2020-13754: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13754 *
CVE-2020-13791: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13791 *
CVE-2020-14145: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14145 *
CVE-2020-14150: bison-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14150 *
CVE-2020-14308: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14308 *
CVE-2020-14309: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14309 *
CVE-2020-14310: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14310 *
CVE-2020-14311: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14311 *
CVE-2020-14344: libx11 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14344 *
CVE-2020-14347: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14347 *
CVE-2020-15469: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15469 *
CVE-2020-15523: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15523 *
CVE-2020-15705: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
CVE-2020-15706: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15706 *
CVE-2020-15707: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15707 *
CVE-2020-15778: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15778 *
CVE-2020-15859: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15859 *
CVE-2020-16092: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16092 *
CVE-2020-16287: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16287 *
CVE-2020-16288: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16288 *
CVE-2020-16289: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16289 *
CVE-2020-16290: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16290 *
CVE-2020-16291: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16291 *
CVE-2020-16292: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16292 *
CVE-2020-16293: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16293 *
CVE-2020-16294: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16294 *
CVE-2020-16295: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16295 *
CVE-2020-16296: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16296 *
CVE-2020-16297: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16297 *
CVE-2020-16298: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16298 *
CVE-2020-16299: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16299 *
CVE-2020-16300: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16300 *
CVE-2020-16301: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16301 *
CVE-2020-16302: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16302 *
CVE-2020-16303: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16303 *
CVE-2020-16304: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16304 *
CVE-2020-16305: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16305 *
CVE-2020-16306: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16306 *
CVE-2020-16307: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16307 *
CVE-2020-16308: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16308 *
CVE-2020-16309: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16309 *
CVE-2020-16310: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16310 *
CVE-2020-17538: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-17538 *
CVE-2020-3810: apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-3810 *
