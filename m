Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6040.1794552437674114077
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 22:47:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=hGHyI8/C;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67c24619b19so181813d50.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 22:47:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794552437; cv=none;
        d=google.com; s=arc-20260327;
        b=ggYrUABJiAAHphG2u/jaAQL4H7B15B220kza3Lw17wIz7pZL/0UC3hF3EZxAjaoN7I
         ZVyFZ3qexUwRLFGISWugCLW4JaK60SqCe2QznwuB2/XEmlrfihTD+Fu3qR8e7DM3s/gI
         6dabUavY2riv3yZb1zuY47S9MjIG7q0wurQdHXlDH+lpC4DvyA8lMyJev+ez5YjScT9Y
         2NrqKF1L2r2mMVym1MsP6P9ws4OoubQ9pv5KSwqlr6qWrtHMaaKXVYEOYPx1CCQegnUQ
         xskCqAGZereOP1H4kNgcVrUllcV6FUVYDBtY8lQjAvYTUPLApvbhtV3fCaELbDwYzLMO
         Bllg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1wFaJ1wKF7D3/+KrEYkb7aFNR4zSQev5U6fTSQc3K1k=;
        fh=1OhkTCE7SeWDLzlx5UncT1DuIRvei4gwg2D8aZxYMzE=;
        b=Cz3QgTa0wdteunfTO15o8Sx47ho7phK9yoh/ynJNv6d/kcx38Ne0IKSyFzvAqnliaT
         e8YIxO/g4RuAqRuqVapmhKc4Xo013GyD0RlGsX9nfDymTqN7NWt4A7DPxV3skfLdh8zB
         IuMWX3cQ4/FJ4UYKMwDNbd/s6CGWVi+CtOnAEumqgIRs3bCfbiPNWOXsWiGN/xm+4oTi
         Ik4uJZjihQ5N26tlQstOBdyyqOu3xWvf0iF9FqFdd01R+uHPoic1KC9h/RDkMGfhnQm5
         1uJqpIn9lrxLb5Rfm1aa4syY+vWmp+0gjbDt7pDY0hQytf1HzZMHjnS3bDfkS1hc2pmZ
         qoMg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794552437; x=1795157237; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1wFaJ1wKF7D3/+KrEYkb7aFNR4zSQev5U6fTSQc3K1k=;
        b=hGHyI8/CsWkIjlgHucIY3tmza43pUWnGI66nWuEbrc5dyQo+qZPPekE1BLS/JyXpPx
         J9JUCvYTcEAcrywnEQAAS6+Pe7WaaNxLGk1bNAFVGiq6tFHI8M0SOjtQXfxYYsDrPejF
         XuNPSSfrvgh+8SaXd0b3vXVWPVMgaoYNj0BYCW3L5m0eXV93o/dREC9uf6oPwMETvxFH
         veSW1sGtQNSTXcCxeYCXjWdwGXFrGU3iiMv3MVFrlaRLckJdLX78rdOq9bLuzg2lZaYa
         R28g/3u03UOITGTC1s6YFd1UlOySwrfpNrw5aEbucuYoaT5IfzF7dMyhEhc9fm3/DVSL
         qTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794552437; x=1795157237;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1wFaJ1wKF7D3/+KrEYkb7aFNR4zSQev5U6fTSQc3K1k=;
        b=h2ui45iD0VnXfJYVTLpzaRCG9lSaHivFNanzocdGj0zVtM6GE8VnksYcBPnJ+p5AAY
         AfbkQEx83XPVifxrNW3jvue7dUlRaiVOIcaARXo4HDciVeVOG6xZU5v0GPtHABV7bIUp
         Z6AWHDafbWAkiCdjFw+dstH6LnwkoND6UsVYny2oSes5bZeDpa/JWNm5BUCd50SmKBJm
         RG2xypxEgVu8eXHBVplKiSCrB4LAdf/ng1r/Fmmr0mJIlc2h+zMZ5GlMlMfW7DH3UY7Y
         I6pDY4wpAqiv/o7c0ujrStCE4UFVCTtKFpTw6XLI0s4YJvahUyvTaM6JhLk1AoL8uBxp
         8MsQ==
X-Gm-Message-State: APuU4Z9gd9kYDAxee7WAlHFjTBuU4FqqGKHOcZvv/gFZ9OOcmA3GQ7+j
	pY9aP6DQLxh3lDkT9W0OzJ5qcfY77xwJPA5pkw34YIWllyFX0xj989+Px1htamE8qEPcIudD9jv
	Pu1w5oZ3wSWsfdfr7EBGQWP7sLs96Gd2zL1ugrPxgAw==
X-Gm-Gg: AYBFou2PPY6Ii6nOVO0tCFFDhmLLbd+miIVKmvWxDSVHVjS1Z6SkZbHsBu7teny3F43
	wMbfPY9Sr/kzFXc7OVWxC2TVFtAFW552Si7BEi1NBjgHnCwWFUSdRUh104AwYA/+e6bgB5F9qXI
	DzSK1dmvRuITgUgVQ94G34t6oiErLkMJkBbYIMAtuhvszyQKZ838u/50Kzcozhlvgur90usnwTK
	N98mZMdFjtWFlSqDi0Ze6FHDWtbXhw5SGzlQlTYqNpwyQffzYxrE4UenJxyllfCwjCz9sqfRPtM
	tBE/EIl8HlODins2XVPRV4jp8hBBZ3p0BLfJKtohsCGaU60tyRisooXQKbDrwWYKxbxNzW/7FZy
	bdOI13KpLHKlLn4k4JS9AHbq5upo/KT9FEqgIxnp4pupORuR3R51T3ltltTTAtJcroOWfCAeReC
	wF0hK0efJkNYvE7gkx0Iw38guOGoNi7jgn3PBdudmRoaKCselcvHoW/5xrArXZxbnLOscZ3v5Bb
	L5y8UrLU7H8sViUlfg9COlTZOp0Xi/6wSmCbA7zX1jHModFqhMO2/9ZK6iQDT6cirj9kUf1MVzx
	lOAnB8ZWQ4xjfnoqYWR33YXbxUtBfA3x6flssKs7MQqAmBZASboPD8yhye2vX3uq2VYVm7W+51B
	WfPnBVFcaRXwOEQKkOwo26ngyXFegHXBM1pd5neP/cy4=
X-Received: by 2002:a05:690e:4007:b0:67c:7f7:206e with SMTP id
 956f58d0204a3-67d896ed093mr1236119d50.77.1794552436700; Thu, 12 Nov 2026
 22:47:16 -0800 (PST)
MIME-Version: 1.0
References: <20261006111230.1478039-1-benhur.tessele@est.tech>
 <20261111154442.241009-1-benhur.tessele@est.tech> <743327.1794550799903849632@lists.openembedded.org>
In-Reply-To: <743327.1794550799903849632@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Nov 2026 22:46:49 -0800
X-Gm-Features: AclHuK_jmT1s-5rkeOwxYlGhXgPDXe5Jb4-r68T4og6li3mRBDy8eD1U02dHfKQ
Message-ID: <CAMKF1spBTO3yUOYJ1pNkSKn9pfzQioX0o5OJU+Nbk=bh5G0OEw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] rust: add rust-analyzer to the SDK behind a PACKAGECONFIG
To: SunilKumar.Dora@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008539a6066022cc8e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 06:47:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250152

--0000000000008539a6066022cc8e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 10:20=E2=80=AFPM Dora, Sunil Kumar via openembedded=
-core
<SunilKumar.Dora=3Dwindriver.com@lists.openembedded.org> wrote:

> Hi Benhur,
>
> Thanks for v3. Tested on master with PACKAGECONFIG rust-analyzer enabled;
> it works for me in a clean environment.
>
> One issue I noticed, not from your patch but from the existing cargo
> wrapper: on a host with rustup installed, rust-analyzer from the SDK
> prefers the rustup cargo proxy (~/.cargo/bin/cargo) and sets
> RUSTUP_TOOLCHAIN to the SDK sysroot.
>
> The nativesdk cargo wrapper then exports LD_LIBRARY_PATH with the SDK
> lib dirs, and the host-side rustc proxy that cargo runs for "rustc -vV"
> gets the SDK's glibc 2.44 under the host loader:
>
>       rustc: symbol lookup error: .../lib/libc.so.6: undefined symbol:
>       __pointer_chk_guard, version GLIBC_PRIVATE
>

binary is started by the system loader, but then picks up a libc.so.6 from
some other glibc tree
(the .../lib/ in the message). That libc wants a private symbol the system
loader doesn=E2=80=99t
provide, so rustc dies before doing anything.


>
>
> cargo metadata exits 101 and rust-analyzer falls back to a degraded mode.
> Seen on Ubuntu 22.04 and 24.04 hosts; with an empty HOME (no rustup) it
> works. So this is a pre-existing wrapper issue, your patch just makes it
> reachable from rust-analyzer. I will report it separately.
>
> Could you share your test setup, host distro/glibc and whether rustup
> was present?
>
> Thanks,
> Sunil Dora
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#250140):
> https://lists.openembedded.org/g/openembedded-core/message/250140
> Mute This Topic: https://lists.openembedded.org/mt/122213821/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000008539a6066022cc8e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 12,=
 2026 at 10:20=E2=80=AFPM Dora, Sunil Kumar via openembedded-core &lt;Sunil=
Kumar.Dora=3D<a href=3D"mailto:windriver.com@lists.openembedded.org">windri=
ver.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div>Hi Benhur,<br><br>Thanks for v3. Tested =
on master with PACKAGECONFIG rust-analyzer enabled;<br>it works for me in a=
 clean environment.<br><br>One issue I noticed, not from your patch but fro=
m the existing cargo<br>wrapper: on a host with rustup installed, rust-anal=
yzer from the SDK<br>prefers the rustup cargo proxy (~/.cargo/bin/cargo) an=
d sets<br>RUSTUP_TOOLCHAIN to the SDK sysroot.<br><br>The nativesdk cargo w=
rapper then exports LD_LIBRARY_PATH with the SDK<br>lib dirs, and the host-=
side rustc proxy that cargo runs for &quot;rustc -vV&quot;<br>gets the SDK&=
#39;s glibc 2.44 under the host loader:<br><br><span style=3D"background-co=
lor:rgb(251,238,184)">=C2=A0 =C2=A0 =C2=A0 rustc: symbol lookup error: .../=
lib/libc.so.6: undefined symbol:</span><br><span style=3D"background-color:=
rgb(251,238,184)">=C2=A0 =C2=A0 =C2=A0 __pointer_chk_guard, version GLIBC_P=
RIVATE</span></div></blockquote><div><br></div><div>binary is started by th=
e system loader, but then picks up a <code dir=3D"ltr">libc.so.6</code> fro=
m some other glibc tree</div><div>(the <code dir=3D"ltr">.../lib/</code> in=
 the message). That libc wants a private symbol the system loader doesn=E2=
=80=99t</div><div>provide, so rustc dies before doing anything.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><br><br>=
cargo metadata exits 101 and rust-analyzer falls back to a degraded mode.<b=
r>Seen on Ubuntu 22.04 and 24.04 hosts; with an empty HOME (no rustup) it<b=
r>works. So this is a pre-existing wrapper issue, your patch just makes it<=
br>reachable from rust-analyzer. I will report it separately.<br><br>Could =
you share your test setup, host distro/glibc and whether rustup<br>was pres=
ent?<br><br>Thanks,<br>Sunil Dora</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#250140): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/250140" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/250140</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/122213821/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/122213821/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000008539a6066022cc8e--
