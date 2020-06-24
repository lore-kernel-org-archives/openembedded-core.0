Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.1483.1593030265832478477
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2020 13:24:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=WEHRCaih;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.171, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f171.google.com with SMTP id z63so3168796qkb.8
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2020 13:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=il6iwpaTxK1wTtqG4FLb9eQG5IsDP3VScFjlo5j68oo=;
        b=WEHRCaihtKiSYjsDpr2ay9AlnQeFjQF3yzyaXKtRaovkdSDUVf1Sc2OytXBjbziA0Q
         YK7Kofb/I5ST4cHsIPFRS16n8BBBeqGrwkRR7AkvAzreLtsoQrwKNfaBnPKVyaY0EN8r
         0VeTPfsMxSo6zNoVsKfcBTazN+MWuZ2y7xhGLbCLRddhkMZ2958L51m8CTgmm9WOns7J
         1OD01dyBg4IYjKdCFUO2ROgkuqWiz4tT6PoBZ07flVvotf7Ug8dtzj822Pg1yHXyoOXi
         mLlX26oMmMlD8DuNIIKCf4cTofTF+plCzM1VW9kXn9l7n60OXLI9Nj64PC108SYmpXIC
         sHdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=il6iwpaTxK1wTtqG4FLb9eQG5IsDP3VScFjlo5j68oo=;
        b=h8BYXn4BraIctlUndLOtSZkceJ04kukiiuTQgN4g620OBgCx377DBKzkG4Hp1lCUSf
         LZj90y1Al9WBSMbRn9Vw4Tz9VRV0uzoaF91uRIgRUbH+2Mt5rtQ6seF0jpq2PbdWH/wH
         0y+ClTvdxb4g2iABMvpLDWeibLcmeJsVokDF9H5peWaL8f152wEc/Jy1GD/UMnYSMThu
         /AXVhbW74xGsHbu8K1EpPjpXYC8FTeZYSTC/vt4GKaHprDC4ZmUoy4MWyYQA2+A7g8DU
         FOn2fRuzh8z46CMtBo9teitZnUYo64vzebarxhAaRbHxtBj39BPVDRp3UFpfcHN6LR/I
         tuJw==
X-Gm-Message-State: AOAM533nSlQ9Nfih9P4IxIq+rnLVAd7LozPix9hs/9xH7SIh7wyNaX6a
	S0jj6Jf+QIOFLweXHXhBuJvVqaxQudXBiA==
X-Google-Smtp-Source: ABdhPJy1kWhi//o52T4xRXN0bucPAJy3PbrN7s9dg92KTDmO/0nXta+TI6wtqdmIyx+OkFjgM4ozgA==
X-Received: by 2002:a37:4d0f:: with SMTP id a15mr27102396qkb.313.1593030264585;
        Wed, 24 Jun 2020 13:24:24 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com. [209.85.160.177])
        by smtp.gmail.com with ESMTPSA id c7sm4151073qta.95.2020.06.24.13.24.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2020 13:24:23 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f177.google.com with SMTP id d27so2829880qtg.4
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2020 13:24:23 -0700 (PDT)
X-Received: by 2002:ac8:60c8:: with SMTP id i8mr18297056qtm.271.1593030263134;
 Wed, 24 Jun 2020 13:24:23 -0700 (PDT)
MIME-Version: 1.0
References: <c207ad43-fba6-d5ff-085a-f6be1231e230@herbrechtsmeier.net>
 <CAP9ODKoR_JOt6UQFTMNJYv_fh4d-vuVyy-5k_cd6ZgjsiLcA0Q@mail.gmail.com>
 <CAMKF1srKPeNpoX0uRPSHQM3VDuqe+C=adNsDFZ85L+irrs6xDQ@mail.gmail.com>
 <2f176c09-1647-6d46-548c-e58fff7559b6@herbrechtsmeier.net>
 <c0aee660-78e1-d6b0-00d1-687853b89578@gmail.com> <9f3cf7b6-7240-f1ea-6c4f-27dde0dbdc6a@herbrechtsmeier.net>
In-Reply-To: <9f3cf7b6-7240-f1ea-6c4f-27dde0dbdc6a@herbrechtsmeier.net>
Date: Wed, 24 Jun 2020 17:24:11 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpQ+ZgNqoZvWtHRF_RyrvpXan4v-ZM=U9fiHXj8o8Daww@mail.gmail.com>
Message-ID: <CAP9ODKpQ+ZgNqoZvWtHRF_RyrvpXan4v-ZM=U9fiHXj8o8Daww@mail.gmail.com>
Subject: Re: [OE-core] Status of Go support
To: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Cc: Khem Raj <raj.khem@gmail.com>, Otavio Salvador <otavio@ossystems.com.br>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qua., 24 de jun. de 2020 =C3=A0s 17:17, Stefan Herbrechtsmeier
<stefan@herbrechtsmeier.net> escreveu:
> The go-mod.bbclass download data from the internet during do_compile. If
> you cut the internet connection after a do_fetch the do_compile failed:

Yes, this was the better we could get without hacking go mod tool
itself. It would be nice if you can provide an alternative way to
improve it.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
