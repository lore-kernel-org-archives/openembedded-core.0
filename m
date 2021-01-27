Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web11.15121.1611783421772341277
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 13:37:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZfG11L+W;
 spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id y19so3460367iov.2
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Jan 2021 13:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9sPjuIylY+OAVayecal3aYymgQxaKH/IotBvywI81y8=;
        b=ZfG11L+WeTte1O9aK3q27CdDncy7zGlgeWnzA6qBYN5IXtSKPBUtRJVvrgTwtRRlmK
         24ynzaekt5B0wprXsImJkS0zTWI80Yx4x84JG6GCDox2R3GU/0c9q2G5F2/HHZhWF6mV
         Ctdj+an7cGC1cw8gRoKtjRHWJjVxbtHTrXEXO3/hlDm4rRN8JaADMNua2Se5b6ra8Xwt
         iGvam1y6t4RYOhoHFVdASAKVHd2vFUuxJKDm0CHnyZue6hOV/GIuQ3LohsYcno+k3/dI
         ikzEA32OvmGp22uWZ+lgb/YFKpN9Yqcfw7U2Z2tHGJoFLr23g7mv2SWueFJw3Jhic5a8
         vFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9sPjuIylY+OAVayecal3aYymgQxaKH/IotBvywI81y8=;
        b=jtjhKJ9ozEj9MCbmkfobYdCWbOrFrTntIz09p4GyKbDwnNzncf7/vEHpX+s0ccJE0O
         yrI8yjwScwXu/y5aXYyFM5rb4dDSw/6bLBJo3gLUnL5yUaObdq4HBVLJIBatjyLn5oG4
         f+WMmj3Tzt80yUmKi2KJaRDFz/4rsYNP3C8EIKdPw8LFlRlQQJD/134oaiI7qKvLRDjg
         IcjnpGt6ritInr6PhefRLJbzkeFIaV1xJK0qxsoIKF7Z9s/dAj2uYzIGp/RpFZtGqkny
         BPLdgXk/u4qlu0KRgbK6YPZw7kgkaQhyYwpwCoPMK4JtHXCDZ3beY9BNiJ4NA5/zfvsG
         kcAQ==
X-Gm-Message-State: AOAM532pWoD+we1ip2rhX7Rd/1ugeXIizhxVtosX5rbVstXK+96Grr2/
	TDcg1+2yQ/zjBtQ83AGMPL1UO8I6rwqR/dW6XMU=
X-Google-Smtp-Source: ABdhPJwmDI4qWOWEQpNb6bjvXaQh1qcqwROqgkz0PM2j5HEfEYezHq1alWaGVmw6q/YWaMxFHkMFfQkxMuX6eVhZKvo=
X-Received: by 2002:a02:634b:: with SMTP id j72mr10551361jac.106.1611783421131;
 Wed, 27 Jan 2021 13:37:01 -0800 (PST)
MIME-Version: 1.0
References: <20210124095546.3329-1-tomasz.dziendzielski@gmail.com>
 <CA+chaQdyeDPFaitWi-42dZi-W=E0ss2_SeyvOjJ7EdmZisCwhA@mail.gmail.com> <165E2EBA5493813B.12137@lists.openembedded.org>
In-Reply-To: <165E2EBA5493813B.12137@lists.openembedded.org>
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
Date: Wed, 27 Jan 2021 22:36:49 +0100
Message-ID: <CAJkqNs1aXao9hJ-iCRNS58zfEy1nzXJejPuoodKWUnK4ujyqzg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] insane: Add test for native/nativesdk inherit order
To: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004582d305b9e89227"

--0000000000004582d305b9e89227
Content-Type: text/plain; charset="UTF-8"

Hello Martin,
I have just submitted patches with fix for missing INSANE_SKIP and printing
shortlist of classes inherited after native/nativesdk.
Please check:

https://lists.openembedded.org/g/openembedded-core/message/147370

https://lists.openembedded.org/g/openembedded-core/message/147371

Sorry for inconvenience.

Best regards,
Tomasz Dziendzielski

--0000000000004582d305b9e89227
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hello Martin,</div><div dir=3D"auto">I have just sub=
mitted patches with fix for missing INSANE_SKIP and printing shortlist of c=
lasses inherited after native/nativesdk.</div><div dir=3D"auto">Please chec=
k:</div><div dir=3D"auto"><br></div><div dir=3D"auto"><a href=3D"https://li=
sts.openembedded.org/g/openembedded-core/message/147370">https://lists.open=
embedded.org/g/openembedded-core/message/147370</a><br><br><a href=3D"https=
://lists.openembedded.org/g/openembedded-core/message/147371">https://lists=
.openembedded.org/g/openembedded-core/message/147371</a></div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">Sorry for inconvenience.</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Best regards,</div><div dir=3D"auto">Toma=
sz Dziendzielski</div></div>

--0000000000004582d305b9e89227--
