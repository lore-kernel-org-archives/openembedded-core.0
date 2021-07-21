Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.2446.1626890335578051040
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jul 2021 10:58:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=huVIaK/V;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.48, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f48.google.com with SMTP id k4so3109066wrc.8
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jul 2021 10:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NqFLIgksQw2VbeKHRPGLY1748ddnBay8//VDVAN/JHI=;
        b=huVIaK/VgUX/R5lYwOo9dxCv8V3KT9JGTcTos0o+ukrOOd8fXvRXlhr1EErpohSGfs
         556TYk+hpq8qI1ppDmQmr6gMzzC0lsfJXH0GTD6WcGYV3Z0f1HeJuOYqrIX3u1XRhWp+
         f75rhqjTo3S5d8Wmev8F81NhxSysrph8c+VEUkIu+vdpz95avMJ5IeURPJDKR20obwey
         ozJ792k1lwI7RWiTqFwFaZUdSz0w2InSCxlqnidly33E4v7xBpXpXwqwVjqNf67aDwep
         O71uTTIBpUfFWKeiAV1JuN0lWdX745FMjAmGVccixP+DqAXUMELzlX/+usB9h/b23gDv
         9C+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NqFLIgksQw2VbeKHRPGLY1748ddnBay8//VDVAN/JHI=;
        b=a/ytmgvmooymc88hwkyGZrsmuGA+fqgAR69NSet3uKn6NxZPbkhe8IYit8J8XtyC8U
         ojOIZiuvrhGlNLRvzJ8vbQzLgByr/sGEXPRQ7G+TzYv5iLWKRlE6Voyo8EoBgTgH3/vB
         rvd5kLUWsRMKt7lFLt10ZHg1//6w6SWkJRfLDpOp0n1K+1O+vcJM+GNHaH7o31Out+tM
         4uaYvBZBo7ZgaqSjEyXdaDx0mSUsYrcmK8jWjYzlL49UsefMkyGiTAZ38MfmSdMiDoGi
         zSTvnpQfTFh7NsfzyvfI7c7p/AKWK27jH+fUDG+LMN5oMvnDpnzonJKvKiftEG6UGXcr
         W2qg==
X-Gm-Message-State: AOAM530uPa8m+NuMCfe09NCvXjxyd4T52Vl65uHjusGc7tjHw9RkFu9M
	pWexuS06kaBJEXZAzfHDOdZHp6ZZLSo7bdlDk7T0Ww==
X-Google-Smtp-Source: ABdhPJxELr2mSOpmn5aDqTtmsmGcLknGIKjA7jQjDO82d3SFXMsPyEO38RSUs6CUyQgE3NA8LctQqMsXw0TNCvhrAHY=
X-Received: by 2002:a5d:4a0f:: with SMTP id m15mr43985781wrq.350.1626890333908;
 Wed, 21 Jul 2021 10:58:53 -0700 (PDT)
MIME-Version: 1.0
References: <1692E92777BDAB63.6380@lists.yoctoproject.org>
In-Reply-To: <1692E92777BDAB63.6380@lists.yoctoproject.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 21 Jul 2021 07:58:42 -1000
Message-ID: <CAOSpxdZhya9R0F9pLa-WF7GTvDrYxYu21ZYh5KQ6PxR=WzfA0g@mail.gmail.com>
Subject: Re: [yocto-security] OE-core CVE metrics for dunfell on Sun 18 Jul 2021 04:30:01 AM HST
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 18, 2021 at 4:32 AM Steve Sakoman via
lists.yoctoproject.org <steve=sakoman.com@lists.yoctoproject.org>
wrote:
>
> Branch: dunfell
>
> New this week: 0 CVEs
>
> Removed this week: 0 CVEs
>
> Full list:  Found 80 unpatched CVEs
> CVE-2018-21232: re2c:re2c-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-21232 *
> CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
> CVE-2019-6293: flex:flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
> CVE-2020-12829: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12829 *
> CVE-2020-13253: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13253 *
> CVE-2020-13754: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13754 *
> CVE-2020-13791: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13791 *
> CVE-2020-14372: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14372 *
> CVE-2020-15469: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15469 *
> CVE-2020-15705: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
> CVE-2020-15859: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15859 *
> CVE-2020-15900: ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15900 *
> CVE-2020-16590: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16590 *
> CVE-2020-16591: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16591 *
> CVE-2020-16593: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16593 *
> CVE-2020-16599: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16599 *
> CVE-2020-17380: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-17380 *
> CVE-2020-25632: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25632 *
> CVE-2020-25647: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25647 *
> CVE-2020-25742: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25742 *
> CVE-2020-25743: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25743 *
> CVE-2020-27661: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27661 *
> CVE-2020-27748: xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27748 *
> CVE-2020-27749: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27749 *
> CVE-2020-27779: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27779 *
> CVE-2020-27821: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27821 *
> CVE-2020-29510: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29510 *
> CVE-2020-29623: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29623 *
> CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
> CVE-2020-35504: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35504 *
> CVE-2020-35505: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35505 *
> CVE-2020-35506: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35506 *
> CVE-2020-3810: apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-3810 *
> CVE-2021-0129: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-0129 *
> CVE-2021-1765: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1765 *
> CVE-2021-1789: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1789 *
> CVE-2021-1799: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1799 *
> CVE-2021-1801: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1801 *
> CVE-2021-1870: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1870 *
> CVE-2021-20181: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20181 *
> CVE-2021-20221: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20221 *
> CVE-2021-20225: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20225 *
> CVE-2021-20233: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20233 *
> CVE-2021-20240: gdk-pixbuf:gdk-pixbuf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20240 *
> CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
> CVE-2021-20266: rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20266 *
> CVE-2021-20294: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20294 *
> CVE-2021-20305: nettle:nettle-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20305 *
> CVE-2021-22897: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22897 *
> CVE-2021-22898: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22898 *
> CVE-2021-27097: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27097 *
> CVE-2021-27138: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27138 *
> CVE-2021-27218: glib-2.0:glib-2.0-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27218 *
> CVE-2021-27219: glib-2.0:glib-2.0-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27219 *
> CVE-2021-27918: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27918 *
> CVE-2021-28041: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-28041 *
> CVE-2021-28153: glib-2.0:glib-2.0-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-28153 *
> CVE-2021-29921: python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-29921 *
> CVE-2021-31525: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31525 *
> CVE-2021-3156: sudo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3156 *
> CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
> CVE-2021-3200: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3200 *
> CVE-2021-33194: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33194 *
> CVE-2021-33560: libgcrypt:libgcrypt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33560 *
> CVE-2021-33574: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33574 *
> CVE-2021-3409: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3409 *
> CVE-2021-3416: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3416 *
> CVE-2021-3418: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3418 *
> CVE-2021-3445: libdnf https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3445 *
> CVE-2021-3468: avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3468 *

Working on this one ^^

> CVE-2021-3497: gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3497 *
> CVE-2021-3498: gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3498 *
> CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
> CVE-2021-3522: gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3522 *
> CVE-2021-3527: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3527 *
> CVE-2021-3541: libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3541 *

Working on this one ^^

> CVE-2021-3544: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3544 *
> CVE-2021-3545: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3545 *
> CVE-2021-3546: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3546 *
> CVE-2021-3588: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3588 *
>
> 
>
