Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
	[209.85.208.43])
	by mail.openembedded.org (Postfix) with ESMTP id BAD446BA0E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 10:50:56 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id k21so21160215edq.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 03:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qhcpPxeXvYoiT0LfAnWoOMMboJIZkWaEpp6+UdDerRo=;
	b=aOi1GmfZYc+oB7ywvka6UHPH8XiusqgLXCzhAq5uZgTCPW2Xq/evxU9qp1medqVJ0C
	goWqeqPV4+NSGT81mKgHxtX93XoW1v3D4kgH3ffbpg6XBFEJo5NVxoccHf5ELRFmB2nu
	I8mVV7iG6D1Bf0JcNYgcNhlfP0u6vmFXQ8+R0SQyQzM00k7zM/EDIUrnZbsUVC6d7E1o
	p06hDDKYi37MrlirTmC60QTHUQA9Dam1DSVZg/gg7FHNWyLSf8lr+Ehy5Er+Da6o6ylE
	2ZXrJ40IZuVqiuX3unFfA//3bFDg84uAz/Ct8ne3DRG/nYokAbUWq4pHA1k34sdNDZwJ
	hPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qhcpPxeXvYoiT0LfAnWoOMMboJIZkWaEpp6+UdDerRo=;
	b=K/an0057X76X/NUUfMoO7O6v4cCvCV67bI85DKdZR2HdjJlDOG6be1F+/c1AnwRMtc
	4v5ohbOgoHH+wOvZ3F25Thx/U7cRIESsqh7OUXZSCeXomMA6r9ewR6Yumdo70IezCh2X
	5HPFR13JS4CarWFaeY7WyPh7vPdYRxLqKhHD4Wg5qwV2vthqn8+5gE11Wy965RAiYgEu
	yDtSbUKN6Bs6MJVFo6UtBP+STjB8SV1rnawrEIGur8xrTPo46bJAruHX2XzPlGCJLVpa
	k/1r6emJDVwi0MlNerYeYiYqL9aJZXTKyBnB7Y7mVjHlJBNrAfgyUtx8GLjP/Jn1EMmn
	YgPg==
X-Gm-Message-State: APjAAAWEVVoU+nK2KqB2I4szQ2Hs2wyohLMcx+In/RynAMyPyfnoimSD
	G2F12VI3tzYZawNPjAiCClgiJ8YcbuQ+/zXdnDI=
X-Google-Smtp-Source: APXvYqxgFKNvaMPPmifkzeGPdvIK4dFSrZTJ/X6fx/y1D5sNmbFGIMJG7BpFRhDmoKz8tUunSohoAPGMN74sMVLEdwU=
X-Received: by 2002:a17:906:1dcc:: with SMTP id
	v12mr61037155ejh.110.1561373457359; 
	Mon, 24 Jun 2019 03:50:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1561348290.git.akuster808@gmail.com>
	<741d44e74b13f0a21a9f3bd3226dfb2c7615840e.1561348290.git.akuster808@gmail.com>
In-Reply-To: <741d44e74b13f0a21a9f3bd3226dfb2c7615840e.1561348290.git.akuster808@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 24 Jun 2019 12:50:47 +0200
Message-ID: <CA+chaQcJiH9HfmZ2_8hiej_dcTBj_+yTMdtj31_ZddueAEf5bg@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Warrior][ 02/19] linux-yocto: Add scsi_debug module when ptest is in DISTRO_FEATURES
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
X-List-Received-Date: Mon, 24 Jun 2019 10:50:57 -0000
Content-Type: multipart/alternative; boundary="00000000000049a78d058c0f962c"

--00000000000049a78d058c0f962c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I think this will backport also this warning:
http://lists.openembedded.org/pipermail/openembedded-core/2019-June/283912.=
html

can it be backported together with the fix for it from Bruce:
http://lists.openembedded.org/pipermail/openembedded-core/2019-June/283913.=
html
I haven't noticed the fix itself on ML yet.


On Mon, Jun 24, 2019 at 5:55 AM Armin Kuster <akuster808@gmail.com> wrote:

> From: Mariano L=C3=B3pez <just.another.mariano@gmail.com>
>
> util-linux ptest requires the scsi_debug module to perform eject/mount
> tests. This will conditionally add scsi_debug module when ptest is in
> DISTRO_FEATURES.
>
> This doesn't include linux-yocto-tiny because the resulting image will
> be too big and do_image would complain about this.
>
> [YOCTO #13301]
>
> Signed-off-by: Mariano L=C3=B3pez <just.another.mariano@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb | 1 +
>  meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb  | 1 +
>  meta/recipes-kernel/linux/linux-yocto_4.19.bb    | 1 +
>  meta/recipes-kernel/linux/linux-yocto_5.0.bb     | 1 +
>  4 files changed, 4 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> index 6604bdf..0836dc7 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> @@ -41,3 +41,4 @@ KERNEL_FEATURES_append =3D " ${KERNEL_EXTRA_FEATURES}"
>  KERNEL_FEATURES_append_qemuall=3D" cfg/virtio.scc"
>  KERNEL_FEATURES_append_qemux86=3D" cfg/sound.scc cfg/paravirt_kvm.scc"
>  KERNEL_FEATURES_append_qemux86-64=3D" cfg/sound.scc cfg/paravirt_kvm.scc=
"
> +KERNEL_FEATURES_append =3D "${@bb.utils.contains("DISTRO_FEATURES",
> "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
> b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
> index 1fe28b1..b5e415f 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
> @@ -41,3 +41,4 @@ KERNEL_FEATURES_append =3D " ${KERNEL_EXTRA_FEATURES}"
>  KERNEL_FEATURES_append_qemuall=3D" cfg/virtio.scc"
>  KERNEL_FEATURES_append_qemux86=3D" cfg/sound.scc cfg/paravirt_kvm.scc"
>  KERNEL_FEATURES_append_qemux86-64=3D" cfg/sound.scc cfg/paravirt_kvm.scc=
"
> +KERNEL_FEATURES_append =3D "${@bb.utils.contains("DISTRO_FEATURES",
> "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
> b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
> index a5fdafe..cda4ecf 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
> @@ -47,3 +47,4 @@ KERNEL_FEATURES_append_qemuall=3D" cfg/virtio.scc"
>  KERNEL_FEATURES_append_qemux86=3D" cfg/sound.scc cfg/paravirt_kvm.scc"
>  KERNEL_FEATURES_append_qemux86-64=3D" cfg/sound.scc cfg/paravirt_kvm.scc=
"
>  KERNEL_FEATURES_append =3D " ${@bb.utils.contains("TUNE_FEATURES", "mx32=
",
> " cfg/x32.scc", "" ,d)}"
> +KERNEL_FEATURES_append =3D " ${@bb.utils.contains("DISTRO_FEATURES",
> "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> index da795d9..8aec315 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> @@ -50,3 +50,4 @@ KERNEL_FEATURES_append_qemuall=3D" cfg/virtio.scc"
>  KERNEL_FEATURES_append_qemux86=3D" cfg/sound.scc cfg/paravirt_kvm.scc"
>  KERNEL_FEATURES_append_qemux86-64=3D" cfg/sound.scc cfg/paravirt_kvm.scc=
"
>  KERNEL_FEATURES_append =3D " ${@bb.utils.contains("TUNE_FEATURES", "mx32=
",
> " cfg/x32.scc", "" ,d)}"
> +KERNEL_FEATURES_append =3D " ${@bb.utils.contains("DISTRO_FEATURES",
> "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000049a78d058c0f962c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I think this will backport also thi=
s warning:</div><div><a href=3D"http://lists.openembedded.org/pipermail/ope=
nembedded-core/2019-June/283912.html">http://lists.openembedded.org/piperma=
il/openembedded-core/2019-June/283912.html</a><br></div><div><br></div><div=
>can it be backported together with the fix for it from Bruce:</div><div><a=
 href=3D"http://lists.openembedded.org/pipermail/openembedded-core/2019-Jun=
e/283913.html">http://lists.openembedded.org/pipermail/openembedded-core/20=
19-June/283913.html</a><br></div><div>I haven&#39;t noticed the fix itself =
on ML yet.</div><div><br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Mon, Jun 24, 2019 at 5:55 AM Armin Kuster=
 &lt;<a href=3D"mailto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Mari=
ano L=C3=B3pez &lt;<a href=3D"mailto:just.another.mariano@gmail.com" target=
=3D"_blank">just.another.mariano@gmail.com</a>&gt;<br>
<br>
util-linux ptest requires the scsi_debug module to perform eject/mount<br>
tests. This will conditionally add scsi_debug module when ptest is in<br>
DISTRO_FEATURES.<br>
<br>
This doesn&#39;t include linux-yocto-tiny because the resulting image will<=
br>
be too big and do_image would complain about this.<br>
<br>
[YOCTO #13301]<br>
<br>
Signed-off-by: Mariano L=C3=B3pez &lt;<a href=3D"mailto:just.another.marian=
o@gmail.com" target=3D"_blank">just.another.mariano@gmail.com</a>&gt;<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com" tar=
get=3D"_blank">akuster808@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.19.bb" r=
el=3D"noreferrer" target=3D"_blank">linux-yocto-rt_4.19.bb</a> | 1 +<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_5.0.bb" re=
l=3D"noreferrer" target=3D"_blank">linux-yocto-rt_5.0.bb</a>=C2=A0 | 1 +<br=
>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.19.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_4.19.bb</a>=C2=A0 =C2=A0 | 1 =
+<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.0.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_5.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0| 1 +<br>
=C2=A04 files changed, 4 insertions(+)<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.1=
9.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_4.19.bb</a> b/met=
a/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.19.bb" rel=3D"nor=
eferrer" target=3D"_blank">linux-yocto-rt_4.19.bb</a><br>
index 6604bdf..0836dc7 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.19.bb" r=
el=3D"noreferrer" target=3D"_blank">linux-yocto-rt_4.19.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.19.bb" r=
el=3D"noreferrer" target=3D"_blank">linux-yocto-rt_4.19.bb</a><br>
@@ -41,3 +41,4 @@ KERNEL_FEATURES_append =3D &quot; ${KERNEL_EXTRA_FEATURES=
}&quot;<br>
=C2=A0KERNEL_FEATURES_append_qemuall=3D&quot; cfg/virtio.scc&quot;<br>
=C2=A0KERNEL_FEATURES_append_qemux86=3D&quot; cfg/sound.scc cfg/paravirt_kv=
m.scc&quot;<br>
=C2=A0KERNEL_FEATURES_append_qemux86-64=3D&quot; cfg/sound.scc cfg/paravirt=
_kvm.scc&quot;<br>
+KERNEL_FEATURES_append =3D &quot;${@bb.utils.contains(&quot;DISTRO_FEATURE=
S&quot;, &quot;ptest&quot;, &quot; features/scsi/scsi-debug.scc&quot;, &quo=
t;&quot; ,d)}&quot;<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_5.0=
.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_5.0.bb</a> b/meta/=
recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_5.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">linux-yocto-rt_5.0.bb</a><br>
index 1fe28b1..b5e415f 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_5.0.bb" re=
l=3D"noreferrer" target=3D"_blank">linux-yocto-rt_5.0.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_5.0.bb" re=
l=3D"noreferrer" target=3D"_blank">linux-yocto-rt_5.0.bb</a><br>
@@ -41,3 +41,4 @@ KERNEL_FEATURES_append =3D &quot; ${KERNEL_EXTRA_FEATURES=
}&quot;<br>
=C2=A0KERNEL_FEATURES_append_qemuall=3D&quot; cfg/virtio.scc&quot;<br>
=C2=A0KERNEL_FEATURES_append_qemux86=3D&quot; cfg/sound.scc cfg/paravirt_kv=
m.scc&quot;<br>
=C2=A0KERNEL_FEATURES_append_qemux86-64=3D&quot; cfg/sound.scc cfg/paravirt=
_kvm.scc&quot;<br>
+KERNEL_FEATURES_append =3D &quot;${@bb.utils.contains(&quot;DISTRO_FEATURE=
S&quot;, &quot;ptest&quot;, &quot; features/scsi/scsi-debug.scc&quot;, &quo=
t;&quot; ,d)}&quot;<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.19.b=
b" rel=3D"noreferrer" target=3D"_blank">linux-yocto_4.19.bb</a> b/meta/reci=
pes-kernel/linux/<a href=3D"http://linux-yocto_4.19.bb" rel=3D"noreferrer" =
target=3D"_blank">linux-yocto_4.19.bb</a><br>
index a5fdafe..cda4ecf 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.19.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_4.19.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.19.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_4.19.bb</a><br>
@@ -47,3 +47,4 @@ KERNEL_FEATURES_append_qemuall=3D&quot; cfg/virtio.scc&qu=
ot;<br>
=C2=A0KERNEL_FEATURES_append_qemux86=3D&quot; cfg/sound.scc cfg/paravirt_kv=
m.scc&quot;<br>
=C2=A0KERNEL_FEATURES_append_qemux86-64=3D&quot; cfg/sound.scc cfg/paravirt=
_kvm.scc&quot;<br>
=C2=A0KERNEL_FEATURES_append =3D &quot; ${@bb.utils.contains(&quot;TUNE_FEA=
TURES&quot;, &quot;mx32&quot;, &quot; cfg/x32.scc&quot;, &quot;&quot; ,d)}&=
quot;<br>
+KERNEL_FEATURES_append =3D &quot; ${@bb.utils.contains(&quot;DISTRO_FEATUR=
ES&quot;, &quot;ptest&quot;, &quot; features/scsi/scsi-debug.scc&quot;, &qu=
ot;&quot; ,d)}&quot;<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.0.bb=
" rel=3D"noreferrer" target=3D"_blank">linux-yocto_5.0.bb</a> b/meta/recipe=
s-kernel/linux/<a href=3D"http://linux-yocto_5.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">linux-yocto_5.0.bb</a><br>
index da795d9..8aec315 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.0.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_5.0.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.0.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_5.0.bb</a><br>
@@ -50,3 +50,4 @@ KERNEL_FEATURES_append_qemuall=3D&quot; cfg/virtio.scc&qu=
ot;<br>
=C2=A0KERNEL_FEATURES_append_qemux86=3D&quot; cfg/sound.scc cfg/paravirt_kv=
m.scc&quot;<br>
=C2=A0KERNEL_FEATURES_append_qemux86-64=3D&quot; cfg/sound.scc cfg/paravirt=
_kvm.scc&quot;<br>
=C2=A0KERNEL_FEATURES_append =3D &quot; ${@bb.utils.contains(&quot;TUNE_FEA=
TURES&quot;, &quot;mx32&quot;, &quot; cfg/x32.scc&quot;, &quot;&quot; ,d)}&=
quot;<br>
+KERNEL_FEATURES_append =3D &quot; ${@bb.utils.contains(&quot;DISTRO_FEATUR=
ES&quot;, &quot;ptest&quot;, &quot; features/scsi/scsi-debug.scc&quot;, &qu=
ot;&quot; ,d)}&quot;<br>
-- <br>
2.7.4<br>
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

--00000000000049a78d058c0f962c--
