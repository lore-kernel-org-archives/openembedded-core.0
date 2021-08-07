Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web08.5320.1628336132900119262
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Aug 2021 04:35:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=GnfRw6a4;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.172, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f172.google.com with SMTP id d2so8577503qto.6
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Aug 2021 04:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=L/fmxYt/RJZtBpWsgnW+6Ek2PUrUVtUIAiAEni/6QwI=;
        b=GnfRw6a4h4XeIVWKAxBqcNbrEH9FCGn611lFlHyNWZq2w6UdueJmoGkFCZY+hbv+zW
         Xu67F7JwYnljDXni3b6mNRKmrvHTYgJt6ojShED1iCnwajPPeglScEClwPnwSTus/T+u
         GRfm6o6v+ME8xmv3qHpwelLU24CuQzx4vt5s6r8jAvX9e32Dyo41SxwBgRmuzW0JEagZ
         exF9LTWEpnNbHURn7Qq1xCeTsy0/fbW8qpxlHTUoTafwGnqJCZ/nORs+J8y99ykOdkl8
         fDom9mKIsmu3WT6KNzhaGAdvAQXyQrgOvm+BpCsieUyFOM4v7AtDtBHpQ9Q2KxlpEsxc
         YWUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=L/fmxYt/RJZtBpWsgnW+6Ek2PUrUVtUIAiAEni/6QwI=;
        b=UUzeCiomK66wq5S5hbELFO7kKSLYn9vb+JGR09SswQy8Bi69pJsAFluopLf5w3A2kh
         yDR/IEsqhCT9IV4MuTvmrp59LprQrGSTn1/IsFZ/cO9XNvJp5tFDcIHk7104F9lXUOww
         0LF9Q6kRdMOKlmHtuJ170feFNFBXPKff33NMrLnPCQSJzOcdr9OqL+DIHHo2esca+qZK
         6a5+BQFaxMWge3m6XTE5/AY29fwfrTDuMbKezWz4P4tpEpn9Tvx6sVHbBPkad/TbO0NQ
         PIfgSOqyqVQD92HY2jhpnPsyeGwO+HcNdDo1KodwQPYQeL9Ug4lr+ktxcburZEwlVy4n
         iUSw==
X-Gm-Message-State: AOAM533AZDEETHm0ZnFU3lUbZXgSZE5i+KNXKzEqtB3fJejzcPrL0Pw7
	SFJ05xgISo3vSw1Io2vUTnsSWcVmU4kv+ft7
X-Google-Smtp-Source: ABdhPJzjXTHslvLooj5bH9BzbqgtNz9Of8SSNDf774VgMLy28JRNvR9BXoALsK7tW0lArVvdJ7Z67A==
X-Received: by 2002:a05:622a:14a:: with SMTP id v10mr12741197qtw.383.1628336131783;
        Sat, 07 Aug 2021 04:35:31 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com. [209.85.160.174])
        by smtp.gmail.com with ESMTPSA id 23sm6181453qkh.97.2021.08.07.04.35.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Aug 2021 04:35:31 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f174.google.com with SMTP id e15so5892373qtx.1
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Aug 2021 04:35:31 -0700 (PDT)
X-Received: by 2002:ac8:7f90:: with SMTP id z16mr5890495qtj.33.1628336130934;
 Sat, 07 Aug 2021 04:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <ec96b538-d04d-e7ea-a9b5-e2f998c6b569@dresearch-fe.de>
In-Reply-To: <ec96b538-d04d-e7ea-a9b5-e2f998c6b569@dresearch-fe.de>
Date: Sat, 7 Aug 2021 08:35:19 -0300
X-Gmail-Original-Message-ID: <CAP9ODKq+=O0QC_F7LxRWvbPtj-7i_JCJ__e6o4bE9+J_GrkPoA@mail.gmail.com>
Message-ID: <CAP9ODKq+=O0QC_F7LxRWvbPtj-7i_JCJ__e6o4bE9+J_GrkPoA@mail.gmail.com>
Subject: Re: [OE-core] GPSD time will jump back 1024 weeks at after week=2180 (23-October-2021)
To: Steffen Sledz <sledz@dresearch-fe.de>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Sean Nyekjaer <sean@geanix.com>, Adrian Bunk <bunk@stusta.de>, Yi Zhao <yi.zhao@windriver.com>, 
	Otavio Salvador <otavio@ossystems.com.br>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em s=C3=A1b., 7 de ago. de 2021 =C3=A0s 05:21, Steffen Sledz
<sledz@dresearch-fe.de> escreveu:
>
> There is a dirty gpsd bug (see https://gitlab.com/gpsd/gpsd/-/issues/144)=
 which is fixed in the latest version 3.23 from yesterday.
>
> Is anyone already working on updating the bitbake recipe accordingly?

I am not; but from discussion with upstream it seems to need to be
ported down to 3.20 gpsd.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
