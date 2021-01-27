Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web08.13561.1611777094200055820
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 11:51:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Uw45ZKVd;
 spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id u17so3143453iow.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Jan 2021 11:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vL+PG68Tj7ZufCcApeUNnOoBvORf3ZCrFCc9388xb7k=;
        b=Uw45ZKVdKuAb58fkTilCKEf2Nsvooz2Qme1X7ha1p++VrzY4tpoe6RzuiP9eNwQYrf
         vva6g8wy4Ht5BbdPRf6U8S9JEixl6ZcqslJPgpwziAARxCu9rGR/EMLRPiMpGmtSvxNQ
         LQcou9Qs/XzKC+e10Dw1lc3zhv9EF8dLwd70ggCC0w8xU4PUIxgYNSuoa2yU323vz5Ej
         cR3K0giKbJv4BcCTrW/z8WNLoZLTEEfLv7B/bFCSXsjhgVa+3Y4JzTynoTSmWywBfl4B
         RiUiHYhquyWVmxS/tRSr/5pKrWvb8O7Jcs+4A4eQLhINRpZSEXCRoDDINjmXFgff7Ipp
         n2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vL+PG68Tj7ZufCcApeUNnOoBvORf3ZCrFCc9388xb7k=;
        b=L81VF2ugufHXq3Zh0XllPsHIpO55YkvQWtY6xXffwaPVb+6sy1HQqetSmj6u7tMjkK
         QB5H/Fw+5pLoSTP45kgOF0pZmVMD77Z2xglGRVSA1RSU/dUxEuwxEjaIL0otTkIIIHYH
         dbttGr7N5qyjLTvSI4gbKTlJAxQzaIE1KoxqMJgvT8UeKd/FrMQaj3hR3tYSvD7hAf1G
         i81uSDtVf4LFWXVXitw9t6X57MEBD+wTbBDUNZw4Od6uvXiKyGamuTauuXH58eCz3Zdw
         aAvR9EEZgFKkoQ7H98svfl5a+yNpxC9/mNo6xODLgKoImXsPnHFl29CZrRMKEnJOIJ+a
         VA7w==
X-Gm-Message-State: AOAM5338vsoTGYg2pbuecwFQ24KBelpxP2ilFz3dpdftVyDjRUUemCCF
	FaiKY/yg3/HMe34bcMCYw5XLS7CuYHqfcnhBcBk=
X-Google-Smtp-Source: ABdhPJzBzAjgc2qPVo8Tk9qMrfzDwAemaUzDFd1aV62AbhlCnrz4dxrU5/K4dyvucF2z3vzbo8yisI5hD5bUAfWQEm4=
X-Received: by 2002:a6b:d20d:: with SMTP id q13mr8812586iob.71.1611777093691;
 Wed, 27 Jan 2021 11:51:33 -0800 (PST)
MIME-Version: 1.0
References: <20210124095546.3329-1-tomasz.dziendzielski@gmail.com> <CA+chaQdyeDPFaitWi-42dZi-W=E0ss2_SeyvOjJ7EdmZisCwhA@mail.gmail.com>
In-Reply-To: <CA+chaQdyeDPFaitWi-42dZi-W=E0ss2_SeyvOjJ7EdmZisCwhA@mail.gmail.com>
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
Date: Wed, 27 Jan 2021 20:54:05 +0100
Message-ID: <CAJkqNs0HpwZoDtKh5hfv8UPMm4M-Che0Zb0f8YgXNar-u5Dihw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] insane: Add test for native/nativesdk inherit order
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000206db305b9e7192d"

--000000000000206db305b9e7192d
Content-Type: text/plain; charset="UTF-8"

>Would it make sense to show some shortened version of inherited_classes?
Yes, it wouldn't be a problem to continue the loop until native/nativesdk
recipe is found and then just print the classes that were found.

>Unfortunately INSANE_SKIP doesn't seem to work with native-last as well.
Is this expected?
It's not expected. I wrongly assumed there is some general mechanism
checking INSANE_SKIP. I will prepare a patch with the correct INSANE_SKIP
handling.

Best regards,
Tomasz Dziendzielski

--000000000000206db305b9e7192d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>&gt;Would it make sense to show some shortened versio=
n of inherited_classes?</div><div>Yes, it wouldn&#39;t be a problem to cont=
inue the loop until native/nativesdk recipe is found and then just print th=
e classes that were found.</div><div><br></div><div>&gt;Unfortunately INSAN=
E_SKIP doesn&#39;t seem to work with native-last as well. Is this expected?=
 <br></div><div>It&#39;s not expected. I wrongly assumed there is some gene=
ral mechanism checking INSANE_SKIP. I will prepare a patch with the correct=
 INSANE_SKIP handling.</div><div><br></div><div>Best regards,</div><div>Tom=
asz Dziendzielski<br></div><div><br></div></div>

--000000000000206db305b9e7192d--
