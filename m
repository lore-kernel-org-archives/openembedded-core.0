Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web10.4562.1631693854207362330
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 01:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RGT2QRHi;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: jupiter.hce@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id u8so1962751vsp.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Sep 2021 01:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=HiA38Yf966BPJ98CPTCo9XGfYsBJPUVdNSj2uMTCCjE=;
        b=RGT2QRHiCtsaSeMAO1YWFRTnF+kLUlHgviZQv/xzZFaWDwbe7WkLwMzHvRSuInUa9H
         GlwMU4PPN9k+MchZBhCztFApQRIl2jUvb28K59Qh9wYV6ZjxLmJ9glQXksFlw/yPixSG
         l1h8DQha16sV+ZLSSGYv3HRm60m86XPb7/3vbaZeZow/H10mNOxIEFHkIUCSZk7LT1Zi
         XMS+nwOEhRtOPEzHE5RA/LJ5OV7lrsE6T84jdL8piqSL6xVEd0tq5g84fUe7hRuHe0PH
         DZNCHAprYhK7nqcvE8PsFEwWGuqrsIuI4Peyp2OHoKwH/MMJUfBRCdUppTT0KZkbMA3F
         eSKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=HiA38Yf966BPJ98CPTCo9XGfYsBJPUVdNSj2uMTCCjE=;
        b=Huy0sh/6UqYfZK5+umNwzbloePk/D/5AU0DncWwrnwn57tVlE7CFpHrmbEChKgYH2t
         mhmsTZ3SDrU2L3WS3cgKKZpZlw087SrjtRfKJHZNR5697LDrasQ73irUnT5w+wSe7XZE
         S+XJTL9YkCHTRF6OJXKzkwQvuXr85xyHnGK+n1deSZcYOtvBUH5+6jABRNm+ARul57Ez
         HgdmHZvJ6Ty6704eh4e9AboewyA2RXxd1wKqZUBSYgI+lyxYTSuVZV1ZUI1Rcm59Zzik
         dx55coTJTvxdPC39O08iuKmerDZewXms31JVaBSkaz0yPaqi6mWlo+tfGIJ6OKK3Q9Zr
         eg+w==
X-Gm-Message-State: AOAM532nAElXJfr/4//KHbPE53NWE2Uy1VWSFhhjKPAJb3/DCbS4owW0
	Raj8zrG4bUxAlDse2yCXevJa0hSwxtP52dwr3H59Fjxc
X-Google-Smtp-Source: ABdhPJyO8HD+sWXVul5F9/iWKOxJ2KrgBlOSczfgbRl9apjBDXTi8MDcupJa4x6NoyDIabmGBI/zlKixNMaggx4MqXQ=
X-Received: by 2002:a67:fe99:: with SMTP id b25mr2318667vsr.5.1631693853339;
 Wed, 15 Sep 2021 01:17:33 -0700 (PDT)
MIME-Version: 1.0
From: "JH" <jupiter.hce@gmail.com>
Date: Wed, 15 Sep 2021 18:16:57 +1000
Message-ID: <CAA=hcWSnctuvZNc=vcAn7-u6W3DHRiLLk2chhgNSyr4s=zNuqw@mail.gmail.com>
Subject: OE systemd RemainAfterExit does not work
To: Yocto discussion list <yocto@yoctoproject.org>
Cc: OE <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

I am running a logout systemd service to clean up in shutdown, the
service was called in boot but was not called in the shutdown process,
I double checked the mlogout.sh script which was not executed.

I tried RemainAfterExit=yes, it did not work either, what could I be missing?

# cat /lib/systemd/system/mlogout.service

[Unit]
Description=Logout clean job
After=syslog.target
DefaultDependencies=no

[Service]
Type=oneshot
ExecStop=/usr/bin/mlogout.sh
RemainAfterExit=true
# RemainAfterExit=yes

[Install]
WantedBy=multi-user.target

Thank you.

Kind regards,

- jupiter
