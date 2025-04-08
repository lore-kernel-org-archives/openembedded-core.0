Return-Path: <alistair23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 496ABC3600C
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 04:04:07 +0000 (UTC)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
 by mx.groups.io with SMTP id smtpd.web11.66727.1744085037844983276
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 21:03:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DgdrHxL6;
 spf=pass (domain: gmail.com, ip: 209.85.221.174, mailfrom: alistair23@gmail.com)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-525b44b7720so2297451e0c.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 21:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744085037; x=1744689837; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tjh+FJcr0NxMsfWvCpOtaDL6mXxlaAl7px6mHjS9qho=;
        b=DgdrHxL6BogZwqvhvP70LzFsqpXV8++9kj+ivjCuc5elvNGXpf44gXAzRo6eJkrW8e
         XPxbpgKALyJUbxnn69b/7mNxYLrzrjVFxlC6maRjsENKlc0wUD/oBLIyqj4Tu2KU3Rf3
         XJLel8GzxBJxgqqKwXBBo5CGI818l6Ypf/QhfuzBacCO27IBWtjgDaBdQYTaed4Q8yVs
         JMDSKvJGkO3CRW7GJF4hDzbtK4YacELCZx3uHSPIT0ObENsK13Sns0JniZbBE8FGlT9S
         zMnjy9FFtJokFHasPs01s5XQmpxB/0GYIC1X3KpKBgX7CtMuucanCBoILesX0tOIRxAh
         Gjyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744085037; x=1744689837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tjh+FJcr0NxMsfWvCpOtaDL6mXxlaAl7px6mHjS9qho=;
        b=Pm7sAXeIzJuDR+NxQcU5yON0UbOsLce/vaDStSOQjNj7l8MZ5eHRoozLyZuUt8jMOT
         elmVCTjqM89368f+2tV16UHwNiYtmyta9mbG0U45t2e6iUTxaA6unWCh4HAXhjxDGFBt
         2FJrAtZ4LEPcE1+YVGRghcCoQB+ApEjdBnEGGBI6PFTa/DwgoZ89Emp8b586bPA+Rlew
         Nw7XFyxMGI1FaCDFNUj9F+i+pT+qJowDBTOJHxax0Imrvn3IHxxfq7jTyD1RT9zZuh8t
         9hSIrH/T32gSONnAf+R8ViF27ZR1hPzOnndiz00CK2R7ojKKz+EvQIUhbbN8iTk2Tvqn
         1qtg==
X-Gm-Message-State: AOJu0YxtV924tBW4YryE5gKjHMXly0SKaiLDirpnMLo8ukLEw1HZk5Bf
	NgW8tbsTKf/8dV+6Qb1LzCXzQV53iCATz6J1p/I+Fk1kbO5nt0/B+IY2I9KQKpaD9wcwuiXVuy3
	r3Z/Ghk8WqrXDnku3DTNti9kXbiU=
X-Gm-Gg: ASbGncv3WAeVaKPEaEv+vlW04iz83r9dCC40LflXlStcdv0EdxUskZ+p+rvDNuNTi4/
	9rCiRiYO0OqTWmfuVCv7tB7aqOGOKwA4GdGJRMwOuQC3bwFrzXIK+TEaw6dxWBUJEvVsUX1BwZD
	HxvujjP7ZkPZoZu6/coSvSAsGD/Dy6clFRvXsORpEXSppNXlrSPhQwU1S/
X-Google-Smtp-Source: AGHT+IE5XGwmSYO9gLyoK5Eayg3gTTDg4YzS45NAWkx/eEMh1US192oVhSUD0jFPEEzzkBbZUDnpyzEbbr8lQpCWNa0=
X-Received: by 2002:a05:6122:659c:b0:520:3987:ce0b with SMTP id
 71dfb90a1353d-5276443fba4mr11574144e0c.2.1744085036858; Mon, 07 Apr 2025
 21:03:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250408034829.4000367-1-alistair.francis@wdc.com> <CAMKF1so4BmMRgPzWBwfCfDV2_h50W=T2QoxOaWz5eFkMeJn_ug@mail.gmail.com>
In-Reply-To: <CAMKF1so4BmMRgPzWBwfCfDV2_h50W=T2QoxOaWz5eFkMeJn_ug@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 8 Apr 2025 14:03:30 +1000
X-Gm-Features: ATxdqUH3j3TykdbBtKgO5XFiBjgEdGIcIeW_SrX95XzTVfPwg8TiugoIZECV9T4
Message-ID: <CAKmqyKPeBmiDRu8ULhYRgXsjDELCoagDKUxp9dgxrh57T1ugRw@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH v2] ktls-utils: Initial commit
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 04:04:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214508

On Tue, Apr 8, 2025 at 1:54=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:
>
> Maybe send it to oe-devel mailing list

Urgh, sorry. I copied the wrong address

Alistair

>
> On Mon, Apr 7, 2025 at 8:48=E2=80=AFPM Alistair Francis via lists.openemb=
edded.org <alistair23=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> Package ktls-utils which includes tlsd.
>>
>> This is used when in-kernel TLS consumers need a mechanism to perform TL=
S
>> handshakes on a connected socket to negotiate TLS session parameters tha=
t
>> can then be programmed into the kernel's TLS record protocol engine.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>  .../ktls-utils/ktls-utils_0.11.bb               | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>  create mode 100644 meta-oe/recipes-kernel/ktls-utils/ktls-utils_0.11.bb
>>
>> diff --git a/meta-oe/recipes-kernel/ktls-utils/ktls-utils_0.11.bb b/meta=
-oe/recipes-kernel/ktls-utils/ktls-utils_0.11.bb
>> new file mode 100644
>> index 0000000000..e85dc4ac72
>> --- /dev/null
>> +++ b/meta-oe/recipes-kernel/ktls-utils/ktls-utils_0.11.bb
>> @@ -0,0 +1,17 @@
>> +SUMMARY =3D "TLS handshake utilities for in-kernel TLS consumers"
>> +DESCRIPTION =3D "In-kernel TLS consumers need a mechanism to perform TL=
S \
>> +handshakes on a connected socket to negotiate TLS session parameters th=
at \
>> +can then be programmed into the kernel's TLS record protocol engine."
>> +DEPENDS =3D "gnutls keyutils glib-2.0 libnl"
>> +RDEPENDS:${PN} +=3D " gnutls"
>> +LICENSE =3D "GPL-2.0-only"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd568123389d9a12625cca2b089b1=
728b"
>> +
>> +SRCREV =3D "5c3314b5728b272cbaf0d98f4d521cca9610b6bf"
>> +SRC_URI =3D "git://github.com/oracle/ktls-utils.git;nobranch=3D1;protoc=
ol=3Dhttps"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +inherit autotools pkgconfig systemd
>> +
>> +PACKAGECONFIG[systemd] =3D "--with-systemd,,systemd"
>> --
>> 2.49.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#214506): https://lists.openembedded.org/g/openembedd=
ed-core/message/214506
>> Mute This Topic: https://lists.openembedded.org/mt/112147336/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [r=
aj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

