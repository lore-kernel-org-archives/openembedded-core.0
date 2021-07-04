Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.9674.1625407434067294600
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Jul 2021 07:03:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=1YAIQUb/;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id f17so2468864pfj.8
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Jul 2021 07:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=nyheoofopJmNSPU/BsN1uJUTpAvBUDfkI0yVzaPLLXs=;
        b=1YAIQUb/t0/PcdiToMZeaml0yaXkFE3fRMLHby3jRVAsTlM2kKxClOXsPn7u5HPd23
         waF0FH/hrtOW0Sj+uugQKw2xIDohuGFTFBJ2uQSq+X7YuZ9zNTKNCoSan6nXFP2n+Iyg
         rx5X6L0ncHG8r1enUSK0Z6PPaEbyPA2KZLC72q7ri8dx4LABB68Swyf4R1SMYbSZT6iE
         ziE4pwHbGAEYkdeyz62ZcTPDAfDX05zmhw3SwbRZhKKAvbMWmOV3H68Vk7o2UDy6m4La
         oeFb8WwsyUsl/2Ps5GhGjHtzC8SZRDqlN6GtOjNLwxqP+v9Qut9ALtxB5KGZMKbz7UN6
         ogNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=nyheoofopJmNSPU/BsN1uJUTpAvBUDfkI0yVzaPLLXs=;
        b=KH0s1QqTbjZKqQNlXEnyj760lVXP4C2TQyE8RTfYwOUN+ZZzQ3LvBl/ZcIq0VK9Z6C
         ebi6sp00nbXKjEuUTVgXBMuhzyy5XMmpYkoUH/1l/YDAc6pjqx3mwKYbr9wovln83VyP
         kIrWVp2G7PE417dFlkEExUysWZXuBwjC2jDcfQ3wGqEBTlDJZkVvX5SqheiHF/vj+bgk
         ppQKE3jHO4eyDpAwJ7ZG72goBM7uppbaKNoH11MgcRMdpkPihy7u82ig57XB78RIjLB8
         +H7DzlpLD+TiIJQwzll/FYmaUxGq7OiNbR5uO/Gt/p0491tONBZBRe700PoOsqi+qmkb
         yFCg==
X-Gm-Message-State: AOAM5334Ax0GAqixoxigWhBgJk/ymKWUH9ElHD03sCGl3OIk8F/WOFA6
	NmNTv4F9VlZ2nwtnmCUQHBC/rQB+8vQKbM7Ct9w=
X-Google-Smtp-Source: ABdhPJxodrGmMlOo/Huf5zMp7Ev2hcGvtthcOhAxl1FA5mCcqG6+cMX0O/kSDnKqV7j3sCAsCbf19w==
X-Received: by 2002:a63:c62:: with SMTP id 34mr4519887pgm.32.1625407432981;
        Sun, 04 Jul 2021 07:03:52 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id c14sm9758923pfj.205.2021.07.04.07.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 07:03:52 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 98D2F96033A; Sun,  4 Jul 2021 04:03:42 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 04 Jul 2021 04:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210704140342.98D2F96033A@nuc.router0800d9.com>
Date: Sun,  4 Jul 2021 04:03:42 -1000 (HST)

Branch: master

New this week: 0 CVEs

Removed this week: 0 CVEs

Full list:  Found 9 unpatched CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2019-6293: flex:flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2020-27748: xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27748 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-33574: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33574 *
CVE-2021-3421: rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3421 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
