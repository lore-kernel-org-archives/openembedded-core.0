Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.8448.1602754609713922720
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2020 02:36:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O02DHSwn;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: marek.belisko@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id h24so2606481ejg.9
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2020 02:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=xMn9O7YAiXMvTb1QODvpvG8i18jFvCT1XJX8xPeBBlo=;
        b=O02DHSwnK8mEHzpxQH075m8UfqgBEkwcunkmRpKowjuozlbXZMQwK/fYFvDKgH3xRt
         Nm4nHXrhVQyJsPSFLPKeeMec6o5RpqG1jMXLBWiJarZYiGHH+hYx1NDN5vhpt9OaIwQM
         z0XO5jC7890ZDGUZ9uxEeJS7T5Wtrr1haB/yGBO7CQs1RkHBbTX4ewtGyCFBjO4EjpPF
         /OdTWPaYG8RnbiHx9Ndf6YBpUI6KhEWc1ZvJh3baLIwXK7MHr1jy2XVOUMhZ0is9duYN
         8gAbOhzm9GUMR2zJyUJPkrelITdrLuZCHYQ0SXST+gp2jF0O5iinswoIqdwdkvJ5fiDs
         QFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=xMn9O7YAiXMvTb1QODvpvG8i18jFvCT1XJX8xPeBBlo=;
        b=k6o2NcH8M/P5dAid0zL9W6G8sTPn1afWA6htlC4YQ4PtgKZFBy3Nwvg31Lhj9n6Rr2
         gvf3RYPTVFOhSQtgt6gCOGhdIpg4DrzWm+ylENChE58gv4XiNAy1bmPGPg2TI7sgTVX4
         GBCe0rXqV32jCaNLoXAFiz9TyWJUZQ96SEyLTT1zrJHQhMBXeLkZGFLG7JFA+p/VUC2i
         DaQLw81fOVrEaKhp+PJ6VRcVBsPqltGoYSzuHz3WsqltcMBq2xrzV+ZZ4yuzkVfxArv4
         VbKy5nU5dwlrAS4Mm07q09UseZCU1QqPqkhqOzc42lzWh/hwzzRnc5tMXSmwTo6aMYXm
         fvGA==
X-Gm-Message-State: AOAM532OUiWRAftz1ImHFPMypjSXcuuZPTyah2YD0tgXw6YmG3d2O+Pz
	WixOwy4Asp6SUz52LBFMMnFHU+SaWpmP2xQqMcWPdXvebo5pow==
X-Google-Smtp-Source: ABdhPJyDrv+8olFJixkLP0cpptZTYWyqS7Edn2ptceCNDK5SNtBUKm8lyH18PMNqe1lZyDC1bS5Zcqv0biX+KcCYeJg=
X-Received: by 2002:a17:906:547:: with SMTP id k7mr3648734eja.204.1602754607486;
 Thu, 15 Oct 2020 02:36:47 -0700 (PDT)
MIME-Version: 1.0
From: "Marek Belisko" <marek.belisko@gmail.com>
Date: Thu, 15 Oct 2020 11:36:36 +0200
Message-ID: <CAAfyv34E2ctqdoy8mEXYXeCx4r5nOb46jgUgd31E6kpk=8=WyA@mail.gmail.com>
Subject: tcpflow package
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

Does anyone have a recipe for the tcpflow package which can be
shared?I tried to use one from meta-kali but it's not working + there
is also git repo I've tried to write a recipe for but I failed with
some obstacles :). Thanks.

BR,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
