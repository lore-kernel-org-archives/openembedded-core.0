Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com [209.85.217.68])
 by mx.groups.io with SMTP id smtpd.web12.995.1594420926901562421
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 15:42:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hdHUQHWk;
 spf=pass (domain: gmail.com, ip: 209.85.217.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f68.google.com with SMTP id q15so3812470vso.9
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2020 15:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rtVY8S/p5Dlm9OGnAfn7sccqbcsFpUmraiQXVW71fEA=;
        b=hdHUQHWkmMR/82cpqmv6d514bgCukaLCkWmVOuHAHHxsSIxHYoR3GC7Wjok3qZciF7
         s6bWSEX5OAMqmjpALmpYrjzgU1xHMV0qXnjFQTeeIqrO+oiMuIi4WgfoFhDbilAcDrco
         XMGN74AxOGzD+mTmQ23lyHY7OGspoN6Gs9oXAoLFVhbmWu27RsZ4P1qliaAVvM9YfXdI
         z6mctcSoLxUFoPJFd5BWSlGjVu3dFy3tvZHITrcaAlGbK3MOKySkdE8+2+cYCFF92Lrp
         FPCsUrGkAykq5HjSKk274tVnKtwzTYQDy/5GEfHMTRmGwG+i6l0JO7a7QXY4ztSAUsKj
         JDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rtVY8S/p5Dlm9OGnAfn7sccqbcsFpUmraiQXVW71fEA=;
        b=g2MRk2FCGFpEPCDv250i4FJxVWTTYNt7QhReL7rPmeOZbdL0LCW956BU0mKEOGIeFU
         MqUBFE4G4p7c/aNWdMxaAz6PnQfwbLSt3clrCIChFJDp7WAL6H83UW62hwoEPrADwArd
         z70khpLzw214DSwDlZuJFUX9sM+Uge1wkHPesaW/mcKXfx/x4X2Fz+HFsuWdGecw8U/l
         pEuQYRsKbgHlhN3SyjE6bkhwDnlApzotZm9SzidmpWiea0DVgqRG42xVwKDyNmnxl8WR
         9X/tZlrSLMDPm1Bl3QWJFT9Ir6K6mU5DDKSDM6yzy4fOZbsN25xOGApQxW+QxIR3h3wa
         XNzw==
X-Gm-Message-State: AOAM531ZIpbLVcKhq5rO0IgEZvq12JcielcZCPnmCbyKWB+QIaLpkHNs
	k3s5GvmyJ7Y4T4vjvaANUrR+qF7a3+SGfy0c4FI=
X-Google-Smtp-Source: ABdhPJw2odNPB8lq1FnS8i5/kK/ZhbN96e0s+B5/FYdedCiuWGd/HFIhONPQyAdTFTvBEQTuntLub4WBiwCuIQWUF9s=
X-Received: by 2002:a67:87cc:: with SMTP id j195mr37085663vsd.25.1594420926042;
 Fri, 10 Jul 2020 15:42:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200710190810.1967868-1-takondra@cisco.com> <CANNYZj9sJAaPdPQ2yPkN5iPBiUA9jNQ4qLSvbhxGGXja2oTR-A@mail.gmail.com>
 <328b3757b8071e7c08776c0d6dd3a6ef8d52b089.camel@cisco.com>
In-Reply-To: <328b3757b8071e7c08776c0d6dd3a6ef8d52b089.camel@cisco.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 11 Jul 2020 00:41:54 +0200
Message-ID: <CANNYZj9XjuiYJH_259nxkQRupbVpMeOO81yLkkH=ugF+Bu--SQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] devtool: remove _PYTHON_SYSCONFIGDATA_NAME to fix do_unpack
To: "Taras Kondratiuk (takondra)" <takondra@cisco.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Martin.Jansa@gmail.com" <Martin.Jansa@gmail.com>, 
	"xe-linux-external(mailer list)" <xe-linux-external@cisco.com>
Content-Type: multipart/alternative; boundary="000000000000eb550505aa1e0cd1"

--000000000000eb550505aa1e0cd1
Content-Type: text/plain; charset="UTF-8"

On Sat, 11 Jul 2020 at 00:03, Taras Kondratiuk (takondra) <
takondra@cisco.com> wrote:

>
> The only replaced parameters seems to be replaced with wrong values. Also
> FIXMESTAGINGDIRHOST will point to recipe-sysroot-native which is not
> target-specific. What am I missing?
>

You are comparing with _sysconfigdata from native sysroot. You need to take
_sysconfigdata from target sysroot, and then you will see quite a few
arch-specific differences.

Alex

--000000000000eb550505aa1e0cd1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, 11 Jul 2020 at 00:03, Taras Kondr=
atiuk (takondra) &lt;<a href=3D"mailto:takondra@cisco.com">takondra@cisco.c=
om</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><br>
The only replaced parameters seems to be replaced with wrong values. Also<b=
r>
FIXMESTAGINGDIRHOST will point to recipe-sysroot-native which is not<br>
target-specific. What am I missing?<br></blockquote><div><br></div><div>You=
 are comparing with _sysconfigdata from native sysroot. You need to take _s=
ysconfigdata from target sysroot, and then you will see quite a few arch-sp=
ecific differences.</div><div><br></div><div>Alex<br></div></div></div>

--000000000000eb550505aa1e0cd1--
