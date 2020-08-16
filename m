Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.25543.1597592436806722702
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2020 08:40:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hFGEpFNh;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id cs12so6671069qvb.2
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2020 08:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LjrJXhycIil9gpVzozuJoJJ0nROEteaKLO76Y650Xp4=;
        b=hFGEpFNh/6+QytVXYB7JEVTmq7DC742IEnzNEEw6MkGaojYdtvdzgcvSkZsUS4APDT
         yLISw53RMDvJhYmyc5W0livKm1hRERgOY0ed0BNrgfSctx+3BD8qraIi6DQtm8+o8uW5
         D/FXqvMtlXe64JSiSpLbyHf67YY6I5+rYg3tVEZuWX+XLlH7rW9UEiwx0whpbTi/l6VF
         QVVF2yoVTYAn0rWIGMAapZf+ac1/NHsTWGzmT2tCuKAd4O0dbEjGtAyoN2RayyVvRyNe
         9LMSbYK60Z2fNJsGP/roHIfRMKmpNOx2hrshExGSW1gh4+hXz1tAEfV+rBfdm1SoI1Bc
         yt9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LjrJXhycIil9gpVzozuJoJJ0nROEteaKLO76Y650Xp4=;
        b=XvAmjlSnHspnR/Uf5BPxHCoOj7LBiND2FaPaXQcHEa6d7//cWzvFG0Eu9UDFfnvIlr
         K7y3kPDxNhfa6xMQ4ZVNR4eQJtAviZs006JtG9duHi6cL0WRS58c2M1u+re7UYKMU40Y
         sXb3Jte3fsGg2/ZU3DVS783p953l32EJ96e/6SNoGJrrxFjyW5sz9t8wl3O5J2jCiueY
         2ImbFyjGuTg9/GtP7lROCYwUzcebypr31Y/3E03O/xkytLmIVhdwwGvazwMYlR2TgpwH
         yfd05Qh9P++I9/GicbuoWxs19C9lnpJrr1NFkzic0HvGh4KjAgfrxFluWTl66GdRSlV/
         1VOw==
X-Gm-Message-State: AOAM530gtjf0nExvxTZdC1zByBg76Q3cMMILEqW1chVdd+jGxwCSdHkP
	oHJE9UT2GP+UL33rq/wNaoFczyoKQ+1qkvk5A+o=
X-Google-Smtp-Source: ABdhPJwYT5vsStRoZ85n/NVA7+us/Ngd4wrIFwQLHDDtaAUmsnEdxP7ohXRCc7yjFKJZuq5Yi6uliSiws3VEZ5CdaFA=
X-Received: by 2002:ad4:4ea5:: with SMTP id ed5mr10863757qvb.130.1597592435673;
 Sun, 16 Aug 2020 08:40:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200816100414.AD0299623AF@nuc.router0800d9.com>
In-Reply-To: <20200816100414.AD0299623AF@nuc.router0800d9.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 16 Aug 2020 08:40:09 -0700
Message-ID: <CAMKF1sqqaExr-7VEO21zewf8WxQyYzSrfJrZB9VWihviNUpu2Q@mail.gmail.com>
Subject: Re: [OE-core] OE-core CVE metrics for master on Sun 16 Aug 2020 12:00:01 AM HST
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 16, 2020 at 3:04 AM Steve Sakoman <steve@sakoman.com> wrote:
>
> Branch: master
>
> New this week:
> CVE-2020-16092: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16092 *
>
> Removed this week:
> CVE-2012-3515: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-3515 *
> CVE-2012-6075: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-6075 *
> CVE-2013-4344: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4344 *
> CVE-2014-3615: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-3615 *
> CVE-2014-3689: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-3689 *
> CVE-2014-5388: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-5388 *
> CVE-2014-7815: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-7815 *
> CVE-2014-7840: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-7840 *
>
> Full list:  Found 155 unpatched CVEs
> CVE-2011-3970: libxslt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-3970 *
> CVE-2012-4564: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-4564 *
> CVE-2012-6094: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-6094 *
> CVE-2013-0800: cairo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0800 *
> CVE-2013-2617: curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-2617 *
> CVE-2013-4235: shadow-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4235 *
> CVE-2013-4342: xinetd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4342 *
> CVE-2013-6425: cairo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-6425 *
> CVE-2013-6629: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-6629 *
> CVE-2013-7381: libnotify https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-7381 *
> CVE-2014-3539: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-3539 *
> CVE-2014-8166: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-8166 *
> CVE-2014-9278: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-9278 *
> CVE-2015-1779: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-1779 *
> CVE-2015-3209: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-3209 *
> CVE-2015-4106: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-4106 *
> CVE-2015-5158: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-5158 *
> CVE-2015-5224: util-linux-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-5224 *
> CVE-2015-6855: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-6855 *
> CVE-2015-7295: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-7295 *
> CVE-2015-7313: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-7313 *
> CVE-2015-7512: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-7512 *
> CVE-2015-8345: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8345 *
> CVE-2015-8504: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8504 *
> CVE-2015-8558: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8558 *
> CVE-2015-8567: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8567 *
> CVE-2015-8568: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8568 *
> CVE-2015-8613: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8613 *
> CVE-2015-8619: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8619 *
> CVE-2015-8666: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8666 *
> CVE-2015-8806: libxml2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8806 *
> CVE-2016-10642: cmake-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-10642 *
> CVE-2016-1568: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-1568 *
> CVE-2016-2381: perl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-2381 *
> CVE-2016-2391: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-2391 *
> CVE-2016-2857: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-2857 *
> CVE-2016-2858: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-2858 *
> CVE-2016-4001: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4001 *
> CVE-2016-4002: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4002 *
> CVE-2016-4020: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4020 *
> CVE-2016-4483: libxml2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4483 *
> CVE-2016-4614: libxml2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4614 *
> CVE-2016-4952: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4952 *
> CVE-2016-4964: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4964 *
> CVE-2016-5011: util-linux-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-5011 *
> CVE-2016-5105: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-5105 *
> CVE-2016-5106: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-5106 *
> CVE-2016-5107: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-5107 *
> CVE-2016-5126: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-5126 *
> CVE-2016-5238: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-5238 *
> CVE-2016-5337: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-5337 *
> CVE-2016-5338: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-5338 *
> CVE-2016-6185: perl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6185 *
> CVE-2016-6328: libexif https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6328 *
> CVE-2016-6351: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6351 *
> CVE-2016-6489: nettle https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6489 *
> CVE-2016-6490: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6490 *
> CVE-2016-6833: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6833 *
> CVE-2016-6834: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6834 *
> CVE-2016-6835: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6835 *
> CVE-2016-6836: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6836 *
> CVE-2016-6888: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6888 *
> CVE-2016-7116: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7116 *
> CVE-2016-7155: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7155 *
> CVE-2016-7156: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7156 *
> CVE-2016-7157: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7157 *
> CVE-2016-7170: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7170 *
> CVE-2016-7421: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7421 *
> CVE-2016-7422: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7422 *
> CVE-2016-7423: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7423 *
> CVE-2016-7466: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7466 *
> CVE-2016-7994: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7994 *
> CVE-2016-7995: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7995 *
> CVE-2016-8576: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-8576 *
> CVE-2016-8577: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-8577 *
> CVE-2016-8578: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-8578 *
> CVE-2016-8667: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-8667 *
> CVE-2016-8668: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-8668 *
> CVE-2016-8669: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-8669 *
> CVE-2016-8909: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-8909 *
> CVE-2016-8910: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-8910 *
> CVE-2016-9101: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9101 *
> CVE-2016-9102: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9102 *
> CVE-2016-9103: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9103 *
> CVE-2016-9104: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9104 *
> CVE-2016-9105: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9105 *
> CVE-2016-9106: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9106 *
> CVE-2016-9401: bash https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9401 *
> CVE-2016-9596: libxml2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9596 *
> CVE-2016-9598: libxml2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9598 *
> CVE-2016-9907: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9907 *
> CVE-2016-9908: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9908 *
> CVE-2016-9911: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9911 *
> CVE-2016-9912: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9912 *
> CVE-2016-9921: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9921 *
> CVE-2016-9923: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9923 *
> CVE-2017-16845: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-16845 *
> CVE-2017-18030: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-18030 *
> CVE-2017-3139: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-3139 *
> CVE-2017-5957: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-5957 *
> CVE-2017-6386: virglrenderer-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-6386 *
> CVE-2017-7377: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-7377 *
> CVE-2017-7471: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-7471 *
> CVE-2017-8086: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-8086 *
> CVE-2017-8112: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-8112 *
> CVE-2017-8309: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-8309 *
> CVE-2017-8379: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-8379 *
> CVE-2018-1000041: librsvg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-1000041 *
> CVE-2018-10844: gnutls https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10844 *
> CVE-2018-10845: gnutls https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10845 *
> CVE-2018-10846: gnutls https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10846 *
> CVE-2018-11806: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-11806 *
> CVE-2018-12433: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12433 *
> CVE-2018-12437: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12437 *
> CVE-2018-12438: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12438 *
> CVE-2018-12617: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12617 *
> CVE-2018-13410: zip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13410 *
> CVE-2018-13684: zip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13684 *
> CVE-2018-15746: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-15746 *
> CVE-2018-16517: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16517 *
> CVE-2018-16868: gnutls https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16868 *
> CVE-2018-16869: nettle https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16869 *
> CVE-2018-17958: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-17958 *
> CVE-2018-18073: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-18073 *
> CVE-2018-18438: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-18438 *
> CVE-2018-6553: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-6553 *
> CVE-2019-1010022: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010022 *
> CVE-2019-1010023: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010023 *
> CVE-2019-1010024: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010024 *
> CVE-2019-1010025: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010025 *
> CVE-2019-10216: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-10216 *
> CVE-2019-14865: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14865 *
> CVE-2019-15847: gcc-source-9.3.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-15847 *

head has 10.1.0 so  I wonder why it lists gcc-source-9.3.0 here

> CVE-2019-18276: bash https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-18276 *
> CVE-2019-20446: librsvg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20446 *
> CVE-2019-20633: patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20633 *
> CVE-2019-6293: flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
> CVE-2020-10713: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10713 *
> CVE-2020-10717: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10717 *
> CVE-2020-12825: libcroco https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12825 *
> CVE-2020-14039: go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14039 *
> CVE-2020-14308: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14308 *
> CVE-2020-14309: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14309 *
> CVE-2020-14310: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14310 *
> CVE-2020-14311: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14311 *
> CVE-2020-14344: libx11 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14344 *
> CVE-2020-14347: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14347 *
> CVE-2020-15586: go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15586 *
> CVE-2020-15705: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
> CVE-2020-15706: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15706 *
> CVE-2020-15707: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15707 *
> CVE-2020-15900: ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15900 *
> CVE-2020-16092: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16092 *
> CVE-2020-1752: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1752 *
> CVE-2020-3810: apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-3810 *
> 
