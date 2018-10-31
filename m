Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id 94FE97503E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2018 19:24:28 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id c16-v6so18421955qtj.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2018 12:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8soDumDGt9Eg5QL9qbXI8ae+GsLea5OVlU+q3JxJ8d8=;
	b=qlUxwOxOr2ZR4puJIGSNaeoUvz24rKQ1z7TOyGM6wW+dWUBdSCqcUp8kCvMJ4+GamM
	nI7ur33aHyDDlvAYdcSR/vAEejVb/2UQm2xuKZHGzh9ZnUVAm2PmBT8JHBoQjVqCJUjc
	XdR6pY5ZDFurUEaM/KfDojGYWoXFBpQAcWDYzS9AUb3JSM3m5oEl/ndblR6YrB04rs2i
	vPMqFYM76CImxFr/4Oho1ZKgStsoUAfqD4upgbH5kAHoD/p/xRGsrowrFGk1CYI0KtGJ
	uq2XfERiYdg5fETO0P0SSNOdsHYuWKSz46H291fPK1gFfQC6wL/ZnTGGb+LmpcwAB7Wu
	vL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8soDumDGt9Eg5QL9qbXI8ae+GsLea5OVlU+q3JxJ8d8=;
	b=WDTKzmTsFOhF8MMr4xp2q1pjC66pl5FiI4RljNiMh+jbaWCA4SQlJKnDI+8YJvKqbq
	M5TQJr67Fnug9QCn91EhG7psdFxmkFEGO582kWTHhUeuiOdPYIOhn0cPzdNTeWQz+QRW
	RFT3qL1M8Q8OOfAstJmFe084TDiZSSV3KWvfNxZwVEC2lZXLGFgFh493MqZrr+rjODEL
	Iil8e94Kj3G1iX77Uv7fyrO6e8okBhzN1g2sGUEprFU6S3PrkWR5I/jEmZvOyynU3fhA
	XGcjDQh5/lU7aNtI1nfztmIM8inz/wS3QE+sEaD2mZBAJYwzEW9l2gySU4V3QJ2xB/2A
	SiCw==
X-Gm-Message-State: AGRZ1gLOz3Vy83mjoz5zM3OLsa+R2TMlqvcqteHu5WUYW2l+UTMIryMn
	RUNqvLED5PQhykl4wWH/vxjA9iz94qfm48nduhw=
X-Google-Smtp-Source: AJdET5dQxwwih+adaY/HzTIK0ONe58kBkUHWSeh2faZcbTZH1IUz/cZkWQzQantoirRPumE56izN44/KjtQLSJdXIQk=
X-Received: by 2002:a0c:98a6:: with SMTP id f35mr3852376qvd.224.1541013869249; 
	Wed, 31 Oct 2018 12:24:29 -0700 (PDT)
MIME-Version: 1.0
References: <20181031185423.21100-1-abrodkin@synopsys.com>
In-Reply-To: <20181031185423.21100-1-abrodkin@synopsys.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 31 Oct 2018 12:24:16 -0700
Message-ID: <CAMKF1sp-gp85SuC1mgmifmki28ZxZ_v0K0t2dK5hEFx3yXmfcQ@mail.gmail.com>
To: Alexey Brodkin <alexey.brodkin@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] perf: Disable libunwind for ARC & RISCV64
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
X-List-Received-Date: Wed, 31 Oct 2018 19:24:28 -0000
Content-Type: multipart/alternative; boundary="000000000000454a8205798b404f"

--000000000000454a8205798b404f
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 31, 2018 at 11:54 AM Alexey Brodkin <alexey.brodkin@synopsys.com>
wrote:

> libunwind is not yet ported for ARC & RISCV64 and on attempt
> to build it for those arches we just get an error message.
>
> If we explicitly disable libunwind it is gracefully handled by
> perf build system and it just gets configured to not use it
> so perf is still usable even on those arches.
>

This looks ok to me

>
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-kernel/perf/perf.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/
> perf.bb
> index af099043e1..bae4948751 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -26,6 +26,10 @@ PACKAGECONFIG[jvmti] = ",NO_JVMTI=1"
>  PACKAGECONFIG[audit] = ",NO_LIBAUDIT=1,audit"
>  PACKAGECONFIG[manpages] = ",,xmlto-native asciidoc-native"
>
> +# libunwind is not yet ported for some architectures
> +PACKAGECONFIG_remove_arc = "libunwind"
> +PACKAGECONFIG_remove_riscv64 = "libunwind"
> +
>  DEPENDS = " \
>      virtual/${MLPREFIX}libc \
>      ${MLPREFIX}elfutils \
> --
> 2.16.2
>
>

--000000000000454a8205798b404f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed,=
 Oct 31, 2018 at 11:54 AM Alexey Brodkin &lt;<a href=3D"mailto:alexey.brodk=
in@synopsys.com">alexey.brodkin@synopsys.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">libunwind is not yet ported for ARC &amp; RISCV64 =
and on attempt<br>
to build it for those arches we just get an error message.<br>
<br>
If we explicitly disable libunwind it is gracefully handled by<br>
perf build system and it just gets configured to not use it<br>
so perf is still usable even on those arches.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">This looks ok to=
 me=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><br>
Signed-off-by: Alexey Brodkin &lt;<a href=3D"mailto:abrodkin@synopsys.com" =
target=3D"_blank">abrodkin@synopsys.com</a>&gt;<br>
Cc: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">ra=
j.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a> | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"nor=
eferrer" target=3D"_blank">perf.bb</a> b/meta/recipes-kernel/perf/<a href=
=3D"http://perf.bb" rel=3D"noreferrer" target=3D"_blank">perf.bb</a><br>
index af099043e1..bae4948751 100644<br>
--- a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a><br>
+++ b/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a><br>
@@ -26,6 +26,10 @@ PACKAGECONFIG[jvmti] =3D &quot;,NO_JVMTI=3D1&quot;<br>
=C2=A0PACKAGECONFIG[audit] =3D &quot;,NO_LIBAUDIT=3D1,audit&quot;<br>
=C2=A0PACKAGECONFIG[manpages] =3D &quot;,,xmlto-native asciidoc-native&quot=
;<br>
<br>
+# libunwind is not yet ported for some architectures<br>
+PACKAGECONFIG_remove_arc =3D &quot;libunwind&quot;<br>
+PACKAGECONFIG_remove_riscv64 =3D &quot;libunwind&quot;<br>
+<br>
=C2=A0DEPENDS =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0virtual/${MLPREFIX}libc \<br>
=C2=A0 =C2=A0 =C2=A0${MLPREFIX}elfutils \<br>
-- <br>
2.16.2<br>
<br>
</blockquote></div></div>

--000000000000454a8205798b404f--
