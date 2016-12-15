Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 736AB772AA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 09:51:06 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id n21so50393362qka.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 01:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AoZMW8RCzSekXDQK/0fUVKzCdJQoOMVuKDKFQi8MG60=;
	b=APh2xI52bEubnptMJNJVaGXSklCDkCyRlXJyjegHQEbN2Z06EoW33L7T3LAgAkk3MS
	B1Xiqmzf0B9AeLHT67MHvv4YM+MAeXf3SktSq8J/JRpMk9xlYmvlbhnPi+G1hPUIxb1v
	gbT8kz4Zuj+yb6wAuEjWkDUGua4uDvjkztn55HBa4oVedWShXUoTJIyTuRTeUcpN452d
	+NINv8h04N/40yRFayrcX+n5lv6sujZOIXOjo5vTzxhGDEiNFvoZ14/MfivH0l4VaF9k
	RmTlNRgvDameOL7WZFoE4gmMR3huBuUedHnG7Y5OEIC9dE8CHkhIlYD7nGcjPrKZgQbf
	NKzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AoZMW8RCzSekXDQK/0fUVKzCdJQoOMVuKDKFQi8MG60=;
	b=BkQ4zgTi1lX+mWsB0sgdzKML2zzzLmSe3vcq1RjqxJMdan+k8djmcVWPzy1cvBmW7s
	bQgrEZ7Pil4wbdR3NvyQ1jXc73BbL0/YBUA80DoDlhlst9e6I+hNUXBs3g1vt59bWHI5
	auiBNhvbme5XQKMV6orNHK/f+pEItdH/EJY20uUDio7I458qhqOnXzN1cLWcZo9fQ3Tp
	7AvZkwlWEDN+qCEuEoneoZZqXv6FeKmOdCURxvINr2bfUYTQ6pSVxzrsBAwUgIAQsUou
	UET6rpxRlH3DtJ03A4ZLO7A7ZG/dbrFTYYhYpPTVP/coEpFnXfxRTCDlNBGIl2Pnt+Ln
	cFbw==
X-Gm-Message-State: AIkVDXIiDZ2JSi7OKyxDA6PxKu2j90J+C8+hrKcUZEpxp9ukcMwhn+vPnw9Z7GAcsWeSvXIx7wnmQlN7/ra/nWcf
X-Received: by 10.55.31.157 with SMTP id n29mr299317qkh.221.1481795468362;
	Thu, 15 Dec 2016 01:51:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Thu, 15 Dec 2016 01:50:48 -0800 (PST)
In-Reply-To: <1481793382-34767-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1481793382-34767-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Dec 2016 09:50:48 +0000
Message-ID: <CAJTo0LbBroCR=TCeVwmOZfFGnhdEZf7BFzhhz4j39hcNLf4WAg@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdb 7.11.1 -> 7.12
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Dec 2016 09:51:07 -0000
Content-Type: multipart/alternative; boundary=001a1147f228859de10543af64cd

--001a1147f228859de10543af64cd
Content-Type: text/plain; charset=UTF-8

On 15 December 2016 at 09:16, Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
wrote:

> 1) Upgrade gdb from 7.11.1 to 7.12
> 2) Delete 11 patches below, since they are integrated upstream.
>     0001-include-sys-types.h-for-mode_t.patch
>     0002-make-man-install-relative-to-DESTDIR.patch
>     0003-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
>     0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
>     0005-Add-support-for-Renesas-SH-sh4-architecture.patch
>     0006-Dont-disable-libreadline.a-when-using-disable-static.patch
>     0007-use-asm-sgidefs.h.patch
>     0008-Use-exorted-definitions-of-SIGRTMIN.patch
>     0009-Change-order-of-CFLAGS.patch
>     0010-resolve-restrict-keyword-conflict.patch
>     0011-avx_mpx.patch
>

NOTE: preferred version 7.11% of gdb not available (for item gdb)
NOTE: versions of gdb available: 7.12

This would be because the preferred version is locked in oe-core:

meta/conf/distro/include/tcmode-default.inc:GDBVERSION ?= "7.11%"

Please also update that reference.

Ross

--001a1147f228859de10543af64cd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 December 2016 at 09:16, Zheng Ruoqin <span dir=3D"ltr">&lt;<a href=3D=
"mailto:zhengrq.fnst@cn.fujitsu.com" target=3D"_blank">zhengrq.fnst@cn.fuji=
tsu.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,2=
04,204);border-left-style:solid;padding-left:1ex"><div id=3D"gmail-:8ax" cl=
ass=3D"gmail-a3s gmail-aXjCH gmail-m15901c6e8df9ae86">1) Upgrade <span clas=
s=3D"gmail-il">gdb</span> from 7.11.1 to 7.12<br>
2) Delete 11 patches below, since they are integrated upstream.<br>
=C2=A0 =C2=A0 0001-include-sys-types.h-for-<wbr>mode_t.patch<br>
=C2=A0 =C2=A0 0002-make-man-install-<wbr>relative-to-DESTDIR.patch<br>
=C2=A0 =C2=A0 0003-mips-linux-nat-Define-_<wbr>ABIO32-if-not-defined.patch<=
br>
=C2=A0 =C2=A0 0004-ppc-ptrace-Define-pt_<wbr>regs-uapi_pt_regs-on-GLIBC-<wb=
r>syst.patch<br>
=C2=A0 =C2=A0 0005-Add-support-for-Renesas-<wbr>SH-sh4-architecture.patch<b=
r>
=C2=A0 =C2=A0 0006-Dont-disable-libreadline.<wbr>a-when-using-disable-stati=
c.<wbr>patch<br>
=C2=A0 =C2=A0 0007-use-asm-sgidefs.h.patch<br>
=C2=A0 =C2=A0 0008-Use-exorted-definitions-<wbr>of-SIGRTMIN.patch<br>
=C2=A0 =C2=A0 0009-Change-order-of-CFLAGS.<wbr>patch<br>
=C2=A0 =C2=A0 0010-resolve-restrict-keyword-<wbr>conflict.patch<br>
=C2=A0 =C2=A0 0011-avx_mpx.patch</div></blockquote></div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">NOTE: preferred version 7.11%=
 of gdb not available (for item gdb)</div><div class=3D"gmail_extra">NOTE: =
versions of gdb available: 7.12</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">This would be because the preferred version is lo=
cked in oe-core:</div><div class=3D"gmail_extra"><br></div>meta/conf/distro=
/include/tcmode-default.inc:GDBVERSION ?=3D &quot;7.11%&quot;<br></div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Please also upd=
ate that reference.</div><div class=3D"gmail_extra"><br></div><div class=3D=
"gmail_extra">Ross</div></div>

--001a1147f228859de10543af64cd--
