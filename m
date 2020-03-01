Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id DA7C26026D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Mar 2020 20:40:07 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id t12so5226988vso.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Mar 2020 12:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dF/MTSzsAypYFE022aAoH4ShKluioEkEn3FSXtqWq+E=;
	b=T8j9gIaaqPiu6LVCJZVPhHqhDH4t4kjvUK27FNPy9P4Vfh3e0/3xvKnd0Ew+FiUQms
	fz67OoaVD1MDIDH6c7Y1T/fupxiUTVCLWFvR0e7y7itHMceqtIkYxfqJYSay2ewRqJ8P
	aH5jZxUqgaXsMwAd7KpulBlaU1FYLQKfSQgnmTjhUG4/fiheRRHdohgxEfygOEkwHmnS
	e70bUsnLNuaSWC72X80ndhHjKRc6IFa0KdnImyI1X5ZraYxdkro9NjCBXokRMcuvJ1AB
	l/O9AruazhpWMuaKs6PyAEsMJSo91Ustd3BR/svoDCppfozMPna/rRd5f89lkedc/Fix
	5Peg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dF/MTSzsAypYFE022aAoH4ShKluioEkEn3FSXtqWq+E=;
	b=JfjkI2+L+RXtosxUIqTp9pRdHoTRYaOGn7dA+0C0BOKtmxUPdJBgr+nis9ZB2R5x9p
	AnsB+1THzhwbXZRrtayW/BlHuTBwQK8fpZrxQs35vDBZZhe0/aU+kdOTQklU0qPvJkPJ
	BXbETQkdUOKTy1tG7M2Rt6IVMMFELFsejGX/yEMhjtsSOD1+jsN2lYel4qdTgciRp7ly
	XIuUbIY67aQQ6mbX/eaulx60pmnCcvoF8EgNes61zF3+3546fYnnsy98ZC2AmNS5cDSf
	GqAtPDcw4ijt9vYtokFaroJnVB6Pc9Lu/6fM/7K0Sfv6aSPMdxlZ4lyKQJzPwUJUEtMr
	ta0w==
X-Gm-Message-State: ANhLgQ16K1yyS+UV2tbxWUmnX6l9oJ5jzboDuI8ZTjAHcN6KVJhFyTxh
	+AUc3GDcbNtJKqfWhQQKUTzNJFj4jV2NEy7t69M=
X-Google-Smtp-Source: ADFU+vtHM9ruo7LvUguxAlMDSsxPXRgtWlOvMfqxDdUYNCjoqn4WqazRicii0jLT8VcH4Ee1I9njqJcS39yq8xZXSn8=
X-Received: by 2002:a05:6102:103:: with SMTP id
	z3mr7827567vsq.23.1583095208478; 
	Sun, 01 Mar 2020 12:40:08 -0800 (PST)
MIME-Version: 1.0
References: <20200301131353.3470253-1-otavio@ossystems.com.br>
In-Reply-To: <20200301131353.3470253-1-otavio@ossystems.com.br>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 1 Mar 2020 21:39:57 +0100
Message-ID: <CANNYZj_MpJZKA5Nch_QVa64y7Oe_Q+BQgR37dn8n7bmwvbh8Pg@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH] easysplash: Add recipes for 1.0.0 release
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
X-List-Received-Date: Sun, 01 Mar 2020 20:40:08 -0000
Content-Type: multipart/alternative; boundary="0000000000008c0cb4059fd113f1"

--0000000000008c0cb4059fd113f1
Content-Type: text/plain; charset="UTF-8"

On Sun, 1 Mar 2020 at 14:14, Otavio Salvador <otavio@ossystems.com.br>
wrote:

> +++ b/meta/recipes-core/easysplash/easysplash-bootanimation-default_1.0.bb
> @@ -0,0 +1,12 @@
> +SUMMARY = "O.S. Systems default boot animation for easysplash"
> +LICENSE = "CLOSED"
>

CLOSED?


> +PACKAGECONFIG[mesa-gbm] = "-DDISPLAY_TYPE_GLES=TRUE
> -DEGL_PLATFORM_GBM=TRUE,,virtual/libgles2 mesa libdrm udev"
>

This I think should also be enabled by default subject to opengl in
DISTRO_FEATURES.

Alex

--0000000000008c0cb4059fd113f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, 1 Mar 2020 at 14:14, Otavio Salva=
dor &lt;<a href=3D"mailto:otavio@ossystems.com.br">otavio@ossystems.com.br<=
/a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">+++ b/meta/recipes-core/easysplash/<a href=3D"htt=
p://easysplash-bootanimation-default_1.0.bb" rel=3D"noreferrer" target=3D"_=
blank">easysplash-bootanimation-default_1.0.bb</a><br>
@@ -0,0 +1,12 @@<br>
+SUMMARY =3D &quot;O.S. Systems default boot animation for easysplash&quot;=
<br>
+LICENSE =3D &quot;CLOSED&quot;<br></blockquote><div><br></div><div>CLOSED?=
<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">+PACKAGECONFIG[mesa-gbm] =3D &quot;-DDISPLAY_TYPE_GLES=3DTRUE -DEGL_PLATF=
ORM_GBM=3DTRUE,,virtual/libgles2 mesa libdrm udev&quot;<br></blockquote><di=
v><br></div><div>This I think should also be enabled by default subject to =
opengl in DISTRO_FEATURES.</div><div><br></div><div>Alex<br></div></div></d=
iv>

--0000000000008c0cb4059fd113f1--
