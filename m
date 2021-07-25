Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.17945.1627221852523545387
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jul 2021 07:04:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=VX6ZsOAh;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id a20so8775166plm.0
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Jul 2021 07:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=f2OHTCmRGxsu9VIkgKJVvUFzKlK0vlztVqmcD07wSgY=;
        b=VX6ZsOAhkEC3YCGVOBAeOfZ6p+qzrFe30SP2en8Oe4AAYq1IpSCpSTCf9Wclx79b8R
         QAwD042icoOkPvuk/Z5S8umcF8yDRA9nIeaCzpFmlwAOC9xhEZy+Davh9yXsjCBdy6Hh
         IgpnqNKTDfmV81z5IwbXfpf+iPFqmCfXTC8A4j+9Ki1PF22IsdPZ7aXNvnHI3cXex+pt
         KXfwZeXnUDIawYOg5TE5cDTS9LGYuslME3rwzbj22VGu70X4V/mJ2N1ZBXd0enzOiODB
         TpXxAs4fCY5FiwiIYx6IKylatO0TF+QckoocWAfMv2y7XOyhsv+hOqN5vLEnm1PdAruR
         eN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=f2OHTCmRGxsu9VIkgKJVvUFzKlK0vlztVqmcD07wSgY=;
        b=UZrBfjzctLSckJhGH/vTCKZhNFFwnu5wCsdxGuHRqGYBfzRvcH9JzQD6yvmuo7qw3q
         WIy3eNWpJFqzq4hVK3oxqTV2y31Fm+xMlcBN1/5FljUfAhf7OKQ5d917R/wn4do22i8q
         tDud0ZDqubNNk5xzderpT5SE+0GYf0zwBJHkV5aksbA2Abh51Ahx6kSzE1diTyx5pXCg
         N2q6qvMYx39Z1QeF3Us3RaVUMa8Vf3CfuVxYiPLsmp2o8UgWLJ591eCmOBdu1EFMnrhX
         T1L00+cyxFyR4eKMS7VMOpaTyXRXV3ShDPdmvHpJrPN0B9TIOipxgrpE3taikZ4du5Ig
         lZtw==
X-Gm-Message-State: AOAM530KX/cvB0GMN6KaI541sAhKBR8ClRQ2ZgN88vMDU/Aw9ctGNih0
	s98++932DF+rTtfPnjC7gSqLZoLgI9uO0WIH
X-Google-Smtp-Source: ABdhPJyQTSDowM/mnonbU0duLEaF6+t3yKhTWkiLFfCPGH9jiTgfIeSWQ9Qp1Qvk3KTU/lYX+RmtIA==
X-Received: by 2002:a05:6a00:189e:b029:32b:9f66:dcbb with SMTP id x30-20020a056a00189eb029032b9f66dcbbmr13488298pfh.72.1627221851316;
        Sun, 25 Jul 2021 07:04:11 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q19sm28036058pgj.17.2021.07.25.07.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jul 2021 07:04:10 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 721BC960318; Sun, 25 Jul 2021 04:04:08 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 25 Jul 2021 04:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210725140408.721BC960318@nuc.router0800d9.com>
Date: Sun, 25 Jul 2021 04:04:08 -1000 (HST)

Branch: master

New this week: 0 CVEs

Removed this week: 1 CVEs
CVE-2021-36217: avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36217 *

Full list:  Found 9 unpatched CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2019-6293: flex:flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2020-27748: xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27748 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-33574: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33574 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-35331: tcl:tcl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35331 *
