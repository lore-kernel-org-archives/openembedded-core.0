Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46272.1793202691526484385
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 08:51:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=SXiMu+r6;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93e7ad9f78dso122228785a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 08:51:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793202690; cv=none;
        d=google.com; s=arc-20260327;
        b=RqZTzZqmHCxbIvBGHpwZgkuvz9qDMx9hvb5YjYZr2nK0P8Ck2kO2hi+SDS+zgeJnyZ
         XxQDssUFy7ZQeGS4pi4cX+Ra81Y1MgamH3ZGlrMM0QYvyRxLsKw69teZoZ+4vKO5IRPU
         MmzvSxcx9VDpL/QPRdkL9oyXLiynLAFQ5MEwjYMDX9gJVGFJW0fnx2CA27+jzdcfdvOL
         xceId6H9N6bFECak2k51hbJ5jqk+YLU1h0b+ubgmrPFdnMk4836PfPHPE3qlNQ1NM/BC
         LsBC9gYyqDYyuTgP95Dw32/Bi2feWRgDwW+cGRCo1DgRvVMZ9Eb9PK6ETtVbPNIfEeD2
         cU0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oPdpld6aeTySpzjEVSxV+/eTdy9VZt+ctLpDyUEGEDk=;
        fh=kXQKoFDc2UfLr/5XYlumfhCfkQX6ogDnuU444IyqtoY=;
        b=eshFWqcXjJzuW0O7w0t6bMjeXeWAGaqJo5c7rhnsfc7XgLrJefVb/0vUxHN+GAEMnr
         TS2PevsH5LdsqTA1gdVGjeLrRwVc4Mu7U4po4IrKL8lwoeHshF+UjMU24wGfezE5mGfx
         dUOtJNvWv7nH6AdVl5ulw2wRb+DokR8c3AWw7WpO1Vh3vlh+2YIKu+NYx8oMGuCoE6sK
         45Iim1tKiXOkh9pMC6fnKd12VEI4FTzmgmfX4WZtG+Ncko/lykUmFbgUM3j8Z1QjxOng
         9D0AiusgrmeFDb/T5NoqrPo9e2g24GU24N7UuFRKoMKLNv+lXxhZhA/RoChS4F55eweD
         Wr1A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202690; x=1793807490; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oPdpld6aeTySpzjEVSxV+/eTdy9VZt+ctLpDyUEGEDk=;
        b=SXiMu+r66aMhuVZMMBInTOhMhWU09TzTr+bEhCF7UZWq0gqNVcaqlvJbP4Q0XWV/rH
         3zMFuACtbbWq2jFK9lEEZJO5pTCn4zhbETM+6/mJoSDVex2pAmq+2aErU9s6TpW/6jxg
         6CI2bxlxAiOzKbbGSxZ9unpwGXQFgtGC2eIC9wiLycG618v/pfB8LClWH3gpvL+petlg
         iln2eQGl8qieqr4uxiP2mJ639neUoHQMCY5VhCzC/qnOlalhYTfSay9KpYGYV5BQDkFW
         y8ZNLzDKwJXPrvKNit1sSv9B6XKgyksRyYZ+Gct/mt7P2U30qDW8Z+wVKF+MvHrhSYme
         NtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202690; x=1793807490;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oPdpld6aeTySpzjEVSxV+/eTdy9VZt+ctLpDyUEGEDk=;
        b=oM5Jh6Sd6W+KarzN9hBj3vHfo21abL7x1JyhZc/xvo20XMBnr2aGLqUFy0//s4CaxE
         B0EGfHw55+jNTqpB0q99YmvkFq1oIzuVS1rl6vmxTP95xKzCPAhNgjgIGPVibocB2Q/4
         ZsX/leCeOMz+ppf4xtvaWt7IyBzoJoPDfPsgmViZ7b5NquqqoKz9bbQfg8EUAsX6NJm6
         LWtJfmEh3VIUs/6En4YvuaLWobpcJTrEd9Fj9YZ2exiA/3xaNiSOnCaIbtc/ggdHOxw6
         REqUlNxet2pFEuYPiixiOx5VdGthTDX1DJlRPphskilH1M65VMSjiDHhZaErFICf+poh
         XT9g==
X-Gm-Message-State: AFq9FYIBPJ8jgDK8DRBywIVYu/qJaam6/XbOXRwcHQhOQYRv0BmeAxNg
	opCshF04H8zhmtClJ+OCc7VOy407u8/MB+4wjssKoNGLE5AovWU+J0xDLUY2w+6JyXv56qFZMpJ
	ZIbESZSmQDlYx1lNPnEecrgbjiKzAkzA=
X-Gm-Gg: AYBFou3L/KylcZi9PYisxsoqFYE5OpDxma6D8peFHNEyoYQ/v2pQRP003WI1CxLiYu5
	8A9UtE3oltJVbqDaTwSSH12wnLjW+ygh1MeJjNeL9QRUQSfD/8+CrNvcufpHiDi07Bn+6OrerzR
	BD6NDuswNfWNMg916JANPt4CGLsKQKOQ+3mEd/eeCdnbjP0u7LhZxfEvhbr8ia+J1CIecGXaFAP
	GUQj9Lpa+srC+eLUpdXKSlbFqgHsyc+4BEW+/DcFNpbV5o/c4EdM2+XLVbmEMffDNyOgBjDI3Ji
	0qIlgw5r3CzIRrBqNf3PqovLuwcqIV6pEFjQ6JZTaCaZmpwdaMsV3FnsJv2lc2FWMuQP9zh2+10
	NCue3bIoplXqkBr4l/Kxaxwa0bnfXM/p2u5rk0Zl6Gf4R21woXWizhVOEpgvUtrJA1In5yw8=
X-Received: by 2002:a05:620a:4515:b0:93e:6620:bde7 with SMTP id
 af79cd13be357-94408cf3ed5mr408371985a.20.1793202690398; Wed, 28 Oct 2026
 08:51:30 -0700 (PDT)
MIME-Version: 1.0
References: <20261028093240.345039-1-ayoub.zaki@embetrix.com> <8ed9b8e9-f82b-4275-9284-327b3b0aefae@embetrix.com>
In-Reply-To: <8ed9b8e9-f82b-4275-9284-327b3b0aefae@embetrix.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 28 Oct 2026 16:51:19 +0100
X-Gm-Features: AclHuK9ex1i0qqlG0Ha9mJ-oUX9ttLaabmkmuonacI7MFJaBIXIlEgyDknewBj0
Message-ID: <CANNYZj8gXd1RZNs6g_kitWz2Z+pspQwTcKEn0vFL3SavxqJsfg@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH v2] pkcs11-provider: import version 1.3.0
 from meta-oe
To: ayoub.zaki@embetrix.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005f1f58065ee8895d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 15:51:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248821

--0000000000005f1f58065ee8895d
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Oct 2026 at 16:05, Ayoub Zaki via lists.openembedded.org
<ayoub.zaki=embetrix.com@lists.openembedded.org> wrote:

> The integration report this error:
>
>
>
> https://bodnuti.dev/reports/openembedded-core/20261028093240.345039-1-ayoub.zaki@embetrix.com/
>
> Is this a known limitation of the checker when introducing a new recipe
> or is there something I should consider?
>
> What is the recommended way to handle this?
>

The oelint checker is not a part of the yocto or openembedded projects, and
its output is not considered when reviewing patches. You need to take this
to oelint maintainers or support channels.

Alex

--0000000000005f1f58065ee8895d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, 28 Oct 2026 at 16:05, Ayoub Zaki via =
<a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;ay=
oub.zaki=3D<a href=3D"mailto:embetrix.com@lists.openembedded.org">embetrix.=
com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">The integration report this error:<br>
<br>
<br>
<a href=3D"https://bodnuti.dev/reports/openembedded-core/20261028093240.345=
039-1-ayoub.zaki@embetrix.com/" rel=3D"noreferrer" target=3D"_blank">https:=
//bodnuti.dev/reports/openembedded-core/20261028093240.345039-1-ayoub.zaki@=
embetrix.com/</a><br>
<br>
Is this a known limitation of the checker when introducing a new recipe <br=
>
or is there something I should consider?<br>
<br>
What is the recommended way to handle this?<br></blockquote><div><br></div>=
<div>The oelint checker is not a part of the yocto or openembedded projects=
, and its output is not considered when reviewing patches. You need to take=
 this to oelint maintainers or support channels.</div><div><br></div><div>A=
lex</div></div></div>

--0000000000005f1f58065ee8895d--
