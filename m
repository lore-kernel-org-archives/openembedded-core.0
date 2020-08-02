Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web10.12906.1596387708041389710
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2020 10:01:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=KfEo2dJ9;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.172, mailfrom: steve@sakoman.com)
Received: by mail-il1-f172.google.com with SMTP id x1so8927204ilp.7
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2020 10:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=QPV8x4MNFxv8jpwg2ksHmSQ0quR6i6FRkJ9jeOPe1iU=;
        b=KfEo2dJ9OE1R70+52DrpKza/KNjC/tj0xOh4Ry2ieprzaEVdbuGXiJCNgNNu7TvFyB
         lx4SmyQqt91Iu/3GxFMjdzCi3EoCJF64rTX430Xlnp33bJaAh7e6H7gev1yZe3FY3nxR
         DbSodSISwmcDj8qvFG4aebO3dLvVKdKBWzHz+//bnUkSQ6lNlfcX6l6EHx4ZOw4AHc1K
         IZkzN05TyWPzBEQ8qtuIpOjEv7Qy1i/alJZBCcKEZJNqK2YEAiX+EL1Ajke7LSl2enAI
         FHy7PVaozyBV2Ce3bfJjV8yah7OktwtIoKCOJFkY82Jl+JejC4OL2VKeDvRJZIX3ePiO
         a+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=QPV8x4MNFxv8jpwg2ksHmSQ0quR6i6FRkJ9jeOPe1iU=;
        b=MWwoPPzoAii7oDsuXsgUmLQbO0NCYCWn6oTZQTgzK5OCwR2s0VnD0wrfa8LCnTZnX0
         SZIbrFYVJeGgFvc6a/0rL9OBDvXkprVB7tNWvDfyu25QcF6N+qxmwPD0QEnKFpb6jGpR
         xndslRWdy4EUSETRTzNNM4hexnqt4IWPF6wMMvEnRKV8G/xdFPhEk24xCB+QEmK2qrvR
         dHVDzDsovhMHoSo9J1oTLajc8yKR3AWmhhs0ktsRyLMj4WFCYyGVmso0TrXgbO9sis4Y
         QWZTMJjdkqaeKZJVaQuM/2hvLE5i5Diitaiyqfwjuumh7/JZMi+slF77ET+Dryxs4Cqd
         NtZw==
X-Gm-Message-State: AOAM530ubHT+yIaivzBQhcCHLREAC8crIPlBPIORw5m6DzZaVdoTQ6bz
	cTWSyQphivGO2iL08m0Rz3HlkdU9raU=
X-Google-Smtp-Source: ABdhPJyET7x+MkIlbG0Rd0rPCHqdhQITLj0IMODodGCU8Ufudr1SbH5PWKtltiYdCUdU60wQdBV/rg==
X-Received: by 2002:a05:6e02:dd4:: with SMTP id l20mr13534424ilj.269.1596387706363;
        Sun, 02 Aug 2020 10:01:46 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id w15sm9421271ila.65.2020.08.02.10.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2020 10:01:45 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 4CDFD962630; Sun,  2 Aug 2020 07:01:43 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 02 Aug 2020 07:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <steve@sakoman.com>,<openembedded-core@lists.openembedded.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20200802170143.4CDFD962630@nuc.router0800d9.com>
Date: Sun,  2 Aug 2020 07:01:43 -1000 (HST)

Branch: master

New this week:
CVE-2013-4235: shadow-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4235 *
CVE-2013-6629: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-6629 *
CVE-2014-3539: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-3539 *
CVE-2015-5224: util-linux-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-5224 *
CVE-2016-10642: cmake-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-10642 *
CVE-2016-2381: perl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-2381 *
CVE-2016-5011: util-linux-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-5011 *
CVE-2016-6185: perl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6185 *
CVE-2016-6489: nettle https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6489 *
CVE-2017-6386: virglrenderer-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-6386 *
CVE-2018-10844: gnutls https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10844 *
CVE-2018-10845: gnutls https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10845 *
CVE-2018-10846: gnutls https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10846 *
CVE-2018-12433: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12433 *
CVE-2018-12437: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12437 *
CVE-2018-12438: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12438 *
CVE-2018-13410: zip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13410 *
CVE-2018-13684: zip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13684 *
CVE-2018-16868: gnutls https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16868 *
CVE-2018-16869: nettle https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16869 *
CVE-2018-18073: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-18073 *
CVE-2019-10216: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-10216 *
CVE-2019-20633: patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20633 *
CVE-2020-12825: libcroco https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12825 *
CVE-2020-14039: go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14039 *
CVE-2020-15586: go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15586 *
CVE-2020-15863: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15863 *
CVE-2020-15900: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15900 *

Removed this week:
=======
>>>>>>> 1043c9e... CVE results for Thu 14 May 2020 01:26:32 PM HST
CVE-2011-3193: pango-native
CVE-2011-3970: libxslt-native
CVE-2012-3515: qemu
CVE-2012-4564: tiff
CVE-2012-6075: qemu
CVE-2012-6094: cups
CVE-2013-0800: cairo
CVE-2013-2617: curl-native
CVE-2013-4235: shadow
CVE-2013-4235: shadow https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4235 *
CVE-2013-4344: qemu
CVE-2013-4577: grub
CVE-2013-6425: cairo
CVE-2013-6629: ghostscript-native
CVE-2013-6629: ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-6629 *
CVE-2013-7324: webkitgtk
CVE-2013-7381: libnotify
CVE-2014-3539: python3
CVE-2014-3539: python3 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-3539 *
CVE-2014-3615: qemu
CVE-2014-3689: qemu
CVE-2014-5388: qemu
CVE-2014-7815: qemu
CVE-2014-7840: qemu
CVE-2014-8166: cups
CVE-2014-9278: openssh
CVE-2015-1779: qemu
CVE-2015-3209: qemu
CVE-2015-4106: qemu
CVE-2015-5158: qemu
CVE-2015-5224: util-linux
CVE-2015-5224: util-linux https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-5224 *
CVE-2015-6855: qemu
CVE-2015-7295: qemu
CVE-2015-7313: tiff
CVE-2015-7512: qemu
CVE-2015-8345: qemu
CVE-2015-8504: qemu
CVE-2015-8558: qemu
CVE-2015-8567: qemu
CVE-2015-8568: qemu
CVE-2015-8613: qemu
CVE-2015-8619: qemu
CVE-2015-8666: qemu
CVE-2015-8806: libxml2
CVE-2016-10642: cmake
CVE-2016-10642: cmake https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-10642 *
CVE-2016-1568: qemu
CVE-2016-2381: perl
CVE-2016-2381: perl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-2381 *
CVE-2016-2391: qemu
CVE-2016-2857: qemu
CVE-2016-2858: qemu
CVE-2016-3710: qemu
CVE-2016-3712: qemu
CVE-2016-4001: qemu
CVE-2016-4002: qemu
CVE-2016-4020: qemu
CVE-2016-4037: qemu
CVE-2016-4429: glibc
CVE-2016-4439: qemu
CVE-2016-4441: qemu
CVE-2016-4453: qemu
CVE-2016-4454: qemu
CVE-2016-4483: libxml2
CVE-2016-4614: libxml2
CVE-2016-4952: qemu
CVE-2016-4964: qemu
CVE-2016-5011: util-linux
CVE-2016-5011: util-linux https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-5011 *
CVE-2016-5105: qemu
CVE-2016-5106: qemu
CVE-2016-5107: qemu
CVE-2016-5126: qemu
CVE-2016-5238: qemu
CVE-2016-5337: qemu
CVE-2016-5338: qemu
CVE-2016-5403: qemu
CVE-2016-6185: perl
CVE-2016-6185: perl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6185 *
CVE-2016-6351: qemu
CVE-2016-6489: nettle
CVE-2016-6489: nettle-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6489 *
CVE-2016-6490: qemu
CVE-2016-6833: qemu
CVE-2016-6834: qemu
CVE-2016-6835: qemu
CVE-2016-6836: qemu
CVE-2016-6888: qemu
CVE-2016-7116: qemu
CVE-2016-7155: qemu
CVE-2016-7156: qemu
CVE-2016-7157: qemu
CVE-2016-7170: qemu
CVE-2016-7421: qemu
CVE-2016-7422: qemu
CVE-2016-7423: qemu
CVE-2016-7466: qemu
CVE-2016-7994: qemu
CVE-2016-7995: qemu
CVE-2016-8576: qemu
CVE-2016-8577: qemu
CVE-2016-8578: qemu
CVE-2016-8667: qemu
CVE-2016-8668: qemu
CVE-2016-8669: qemu
CVE-2016-8909: qemu
CVE-2016-8910: qemu
CVE-2016-9085: libwebp
CVE-2016-9101: qemu
CVE-2016-9102: qemu
CVE-2016-9103: qemu
CVE-2016-9104: qemu
CVE-2016-9105: qemu
CVE-2016-9106: qemu
CVE-2016-9596: libxml2
CVE-2016-9598: libxml2
CVE-2016-9907: qemu
CVE-2016-9908: qemu
CVE-2016-9911: qemu
CVE-2016-9912: qemu
CVE-2016-9921: qemu
CVE-2016-9923: qemu
CVE-2017-16845: qemu
CVE-2017-18030: qemu
CVE-2017-3139: bind
CVE-2017-3209: busybox
CVE-2017-5957: qemu
CVE-2017-6311: gdk-pixbuf-native
CVE-2017-6312: gdk-pixbuf-native
CVE-2017-6313: gdk-pixbuf-native
CVE-2017-6314: gdk-pixbuf-native
CVE-2017-6386: virglrenderer
CVE-2017-6386: virglrenderer https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-6386 *
CVE-2017-7377: qemu
CVE-2017-7471: qemu
CVE-2017-8086: qemu
CVE-2017-8112: qemu
CVE-2017-8309: qemu
CVE-2017-8379: qemu
CVE-2018-1000041: librsvg
CVE-2018-1000500: busybox
CVE-2018-1000517: busybox
CVE-2018-10844: gnutls
CVE-2018-10844: gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10844 *
CVE-2018-10845: gnutls
CVE-2018-10845: gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10845 *
CVE-2018-10846: gnutls
CVE-2018-10846: gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10846 *
CVE-2018-11806: qemu
CVE-2018-12433: openssl
CVE-2018-12433: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12433 *
CVE-2018-12437: openssl
CVE-2018-12437: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12437 *
CVE-2018-12438: openssl
CVE-2018-12438: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12438 *
CVE-2018-13410: zip-native
CVE-2018-13410: zip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13410 *
CVE-2018-13467: epiphany
CVE-2018-13467: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13467 *
CVE-2018-13684: zip-native
CVE-2018-13684: zip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13684 *
CVE-2018-15746: qemu
CVE-2018-16517: nasm-native
CVE-2018-16847: qemu
CVE-2018-16868: gnutls
CVE-2018-16868: gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16868 *
CVE-2018-16869: nettle
CVE-2018-16869: nettle-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16869 *
CVE-2018-16872: qemu
CVE-2018-17075: go
CVE-2018-17142: go
CVE-2018-17143: go
CVE-2018-17846: go
CVE-2018-17847: go
CVE-2018-17848: go
CVE-2018-17958: qemu
CVE-2018-17963: qemu
CVE-2018-18073: ghostscript-native
CVE-2018-18073: ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-18073 *
CVE-2018-18438: qemu
CVE-2018-19665: qemu
CVE-2018-21232: re2c
CVE-2018-21232: re2c https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-21232 *
CVE-2018-6553: cups
CVE-2018-7550: qemu
CVE-2019-1010022: glibc
CVE-2019-1010023: glibc
CVE-2019-1010024: glibc
CVE-2019-1010025: glibc
CVE-2019-10216: ghostscript-native
CVE-2019-10216: ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-10216 *
CVE-2019-15847: libgcc
CVE-2019-18276: bash
CVE-2019-20175: qemu
CVE-2019-20334: nasm-native
CVE-2019-20334: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20334 *
CVE-2019-20446: librsvg
CVE-2019-20633: patch
CVE-2019-20633: patch https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20633 *
CVE-2019-6290: nasm-native
CVE-2019-6290: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6290 *
CVE-2019-6291: nasm-native
CVE-2019-6291: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6291 *
CVE-2019-6293: flex-native
CVE-2019-8343: nasm-native
CVE-2019-8343: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-8343 *
CVE-2020-10018: webkitgtk
CVE-2020-10029: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10029 *
CVE-2020-10543: perl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10543 *
CVE-2020-10761: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10761 *
CVE-2020-10878: perl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10878 *
CVE-2020-10933: ruby
CVE-2020-11022: jquery
CVE-2020-11023: jquery
CVE-2020-11793: webkitgtk
CVE-2020-11869: qemu
CVE-2020-12723: perl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12723 *
CVE-2020-12762: json-c
CVE-2020-12762: json-c https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12762 *
CVE-2020-12767: libexif
CVE-2020-12825: libcroco-native
CVE-2020-12825: libcroco-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12825 *
CVE-2020-13790: libjpeg-turbo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13790 *
CVE-2020-13871: sqlite3 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13871 *
CVE-2020-1752: glibc
CVE-2020-5247: ruby
CVE-2020-6096: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-6096 *
CVE-2020-6750: glib-2.0-native
Found 171 unpatched CVEs
Found 190 unpatched CVEs

Full list:  Found 160 unpatched CVEs
CVE-2011-3193: pango-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-3193 *
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
CVE-2013-4577: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4577 *
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
CVE-2016-9085: libwebp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9085 *
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
CVE-2017-6311: gdk-pixbuf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-6311 *
CVE-2017-6312: gdk-pixbuf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-6312 *
CVE-2017-6313: gdk-pixbuf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-6313 *
CVE-2017-6314: gdk-pixbuf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-6314 *
CVE-2017-6386: virglrenderer-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-6386 *
CVE-2017-7377: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-7377 *
CVE-2017-7471: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-7471 *
CVE-2017-8086: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-8086 *
CVE-2017-8112: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-8112 *
CVE-2017-8309: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-8309 *
CVE-2017-8379: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-8379 *
CVE-2018-1000041: librsvg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-1000041 *
CVE-2018-1000500: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-1000500 *
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
CVE-2019-15847: gcc-source-9.3.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-15847 *
CVE-2019-18276: bash https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-18276 *
CVE-2019-20446: librsvg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20446 *
CVE-2019-20633: patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20633 *
CVE-2019-6293: flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2020-10717: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10717 *
CVE-2020-12825: libcroco https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12825 *
CVE-2020-14039: go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14039 *
CVE-2020-15586: go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15586 *
CVE-2020-15863: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15863 *
CVE-2020-15900: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15900 *
CVE-2020-1752: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1752 *
CVE-2020-3810: apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-3810 *
