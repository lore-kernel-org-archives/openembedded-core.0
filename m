Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.6036.1613724828291662640
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Feb 2021 00:53:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nG9mSEC0;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: mans.zigher@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id c8so16195314ljd.12
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Feb 2021 00:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=/GcX4Lp4TcK4yzIAWmlzqGtREnm+YNhDRREiFFaOobg=;
        b=nG9mSEC0Oi39dcRiJoJTRVXlaLe0kCp+XKb+ihFeE/ITHJYrzAO7Q2pseX6oicgMES
         ktRpnvf9GmlKHRugngJxrVOB7WDCvyeF0EhjAUA6Kcn/1hwRz2Xu156LnVKwNpsHcX5a
         87P+ZV5EZ1pD6yxk+TvTpuomPD6Ozro1fBILRLxyvwEWONBeDx/rj9DziZ3+bIgvMwCB
         yTFERon9hib1yozyTVjWO9a7tL0hKPik2wMA8IWgGGbYYp40IW4iR2JmEza6qbOezN7l
         b73TNYDv9dM8+mqC5ZqgwL9lJYaWi5aVzNPTCYxnUGhDbHT71qyCxcivAU0pTwawGZJV
         VCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=/GcX4Lp4TcK4yzIAWmlzqGtREnm+YNhDRREiFFaOobg=;
        b=pipUo07pNqgoM2POGPTCauC4s4vz1rYhb41h3eyRzylv4u3wPejohBbSvGomU/Cmzo
         wV93LettVa9zXBHgjl6FPilJ8eyDSJ+yfK/jGa/71cVtqmZLrQJ7vIojrJ4cNDIiHqDt
         pCuTsJNr1ZI7mNW5/sbsKk9RytcX6BMfkyD6CrnGWE4mOWJyAAH0EedpdGR84JDDKXN8
         rmjtpld6ux8h2EkEB0PiBMy9gKmozfi7yzMj/7QbWD2crdWK3IDbvce3w75EVEqu/C0B
         LtIA7s2uzSav+pc29ESQ9VyFvGnbojJHD3tpcVOtM98pbBTNgjLBFTGA7lW6e1aTo977
         d4aw==
X-Gm-Message-State: AOAM5311RKZUQ/D59fRexh6T59FKxw9xEMFmBuxd5etyZjh72tQ2K1dc
	WcQcV+UJ8t2Dcypr9yYxGVDam5eS24O4HYN30IHLhMy467s=
X-Google-Smtp-Source: ABdhPJxOxp49xTiC+Dhpju73eiCSo20a84lecHlbllQ4UE3550h4IK9E17j+bAFktq2z2oOYoHLkShjJZGAdbwyeMj8=
X-Received: by 2002:a05:6512:519:: with SMTP id o25mr5031586lfb.529.1613724825861;
 Fri, 19 Feb 2021 00:53:45 -0800 (PST)
MIME-Version: 1.0
From: "Mans Zigher" <mans.zigher@gmail.com>
Date: Fri, 19 Feb 2021 09:53:35 +0100
Message-ID: <CAEhQi8=E4K3h5Y8ui3PRXYx68Jgk=RzShj0UwQEcGupd_YMYWQ@mail.gmail.com>
Subject: [Question] "global" package list used to bump up customer packages
To: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

I have a problem getting my customer to understand how to work with
OE. They have a set of private packages that they continuously need to
bump up to use the latest version. The packages are stored up in an
artifactory server. I have an idea of maybe helping them out by adding
a manifest file containing a couple of entries for each package

VERSION = "0.25.6"
SRC_URI[md5sum] = "0d6bc46bb69b2a0dce0c042d27b4f25c"
SRC_URI[sha256sum] =
"c20ea63a5e2f24e25d91e5cdfaa6b4b3735739d6170bea7b2b7d429fc397b718"

This manifest should then be pulled into the bitbake environment so
that the packages can read these entries and download what is needed.
Any comments regarding this potential solution would be greatly
appreciated.

Also I have a faint memory of seeing something similar solution so if
you know if something already exists then I would appreciate if you
could let me know.

BR
