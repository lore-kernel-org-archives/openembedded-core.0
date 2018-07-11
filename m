Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5C22E784DA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 15:20:55 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id j5-v6so12059168wrr.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 08:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=k3pAMvs39bBV2dB+5Z0VdfdF+XIpfwK/cPIFpExcrhw=;
	b=hPF5172oOOPOySNcpb4P+bnWhGQEMBSnKqBt3gusTX7bPYDvqInA0JaZaIVv5lJ9p1
	YU/oPXFDRW/EjEAAL8R78IrVStLgX6HeZj5BUHBartGZwvi78zWI5q9tOQ4bdke1RQ1U
	J5ihap9VorSkviBTH7xip2c4MCGhksgejl8nPh+82dKt5MGhD8fb0BxeDy/hjHQxf3b6
	TP7Ud06kDNKY1xzV7QhO8jD04ZpXL2cCJyx/UV2kVwBpgjJFe8w0Kli0PixnYttDGYhU
	LzCo7bdfffK2470oO34kzOfa2L8Eaj9VRJal3hdiSEAqX4q9K4OCCcg2CiSZM6tDxLBQ
	jq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=k3pAMvs39bBV2dB+5Z0VdfdF+XIpfwK/cPIFpExcrhw=;
	b=M/zJ2BC5+3EqCYOESR1UfkUnhz1IdCQen2wiOnhJhUUj+BTKhus6u/XNRupSN485qi
	6SIL6Z6K3r8LSOEhazhoCh60UqsPGkMYClT4m2TaaMFbJWPPi37lzugO8WrWMbDJ8+pL
	ztX/EWMlIMTHqGQNcZAPc6/qJzesVh4Skl8SuPCv0slHs+bvtOH0epISYt5ARw/sangZ
	UEZXPHsUKSF+fvFQSBYfWr09A7meLB51y6nS5kFtYqVI2Fe2X+XKRj4X8gV7kSza84gh
	DfPL978D8X4EnHWhJuvj+WeuW7cJcvX4oeURiQmR9Lwqug8spsM6nCCio5m6gv/eb+sO
	BNdQ==
X-Gm-Message-State: APt69E3x79rE6ORAMLuZFTO7vGXmbc+ST2gpqVA7ajwwuYpQDF6oAT55
	kqONJDsklQxZoTV1m4S0XwimgVulSIXCie7d+Mc=
X-Google-Smtp-Source: AAOMgpeXA9N85W+yIECDYD41AfW6t/MTPFxZG9SABP7R2CZGLD6Isj8khkbxIiP+C3BZFNJTSbu99PvNfek6NWzUgi4=
X-Received: by 2002:adf:8541:: with SMTP id
	59-v6mr19868221wrh.223.1531322456192; 
	Wed, 11 Jul 2018 08:20:56 -0700 (PDT)
MIME-Version: 1.0
References: <20180711150308.30275-1-marex@denx.de>
In-Reply-To: <20180711150308.30275-1-marex@denx.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 11 Jul 2018 17:20:46 +0200
Message-ID: <CA+chaQeD8xFEZncStxX_jd4Zme6g8E-c9bnVE3DOPpDyEn1b3Q@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] u-boot: Add missing dependency on swig
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
X-List-Received-Date: Wed, 11 Jul 2018 15:20:56 -0000
Content-Type: multipart/alternative; boundary="00000000000009bad00570bacb11"

--00000000000009bad00570bacb11
Content-Type: text/plain; charset="UTF-8"

Doesn't it add dependency on python as well?

It was failing before RSS when swig-native was autodetected in sysroot:
https://www.mail-archive.com/yocto@yoctoproject.org/msg38214.html
https://lists.yoctoproject.org/pipermail/yocto/2017-October/038347.html
IIRC it fails to build only when the Python.h is also missing on host,
which makes it even worse.

On Wed, Jul 11, 2018 at 5:10 PM Marek Vasut <marex@denx.de> wrote:

> The U-Boot build, in particular the pylibfdt, depends on swig-native.
> Add the missing dependency.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> Cc: Otavio Salvador <otavio@ossystems.com.br>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot_2018.05.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2018.05.bb
> b/meta/recipes-bsp/u-boot/u-boot_2018.05.bb
> index 37c21dcaa3..3cdec00cbd 100644
> --- a/meta/recipes-bsp/u-boot/u-boot_2018.05.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot_2018.05.bb
> @@ -1,4 +1,4 @@
>  require u-boot-common_${PV}.inc
>  require u-boot.inc
>
> -DEPENDS += "bc-native dtc-native"
> +DEPENDS += "bc-native dtc-native swig-native"
> --
> 2.16.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000009bad00570bacb11
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Doesn&#39;t it add dependency on python as well?<div><br><=
/div><div>It was failing before RSS when swig-native was autodetected in sy=
sroot:</div><div><a href=3D"https://www.mail-archive.com/yocto@yoctoproject=
.org/msg38214.html">https://www.mail-archive.com/yocto@yoctoproject.org/msg=
38214.html</a><br></div><div><a href=3D"https://lists.yoctoproject.org/pipe=
rmail/yocto/2017-October/038347.html">https://lists.yoctoproject.org/piperm=
ail/yocto/2017-October/038347.html</a><br></div><div>IIRC it fails to build=
 only when the Python.h is also missing on host, which makes it even worse.=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Jul 11,=
 2018 at 5:10 PM Marek Vasut &lt;<a href=3D"mailto:marex@denx.de">marex@den=
x.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The U-Boot buil=
d, in particular the pylibfdt, depends on swig-native.<br>
Add the missing dependency.<br>
<br>
Signed-off-by: Marek Vasut &lt;<a href=3D"mailto:marex@denx.de" target=3D"_=
blank">marex@denx.de</a>&gt;<br>
Cc: Alexander Kanavin &lt;<a href=3D"mailto:alexander.kanavin@linux.intel.c=
om" target=3D"_blank">alexander.kanavin@linux.intel.com</a>&gt;<br>
Cc: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.br" target=
=3D"_blank">otavio@ossystems.com.br</a>&gt;<br>
Cc: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org=
" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
Cc: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_bla=
nk">ross.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2018.05.bb" rel=3D"n=
oreferrer" target=3D"_blank">u-boot_2018.05.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2018.05.bb" r=
el=3D"noreferrer" target=3D"_blank">u-boot_2018.05.bb</a> b/meta/recipes-bs=
p/u-boot/<a href=3D"http://u-boot_2018.05.bb" rel=3D"noreferrer" target=3D"=
_blank">u-boot_2018.05.bb</a><br>
index 37c21dcaa3..3cdec00cbd 100644<br>
--- a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2018.05.bb" rel=3D"n=
oreferrer" target=3D"_blank">u-boot_2018.05.bb</a><br>
+++ b/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2018.05.bb" rel=3D"n=
oreferrer" target=3D"_blank">u-boot_2018.05.bb</a><br>
@@ -1,4 +1,4 @@<br>
=C2=A0require u-boot-common_${PV}.inc<br>
=C2=A0require u-boot.inc<br>
<br>
-DEPENDS +=3D &quot;bc-native dtc-native&quot;<br>
+DEPENDS +=3D &quot;bc-native dtc-native swig-native&quot;<br>
-- <br>
2.16.2<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--00000000000009bad00570bacb11--
