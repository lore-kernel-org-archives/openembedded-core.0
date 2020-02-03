Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 724C860B96
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 07:18:37 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z3so16546071wru.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Feb 2020 23:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=6Gk/vVyo31ZK7l/ihA5CAgsYVh4CVOA3uUMbaTMd3Rg=;
	b=R+R86MUZB9TB9S0qbrG0JPJ/IjH6KYzTOSUKMv78LXKy5oKINrCjkqaVvys0go9W4m
	fuhv01gikR7raBXDJu2jxxIu7hA5/ZevwbOKnrfg0TZbgXsaku1bTukCt1+FVbFVECiZ
	Cdw1aMw3mTwjJvBmme9GhjkmvV4TrjHej2AgQxy/KXXk2XeXOZ9v0A8Z1B6G5XjXnc4/
	pz7nORodnWcXJai6PhhqU6qSNfrpaml/A5zemd0IJvy6Bio5cxHNbckhjqTSUtQWIBpB
	WpHcZLG8iTkocb4hqne4HfR51p6O64eXLj2IsIeqMEFPByxbAhounRxUBFTJtRHf5Ema
	EZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=6Gk/vVyo31ZK7l/ihA5CAgsYVh4CVOA3uUMbaTMd3Rg=;
	b=kibP2y4F87jRqh2+E7P72Cbr61qYRf/2CTwutWtBsZdV1ztGuQ2VNwyLy1JAZaV3bs
	YceJvp2jj2vIGOcHHQj7rc6k1oY3U9mFQsQCrlkejAIOhuglJcRMAuPrbGn8A+HCM2wY
	Dp5wy1+N208pDobUBIo7doI7tOr//3UhQY9EBa9WAohHBPFu5mGJdeuhsGuDdSj8EwQx
	JLnrQZgJVYcTLi/xlYlx9SA9iJQ2aNBMyRYXG0imywDVfm+15ncxlG290WdkdclIrAc1
	Im2vVYRTRneaFoGXfXIUypdvsVpKXXCWSkrKHTSSe0/Qu0BZ9S64Z/SVmlLfvIbKQHEB
	KyTQ==
X-Gm-Message-State: APjAAAVY1yRP/mJwZaBCNn8X3ChMw36s8bMKxO27NiLjmn8dzxRK4YEx
	gh3JhczCh+YPNZCcvFV8glW5S9M8
X-Google-Smtp-Source: APXvYqwOBIErdT4deXKWOT2qgFabg3s9xVNyMWzBzbbCPTA2O8h0lXVC1ON8uGRmV6AYQ9P7kzafNw==
X-Received: by 2002:adf:b648:: with SMTP id i8mr13444564wre.91.1580714318049; 
	Sun, 02 Feb 2020 23:18:38 -0800 (PST)
Received: from ?IPv6:2a01:598:b10d:af82:9dad:6022:9130:4cb4?
	([2a01:598:b10d:af82:9dad:6022:9130:4cb4])
	by smtp.gmail.com with ESMTPSA id
	133sm15946919wmd.5.2020.02.02.23.18.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 02 Feb 2020 23:18:37 -0800 (PST)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16G102)
In-Reply-To: <20200203064732.3923-1-zhe.he@windriver.com>
Date: Mon, 3 Feb 2020 08:18:36 +0100
Message-Id: <CFA2B040-69D2-4255-AD7F-E2C1E2765AA7@gmail.com>
References: <20200203064732.3923-1-zhe.he@windriver.com>
To: zhe.he@windriver.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lttng-modules: update to 2.11.1
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
X-List-Received-Date: Mon, 03 Feb 2020 07:18:37 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

The patch files should also be removed.

Alex

> On 3 Feb 2020, at 7.47, <zhe.he@windriver.com> <zhe.he@windriver.com> wrot=
e:
>=20
> From: He Zhe <zhe.he@windriver.com>
>=20
> Fix build failure with kernel v5.5.
> Remove patch as issues fixed upstream.
>=20
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
> ...modules_2.11.0.bb =3D> lttng-modules_2.11.1.bb} | 16 ++++++----------
> 1 file changed, 6 insertions(+), 10 deletions(-)
> rename meta/recipes-kernel/lttng/{lttng-modules_2.11.0.bb =3D> lttng-modul=
es_2.11.1.bb} (68%)
>=20
> diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.11.0.bb b/meta/reci=
pes-kernel/lttng/lttng-modules_2.11.1.bb
> similarity index 68%
> rename from meta/recipes-kernel/lttng/lttng-modules_2.11.0.bb
> rename to meta/recipes-kernel/lttng/lttng-modules_2.11.1.bb
> index 3465a43d38..c833ff7009 100644
> --- a/meta/recipes-kernel/lttng/lttng-modules_2.11.0.bb
> +++ b/meta/recipes-kernel/lttng/lttng-modules_2.11.1.bb
> @@ -11,14 +11,10 @@ COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|aarch64|mips=
|nios2|arm|riscv).*-linux'
> SRC_URI =3D "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
>            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.pat=
ch \
>            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
> -           file://0001-Fix-SUNRPC-Fix-oops-when-trace-sunrpc_task-events-=
in.patch \
> -           file://0002-Fix-sunrpc-null-rpc_clnt-dereference-in-rpc_task_q=
ue.patch \
> -           file://0003-Fix-sunrpc-use-signed-integer-for-client-id.patch \=

> -           file://0004-sunrpc-introduce-lttng_get_clid-helper.patch \
>            "
>=20
> -SRC_URI[md5sum] =3D "46ec6c566e65cf27b391a1bb643e11b4"
> -SRC_URI[sha256sum] =3D "98af92d8c2e00f4eb63bc637a6967103cf6997434493f36e7=
a535a491e4fad5f"
> +SRC_URI[md5sum] =3D "0d964723c8765b39835e5e6efc60a604"
> +SRC_URI[sha256sum] =3D "d3e5648937e59dee983ef844f9316c55e9961f9dc8515b926=
0c473bbb70696c1"
>=20
> export INSTALL_MOD_DIR=3D"kernel/lttng-modules"
>=20
> @@ -35,13 +31,13 @@ python do_package_prepend() {
> }
>=20
> BBCLASSEXTEND =3D "devupstream:target"
> -LIC_FILES_CHKSUM_class-devupstream =3D "file://LICENSE;md5=3Dc4613d1f8a95=
87bd7b366191830364b3"
> +LIC_FILES_CHKSUM_class-devupstream =3D "file://LICENSE;md5=3D3f882d431dc0=
f32f1f44c0707aa41128"
> DEFAULT_PREFERENCE_class-devupstream =3D "-1"
> -SRC_URI_class-devupstream =3D "git://git.lttng.org/lttng-modules;branch=3D=
stable-2.10 \
> +SRC_URI_class-devupstream =3D "git://git.lttng.org/lttng-modules;branch=3D=
stable-2.11 \
>            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.pat=
ch \
>            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
>            "
> -SRCREV_class-devupstream =3D "624aca5d7507fbd11ea4a1a474c3aa1031bd9a31"
> -PV_class-devupstream =3D "2.10.10+git${SRCPV}"
> +SRCREV_class-devupstream =3D "6ad0e68b43c3e52fcb3d47c4d823a7b84aeb443a"
> +PV_class-devupstream =3D "2.11.1+git${SRCPV}"
> S_class-devupstream =3D "${WORKDIR}/git"
> SRCREV_FORMAT ?=3D "lttng_git"
> --=20
> 2.17.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

