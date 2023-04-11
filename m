Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2143C77B6F
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 16:42:02 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.19450.1681231319270715659
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Apr 2023 09:41:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TBtngdbN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id e22so8134285wra.6
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 09:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1681231317;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wqpNmZtr8efeo9aL9J2VxmxHRrhCIW6/TS3fTiC2DMc=;
        b=TBtngdbNeXxsCFGIYlPBPAbs+8CQOQ8qJp0yMXwZO7q54H+oUK+NZLSUbFwpCNmqYe
         UeGlJCWc607gOKubg13dDmgiCSnG9Qgn15E5pLFAbZ0y2bBSoY9hbfLhIXxm5CjfkScO
         7/GAEyx9e22rHLqyr68esmWXEx9tKigcjoOyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681231317;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wqpNmZtr8efeo9aL9J2VxmxHRrhCIW6/TS3fTiC2DMc=;
        b=3j6yFuisaNzWHFlyhHuXiA9k3kS8nP+QeFR0OBrk4VCLqw4/wwusfZVD9Nw4sbRBNc
         hkAqe7eGsOQc2RaoXaMKBYW9rMZ82Ds9eHQVWmBW9X9Fqpp7lvpMB9GwcBRhlLTZs/KU
         gmrnBmzYHANNXRAz6p7YH8iH3ZucSUXGeksLTY3gQBkj5eI66D0ym2o1NYQG5yKOPW3U
         ldDjm6kALyLC49cy6YYF6iIAn1Ck1PD5DLJadbaxXRd6GiGYo0vPjlM3SnAtAUehvjOa
         c6MhNrCsY5YiGVpEu2xcCeS5Tmml2g/Wqg8yRgRmQecdkplAx8PJQt0zbAAM8F9Oy2Ko
         WlRA==
X-Gm-Message-State: AAQBX9cfZnnP8SNOIl+uhIEBv/67hU0fvDoo3BXUz/tAS8hPTfdJjgOW
	e4/exraPvMOHJXw8ZNx6LyBVjA==
X-Google-Smtp-Source: AKy350ZtNLLI70fgDx10+sYYGS4CnxekSUaSjbJ/p1p215pzdwPHLNmDpV8qgfulSuwfyWyA4p0SfA==
X-Received: by 2002:adf:f5cd:0:b0:2f2:5408:f15b with SMTP id k13-20020adff5cd000000b002f25408f15bmr4662642wrp.26.1681231317654;
        Tue, 11 Apr 2023 09:41:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d973:4e5f:b43e:78a5? ([2001:8b0:aba:5f3c:d973:4e5f:b43e:78a5])
        by smtp.gmail.com with ESMTPSA id i5-20020adff305000000b002efb4dc5a5fsm11142640wro.7.2023.04.11.09.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 09:41:57 -0700 (PDT)
Message-ID: <21660e0a3de594390aca712d5fc204b14a83f489.camel@linuxfoundation.org>
Subject: Re: [OE-core] Reproducible build
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Fr=E9d=E9ric?= Martinsons <frederic.martinsons@gmail.com>
Cc: Jose Quaresma <quaresma.jose@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 11 Apr 2023 17:41:56 +0100
In-Reply-To: <CA+cAkerdCUTNQFcMnAVrR6ZOFZUjTPUZcFWSGU+SsCJm+aQqZg@mail.gmail.com>
References: <1753B0402875C548.11304@lists.openembedded.org>
	 <CA+cAkerWUvabx_kzN2s6S64454t88ifOR+nqtaLwk0wHfw3n2Q@mail.gmail.com>
	 <6381549a7f058cb233c656dca9324ae4d7a435c2.camel@linuxfoundation.org>
	 <CA+cAkerd92jAqwA1iDrNOV+W1mK5Tb39yvT_Dp-t18=LCNm09w@mail.gmail.com>
	 <CANPvuRkfQuVdP-WJw58UOK9WVhy95UgujST4k6unnUvYQ7FySA@mail.gmail.com>
	 <1754A030DDACF987.21832@lists.openembedded.org>
	 <CA+cAkerdCUTNQFcMnAVrR6ZOFZUjTPUZcFWSGU+SsCJm+aQqZg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 16:42:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179934

On Tue, 2023-04-11 at 17:27 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote:
> Hello with the patch below:
>=20
> --- a/meta/lib/oeqa/selftest/cases/reproducible.py
> +++ b/meta/lib/oeqa/selftest/cases/reproducible.py
> @@ -134,9 +134,9 @@ class ReproducibleTests(OESelftestTestCase):
> =C2=A0 =C2=A0 =C2=A0max_report_size =3D 250 * 1024 * 1024
> =C2=A0
> =C2=A0 =C2=A0 =C2=A0# targets are the things we want to test the reproduc=
ibility of
> - =C2=A0 =C2=A0targets =3D ['core-image-minimal', 'core-image-sato', 'cor=
e-image-
> full-cmdline', 'core-image-weston', 'world']
> + =C2=A0 =C2=A0targets =3D ['zvariant']
> =C2=A0 =C2=A0 =C2=A0# sstate targets are things to pull from sstate to po=
tentially
> cut build/debugging time
> - =C2=A0 =C2=A0sstate_targets =3D []
> + =C2=A0 =C2=A0sstate_targets =3D ['rust-native', 'cargo-native']
> =C2=A0 =C2=A0 =C2=A0save_results =3D False
> =C2=A0 =C2=A0 =C2=A0if 'OEQA_DEBUGGING_SAVED_OUTPUT' in os.environ:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0save_results =3D os.environ['OEQA_DEBUG=
GING_SAVED_OUTPUT']
>=20
> I managed=C2=A0to reduce the time to test to 30mn (which is reasonable).
> Today, I made 5 run of this
> reproducibility test and if library is indeed different between build
> A and build B every time, this
> is the same exact difference, that is to day that the 5 libraries in
> build A are identical and so are
> the 5 libraries in build B.
>=20
> I admit I'm surprised=C2=A0, I would have=C2=A0waited for some random dif=
f.
> I'll continue my investigation but if this rang a bell to someone
> here, feel free to tell (this does
> seem strange to me).

It likely means it is the path the build is made in that is being
encoded into the build somehow. The same binary is resulting for a
given build path?

Cheers,

Richard

