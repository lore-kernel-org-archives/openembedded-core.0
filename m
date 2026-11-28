Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2062.1795894174881696995
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Nov 2026 11:29:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=0xVrF57Q;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-9213922de73so64093296d6.1
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 11:29:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795894174; cv=none;
        d=google.com; s=arc-20260327;
        b=o4IsF9kyuzDxQ9E7aZrT/SUkDXxQzppL77lDH5bmnRz/F1cYNeJg58EFOJGybZ5S/3
         swr+Lx5Z2ZxpIPwg6cbIvK8LiqIpObhS7DBQmEVVOoAOZcTIEZFadrn/7OlE/FXRczNS
         iWo8RUH/DpUzeVr5B4F+ELi155aeMdbCZYWnOHU/00k4D78G8JhhyklQIU2fdF0SVZJ9
         oewFdrHrOmEYdj/pbBpLk4d4CTDj7TK4Lv9VJ5r5oa/j6twD3rJt2j7AOrZUfFqK5E1J
         MhuT27zZkmOf294CQ+EMAFOh2FNWbkzGiaKRym2I5PoH41IJc31Mt4CrmwHp+z+SAbil
         rwvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=d2a98td44sbHWSGACHDdBX5KLiXrfuUbu395LFTro/s=;
        fh=ghTAXjEm0J0VA8rgMHw3wPbki1J8TiilyuFcSwgcoHk=;
        b=aJYJr1c6BMLXx3ez2UMfE+Fko88iv6RUnRJRaXsMHNoAb7WdmVIQYmRMoke31JB1RC
         6qtQ87+Q9XAHnO4kClqyC1BHU/8/NWlwTT06uCAbO9yeH5Lf94bvQIHBxwNhylmG1m1Q
         2MnotDoddl/2czA3EZbxOzxQTpMLvb8vNA7/DjOvUwj//UYq/0hSUH64DXlbId7pkbDe
         4S6aQIZcqHrhhj80nWXmQjqJ+AjQr5pyjkf3eFRYNhGrW2x9d6TJxl7pvGo8+v99DxYS
         gUCZQjjQTiYX8hF4tKl0MOQTf5YzTssyW5wgKlOQTIuggbrzaidekn14OUdAcitpgziN
         yERg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795894174; x=1796498974; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d2a98td44sbHWSGACHDdBX5KLiXrfuUbu395LFTro/s=;
        b=0xVrF57QLxwqpbbUnfQSnb+cwYxxWlM4TNgyzrPsxTEbYZgUzngITk0TcLTS0wWDzU
         OSLz9bB1R52y7ii+lphajy0CJYVOmcRb3yiNkVZaXZvH2ztauQ9UUrCaRZisQB7nFDiN
         2+Yyx7Tv00A62Vaj6FL/UnHDZF3S1MxkMDFe+Y0/MpCE5cJCzSCT+sd+w++RE9n4vLgz
         l2xzDQ+2O8V6JfdbEauEiyu3o+BB/oTEYM3bbqkWqs+Fj+WTuSOb1/UvbQic+FJGRA0a
         uieP8/c40mlrovmyS/6Pg4Aq9o5XEuzpRyGCinjP5Had9QLUB7QtW2gpdFHxan20b9AM
         ZYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795894174; x=1796498974;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d2a98td44sbHWSGACHDdBX5KLiXrfuUbu395LFTro/s=;
        b=VjWOa/mJ1+HLskXBeMiUzwY7Sh0d1J3+sxmi26O7RFdRv3zgWqGQsPeekvCRd35Z0v
         eNtl0FNMtqHqu+H/CgtB6brVMMn/lPMFYacJeuU8ug6KWgtmFWLtmvI59RlRKL0yH8Fi
         Cfzbu79CkHlPn/xKRubsMeJ7iMNrgaRDc/TFgRx6oC5SizkZwid8UNoG/XNPCwPWOjd/
         SUGBVWkgzZCPSI8Wpauq/AAWRsYc0rrlF2sXv9KFZQpZguG9BQp5mbiTwkgnqWQaxD3Z
         VyK19dEPdEjNdctxJwaxOI86YI8U3PcxntASq/XuzkvMxJoSaRzqKNQkcNhDBrQSNYSp
         5/Og==
X-Gm-Message-State: APuU4Z+tu+pp9G/8Cw8Gq4gDcZW5KijCtj/4qP38Ji9MaZ99fA/wTbe7
	GfHQ5jleUdgvvSZRgpbvFCrKMdsz8xTIl3Ig3oN1jn5RQsY2UtmP+syvtOeC/5YU07ojr48F3JF
	h29j/Ng1RtI5dnocBQONCgkkf6uEimzA=
X-Gm-Gg: AZFdTZdkLjJHwSfXnaIZaHMaIRWSLBgkWMtp/OfeKF9z1IX2MWkmxRmfG+bC7b8A7QP
	lsu9xTkW0lLCNKJLBqxv9gJonEbCjjqKKuMhx2aOriTJm/LalmU3x6+OxGKswbChJNkS2fpE6l5
	fVqNCmsOq0e2wFwqm4OY0SZhkIlecPlAO11JsQj0gxl5zCV3Davh1IqpM/bdMMy2P/gcd9HlHjF
	UKw3Mp9qURvZg0esfyJ/7Ere3xxLLXNMyQbAJJ5y6pW4zuN5UVUNRDeOHx8rAflNvMBHav+JdMG
	YsvKAtAJOjDvhnBLHiiK6Fr3yHPXOu3ewufH4WUiO+GZk2ii1jmIY917UgmvJZ3JJ+G0kxhZnNv
	4Qi8kVzhPuD9Ty8cCv7TCE6/vviBX7k4iS9IPqSJRgyA6SutUQNAhanxiYDO3KI6a0p0bHY2s
X-Received: by 2002:ad4:5f0d:0:b0:921:3d29:164c with SMTP id
 6a1803df08f44-9216bcedb00mr304421156d6.13.1795894173822; Sat, 28 Nov 2026
 11:29:33 -0800 (PST)
MIME-Version: 1.0
References: <20261128174750.1470765-1-khem.raj@oss.qualcomm.com>
In-Reply-To: <20261128174750.1470765-1-khem.raj@oss.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 28 Nov 2026 20:29:24 +0100
X-Gm-Features: Aa3M54rwV49iPc2n7CU98GWL-Le25L-zHVLYHOddCgvHwFmYzwu_mfgFiNdhsJ8
Message-ID: <CANNYZj_Og04TCsh2AHu4a5iTvi4FTtU-05FjfT+N1BEDp2uPXQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] avahi: Mark the upstream version as unknown
 until 0.9 is released
To: raj.khem@gmail.com, Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, 
	Khem Raj <khem.raj@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="00000000000048f4e806615b3205"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 19:29:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251508

--00000000000048f4e806615b3205
Content-Type: text/plain; charset="UTF-8"

On Sat, 28 Nov 2026 at 18:47, Khem Raj via openembedded-core <raj.khem=
gmail.com@lists.openembedded.org> wrote:

> avahi is built from the v0.9-rc5 tag. The git upstream check ignores
> tags that contain "rc", so the newest version it finds is 0.8, older
> than PV, and check-upgrade-status reports UNKNOWN_BROKEN. Set
> UPSTREAM_VERSION_UNKNOWN; once 0.9 is tagged the check reports
> KNOWN_BROKEN, which shows that the recipe can move to the release.
>


> +# The git tag check skips -rc tags and there is no 0.9 release yet
> +UPSTREAM_VERSION_UNKNOWN = "1"
>

The patch is technically correct, but avahi is notorious for not committing
to a release schedule and spending years in release candidate hell. Should
we rather adjust the upstream check to include rc tags, and tell us when a
new rc is tagged?

Alex

--00000000000048f4e806615b3205
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, 28 Nov 2026 at 18:47, Khem Raj vi=
a openembedded-core &lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openem=
bedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:</div><div class=
=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">avahi is built from the v0.9-rc5 tag. The git upstream check =
ignores<br>
tags that contain &quot;rc&quot;, so the newest version it finds is 0.8, ol=
der<br>
than PV, and check-upgrade-status reports UNKNOWN_BROKEN. Set<br>
UPSTREAM_VERSION_UNKNOWN; once 0.9 is tagged the check reports<br>
KNOWN_BROKEN, which shows that the recipe can move to the release.<br></blo=
ckquote><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+# The git tag check skips -rc tags and there is no 0.9 release yet<br>
+UPSTREAM_VERSION_UNKNOWN =3D &quot;1&quot;<br></blockquote><div><br></div>=
<div>The patch is technically correct, but avahi is notorious for not commi=
tting to a release schedule and spending years in release candidate hell. S=
hould we rather adjust the upstream check to include rc tags, and tell us w=
hen a new rc is tagged?</div><div><br></div><div>Alex=C2=A0</div></div></di=
v>

--00000000000048f4e806615b3205--
