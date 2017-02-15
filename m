Return-Path: <raltherr@google.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id DA1E36E630
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 04:18:03 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id j13so82303152iod.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 20:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=p+YiykXi0IL1UyzoDi5EHIIna8J9Y1VaODy/wBGgJao=;
	b=ZbY2B6JYR6UmeMHTEBCFXVMo/LdzsnduU8x2TNNkAbv/5Eaf2bM0mEf6hFope9qjOr
	oR30R62HS66dSFxCBjlgFeP9Te/70LXG4HZ95iFQv/eievK373XT6cKaiQGRbAq2UDDa
	T1jkaN+vWHINu3Rnd5+bAmCf+uyYHLSHHOI4bkW6ZERx/JQX0FqYFLwHmMHTbQDqMr7R
	wFHh0B3hTMP0ncNcoqx6TocRinll4H+rGjxBtvm1EgaiPvdHvo24qHsvRBaitkOEjt2O
	UEsjwCotbJHZlZGzBA4Wg6GZFsjW3AtCLAehEN2aGM8X2Nw7aHNaMVI9bwUtEeHb028T
	UfVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=p+YiykXi0IL1UyzoDi5EHIIna8J9Y1VaODy/wBGgJao=;
	b=lq7WfnznEiNfES9mrFo+Ibb+XdEK8xAjDIvwo4a3ilHDT7jhWGE65OSOVprFa475YU
	5Jp0Hjs8gjtrG3u9swX8vyac23P2PmXZxJ8v5Ht2jGwIoDAiYtQ79FvTCKvbkE4UJXK6
	DJ47Q6/ZvzAKkLdSyedEvUN/eed3F//BtIYRX8Ry5nNCna6nAbSyPK2n+J4j/2gQwsAJ
	6MSF9Z2IUU/n2eRSl41UPxC3dmBu6Nh8n81GyYlmqqMyPahlKwqLJPYU6r+qIxmtpEwa
	FM10RptwU64z9HFNILLLIwkl/m9Mhh9okNtp54F3xDN3kUhuQa17cKykDh9tmaE+1HIg
	9I5g==
X-Gm-Message-State: AMke39mwanttbwVO7y28Kb7tfQ2stJz8bHxBS79ELuGKN63n4pSloeWetEtFUXgK/sYSkImgUYcG+wr15/84/Qfn
X-Received: by 10.107.180.8 with SMTP id d8mr30641765iof.101.1487132283601;
	Tue, 14 Feb 2017 20:18:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.133.226 with HTTP; Tue, 14 Feb 2017 20:18:03 -0800 (PST)
In-Reply-To: <1487127821-3779-1-git-send-email-nikunj.kela@gmail.com>
References: <1487127821-3779-1-git-send-email-nikunj.kela@gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Tue, 14 Feb 2017 20:18:03 -0800
Message-ID: <CAPLgG==3Zv-ksFv9tXqeHPScjE9c6VLBWXo1ZZXRoH6M1yiU0g@mail.gmail.com>
To: Nikunj Kela <nikunj.kela@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kernel-fitimage.bbclass: Allow set/unset load address for FDT
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
X-List-Received-Date: Wed, 15 Feb 2017 04:18:04 -0000
Content-Type: multipart/alternative; boundary=94eb2c05a6567fda44054889f7c9

--94eb2c05a6567fda44054889f7c9
Content-Type: text/plain; charset=UTF-8

Reviewed-by: Rick Altherr <raltherr@google.com>

On Tue, Feb 14, 2017 at 7:03 PM, Nikunj Kela <nikunj.kela@gmail.com> wrote:

> Allow the load address for the FDT segment in the fitImage. This
> allows U-Boot to load the FDT at a specific address.
>
> UBOOT_FDT_LOADADDRESS - Specifies the load address used by u-boot
>                 for the FDT
>
> Signed-off-by: Nikunj Kela <nikunj.kela@gmail.com>
> ---
>  meta/classes/kernel-fitimage.bbclass | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-
> fitimage.bbclass
> index 1c3b4b7..7f9da49 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -127,6 +127,11 @@ EOF
>  fitimage_emit_section_dtb() {
>
>         dtb_csum="sha1"
> +       fdt_loadline=""
> +
> +       if [ -n "${UBOOT_FDT_LOADADDRESS}" ]; then
> +               fdt_loadline="load = <${UBOOT_FDT_LOADADDRESS}>;"
> +       fi
>
>         cat << EOF >> ${1}
>                  fdt@${2} {
> @@ -135,6 +140,7 @@ fitimage_emit_section_dtb() {
>                          type = "flat_dt";
>                          arch = "${UBOOT_ARCH}";
>                          compression = "none";
> +                        ${fdt_loadline}
>                          hash@1 {
>                                  algo = "${dtb_csum}";
>                          };
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c05a6567fda44054889f7c9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Rick Altherr &lt;<a href=3D"mailto:raltherr@g=
oogle.com">raltherr@google.com</a>&gt;</div><div class=3D"gmail_extra"><br>=
<div class=3D"gmail_quote">On Tue, Feb 14, 2017 at 7:03 PM, Nikunj Kela <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:nikunj.kela@gmail.com" target=3D"_blan=
k">nikunj.kela@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">Allow the load address for the FDT segment in the fitImage. This<br>
allows U-Boot to load the FDT at a specific address.<br>
<br>
UBOOT_FDT_LOADADDRESS - Specifies the load address used by u-boot<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for the FDT<br>
<br>
Signed-off-by: Nikunj Kela &lt;<a href=3D"mailto:nikunj.kela@gmail.com">nik=
unj.kela@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/kernel-fitimage.<wbr>bbclass | 6 ++++++<br>
=C2=A01 file changed, 6 insertions(+)<br>
<br>
diff --git a/meta/classes/kernel-<wbr>fitimage.bbclass b/meta/classes/kerne=
l-<wbr>fitimage.bbclass<br>
index 1c3b4b7..7f9da49 100644<br>
--- a/meta/classes/kernel-<wbr>fitimage.bbclass<br>
+++ b/meta/classes/kernel-<wbr>fitimage.bbclass<br>
@@ -127,6 +127,11 @@ EOF<br>
=C2=A0fitimage_emit_section_dtb() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb_csum=3D&quot;sha1&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fdt_loadline=3D&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot;${UBOOT_FDT_LOADADDRESS}&quot; ];=
 then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fdt_loadline=3D&quo=
t;load =3D &lt;${UBOOT_FDT_LOADADDRESS}&gt;;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cat &lt;&lt; EOF &gt;&gt; ${1}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fdt@${2} {<br=
>
@@ -135,6 +140,7 @@ fitimage_emit_section_dtb() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0type =3D &quot;flat_dt&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0arch =3D &quot;${UBOOT_ARCH}&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0compression =3D &quot;none&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ${fdt_loadline}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0hash@1 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0algo =3D &quot;${dtb_csum}&quo=
t;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0};<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.5.0<br>
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

--94eb2c05a6567fda44054889f7c9--
