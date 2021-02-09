Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web08.7654.1612859373245255230
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 00:29:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UGVLax6T;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: rfried.dev@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id k204so17034463oih.3
        for <Openembedded-core@lists.openembedded.org>; Tue, 09 Feb 2021 00:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=MHok3iFFw6F+sIJw0Gf6Fxsg8pOYus4VTSpH6NpcZVU=;
        b=UGVLax6TRRozdrCamfzu8uxYDpNa8f5nsvnE2QXIxVloVu1Yr34yAYsthwB9u0b3fZ
         1yW52/nXaSsxfDqz7Z4w+10hWV8ezvc+KFxpYwHUouN3i5Mryvdvy5cTBH+PNtm31gqr
         5Ye7T5QVCvoWk2FLIOQ6uUUEKaILz7H9WijYsmqxHm7GtsDOC/2zk6jzCIoVE974ysn4
         LTRtbG2znZXdZsZffS4Yp/6Jm65fxOLEokxuq0OUEheGx2r4b3jPoo3Tol/qPApd9G3w
         bPR9gKlmsgcrd7a5PiNV9AqRKlDHmEw4vObD0eObOBK/vxqaVCJd8LoFWXDnliQ+jH/h
         3g0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=MHok3iFFw6F+sIJw0Gf6Fxsg8pOYus4VTSpH6NpcZVU=;
        b=JndnSfEzODRlRunP33GyNZf3rw/FVNWitU6e2KDsvAorULGUyOmjFqD0a0KC+pAzCM
         bTIbcnbEomoEaNOxkrCDN/REBSaeEIi6CsU1HlOp9Ln8gYf2wcofBCSCUxcwY8E62UuB
         CQOIoNh9ES8aYceIGjaycRcD8FQbVWKx1BwTl0mJgZD2qBjXNvVGyl95RO8Hg+/mGuaK
         QqxsxzRfgbMI+2oNGGVEfoDdOEXeORTiyapDC2eT6je4vag6RnPuFdKN7bs2EIg6wcJ6
         3ORl8cO55sWIzCMBH5j6bvBjH/y6yTBVQFDsrzvRxfkJ0FCpcH8Uvfl2BRNsS6g0np0x
         8Kdw==
X-Gm-Message-State: AOAM532KTP9Ds7W/DdSuunfQ1EMzmlsQ5pYV6/JevxSvecYk3Mw9B71+
	AXrB/WjvFP/rCtwJo7JBRHCbcIcC2FU8AfAhNyjc7/teDpFYVg==
X-Google-Smtp-Source: ABdhPJw4R43Pz1EbK/1TkZN2FaGKQHp8Zg0ciiB/9MvfVROj3WIvmakF6jvAvdnHXHDxZGhsZKD/EYuJg538WBdbj+U=
X-Received: by 2002:aca:c7c8:: with SMTP id x191mr1820724oif.152.1612859372215;
 Tue, 09 Feb 2021 00:29:32 -0800 (PST)
MIME-Version: 1.0
From: "Ramon Fried" <rfried.dev@gmail.com>
Date: Tue, 9 Feb 2021 10:29:21 +0200
Message-ID: <CAGi-RUJUdQf4LtsYusmzDH-FSpuq=6ZvEpyPBJkj3=XojqR4kw@mail.gmail.com>
Subject: libsystemd is missing ?
To: Openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"

Hi.
I stumbled upon a recipe which needs libsystemd (fluentbit).
In the configuration phase, during pkg-config, it fails finding libsystemd.
Specifically, it fails to find the journald header file: sd-journal.h

Am I missing some configuration, or systemd recipe doesn't install the
dev libraries, only the runtime ?

Thanks,
Ramon.
