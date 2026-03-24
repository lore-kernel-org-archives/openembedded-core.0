Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A1DFF532F5
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 08:39:50 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15137.1774341588645107447
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 01:39:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=A0yrg3Nq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso41772625e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 01:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774341587; x=1774946387; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RaX0azm9rGdr3LhEp1LWQ+Ub74kJKaYoGSup2j+HmJ4=;
        b=A0yrg3NqaJ1pFE/5WAchQvCpqPi+6dBjbZpdFYxpydpVsJGy1eozMqcEcyDPTdOC3u
         mTzN50SygTw3uLwJKacWolOfxCZie8brdRHVoxg/mKwWrXqYRyoS67hIhwSM7KxWVB7e
         A7fbnM/X7FP7XHtUwq2sDXlZ1MjCgNhFSxLf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774341587; x=1774946387;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RaX0azm9rGdr3LhEp1LWQ+Ub74kJKaYoGSup2j+HmJ4=;
        b=WVAS7Lh4GM4rPERiQySP9WMqh+ibPQWgeBS+uSB3v1iZnokKcu+w7bfYne7paV9RCL
         7/nO2us8dyf1Zp6kC6Ys/vyqsTgQiyKnHVMn6RPQ2tOCCEY8eAHQziVmD6C357NoLMeV
         OPQOkYmAIGJZG8b/IcPmrYrqrIcqpSKMCur2q/7I8or89keJI0XDIq82y4tvH5iR2+Ao
         wqZH/R+CTmS35ccGUPy1SI9JuEMVG2j0ymcbkQSplOghQ8cArfyG0gkQZT2JJRj7GrDX
         rLf/q6O5icOD6vj6efiYQzzsbi4zLXZT3ecPZ5UBJog7EtwnkfRDDAm8KIbAhMwJsPvC
         IiAQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0X2t297FP5K6xDevvOTewGgdnDG77SCHmdegO6bLLoPGTnZswVOy4AzGzIx13cpMMbl7OsDrZGHmBFMr//rrV7A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzyj9oEURM1jBwtyvq1qZ5+jndOROa4U2msyjFrArTGh+kve2ST
	oziImSEAiy6Y/3I8qx0q2um94/rdeD94iDnvI4n/cvUxDeMjc8ytAC3pX9XRyzKlo+s=
X-Gm-Gg: ATEYQzzIH5nkk1wx5CrchobqQSTxZ5+kZTt+UqwDdrgML8pbocHNRJ7+N3IYHPCF0qv
	CD7vpkAnZMam3CNmL6mr2UfqDT+mFA9GC2l6KZ0BR4ZEhYRxL8FP9sCN1pXMeH2vcuC+6uZUX1r
	tchWZZHvM4LVQbOYPoA82ZwtU0RDxx3d2slRAuJjQwLJy3VNDHp6n87epLp7DHAM0VBg6sJK/xC
	TXWkfR7HOz1qKR7wqckki++yj1GduqC5czTrbl3zGdxmleIsMxnA9T/tQ4RXCacGOMuLB6hcLZM
	W5UwaICU5VhGoj2rWxF+9ETZz90Ia8pS5envP3PhfXOPsluxLb9Yool+HHzv1vekoqO41Kwdk2D
	m+kTYt4eyRiIYuU+/KdAGZ2vLD6QRwYzEnvggcBvbOTEGMdw/Fe2h/uI7MVQE56Wb6+RpUhLxTD
	soTFDeWPB6kQ4FKa4ahsRkNRokWUYUZlpC0bmnhwi3wFyFT7focfCgbpa9nm0sZCVWG6Ev4YnRn
	/4poN58fRpn+dQO1jF7tf760/g=
X-Received: by 2002:a05:600c:c167:b0:477:a1a2:d829 with SMTP id 5b1f17b1804b1-486fedc9a52mr194578215e9.13.1774341586857;
        Tue, 24 Mar 2026 01:39:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a42d:49b6:a690:7df7? ([2001:8b0:aba:5f3c:a42d:49b6:a690:7df7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116f173csm41498805e9.2.2026.03.24.01.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 01:39:46 -0700 (PDT)
Message-ID: <84209a7f7a29421932c8f5dd95357039e6db8856.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] python3-pyzstd: Upgrade 0.17.0 -> 0.19.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jiaying.Song.CN@windriver.com, openembedded-core@lists.openembedded.org,
 	Ross.Burton@arm.com
Date: Tue, 24 Mar 2026 08:39:45 +0000
In-Reply-To: <20260323031116.2513728-1-jiaying.song.cn@windriver.com>
References: <20260323031116.2513728-1-jiaying.song.cn@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 08:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233776

On Mon, 2026-03-23 at 11:11 +0800, Song, Jiaying (CN) via lists.openembedde=
d.org wrote:
> From: Jiaying Song <jiaying.song.cn@windriver.com>
>=20
> Changelog:https://github.com/Rogdham/pyzstd/blob/master/CHANGELOG.md
>=20
> Recipe changes:
> - Remove 0001-Remove-setuptools-version-limit-of-74.patch (no longer need=
ed)
> - Switch from python_setuptools_build_meta to python_hatchling
> - Add python3-hatch-vcs-native to DEPENDS
> - Remove obsolete do_configure:append:arm:toolchain-clang (setup.py no lo=
nger exists)
>=20
> Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> ---
> =C2=A0...emove-setuptools-version-limit-of-74.patch | 27 ----------------=
---
> =C2=A0...std_0.17.0.bb =3D> python3-pyzstd_0.19.1.bb} | 11 +++-----
> =C2=A02 files changed, 4 insertions(+), 34 deletions(-)
> =C2=A0delete mode 100644 meta/recipes-devtools/python/python3-pyzstd/0001=
-Remove-setuptools-version-limit-of-74.patch
> =C2=A0rename meta/recipes-devtools/python/{python3-pyzstd_0.17.0.bb =3D> =
python3-pyzstd_0.19.1.bb} (53%)
>=20
> diff --git a/meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setu=
ptools-version-limit-of-74.patch b/meta/recipes-devtools/python/python3-pyz=
std/0001-Remove-setuptools-version-limit-of-74.patch
> deleted file mode 100644
> index f2910322ff..0000000000
> --- a/meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setuptools-=
version-limit-of-74.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -From bc9b975c9f41e43481a2eb0623b4180926baecec Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 9 Apr 2025 14:38:31 -0700
> -Subject: [PATCH] Remove setuptools version limit of '74'
> -
> -Upstream sticks to 0.74 since setuptools have dropped msvc9compiler
> -support beyond that which is needed for python 3.9 on windows. We
> -do not have this problem on Linux
> -
> -Upstream-Status: Inappropriate [OE-specific]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - pyproject.toml | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/pyproject.toml b/pyproject.toml
> -index dd885e4..5d4d511 100644
> ---- a/pyproject.toml
> -+++ b/pyproject.toml
> -@@ -1,6 +1,6 @@
> - [build-system]
> - # setuptools 64+ support --build-option
> - # setuptools 74+ drops distutils.msvc9compiler required for Python 3.9 =
under Windows
> --requires =3D ["setuptools>=3D64,<74"]
> -+requires =3D ["setuptools>=3D64"]
> - backend-path =3D ["build_script"]
> - build-backend =3D "pyzstd_pep517"
> diff --git a/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb b/meta=
/recipes-devtools/python/python3-pyzstd_0.19.1.bb
> similarity index 53%
> rename from meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb
> rename to meta/recipes-devtools/python/python3-pyzstd_0.19.1.bb
> index af7069b6ed..ccf37eacf3 100644
> --- a/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb
> +++ b/meta/recipes-devtools/python/python3-pyzstd_0.19.1.bb
> @@ -9,12 +9,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Daedb5a2679cd1=
552fb61c181ef974b9e"
> =C2=A0
> =C2=A0PYPI_PACKAGE =3D "pyzstd"
> =C2=A0
> -SRC_URI +=3D "file://0001-Remove-setuptools-version-limit-of-74.patch"
> -SRC_URI[sha256sum] =3D "d84271f8baa66c419204c1dd115a4dec8b266f8a2921da21=
b81764fa208c1db6"
> +SRC_URI[sha256sum] =3D "36723d3c915b3981de9198d0a2c82b2f5fe3eaa36e4d8d58=
6937830a8afc7d72"
> =C2=A0
> -inherit pypi python_setuptools_build_meta ptest-python-pytest
> +inherit pypi python_hatchling ptest-python-pytest
> +
> +DEPENDS +=3D "python3-hatch-vcs-native"
> =C2=A0
> -# clang-16 with -flto segfaults on arm, therefore ignore flto for now
> -do_configure:append:arm:toolchain-clang() {
> -=C2=A0=C2=A0=C2=A0 sed -i -e "s|'-flto'|''|" ${S}/setup.py
> -}

The ptests aren't quite working yet:

https://valkyrie.yocto.io/pub/non-release/20260324-50/testresults/qemux86-6=
4-ptest/python3-pyzstd.log

Cheers,

Richard

