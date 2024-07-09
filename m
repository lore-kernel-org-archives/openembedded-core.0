Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCDA9C2BD09
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 15:45:21 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.1499.1720539916831971935
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 08:45:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S/phUZpl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52ea79e6979so4670146e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 08:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720539915; x=1721144715; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fj8Pv5o6j5KPq5/u3ClgyBFy43TMLCAlmgdxrLjPyC0=;
        b=S/phUZplygkuW9mjITaV17AUGpm9tvkhzYXlN6Ec/lZAKkDx2id2LcJjwsn69evLFb
         kv/7nwBYROZZgRBHOllVw+wKIDd1zAwY4trFziRx0eR3qUCDKxsVZoYS8AYluKgqlS8C
         BUnSgFVGuasU0R1hPcDobkX/9gkp10E3tNuns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720539915; x=1721144715;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fj8Pv5o6j5KPq5/u3ClgyBFy43TMLCAlmgdxrLjPyC0=;
        b=Qmcre4fO5IN7E8FIPw+emSD2lPV5coH+jCQkoL8UOLcm19d24W8W4yuMFJ4InnBXqf
         C36RgOG63OvLQvbXqSszHRxwuVtQUlw7tttFWJqkCSqLNqDgJPtlAJdAKGuLhjGavm0Y
         rHU8nwhClNrsgBrR1bZba69DVdUgf2iBYolMzTArQXoxaEq/1TAz/RK9hMcSRLEP+lS1
         Ko4Dn78MdW5MT4iAeD0tAB/uMwpPNjfpL0/dSXEaygxXxxPXPbEVwcOZRAUwPbwf0/5p
         QtVd8KwNvzumt8ysFWHSxMu8MyfNcALTc1e8GQ0TE4mP3wIgRNETAReU70ax/cj4cgwL
         a36Q==
X-Forwarded-Encrypted: i=1; AJvYcCWnTMXKmEHa//TOHE1OEsOlMTrU7rs4ge1+WMQFTLLKaJZ4/9lWngDsDzAZz33IM1DKvIt+EVMefv0hx6vbZgUFJnDtXl+EOeKLjV2SnsZZ/KRTfdKudm1e
X-Gm-Message-State: AOJu0YzRl4fm1xohbBXi/wTCouCc56hPaQG1UbChPL5SJvXgzvX9aPsO
	CjHa9aSHkcNyTxksmEnqNkgWIdqX2QiK9rtNyA0xHa/ukXdp/JABEX9sQvhQWMI=
X-Google-Smtp-Source: AGHT+IHykKPN+wGygTL0y+Tq7yk5ZAyRujrgqGsWRy8E3CVN2AsKe2ov9atuROBhrvuFP1/tpyjd/w==
X-Received: by 2002:ac2:47e4:0:b0:52c:a8c4:4d99 with SMTP id 2adb3069b0e04-52eb99da430mr1551335e87.68.1720539913806;
        Tue, 09 Jul 2024 08:45:13 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:eb12:75be:8387:683a? ([2001:8b0:aba:5f3c:eb12:75be:8387:683a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f74159csm45437065e9.42.2024.07.09.08.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 08:45:13 -0700 (PDT)
Message-ID: <b0d285aee1277900e781f6290d304abb6a29300d.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 1/4] systemd: upgrade from 255.6 to 256
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Qi.Chen@windriver.com, openembedded-core@lists.openembedded.org
Date: Tue, 09 Jul 2024 16:45:12 +0100
In-Reply-To: <20240704082444.3886275-1-Qi.Chen@windriver.com>
References: <20240704082444.3886275-1-Qi.Chen@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 15:45:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201666

On Thu, 2024-07-04 at 01:24 -0700, Chen Qi via lists.openembedded.org wrote=
:
> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> The 'cgroupv2' PACKAGECONFIG is dropped as systemd now only supports
> cgroupv2.
>=20
> mime is now inherited because ${datadir}/mime/packages/io.systemd.xml
> is a mime type file.
>=20
> For musl specific patches, most are refreshed. One old patch is dropped,
> and three new ones are added.
> Newly added:
> =C2=A0 build-path.c: avoid boot time segfault for musl
> =C2=A0 adjust header inclusion order to avoid redeclaration
> =C2=A0 undef stdin for references using stdin as a struct member
> =C2=A0 include signal.h to avoid the 'undeclared' error
> Dropped:
> =C2=A0 src/basic/missing.h: check for missing strndupa
> =C2=A0 (drop reason: systemd does not use strndupa any more)
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>

This is causing parselog failures in testing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/6293/ste=
ps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/6345
https://autobuilder.yoctoproject.org/typhoon/#/builders/109/builds/8042

Cheers,

Richard



