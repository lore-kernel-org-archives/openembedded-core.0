Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id ABD6874631
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 10:53:30 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id y7so1307171wrh.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 03:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZszTa4ge6yXXPz2r/OjbpLrIp5mGb8eLqF4Rfa6B8I8=;
	b=oCHaC1RCg1A1ew2t64L3GdNEUqxFlrfb5FcvmNMvogJHlDlx/7QZ6meS/w1h/TzBKe
	es7KZJv7B/gTcc87kAQ7Xid3OXJdclkB5OeCbazdPpiq6yFe7Vu8W2NljRgD0v7o/leq
	JLJj9/QtOxxdFeJnLYKb301+lADxha0c1buVDwDksmPDQjIsj7pLBCWNSn8Mfrtr+BoK
	uK8JRR6qL2gFgHfWddV79w6MVutVBx5R+1kj9pI8LVz96yxC9MKw6N+0Iv9ZNS0xLNq/
	QPp0nW5rPyQLoJNFBgKINKf5EjH1VrwbKKkFgyqlGLZ15j9tcUAyWY/jVo+vg1r3yU6T
	64Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZszTa4ge6yXXPz2r/OjbpLrIp5mGb8eLqF4Rfa6B8I8=;
	b=Fxp9QmwpoAjE6Lm8hT88oncOzt048+2EdBCWdfyt5GcIsJ8Z6m4Uz8lQ/T7ja9ShWj
	Af3dqier0mjUXU0e01sNUIdXhoPZ5YaZsJeAaKJdCfF8bBAH7LETv4tbvUkzezyIH7aT
	bY6qIS6L3JgyqXUmsJf5T2CyNK6/FUFrFxfaQdHLjEL0jfZZf9WBcTLcrfJuMxm7hDjQ
	tpxF9luAfVDDG+OOgxNh2C41QYfzBDWLf/amx8y0ExAuiMt46FxwCj9jCg+R2PI+17bf
	Fl1QVP6zmMtMbgxoHjJA3ibc1J+gEdraYb+HrQSSP9GmpgbMPvf9/79Os3su2+pGe4tg
	xA/g==
X-Gm-Message-State: ALQs6tBOX71eshYfOnKwAihFCwbPtglHJcGxEUIMCYb7NRdX+Ac8q2k/
	OLRn0NGF/aYoq1vfP1xyt+oeico6yiDe7GmeFC4=
X-Google-Smtp-Source: AIpwx4+zbRr9nbzZJ7gIJNZd/wUwm36DCk+n2CS6OWMjX4sKKfMnLLhmdpjbEr8MPNPJ7XNMiWgdNbpKdm0OMGAbRbQ=
X-Received: by 10.223.142.17 with SMTP id n17mr894156wrb.133.1523444011121;
	Wed, 11 Apr 2018 03:53:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.126.12 with HTTP; Wed, 11 Apr 2018 03:53:30 -0700 (PDT)
In-Reply-To: <20180410143532.31916-1-ross.burton@intel.com>
References: <20180410143532.31916-1-ross.burton@intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 11 Apr 2018 12:53:30 +0200
Message-ID: <CA+chaQdRDvvi-2UgmbC_=yjiuN-8yqdrk5K1yzTh9CVKZsXiJA@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: use pigz to create .gz files
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
X-List-Received-Date: Wed, 11 Apr 2018 10:53:31 -0000
Content-Type: multipart/alternative; boundary="f403045f50e21e41c0056990735f"

--f403045f50e21e41c0056990735f
Content-Type: text/plain; charset="UTF-8"

What about using pigz for sstate-cache archives?

On Tue, Apr 10, 2018 at 4:35 PM, Ross Burton <ross.burton@intel.com> wrote:

> Since pigz is no longer a drop-in replacement for gzip (oe-core 1624b7b)
> the
> image creation has been using gzip instead of pigz, despite still
> depending on
> pigz-native.  Fix this by invoking pigz explicitly.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/image_types.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.
> bbclass
> index e872ae20982..00a00d318f4 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -281,7 +281,7 @@ COMPRESSIONTYPES ?= ""
>
>  CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip sum md5sum sha1sum
> sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vdi qcow2
> ${COMPRESSIONTYPES}"
>  CONVERSION_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_
> SUFFIX}.${type}"
> -CONVERSION_CMD_gz = "gzip -f -9 -n -c ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}
> > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
> +CONVERSION_CMD_gz = "pigz -f -9 -n -c ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}
> > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
>  CONVERSION_CMD_bz2 = "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_
> SUFFIX}.${type}"
>  CONVERSION_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS}
> --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} >
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
>  CONVERSION_CMD_lz4 = "lz4 -9 -z -l ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045f50e21e41c0056990735f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">What about using pigz for sstate-cache archives?</div><div=
 class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Apr 10, 2018 =
at 4:35 PM, Ross Burton <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton=
@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">Since pigz is no longer a drop-in replacem=
ent for gzip (oe-core 1624b7b) the<br>
image creation has been using gzip instead of pigz, despite still depending=
 on<br>
pigz-native.=C2=A0 Fix this by invoking pigz explicitly.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/image_types.<wbr>bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/image_types.<wbr>bbclass b/meta/classes/image_typ=
es.<wbr>bbclass<br>
index e872ae20982..00a00d318f4 100644<br>
--- a/meta/classes/image_types.<wbr>bbclass<br>
+++ b/meta/classes/image_types.<wbr>bbclass<br>
@@ -281,7 +281,7 @@ COMPRESSIONTYPES ?=3D &quot;&quot;<br>
<br>
=C2=A0CONVERSIONTYPES =3D &quot;gz bz2 lzma xz lz4 lzo zip sum md5sum sha1s=
um sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vdi qcow2 ${COM=
PRESSIONTYPES}&quot;<br>
=C2=A0CONVERSION_CMD_lzma =3D &quot;lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME=
_<wbr>SUFFIX}.${type}&quot;<br>
-CONVERSION_CMD_gz =3D &quot;gzip -f -9 -n -c ${IMAGE_NAME}${IMAGE_NAME_<wb=
r>SUFFIX}.${type} &gt; ${IMAGE_NAME}${IMAGE_NAME_<wbr>SUFFIX}.${type}.gz&qu=
ot;<br>
+CONVERSION_CMD_gz =3D &quot;pigz -f -9 -n -c ${IMAGE_NAME}${IMAGE_NAME_<wb=
r>SUFFIX}.${type} &gt; ${IMAGE_NAME}${IMAGE_NAME_<wbr>SUFFIX}.${type}.gz&qu=
ot;<br>
=C2=A0CONVERSION_CMD_bz2 =3D &quot;pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_<=
wbr>SUFFIX}.${type}&quot;<br>
=C2=A0CONVERSION_CMD_xz =3D &quot;xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_=
THREADS} --check=3D${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_<wbr>SUF=
FIX}.${type} &gt; ${IMAGE_NAME}${IMAGE_NAME_<wbr>SUFFIX}.${type}.xz&quot;<b=
r>
=C2=A0CONVERSION_CMD_lz4 =3D &quot;lz4 -9 -z -l ${IMAGE_NAME}${IMAGE_NAME_<=
wbr>SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_<wbr>SUFFIX}.${type}.lz4&quot=
;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.11.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--f403045f50e21e41c0056990735f--
