Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.35952.1607959535978794730
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 07:25:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=0JbpQqT5;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.181, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f181.google.com with SMTP id z20so12071503qtq.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 07:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TU23DZG5pGo1qY0MEL1yqtbi5TI83kphmho0YwzVuno=;
        b=0JbpQqT5m7sWIcbH2Ok63aIl9NAyJeqIH+2Y3wzNCkOlHb2ysjPA+8lExi10UhulyN
         nKPu6cG/WL/15tAKxJJqGBkGEo83jGzM6D4WWUWvMt9btbQKpfAJQdj7RardROOlN5uq
         5w41d0+3zOx++rdjO7nthzS+skwn9ff4ijNfu0bWMOmm0ILuZSrbhX+9/v+7nIIqg5KY
         LLXpR9fwPUVl25BKiecHVn7FOhNVIYEHst/idCxhnlFfIEOPQpr3dSY4uD3Zao2RW8MO
         uui2bz19zAkQVEavwClFUs6rkCMOI8RK+WVHVFE5JrUFX+tkNio0pTWrB769k/uJUzHW
         ACvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TU23DZG5pGo1qY0MEL1yqtbi5TI83kphmho0YwzVuno=;
        b=OPVJLZxflNQ4BPPfoKpAHEyg2ot7s3Xb5/XYpV2UN9mDkKruUPTzz2j7LIMbDpGkwS
         Nc6P1i3eeaUMVJ/xgw83DAXisw0J5w9c51xSfGStwJLVXPA840kACOdjiRMtVMNBIc7y
         eg/Y/Rd3akRlQXzCZ++mgfV0Wf8dA/K9rxPyM2XgbxAnJtJfhcSlF2PIB6rG/Nl2W6cZ
         6smmIhLoToKhAXdxZIzKqJez7ae8J9AbyRzRldnn97XIp+HMUuCSKV8Eeh3QP0jGTIrV
         /bHlJl0+YaHZyzN1aawiuzRPca0Bdctibu9vOQE7QML6fweGmlXrAEAZ2kakZdh2S8Fh
         cogw==
X-Gm-Message-State: AOAM533KkwbUlK1KZOqW0Hvca9yhAt/QIJaNkzHKMRJK/tIuf0KPJ24U
	3RF5cDZ8zIpiPv+ZoNj/ObboDWoaB6Xe/vnX
X-Google-Smtp-Source: ABdhPJx0z6g0J+Iv53S7bwvqAJ+kr5K/CCz9ZfAL/izHS/demyBtbh/Gy22qW53siI0Hv/p2+YXFiw==
X-Received: by 2002:ac8:5ccc:: with SMTP id s12mr31422097qta.309.1607959534799;
        Mon, 14 Dec 2020 07:25:34 -0800 (PST)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com. [209.85.219.44])
        by smtp.gmail.com with ESMTPSA id k7sm4217888qtg.65.2020.12.14.07.25.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Dec 2020 07:25:34 -0800 (PST)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qv1-f44.google.com with SMTP id d11so7950221qvo.11
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 07:25:34 -0800 (PST)
X-Received: by 2002:ad4:4761:: with SMTP id d1mr32469055qvx.12.1607959533741;
 Mon, 14 Dec 2020 07:25:33 -0800 (PST)
MIME-Version: 1.0
References: <CAP9ODKpXfVcDjtMwUvSRi68+-BHnK9nF6B-5wFX7nzW2wi2adQ@mail.gmail.com>
 <CAMKF1sqj0epXj_cFBniiEvYmfTgcVuCxaAfLh7_Y7oPZ==Tq1w@mail.gmail.com>
 <CAP9ODKoxVgDoMtys=aQdhteAZQ3bV7fbtLN8ZUuHehW2caLgSg@mail.gmail.com>
 <CAMKF1spBFaSKMXU77Rmx-usTw-mJN-dhbAb-=PKiFSFJ1-5hSg@mail.gmail.com>
 <CAP9ODKoPuatKkZYK0Zy-6wfPh--G7HD3bz_QDRmqDR-gRhiLnA@mail.gmail.com>
 <AM9PR09MB47393922BAC96879D84F9A8DA8C70@AM9PR09MB4739.eurprd09.prod.outlook.com>
 <CAP9ODKrCw15pXVTTqcZm3C12ZZR+i0bxKHC5UbdOQC8VvewNgQ@mail.gmail.com> <AM9PR09MB4739F7F2E5541EEA191395AAA8C70@AM9PR09MB4739.eurprd09.prod.outlook.com>
In-Reply-To: <AM9PR09MB4739F7F2E5541EEA191395AAA8C70@AM9PR09MB4739.eurprd09.prod.outlook.com>
Date: Mon, 14 Dec 2020 12:25:22 -0300
X-Gmail-Original-Message-ID: <CAP9ODKp6qxtK26vncP7dhxrtm2a92N8ug+UHaDswA0N03g1E7Q@mail.gmail.com>
Message-ID: <CAP9ODKp6qxtK26vncP7dhxrtm2a92N8ug+UHaDswA0N03g1E7Q@mail.gmail.com>
Subject: Re: [OE-core] Strange segfault on native Go binaries
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: "Purdie, Richard" <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Konrad,

Em seg., 14 de dez. de 2020 =C3=A0s 11:06, Konrad Weihmann
<kweihmann@outlook.com> escreveu:
> Had that at a bunch of my tools in meta-sca - as I couldn't rule out my
> own fault, I help myself with the static linking workaround
>
> On 14.12.20 15:03, Otavio Salvador wrote:
> >> As a partial workaround I disabled GO_DYNLINK for native - so I kind o=
f
> >> second the impression that relocation is buggy in here.
> >
> > Where you did it? I tried in the 'glide-native' case but it did not wor=
k out.

Adding:

# Disable dnylinking
GO_DYNLINK_class-native =3D "1"

"solves" it, indeed.

Richard and Khem, it seems to be related to Go itself. I'd like to
propose we add this to the class so  we workaround it for now until we
fix it properly.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
