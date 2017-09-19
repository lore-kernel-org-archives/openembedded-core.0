Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id 12335780A1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 11:53:40 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id u134so1610930ywu.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 04:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=iv7N8z3ooPW6T4yzPq4SkBVFYyBXjTagVaeVhQ/aTXY=;
	b=GsPa58kM5anGbnMkOgtjRrgJWSrpYlU30MkqLR71t7G+d6IQsdsEkdWJcYZQvpCAkv
	wwG/ddkJlK+ycdFhgC4Yw4FryysV3DK1xD7uowCJwKlPzBJzgHzPX0zcGivsh1+NRLww
	txEJQEGEfIjcaNC48re9MLcKVD0ODRYOywnM8ZDXZ1MC3jm3S9hGPiRlnVD4rQdEDHXP
	Y/YEUxDcLCjHBjHTYCclduUbpRKa6wZdNTSXZ7vLYnMCIa0Y2quE50SrRZKijzVVUzjM
	WWmmrzB0WdZYEvCWOCm1FAIPVbMLC6ungSjLORIQffOjEvwEqQiV08qvTqWUydwLCpPl
	F+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=iv7N8z3ooPW6T4yzPq4SkBVFYyBXjTagVaeVhQ/aTXY=;
	b=FQDdNjzG3LDvcaCOynWT1sUq7eKmKXBSqa2VFEK9lbfqgED8N+nZ9aLXnhia79AsAj
	7tKq5ckZt23qJBAZYwtmVX85k5PGwmrLugjJbcR9LRFx6JtUVAXtJSgLQtuY/R5gds82
	oVByr0NZcGFtpR6ib0HvckqhUIOnKx1seV64Knn337DJr6WGU6H6LzhZRf0PyP+Zs7XJ
	h34zSyzSrrrqTaSuOOWwvAWwx/cvi33ozjXHqOLxBsYWaOv45PjvRhigZGZbhGyd9ZLh
	iwShH7oRTL3FF8AaLiuIGWK3mpVfaYIu4iZx6j25z36xEr/330nYoSP3GSf89CMSpfUh
	Po6Q==
X-Gm-Message-State: AHPjjUhnhjN/+EckBT5XnaEz5mHdO9rUxwBbgRKwZ+z5dUy0vcbqQhXR
	X1/TW1BVEoJhJZTIXRDUQVcjR5L2
X-Received: by 10.129.50.2 with SMTP id y2mr716374ywy.119.1505822021399;
	Tue, 19 Sep 2017 04:53:41 -0700 (PDT)
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com.
	[209.85.223.182])
	by smtp.gmail.com with ESMTPSA id v76sm3931895ywe.6.2017.09.19.04.53.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Sep 2017 04:53:40 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-io0-f182.google.com with SMTP id d16so9260236ioj.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 04:53:40 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QChbOtXxVwi0R9n7R4CHYqIwy8bATLYYgeHLJJ38DGM9CWHybZFCnjDkg/LtlftwVznxstRW1XKgLpWPFJilPc=
X-Received: by 10.202.224.130 with SMTP id x124mr1061932oig.100.1505822019648; 
	Tue, 19 Sep 2017 04:53:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.66.149 with HTTP; Tue, 19 Sep 2017 04:53:38 -0700 (PDT)
Received: by 10.157.66.149 with HTTP; Tue, 19 Sep 2017 04:53:38 -0700 (PDT)
In-Reply-To: <20170919112634.GL17137@bill-the-cat>
References: <20170919054058.20380-1-otavio@ossystems.com.br>
	<20170919112634.GL17137@bill-the-cat>
Date: Tue, 19 Sep 2017 08:53:38 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoSKajx42ti5DD6tEnzseF5SF=4cdU1OjEUo2at=k0jwA@mail.gmail.com>
Message-ID: <CAP9ODKoSKajx42ti5DD6tEnzseF5SF=4cdU1OjEUo2at=k0jwA@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Marek Vasut <marek.vasut@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot-fw-utils: Fix cross and target builds
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
X-List-Received-Date: Tue, 19 Sep 2017 11:53:41 -0000
Content-Type: multipart/alternative; boundary="001a113d376a93853a05598982a3"

--001a113d376a93853a05598982a3
Content-Type: text/plain; charset="UTF-8"

Em 19 de set de 2017 8:26 AM, "Tom Rini" <trini@konsulko.com> escreveu:

On Tue, Sep 19, 2017 at 02:40:58AM -0300, Otavio Salvador wrote:
>  - The environment tools target has change to envtools;
>  - The HOSTCC variable must be used to set CC for cross;
>  - The ARCH variable must be set for cross;
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>
>  meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb
b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb
> index c2e8f0fb84..21ab5b3e6d 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb
> @@ -5,13 +5,13 @@ DEPENDS = "mtd-utils"
>
>  INSANE_SKIP_${PN} = "already-stripped"
>  EXTRA_OEMAKE_class-target = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${CC}
${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"
V=1'
> -EXTRA_OEMAKE_class-cross = 'ARCH=${TARGET_ARCH} CC="${CC} ${CFLAGS}
${LDFLAGS}" V=1'
> +EXTRA_OEMAKE_class-cross = 'ARCH=${ARCH} HOSTCC="${CC} ${CFLAGS}
${LDFLAGS}" V=0'

Since we're messing with this, U-Boot's build system doesn't take ARCH.
It's one of the variables that you pick in Kconfig, not set so that
arch/$(ARCH)/Kconfig is sourced.  We should drop that.


You can't. Try dropping it...

And the
changelog doesn't say you're going from V=1 to V=0.


I sent v2 just after.


--
Tom

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a113d376a93853a05598982a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">Em 19 de set de 2017 8:26 AM, &quot;Tom Rini&quot; &lt;<a href=3D=
"mailto:trini@konsulko.com">trini@konsulko.com</a>&gt; escreveu:<br type=3D=
"attribution"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div class=3D"quoted-text">On Tue, S=
ep 19, 2017 at 02:40:58AM -0300, Otavio Salvador wrote:<br>
&gt;=C2=A0 - The environment tools target has change to envtools;<br>
&gt;=C2=A0 - The HOSTCC variable must be used to set CC for cross;<br>
&gt;=C2=A0 - The ARCH variable must be set for cross;<br>
&gt;<br>
&gt; Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.=
com.br">otavio@ossystems.com.br</a>&gt;<br>
&gt; ---<br>
&gt;<br>
&gt;=C2=A0 meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils_2017.0=
9.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-fw-utils_2017.09.bb<=
/a> | 6 +++---<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils=
_2017.09.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-fw-utils_2017=
.09.bb</a> b/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils_2017=
.09.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-fw-utils_2017.09.b=
b</a><br>
&gt; index c2e8f0fb84..21ab5b3e6d 100644<br>
&gt; --- a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils_2017.0=
9.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-fw-utils_2017.09.bb<=
/a><br>
&gt; +++ b/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils_2017.0=
9.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-fw-utils_2017.09.bb<=
/a><br>
&gt; @@ -5,13 +5,13 @@ DEPENDS =3D &quot;mtd-utils&quot;<br>
&gt;<br>
&gt;=C2=A0 INSANE_SKIP_${PN} =3D &quot;already-stripped&quot;<br>
&gt;=C2=A0 EXTRA_OEMAKE_class-target =3D &#39;CROSS_COMPILE=3D${TARGET_<wbr=
>PREFIX} CC=3D&quot;${CC} ${CFLAGS} ${LDFLAGS}&quot; HOSTCC=3D&quot;${BUILD=
_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}&quot; V=3D1&#39;<br>
&gt; -EXTRA_OEMAKE_class-cross =3D &#39;ARCH=3D${TARGET_ARCH} CC=3D&quot;${=
CC} ${CFLAGS} ${LDFLAGS}&quot; V=3D1&#39;<br>
&gt; +EXTRA_OEMAKE_class-cross =3D &#39;ARCH=3D${ARCH} HOSTCC=3D&quot;${CC}=
 ${CFLAGS} ${LDFLAGS}&quot; V=3D0&#39;<br>
<br>
</div>Since we&#39;re messing with this, U-Boot&#39;s build system doesn&#3=
9;t take ARCH.<br>
It&#39;s one of the variables that you pick in Kconfig, not set so that<br>
arch/$(ARCH)/Kconfig is sourced.=C2=A0 We should drop that.=C2=A0 </blockqu=
ote></div></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">You can=
&#39;t. Try dropping it...</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=
=3D"quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">And the<br>
changelog doesn&#39;t say you&#39;re going from V=3D1 to V=3D0.<br></blockq=
uote></div></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I sent=
 v2 just after.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div cla=
ss=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<font color=3D"#888888"><br>
--<br>
Tom<br>
</font><br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div></div></div>

--001a113d376a93853a05598982a3--
