Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3382.1795170982568788168
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 02:36:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=tGBVqmuC;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91c847584b8so7776506d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 02:36:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795170981; cv=none;
        d=google.com; s=arc-20260327;
        b=pGD4BNL46IISEd6BQfdQalwQcs4GEEgGQ2LNUGtlpmYCUOiV6ut+8tq3YSrykeMXVu
         eS+ibKcAZm4WckOVTuEbTb2K/3r6Sgt53dyJkqCf22HHN/+dmNbJFmdKPcQm1p9/sZ3K
         j8n4t5J03Hc7BomWF2xM0DR8haqmhJl2WUdnYm7N9QApsBdJ4gZ7LAMXJnP2CQCOiRms
         KSrRl4Vut3bjx4h5JSujbfO4kH3FVjgeJ/HILnHp1IXfa047tzPJuX5e45t3XdFv3iY0
         Qw+hNPRS7vc/7I1VC2uEANyHB+VAy/Hj5pgpi/PyYP+wDnfUXkS3SFJ28JSxV6meAe+0
         JSsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VFaoxLlxgZ2x89SNvf5iYEj3zjn/NZPwAXFvQOlXupI=;
        fh=6Z4xUuTqkcxNv6cvnn0HdSGcZYvnhz2BRm++iEwx924=;
        b=ctI0py3cpjsFOuGLXOgS/ZqOf06MSRgRmfMzv5MGXHHt/rdTYWc/ri7EKV/AlJAOPE
         Lxh/533TM/GoHQNbXWIgKT48pPtqIKbufoT/PDHCpEfwGOIAIHRBB0O3tz7Y3NECl/BN
         XgJHk8w01gjE7bDXU1+KPdd6HKs4o8pS6TeVOfxQ0nG1VxIboY307P+gcY41i23AmjhC
         dL+lM42TQdcOnQjzz/RaNqTv3H2F0l8ab5KntPU3z12GQPmiscjv9ono05o+EB/VcUvQ
         E+LOdylj5q1DgOCGsVsgvtmBF0wzme9Adnuu6+lsekG7w39+VkPctZp5Dhc3ARGpZSz3
         OF/Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795170981; x=1795775781; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VFaoxLlxgZ2x89SNvf5iYEj3zjn/NZPwAXFvQOlXupI=;
        b=tGBVqmuCTgfZ/FQ6datn+llCUn0iCkl9R9mtly0S7DllU8MOOYVntDNJ3helGFzWrt
         YrVp6M//GujDNxiLhjPlb25m14j4DZmAXw0D8q1O3bAbSlhL+kw3RMzAX8r/Tpapyn1Y
         Vy1K732MiEu43tjAZW3fZuugPxqzpvoArhVhAWct/+0gL1pP6f3cnTtPiLvDOk5ID31u
         dIECgaBz4wdqKloz30m+Oj+YahuQL7Wa+AwGR29qPeLv6HkU6VE07wi/r4El8YdYCG+u
         6MwcK7J6PaxBthvCBJcdp3tG22dLGO8VC6UWbYS9vCjHDkrp6EEJ+9uNsgWMA6LyT8Wy
         A/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170981; x=1795775781;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VFaoxLlxgZ2x89SNvf5iYEj3zjn/NZPwAXFvQOlXupI=;
        b=Tc5i3fRGYC1KcLSOrdzxId8qQC1nrSUw9Hu2riz1DyMS1W+m4ZzZSNRcQtjhBelh0Z
         8AjhTQypZoVIDBgYWNhJo4kYbd5gZ3S0XiP7N18A0ebb5DWlO3/cmF1leb+Y5zO83eq3
         cliBX1yfmC+PbgQmtFPPVwpdY2xHVCfYINhofJ6hI6NJ6LWMQQJtp6YdJUzXMuMwbpOR
         CoWMxrIeDfjf7/RDkONcS+wlx3N5NRNr8wxl028nTlhWujg9CLDdDJ2yf5Jpn6fyhUnH
         7l3Fl8dQ94TwQ7GWyMvfneysJgWeGRY4Q+SOGgfG244YssTPAxmG/LJKXU1YQLfzAici
         FtXQ==
X-Gm-Message-State: APuU4Z8LHS/NS8Luqj9IH4px/zbnIqEUMHQLuwZWY9i/sJzEEWG3VK5V
	lQf7qr6bwC+B4P1UX34XxpCAsowyKEjDNtcwXEXaoimdfPegd2Ify2QBQoq/qIZ7bjmVV6M7HXA
	SEikk4K6h5fsPKC2ctDcgZI30cGdsRhXe1g==
X-Gm-Gg: AZFdTZcVamY4dslXoCssQRzAeOBQH9WctJALAuxqbGoX0jQVvyjZjcOLzwtrcKK4ECE
	CrlO7EwYarmsLo2A0VE2CqypIlfmk26oS6LrQFIou6jHOlaA6gRXBw15Yco4QmeLfMgV31aS12D
	3DmCMZo+N37FfBWbJ+fyGGBqulRWkWgEInUOeff3srkgMBGkL0YcKugC5VJMvpOzchjySPW+BE5
	3vNcvzSiXnG9OI166gSHm/zYl3yXmP/oX+XYd1iVGvlytPTDL1FaFIouGwAeftVcept2t94hy1e
	1jl4Ymw4OI7RismdHQ/GpV+Kc4xLbvqpp5xAW6psxDsof0ida3GVVDWSywmcMzqGDo8MnrgN/8W
	bc8yFnV4WLQeC6ILCUtbDAE576l47gqYug26dwRUFvqi6o55R2eDEOxOQ/TgHdMIfzDq2AkE=
X-Received: by 2002:a05:6214:1d03:b0:91e:972b:ad99 with SMTP id
 6a1803df08f44-9212e0ff1d1mr60600966d6.25.1795170981432; Fri, 20 Nov 2026
 02:36:21 -0800 (PST)
MIME-Version: 1.0
References: <20261119141333.34492-1-jaipaul.cheernam@est.tech> <20261119141333.34492-8-jaipaul.cheernam@est.tech>
In-Reply-To: <20261119141333.34492-8-jaipaul.cheernam@est.tech>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 20 Nov 2026 11:36:09 +0100
X-Gm-Features: Aa3M54rclL7LZAGoxxBi2qPaJWxtB89IPfIP9ADEx2u_CNu9qE3J1kx90U4PP18
Message-ID: <CANNYZj9dikE_THGNhhdMYKdJ9PJj4fPApc_mS1XgiJufwZFmQg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 7/7] dnf: Do not hardcode /etc bash completion directory
To: jaipaul.cheernam@est.tech
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a8d1460660b2d009"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 10:36:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250759

--000000000000a8d1460660b2d009
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Nov 2026 at 15:13, Jaipaul Cheernam via openembedded-core
<jaipaul.cheernam=est.tech@lists.openembedded.org> wrote:

> +Upstream-Status: Inappropriate [oe-core specific]
> +-  set (BASH_COMPLETION_COMPLETIONSDIR "/etc/bash_completion.d")
> ++  set (BASH_COMPLETION_COMPLETIONSDIR
> "${CMAKE_INSTALL_FULL_SYSCONFDIR}/bash_completion.d")


This seems like it could be offered upstream?

Alex

--000000000000a8d1460660b2d009
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 19 Nov 2026 at 15:13, Jaipaul Che=
ernam via openembedded-core &lt;jaipaul.cheernam=3D<a href=3D"mailto:est.te=
ch@lists.openembedded.org">est.tech@lists.openembedded.org</a>&gt; wrote:</=
div><div class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">+Upstream-Status: Inappropriate [oe-core specif=
ic]<br>+-=C2=A0 set (BASH_COMPLETION_COMPLETIONSDIR &quot;/etc/bash_complet=
ion.d&quot;)<br>
++=C2=A0 set (BASH_COMPLETION_COMPLETIONSDIR &quot;${CMAKE_INSTALL_FULL_SYS=
CONFDIR}/bash_completion.d&quot;)</blockquote><div><br></div><div>This seem=
s like it could be offered upstream?</div><div><br></div><div>Alex=C2=A0</d=
iv></div></div>

--000000000000a8d1460660b2d009--
