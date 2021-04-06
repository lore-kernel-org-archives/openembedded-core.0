Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web11.8810.1617694446164306779
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Apr 2021 00:34:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ROvlAft2;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: jupiter.hce@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id l187so8976462ybl.4
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Apr 2021 00:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=XEJLD3FP50KGNNkoeIgZgSvbnGHL0MAEwOPR9Uihb9k=;
        b=ROvlAft2XIt7FsfeiYDNt9Dew0uoOi8Hnxld5DO+DZHWAOKwmYDaICYxdzGkdZtHwD
         +uhmI04b6H2bqaquTo2NKcEDskTYiNm0ciIkdTbH0IFvYAssCqSDFXjvf5QtZYeJlPk+
         ei5XejkZ+a4aymlpWHoC/fhhGvBPd6Udy7hOadLgIUbpBAAnNFTsHoDq47n/keWDK/rz
         2+NL+r6A6MewUsHPl1EgMN/qjZGh4n6ZU+z2SDW1lNXXRAsL4kLDrN75ba34y5FaBPV7
         LSNaDbGf+osBRBhenxnzH5tCmU9XGQ/1BSU29CWPawWzxErw78fPCH9Jg+/gkthlbNyc
         +Pqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=XEJLD3FP50KGNNkoeIgZgSvbnGHL0MAEwOPR9Uihb9k=;
        b=mPzCf0xrR4bN7GPEtucn7sJMnAHiykWS7K9UcW3nKFYqfA+U8B59ayYabTM7sVyHT1
         +RKOg/7wCHkuCPhvFtYryG6k55aA6QqP1k1Z6QdtDtc69TO6nRh9FSHcxW/bY1HPm5PG
         MNc9aRuQRN5ntXAR2LOEGY1VOcoQDte8MJ/sx8IKq496eplmGbJtMEglDG8r2L9dV9Sp
         iy025JL2CpNFAGegCoIQBj6iCsfjUttoxMNA3qN4VsOzNiloODrSHjv+fF6srWnOuf4E
         U8p9w6g8IdBc5s0QDPP9JO5578ZEvJ6LJx8FWcdnem7ZNjFarvNJ+pPQM2GMwGo2u2Za
         cPNg==
X-Gm-Message-State: AOAM531DYvVMsguQG3DLTVHWbbAykxkbvHBRaEv5qvT+Sr//B9bb60bQ
	Mu5BMmu5n66jkbig2r+yRFJsayApS5hq1yT+Gf0=
X-Google-Smtp-Source: ABdhPJxCccxnQZbXoKpBnJF9HDRjgkiVR18oLuz17JjEECVqGx8Vy1mXUbbGPRMEX2dSXzQjkhhc+q7q6eDwTMMNbt8=
X-Received: by 2002:a25:8407:: with SMTP id u7mr8045470ybk.156.1617694445381;
 Tue, 06 Apr 2021 00:34:05 -0700 (PDT)
MIME-Version: 1.0
From: "JH" <jupiter.hce@gmail.com>
Date: Tue, 6 Apr 2021 17:33:28 +1000
Message-ID: <CAA=hcWRmH9m3ynX9w7_FXVfeK=ofrbneqZ7Z8QQj6ShftESteA@mail.gmail.com>
Subject: WiFi P2P support
To: Yocto discussion list <yocto@yoctoproject.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

I am building WiFi wlan Linux image on Zeus using Linux WiFi
linux-firmware-sd8801 and connman, I need to add WiFi P2P support, is
it sufficient to create wpa-supplicant_2.9.bbappend to enable
CONFIG_P2P=y (it is disabled in wpa-supplicant_2.9 defconfig)?

Do I need to make other changes on OE configurations?

Thank you very much.

Kind regards,

jupier
