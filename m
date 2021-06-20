Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web08.33805.1624197844416171228
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jun 2021 07:04:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=XLoy0k3Q;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.48, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f48.google.com with SMTP id o17-20020a9d76510000b02903eabfc221a9so14984060otl.0
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Jun 2021 07:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=OsEB4Q6suIohQtUAmBYioHMnNkDb/jOlmhHpHJA2LT0=;
        b=XLoy0k3QhzHIYbzP+2wM+Mkb3xs6UcoOA0EUqzsZX06L+RxqKdDDzOpLu6p/QEYy18
         MSalmsM6rLNqoowfiJt+dvlQbIiS6MvvKkMW4s4y5Bm8m4XAwlnpKRReOZyegeixPjbD
         xH8K4txSwHVpRJqvbvFKkya8H3NpiycON2Ql8Hr9tlWWKLCLOj6L8GMFaH7rtUNNW99Q
         nQh20UPeC1giKviF/A+OTKsnPxJDc5kxKBexk0pjMlEUBTdlei22/7qfJPwz83+Fg+I/
         Rvg9M72lb+RYRSO1/SMPm4qYmVpT8iYPmB9bVL0iz+IIKCvsypX0PqN/4xMjrCkkLOc+
         JdpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=OsEB4Q6suIohQtUAmBYioHMnNkDb/jOlmhHpHJA2LT0=;
        b=InlKYF5kdzb+JWBl9RMk1lzhOzTBWnL/JpgSxQUOwjNzkKQ2HXeMttclYEhRYI5Avr
         1+Ljglsj8iuixVtT71h+QctquJKSXvSCb7abb2IpCzDt4xEn3SlAmk1fyJ06lpwRapaj
         V8NxkZJm158pZDjULIaEQd9r4ahRc8STyd0bkge9rY361iAFV7/qF8H2SaNgHltgX9vk
         2RllMbQUHFjcUsxSvD+zmYyaDWXgtcFZ3lkr6QLzTm7Y2Z87y3HOvojfraCj5seJbUBu
         IdNYAfAjd7eIAXHlAhkP+0a4sjet1Qk7Vc8sAKPr6Aob2sCwP71j8iU4cGEDr+yk0sKs
         tvFQ==
X-Gm-Message-State: AOAM530jJbJq+XzVE/xfXxXrKq5a0WTzANnLvOHg/bJk0j3bjjrkzJ8n
	gaZ1uYmnt64sP5MSrfpZ9wwzfp+BmruT33d8W48=
X-Google-Smtp-Source: ABdhPJxaMSwaqjkZS2YDYKIkzEJ5KVKDCz4CEL49Dfgj+6LjwZtorD6oskKrKQajVBb0uvbHdgQFXw==
X-Received: by 2002:a9d:4d12:: with SMTP id n18mr17559794otf.128.1624197843155;
        Sun, 20 Jun 2021 07:04:03 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s123sm1648907oos.12.2021.06.20.07.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jun 2021 07:04:02 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 46803960348; Sun, 20 Jun 2021 04:03:52 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 20 Jun 2021 04:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210620140352.46803960348@nuc.router0800d9.com>
Date: Sun, 20 Jun 2021 04:03:52 -1000 (HST)

Branch: master

New this week: 0 CVEs

Removed this week: 7 CVEs
CVE-2020-17541: libjpeg-turbo:libjpeg-turbo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-17541 *
CVE-2020-27661: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27661 *
CVE-2020-35505: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35505 *
CVE-2021-3468: avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3468 *
CVE-2021-3544: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3544 *
CVE-2021-3545: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3545 *
CVE-2021-3546: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3546 *

Full list:  Found 10 unpatched CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2019-6293: flex:flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2020-27748: xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27748 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-33574: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33574 *
CVE-2021-3421: rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3421 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-3527: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3527 *
