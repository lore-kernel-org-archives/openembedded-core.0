Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web10.17454.1623593056330656834
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Jun 2021 07:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=j6+ZvoRR;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.50, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f50.google.com with SMTP id w22-20020a0568304116b02904060c6415c7so5877612ott.1
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Jun 2021 07:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=DA6NZ2rb71J+pcnHGVJZy/OQgCsG+3/s0V7Ie9kylao=;
        b=j6+ZvoRRg43Wjli7BW4oHsKRwCjZo5uCP234YsBTdDy/dhiX9sfF5yY/iZDt15Ifpt
         5hi/dHpa5rG3ZyvDrnx2WDhXseHJPj+Xql3D9Ktcbme1tW0up7RtEKrInd08V/4M1y2s
         jfrewOOu0WTYKz+Sw3F6M69aSCanVpJgUj84wVLe2ZN2QHelVh8fo8vi/au/J1hliIKF
         cjPVOnYzE99Y6+9qHFrl77bMdPkOxiY+HVWHTBi0FNlL9o/nTTs4l5HgPaOfZLJGDfk6
         G/nyRauEymwZ4tM0xWCrvV2JYVaTKlkcuoIuMUnBJEO04cCvPhB2VLWRoevtHrUtBfQq
         D+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=DA6NZ2rb71J+pcnHGVJZy/OQgCsG+3/s0V7Ie9kylao=;
        b=sw6GWIg/a7+3Use4NRaAIfQsElKdqz0K8I3czrh8AdplVRsKCPX4Z0yVt79hFLM3gT
         RI8+0CAjpV+d6JbnsGlt/VTWoiuWFwuYlGsmAmNfPkgj9PG9c1pdJIfXRNuJkAmiIhOj
         clnwb6xgBwLb9ultBkGspNHH6BsVm762J22z/n1wlXa5ZyWyCzeSJkbZqlCCDM4H+WmF
         JeP06Ighi3hF0Ul4aEBonP2MqlBC7efrtcCaymusk/mTMdDSNO4kVZFT0XGyMHE9Zj9V
         WMVPKGPnPeBzzy/HokcilyeytG6Wir/TITcvbWBxa8aNxnk2XbDXdAgav9pOGQ+YRv0W
         Qcig==
X-Gm-Message-State: AOAM53308kLT2oNzYN2oRlLQGAAoLVWwZ9n4mvc2hZymB6eT7ZL37Xzq
	jJR/ihA4rsvJ5lgYEQI8yvf91Wr3PpVuaKIK9J8=
X-Google-Smtp-Source: ABdhPJxh8SZ+PutTU8SdoQlx2MkYIH/esjPRm1rV62JSfmv1cbYekpAVT8pkEqiiZ8e3hRKgDp+y3A==
X-Received: by 2002:a05:6830:1595:: with SMTP id i21mr9871498otr.301.1623593055091;
        Sun, 13 Jun 2021 07:04:15 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id a74sm2312261oib.21.2021.06.13.07.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jun 2021 07:04:14 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 4202C9602DE; Sun, 13 Jun 2021 04:04:03 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 13 Jun 2021 04:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210613140403.4202C9602DE@nuc.router0800d9.com>
Date: Sun, 13 Jun 2021 04:04:03 -1000 (HST)

Branch: master

New this week: 10 CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-17541: libjpeg-turbo:libjpeg-turbo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-17541 *
CVE-2020-27661: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27661 *
CVE-2020-27748: xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27748 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2020-35505: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35505 *
CVE-2021-3468: avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3468 *
CVE-2021-3544: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3544 *
CVE-2021-3545: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3545 *
CVE-2021-3546: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3546 *

Removed this week: 0 CVEs

Full list:  Found 17 unpatched CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2019-6293: flex:flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2020-17541: libjpeg-turbo:libjpeg-turbo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-17541 *
CVE-2020-27661: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27661 *
CVE-2020-27748: xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27748 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2020-35505: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35505 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-33574: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33574 *
CVE-2021-3421: rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3421 *
CVE-2021-3468: avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3468 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-3527: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3527 *
CVE-2021-3544: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3544 *
CVE-2021-3545: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3545 *
CVE-2021-3546: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3546 *
