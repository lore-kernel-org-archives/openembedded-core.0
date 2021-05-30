Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web12.32106.1622383416330156527
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 May 2021 07:03:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Y2Wco/TJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.46, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f46.google.com with SMTP id d25-20020a0568300459b02902f886f7dd43so8504575otc.6
        for <openembedded-core@lists.openembedded.org>; Sun, 30 May 2021 07:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=YXl+LtzHHuVHPHlHEj9Pu3ZB6wdCMatiNNZeqQAq0qg=;
        b=Y2Wco/TJYIlGbBwqzKGKoVhwRQF7SCx6L/1CJ7s9Qqj3YlL/nArEtVrVPDjoTZB2EM
         TbZjRcy98mnhaYZmsaYPzVNvwwFiaOn/RukXQQRyVNYgY2mqg6BS8hlrBo4S8sbhn3lW
         L2BlDvjgRgKXeA1Lg5BtMGcvTuRl5rYeTRTCTKZ9B8ZaDpKeec2G8qfKp144QnM1HUTN
         R2sVpOzTXbY1BZ8bsNIEyAhnvqSXkOAlQwMLid7HZUBndBMkSu6RusvvSp/mOPH9ZTCo
         tYmlPG+rjBOAhV76BJafQNTOYE/HRq2VBDmaQtZ0pP1mVfaPKe/CbB5IB3PGx2PIdPjG
         hg5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=YXl+LtzHHuVHPHlHEj9Pu3ZB6wdCMatiNNZeqQAq0qg=;
        b=uL8QHWX56zR4pw4j8zeW2A4WOq4BF7WhkBfH001gCEhfwUgd+McxTqMRycKq+BBQqp
         szkAtP900n+eGfb1hd9aWhoFuZA4D0URXsB9JXxf1TjtDhv2VUB1taA0PXvSuUILa6iY
         1nyiEpDMX5UUb1o5GbtAaYlhoE0bl6J12oZmnQ1vmj6Xa5Dl0+WCxNA/hIe6XorPw5rn
         WFOXdu8H16THg16UYAs3k9zOc1xVdjEG46Ai1cy/6U8K9VQUJRACSNuiUmL2w5CWOMh0
         ud3Rc4cW6B1gpv2BBOPAxQVxtkdwYal/hsYnJ/Zy84Uqm5vO479+UQYCidbl+2VbDfuV
         FtdA==
X-Gm-Message-State: AOAM530MAQkw8xZ0C4MjIhpuk0uJARe3OwfiiDVHiVq5BeDOfvvHdDrT
	H3bJKTn+rs34A3aEUyjzOZRJbnChUH3grNDZdmA=
X-Google-Smtp-Source: ABdhPJzw+MLeV70qSahXyXXVSX7eWccJGkuWUlkFNLkTK9dNUXFlQ4uSDHov9h832yexYMRm+B09iw==
X-Received: by 2002:a05:6830:248d:: with SMTP id u13mr13644029ots.121.1622383415076;
        Sun, 30 May 2021 07:03:35 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id w10sm2359677ott.75.2021.05.30.07.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 07:03:34 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 51D3F960398; Sun, 30 May 2021 04:03:24 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 30 May 2021 04:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210530140324.51D3F960398@nuc.router0800d9.com>
Date: Sun, 30 May 2021 04:03:24 -1000 (HST)

Branch: master

New this week: 2 CVEs
CVE-2021-20231: gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20231 *
CVE-2021-22876: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22876 *

Removed this week: 1 CVEs
CVE-2000-0803: groff:groff-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0803 *

Full list:  Found 6 unpatched CVEs
CVE-2019-6293: flex:flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2021-20231: gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20231 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-22876: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22876 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
