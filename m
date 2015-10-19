Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id C2F76607A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 19:40:05 +0000 (UTC)
Received: by igbhv6 with SMTP id hv6so60277514igb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 12:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=fKLTonNMy8OvJjMoF5H9ouGKqamFh/e9q0fMV26HWKo=;
	b=CT7c0mry9D2geI8+n8PcqtK6V6jd5yrKp5p3BQmqJgd+QTNZZA+6Hzc5SbA5oxleD9
	DasM9dLSMpOMMl4uNLKKoYEo4z/KswUVsBIiEKI3HrINNApS6FSa76kss9vFjpBwoo+T
	WMGrOqZDxTI8Zp32DU1CZVyGDLLLCg4d0OkGB44U692cEvrTlYscfVVXxCsDPwKUx6Dx
	zmlgrLxchBTAsrysbFmRF2QrRN7gCy5O5d/UAijQn2rP49MJjSZShO/w0ntOiB6Q3OOG
	gXkxFTxQdnT/CT3bSONTE/dXblOzPFYRg3hNhd90kbMmzQ4MS9pH9jsFPICqQsuWfHAm
	WHHA==
MIME-Version: 1.0
X-Received: by 10.50.131.229 with SMTP id op5mr16263942igb.83.1445283605694;
	Mon, 19 Oct 2015 12:40:05 -0700 (PDT)
Received: by 10.107.141.18 with HTTP; Mon, 19 Oct 2015 12:40:05 -0700 (PDT)
Received: by 10.107.141.18 with HTTP; Mon, 19 Oct 2015 12:40:05 -0700 (PDT)
In-Reply-To: <1445277812-3941-1-git-send-email-Martin.Jansa@gmail.com>
References: <1444138615-5618-1-git-send-email-Martin.Jansa@gmail.com>
	<1445277812-3941-1-git-send-email-Martin.Jansa@gmail.com>
Date: Mon, 19 Oct 2015 12:40:05 -0700
Message-ID: <CAMKF1sqz7-0GYeuqR5foRyhDA4fFOgu1AS6PjscqqD66r3imrA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][WIP[[PATCH] feature-arm-vfp.inc: respect vfpv4 when setting -mfloat-abi andARMPKGSFX_EABI
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
X-List-Received-Date: Mon, 19 Oct 2015 19:40:06 -0000
Content-Type: multipart/alternative; boundary=047d7b3a9bc0ead12b05227a4fd0

--047d7b3a9bc0ead12b05227a4fd0
Content-Type: text/plain; charset=UTF-8

Why doesnt vfpv4 also imply vfp ? Isnt it a super set
On Oct 19, 2015 11:03 AM, "Martin Jansa" <martin.jansa@gmail.com> wrote:

> * without this change it wasn't possible to use call-convention hard
>   together with vfpv4
> * also use ' inside quoted values
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/conf/machine/include/arm/feature-arm-vfp.inc | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc
> b/meta/conf/machine/include/arm/feature-arm-vfp.inc
> index 13927ff..440950a 100644
> --- a/meta/conf/machine/include/arm/feature-arm-vfp.inc
> +++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
> @@ -1,9 +1,10 @@
>  TUNEVALID[vfp] = "Enable Vector Floating Point (vfp) unit."
> -ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "vfp", "-vfp", ""
> ,d)}"
> +ARMPKGSFX_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfp', '-vfp', ''
> ,d)}"
>
>  TUNEVALID[vfpv4] = "Enable Vector Floating Point Version 4 (vfpv4) unit."
> -ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "vfpv4",
> "-vfpv4", "" ,d)}"
> +ARMPKGSFX_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv4',
> '-vfpv4', '' ,d)}"
>
>  TUNEVALID[callconvention-hard] = "Enable EABI hard float call convention,
> requires VFP."
> -TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "vfp",
> bb.utils.contains("TUNE_FEATURES", "callconvention-hard", "
> -mfloat-abi=hard", " -mfloat-abi=softfp", d), "" ,d)}"
> -ARMPKGSFX_EABI .= "${@bb.utils.contains("TUNE_FEATURES", [
> "callconvention-hard", "vfp" ], "hf", "", d)}"
> +TUNE_CCARGS .= "${@bb.utils.contains_any('TUNE_FEATURES', [ 'vfp',
> 'vfpv4' ], bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', '
> -mfloat-abi=hard', ' -mfloat-abi=softfp', d), '' ,d)}"
> +ARMPKGSFX_EABI .= "${@bb.utils.contains('TUNE_FEATURES', [
> 'callconvention-hard', 'vfp' ], 'hf', '', d)}"
> +ARMPKGSFX_EABI .= "${@bb.utils.contains('TUNE_FEATURES', [
> 'callconvention-hard', 'vfpv4' ], 'hf', '', d)}"
> --
> 2.6.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--047d7b3a9bc0ead12b05227a4fd0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Why doesnt vfpv4 also imply vfp ? Isnt it a super set</p>
<div class=3D"gmail_quote">On Oct 19, 2015 11:03 AM, &quot;Martin Jansa&quo=
t; &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>=
&gt; wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">* withou=
t this change it wasn&#39;t possible to use call-convention hard<br>
=C2=A0 together with vfpv4<br>
* also use &#39; inside quoted values<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com">M=
artin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/machine/include/arm/feature-arm-vfp.inc | 9 +++++----<br>
=C2=A01 file changed, 5 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc b/meta/conf/=
machine/include/arm/feature-arm-vfp.inc<br>
index 13927ff..440950a 100644<br>
--- a/meta/conf/machine/include/arm/feature-arm-vfp.inc<br>
+++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc<br>
@@ -1,9 +1,10 @@<br>
=C2=A0TUNEVALID[vfp] =3D &quot;Enable Vector Floating Point (vfp) unit.&quo=
t;<br>
-ARMPKGSFX_FPU .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quot;, &=
quot;vfp&quot;, &quot;-vfp&quot;, &quot;&quot; ,d)}&quot;<br>
+ARMPKGSFX_FPU .=3D &quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39;, &#3=
9;vfp&#39;, &#39;-vfp&#39;, &#39;&#39; ,d)}&quot;<br>
<br>
=C2=A0TUNEVALID[vfpv4] =3D &quot;Enable Vector Floating Point Version 4 (vf=
pv4) unit.&quot;<br>
-ARMPKGSFX_FPU .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quot;, &=
quot;vfpv4&quot;, &quot;-vfpv4&quot;, &quot;&quot; ,d)}&quot;<br>
+ARMPKGSFX_FPU .=3D &quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39;, &#3=
9;vfpv4&#39;, &#39;-vfpv4&#39;, &#39;&#39; ,d)}&quot;<br>
<br>
=C2=A0TUNEVALID[callconvention-hard] =3D &quot;Enable EABI hard float call =
convention, requires VFP.&quot;<br>
-TUNE_CCARGS .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quot;, &qu=
ot;vfp&quot;, bb.utils.contains(&quot;TUNE_FEATURES&quot;, &quot;callconven=
tion-hard&quot;, &quot; -mfloat-abi=3Dhard&quot;, &quot; -mfloat-abi=3Dsoft=
fp&quot;, d), &quot;&quot; ,d)}&quot;<br>
-ARMPKGSFX_EABI .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quot;, =
[ &quot;callconvention-hard&quot;, &quot;vfp&quot; ], &quot;hf&quot;, &quot=
;&quot;, d)}&quot;<br>
+TUNE_CCARGS .=3D &quot;${@bb.utils.contains_any(&#39;TUNE_FEATURES&#39;, [=
 &#39;vfp&#39;, &#39;vfpv4&#39; ], bb.utils.contains(&#39;TUNE_FEATURES&#39=
;, &#39;callconvention-hard&#39;, &#39; -mfloat-abi=3Dhard&#39;, &#39; -mfl=
oat-abi=3Dsoftfp&#39;, d), &#39;&#39; ,d)}&quot;<br>
+ARMPKGSFX_EABI .=3D &quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39;, [ =
&#39;callconvention-hard&#39;, &#39;vfp&#39; ], &#39;hf&#39;, &#39;&#39;, d=
)}&quot;<br>
+ARMPKGSFX_EABI .=3D &quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39;, [ =
&#39;callconvention-hard&#39;, &#39;vfpv4&#39; ], &#39;hf&#39;, &#39;&#39;,=
 d)}&quot;<br>
--<br>
2.6.1<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--047d7b3a9bc0ead12b05227a4fd0--
