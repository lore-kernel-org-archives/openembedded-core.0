Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web12.465.1611866916142859428
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 28 Jan 2021 12:48:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=ETzKS5AM;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.48, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qv1-f48.google.com with SMTP id l14so3496026qvp.2
        for <Openembedded-core@lists.openembedded.org>; Thu, 28 Jan 2021 12:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=s4mkwxqCccHDN1f1KG33mjsfY27Vb18unqnGFqelyOk=;
        b=ETzKS5AMTplqYdmJsuimjV/0o+9AqMNRlztyrP/Xu6Tdnakn5LP2QbN4IgH+1A9wOV
         6fl0u0H3YVk8U4AXI5elxiZ8aE2kD+RodZIV04/A6bgwpGdDRrTmg0xbWVOnUkD20SIz
         d+ApW8fWRy6gkp2JJz6a06dFwwAK82WS1z8J7bypk2PdlaiRHsHaUMlDg8FUqmvMwZDf
         YPJbb/Y3RU8JXfKikG11r9b68fHVX0ARzSVjKK5o1+hdZHpMTy3bCH1C42WYgWC7uKlQ
         +quzJl8UFs/nEo/NK1Gh46TR/n1IlJXtY5UU2fnqTmkGo2IoMD4aH81Wds106VYBgoKR
         FFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=s4mkwxqCccHDN1f1KG33mjsfY27Vb18unqnGFqelyOk=;
        b=tQLnllVVxacnhgocgjey7PgDizW+HWPJFQCvZvlARVvPpo0YiG56HNCd466AhTaoeJ
         MbVuvnFFgQJ+Yj3PK6/CryG//E9tR/fA2iew37gXqO2yVnKxj6JSyhlcPZmuTypiVj6Y
         ZWSU/gubRNy5jZ/6eg7CUPIFtAY3P8j2Mp3E0oMk7Rai60wOHLdH6pqBg03UwmdMZUVQ
         SaOCMe4A3ZsqAzbVZ6q/e0w93DlRj7eUwrm5aX0ZkZwi4P+X1WxM2WKs5abV0G+lZJXH
         KRFKLTLaaSblNlpqbMN2RQ4O87UKDgZXF9R51t7uWMXAcjlgRl7DV95dhpxcYBxNcvVg
         SAlg==
X-Gm-Message-State: AOAM530BfjWh59HGPk870FKP2rCm131mZ+v6hKQ4UfgKF7ltfrTSKYCG
	DxILeE7J2eWn8FbwDyE/799zWL+xI7+JJ6PL
X-Google-Smtp-Source: ABdhPJy+4ny8T6/bJe/tlo4kxKjJzU8T7oMwsqj3MAlZuyqe/SO5GvsEUvaWzcqC6o/BKD2i7DqPLQ==
X-Received: by 2002:a0c:bf12:: with SMTP id m18mr1091846qvi.40.1611866915219;
        Thu, 28 Jan 2021 12:48:35 -0800 (PST)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com. [209.85.160.169])
        by smtp.gmail.com with ESMTPSA id 203sm4267858qkd.81.2021.01.28.12.48.34
        for <Openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jan 2021 12:48:34 -0800 (PST)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f169.google.com with SMTP id w20so2951228qta.0
        for <Openembedded-core@lists.openembedded.org>; Thu, 28 Jan 2021 12:48:34 -0800 (PST)
X-Received: by 2002:ac8:4a98:: with SMTP id l24mr453184qtq.33.1611866914246;
 Thu, 28 Jan 2021 12:48:34 -0800 (PST)
MIME-Version: 1.0
References: <20210128204342.586225-1-voa.aquino@gmail.com>
In-Reply-To: <20210128204342.586225-1-voa.aquino@gmail.com>
Date: Thu, 28 Jan 2021 17:48:22 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpJE23cq62D-_1WZBWsr3Kdh2TMXwuNswCsievs1c+WiA@mail.gmail.com>
Message-ID: <CAP9ODKpJE23cq62D-_1WZBWsr3Kdh2TMXwuNswCsievs1c+WiA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cmake: Upgrade 3.19.2 -> 3.19.3
To: =?UTF-8?Q?Vin=C3=ADcius_Ossanes_Aquino?= <voa.aquino@gmail.com>
Cc: Patches and discussions about the oe-core layer <Openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qui., 28 de jan. de 2021 =C3=A0s 17:45, Vin=C3=ADcius Ossanes Aquino
<voa.aquino@gmail.com> escreveu:
>
> Signed-off-by: Vin=C3=ADcius Ossanes Aquino <voa.aquino@gmail.com>

Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>


--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
