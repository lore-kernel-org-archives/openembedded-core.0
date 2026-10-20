Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10783.1792463237701053402
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 19:27:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nSek5zHP;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8ac9d666d4eso21409837b3.3
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 19:27:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792463237; cv=none;
        d=google.com; s=arc-20260327;
        b=Aez2tLzkaGSAsLBCykosgTbrecGopnQPx55EHpT78SfCivcVGPAZYYMWQTjzPSbUdv
         t6rqLYELZhhVG3Rc08T8wW5xMulO2j89jvPXTk9cpq+0SABluYD4HcCEZYT/zkEbjLJe
         l7fp4uKc0Gx6J78Fo9qZJpdsryjhZmW9/VxU3d2TAHtSAit8e9D2TLtFgaYM6yThk3qF
         UrK4lO1pcYBV+AWDZwPABeMahhV1/2A3gWHf9eruQxOHB7CNio+ONvPV7p33AoHZbDPU
         O2G/6LhxlFehwkS+oQa0e2PQ3Y2gBAetd9ZorPocXhnDYqbBja+mfJdEiMfgHD8adPJn
         7how==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Y/av2TYMV0Uoafuyl+8Zd05ghFyasZaZgLYSPzGGF0w=;
        fh=VOVZu8FjXojtP/2iv884q8pvwCQeeuFgwI9OY1sYm5U=;
        b=DAoQt9AUpj2VRB+lWHBELuNpOAZeZNNcug2lRuoMY5FPT8orQ5HGYEZIVobuo26vQ5
         rvX0xuIJX4sBDHZd4ur614VVPMM/BAmBqhoxIMoRPR4OAawCZ3ImYl4Cd3AK/mZ+wHS+
         E77l3/cHv1vPUyb+J+xrneHwbm1ZUJ/csjUzRfJpYT39a8cszdjNrArSHcSfWeLSALir
         FBXW0e+MgjnSou3PJzMsWOH4v+85ezlF37hQa38jLWUPQsFCj+CC2lvl30krrRCUUXzg
         6pmEo4+CtznCMtop57XvxGGRlDMdxa1yaIkCaJ58sV9eJQDRzVoo7tSMDmwfeshf+Wnd
         kDWA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792463237; x=1793068037; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y/av2TYMV0Uoafuyl+8Zd05ghFyasZaZgLYSPzGGF0w=;
        b=nSek5zHPePZMx5tDZvErDIZvfNkQQJ3tRaVXPkM61KJsQRZQi4z0+fo7nMyTCnjAWR
         uua3SvbV0uchps7ms9cqDsqTbZGKHXJoRj6MrClRbNhWEdn454XP4+aLCEe8X66OCJa+
         rNL0wc1+8FytNoYlh/FKKrt+gR3GUJ3ldto5pUHI87NzAOFxjQjZTlJCXawMftMXNFp3
         m/6ZD9o6nz1BNy8dSKCI8U0i/sBiGXtP15TTFh5bm6ugN9M0FiXB7BB0nwW89DrtextK
         JZDhwtSEmNyRFABg6nyDJAVxuEmv3bSCrQu3keFpAfFzypMu+1Lvh/O2ISiFXprXSai3
         Nesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792463237; x=1793068037;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y/av2TYMV0Uoafuyl+8Zd05ghFyasZaZgLYSPzGGF0w=;
        b=1wK88nsn4XUvonR8RP2N+RqOMjWht2WnKDaTyUIgW9A5USMIjXukeDwFSCiAlPzC8C
         mnrHlBc/v9Xu5hBxCMZG6RQlnZnk9JKMfuLyzRqiwOxdVkfAwkEn7dHasW+sFaRjtnyN
         jLP/i4nvMLAit/kYfCpJNozQQhJifnw/0T9HTD0/Gy4MutV5Ip6N0uLyBTMwkinFWjnl
         30Tk6HtNMRdpt7f3CXKrCx6/zWkaD7jjZoEWFKt/Yoa3UfCnYZhZDEGTJNHE03pu9BFC
         M8vA1KrYAlsMWbW7ruKyfknlMdwmL/4EKm7fHs6wrN16mCZU8xFs+6wQSzGLvU6MZ1VQ
         sqSQ==
X-Gm-Message-State: AFq9FYILlzE20fZCE6lzOCPGzsRW4/VvtBxd37RNXTq3MbLNU6bGgCkp
	dRo+6vF/PQExT4EKIsQIbwf6jar9CYZgpRH6Upro6JPOptZ0z3pSjMbg7T8IN2gEb5/YthuA/fB
	EQmM6Gedm91yTg2GPmPFIqOLgeZNegA3uPFhE
X-Gm-Gg: AYBFou1j06B3L6DkHJjMjGn5bJfAUskiFjzfG6gczEvJh5++E7+iWgO4IHEclq2NUAl
	6O4okSnEG3ak6IpogFHzvBb9aP//lJk3oppXBGSCT+3KfR2SItEDX7fqXE7F4jXXbzkc0RJ4t/F
	G+NxV9egDzB229nuFSN/cJQj26XMoO4shE2cEfCU7rH3BctD/1pGazLTPWCDEGV02zjQ7rC89Fm
	MxyAbmSrmxA1rjMKGNkVqvYNGnQfH2NVHDlGU1VXeH98h191XvKO/k2bOUY1FEzJjQ0ZlcpoVo5
	fvYE00+JL3IZVN+fjOFLqC8h6UCJzAlshZDwcdA6ifgcneJvzlsvG365sK5PN2JjOJKYgDHmCDM
	eIA1l4dziGfhyhL1Y9kt8bDCjQ1FF7V4AQFE/2VcXf+lxpZjiWp/LfO25EDoY97JXdpfIhM6NRp
	Uax+5xch6v09H1ul4h8j8FJUJkQTQH0xjrIbo5bDZnpRa223B11CRHh0xZf02S8l9TJNbJTTWWh
	ORn9fOLsTNWmE2A3FjysLtHsZXuODwMMAv3LGZjRWiXpXP6DzAYC/BOlQftj3bOlMVgBB9otaUA
	bMmRjGuJUd4l9QHbM3Rdlp4hdf6KLvWEKxI9sNU=
X-Received: by 2002:a05:690c:61c4:b0:8ab:43f7:f058 with SMTP id
 00721157ae682-8b0f220ed99mr26852107b3.107.1792463236743; Mon, 19 Oct 2026
 19:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <20261017232743.1871823-1-khem.raj@oss.qualcomm.com> <04ACEAD8-0C40-48FE-9561-D0988EE53D57@arm.com>
In-Reply-To: <04ACEAD8-0C40-48FE-9561-D0988EE53D57@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Oct 2026 19:26:48 -0700
X-Gm-Features: AclHuK9CVkyxwkLCDhUNbbZNIY9nqmpmr9z05SDZSfm4AP_1h8u3vdd2mVWkCag
Message-ID: <CAMKF1soL6r7NnCW3hNSYqReeZHGNh2DOjrGg5yE19cCsHCSVzg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libfyaml: Link with libatomic on targets
 lacking 64-bit atomics
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007fc606065e3c5e55"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 02:27:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248213

--0000000000007fc606065e3c5e55
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 8:20=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:

> On 18 Oct 2026, at 00:27, Khem Raj via lists.openembedded.org <raj.khem=
=3D
> gmail.com@lists.openembedded.org> wrote:
> >
> > libfyaml uses 64-bit atomic operations, which need libatomic on 32-bit
> > targets such as riscv32, otherwise linking fails with
> >
> >  error: undefined reference: __atomic_load_8
> >  error: undefined reference: __atomic_compare_exchange_8
> >
> > Match on the relevant TUNE_FEATURES (32 for riscv32, armv5, o32 for
> > mips and m32 for ppc/x86) to add -latomic.
>
> Did you report this upstream so they can detect it automatically?
>
>
Well now that you ask, it's fixed for our usecase upstream so I have sent a
patch to apply the backport, additionally I have also sent a patch
upstream to make the checks more durable. see
https://github.com/pantoniou/libfyaml/pull/497


> Ross

--0000000000007fc606065e3c5e55
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 19,=
 2026 at 8:20=E2=80=AFAM Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.=
com">Ross.Burton@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On 18 Oct 2026, at 00:27, Khem Raj via <a href=3D"h=
ttp://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.op=
enembedded.org</a> &lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openemb=
edded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote=
:<br>
&gt; <br>
&gt; libfyaml uses 64-bit atomic operations, which need libatomic on 32-bit=
<br>
&gt; targets such as riscv32, otherwise linking fails with<br>
&gt; <br>
&gt;=C2=A0 error: undefined reference: __atomic_load_8<br>
&gt;=C2=A0 error: undefined reference: __atomic_compare_exchange_8<br>
&gt; <br>
&gt; Match on the relevant TUNE_FEATURES (32 for riscv32, armv5, o32 for<br=
>
&gt; mips and m32 for ppc/x86) to add -latomic.<br>
<br>
Did you report this upstream so they can detect it automatically?<br>
<br></blockquote><div><br></div><div>Well now that you ask,=C2=A0it&#39;s f=
ixed for our usecase upstream so I have sent a patch to apply the backport,=
 additionally I have also sent a patch</div><div>upstream to make the check=
s more durable. see <a href=3D"https://github.com/pantoniou/libfyaml/pull/4=
97">https://github.com/pantoniou/libfyaml/pull/497</a></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
Ross</blockquote></div></div>

--0000000000007fc606065e3c5e55--
