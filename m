Return-Path: <vomegaz@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id DEDA860557
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 16:30:42 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id p186so20720891ioe.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 09:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=D9MVMHnFsCc758l1keLHBdJBiuBkQOrUe6wRWkNXAug=;
	b=iGvz2X7ASy7LyfkEyJ4kLEh9fSyhgsDkroyzf2QoMju7lDOesGl0PFAaVDiLabmb92
	YMEbhaJvec1nQNObHST8/wDFpIPHE2Nhs0PLVm6O384F87MzTTUC/b6kJs+LjYrrjvsq
	5m1qQAe8zmdVsLMHt08dhO7CzppTaTRLY6HU7Tk6q4MCC6R44HnmCr1qUvp7J4luPcLL
	6M3bJVkOjH0jynEV4qLL+j/KauhaYD1/QUbhkuiWw0xdAsfeqRph8fw8DPUFbCldFWUd
	rPvSP+l3R5NOCVaXwCBicyCwSA96dvx3iXKL1Ma7YVq1OuZuM6nhp2OzpfyKVLRvAA45
	fPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to;
	bh=D9MVMHnFsCc758l1keLHBdJBiuBkQOrUe6wRWkNXAug=;
	b=lQL0KeXtqEH5wXtzDtnK6KL6leXMuEpaHo4ZiZS75A/Sxl1FVNhIeqeVRjNvz+FbMW
	h+CV7goNJ8iUJie/xle1KIU/Ppkl9XG8yuhAQXzujUfxvyqQiz2F9vdrgcg4bIe3WfYp
	Apba320tfRg4f+lF2FRZzTmtbpbFJ751keKDizfF5/XTZhKM0L6z975t91Q18qf18K9D
	pZP5Bepv8P3eg7FozpMplfmuUpX+fB1L9q824DufF1mrH13N1xh8TUfDisOiuJ7bCJ/2
	qsxYnOy6pedbJNxM7lWmH8mj4jdL/K3L8wWW9YrQ4tjdhLroF1BHkggb2870uwg+it1K
	uxdw==
X-Gm-Message-State: AMCzsaXkhPOi3KDY5Ne3BtKaQArLSG/nvBitxHpJkBi2WwBA+6fBUU7A
	sM00cL3+G1ypR1osl39XUiZMilpZdP4Ldjx2uU9REw==
X-Google-Smtp-Source: ABhQp+StK78R5QLFInvWf/iSlw/Srd0s7lGUgYEo102JjlpoPwfmQbynN0lKyTdLIKywf8HVIMrAcCeOlld88ksk06c=
X-Received: by 10.107.232.3 with SMTP id f3mr17318184ioh.156.1508776243522;
	Mon, 23 Oct 2017 09:30:43 -0700 (PDT)
MIME-Version: 1.0
Reply-To: thomas.perrot@tupi.fr
Sender: vomegaz@gmail.com
Received: by 10.107.167.211 with HTTP; Mon, 23 Oct 2017 09:30:02 -0700 (PDT)
In-Reply-To: <20171023155959.27615-1-thomas.perrot@tupi.fr>
References: <20171023155959.27615-1-thomas.perrot@tupi.fr>
From: Thomas PERROT <thomas.perrot@tupi.fr>
Date: Mon, 23 Oct 2017 18:30:02 +0200
X-Google-Sender-Auth: HVRAMxeM0s9YUoTFUrr1Ra2bMnI
Message-ID: <CAGXeWgkVB2Fy1hn1gJS8SUhpZ5816RQhkFOAx_TYioM+AjubwQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta][pyro][PATCH] Avoid a circular dependency between do_concat_dtb and do_assemble_fitimage
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
X-List-Received-Date: Mon, 23 Oct 2017 16:30:43 -0000
Content-Type: multipart/alternative; boundary="f403043819f00a7507055c3958e9"

--f403043819f00a7507055c3958e9
Content-Type: text/plain; charset="UTF-8"

Sorry, there is a bad copy/paste into this patch, I just pushed a version 2.

Still sorry for my mistake

Thomas P.

On Mon, Oct 23, 2017 at 5:59 PM, Thomas Perrot <thomas.perrot@tupi.fr>
wrote:

> Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
> ---
>  meta/classes/kernel-fitimage.bbclass |  2 +-
>  meta/classes/uboot-sign.bbclass      | 21 +++++++++------------
>  2 files changed, 10 insertions(+), 13 deletions(-)
>
> diff --git a/meta/classes/kernel-fitimage.bbclass
> b/meta/classes/kernel-fitimage.bbclass
> index abbc309b09..5ad439e82d 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -31,7 +31,7 @@ python __anonymous () {
>          # the fitImage:
>          if d.getVar('UBOOT_SIGN_ENABLE') == "1":
>              uboot_pn = d.getVar('PREFERRED_PROVIDER_u-boot') or 'u-boot'
> -            d.appendVarFlag('do_assemble_fitimage', 'depends', '
> %s:do_deploy' % uboot_pn)
> +            d.appendVarFlag('do_assemble_fitimage', 'depends', '
> %s:do_deploy_dtb' % uboot_pn)
>  }
>
>  # Options for the device tree compiler passed to mkimage '-D' feature:
> diff --git a/meta/classes/uboot-sign.bbclass
> b/meta/classes/uboot-sign.bbclass
> index 8ee904e7df..86d531abc4 100644
> --- a/meta/classes/uboot-sign.bbclass
> +++ b/meta/classes/uboot-sign.bbclass
> @@ -47,16 +47,14 @@ do_deploy_dtb () {
>         cd ${DEPLOYDIR}
>
>         if [ -f ${B}/${UBOOT_DTB_BINARY} ]; then
> -               install ${B}/${UBOOT_DTB_BINARY}
> ${DEPLOYDIR}/${UBOOT_DTB_IMAGE}
> -               rm -f ${UBOOT_DTB_BINARY} ${UBOOT_DTB_SYMLINK}
> -               ln -sf ${UBOOT_DTB_IMAGE} ${UBOOT_DTB_SYMLINK}
> -               ln -sf ${UBOOT_DTB_IMAGE} ${UBOOT_DTB_BINARY}
> +               install ${B}/${UBOOT_DTB_BINARY}
> ${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_IMAGE}
> +               ln -sf ${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_IMAGE}
> ${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_SYMLINK}
> +               ln -sf ${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_IMAGE}
> ${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_BINARY}
>         fi
>         if [ -f ${B}/${UBOOT_NODTB_BINARY} ]; then
> -               install ${B}/${UBOOT_NODTB_BINARY}
> ${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}
> -               rm -f ${UBOOT_NODTB_BINARY} ${UBOOT_NODTB_SYMLINK}
> -               ln -sf ${UBOOT_NODTB_IMAGE} ${UBOOT_NODTB_SYMLINK}
> -               ln -sf ${UBOOT_NODTB_IMAGE} ${UBOOT_NODTB_BINARY}
> +               install ${B}/${UBOOT_DTB_BINARY}
> ${DEPLOY_DIR_IMAGE}/${UBOOT_NODTB_IMAGE}
> +               ln -sf ${DEPLOY_DIR_IMAGE}/${UBOOT_NODTB_IMAGE}
> ${DEPLOY_DIR_IMAGE}/${UBOOT_NODTB_SYMLINK}
> +               ln -sf ${DEPLOY_DIR_IMAGE}/${UBOOT_NODTB_IMAGE}
> ${DEPLOY_DIR_IMAGE}/${UBOOT_NODTB_BINARY}
>         fi
>  }
>
> @@ -70,11 +68,10 @@ do_concat_dtb () {
>                         oe_runmake EXT_DTB=${DEPLOYDIR}/${UBOOT_DTB_IMAGE}
>                         install ${B}/${UBOOT_BINARY}
> ${DEPLOYDIR}/${UBOOT_IMAGE}
>                         install ${B}/${UBOOT_BINARY}
> ${DEPLOY_DIR_IMAGE}/${UBOOT_IMAGE}
> -               elif [ -e "${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}" -a -e
> "${DEPLOYDIR}/${UBOOT_DTB_IMAGE}" ]; then
> -                       cd ${DEPLOYDIR}
> -                       cat ${UBOOT_NODTB_IMAGE} ${UBOOT_DTB_IMAGE} | tee
> ${B}/${UBOOT_BINARY} > ${UBOOT_IMAGE}
> +               elif [ -e "${DEPLOY_DIR_IMAGE}/${UBOOT_NODTB_IMAGE}" -a
> -e "${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_IMAGE}" ]; then
> +                       cat ${DEPLOY_DIR_IMAGE}/${UBOOT_NODTB_IMAGE}
> ${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_IMAGE} | tee ${B}/${UBOOT_BINARY} >
> ${UBOOT_IMAGE}
>                 else
> -                       bbwarn "Failure while adding public key to u-boot
> binary. Verified boot won't be available."
> +                       bbfatal "Failure while adding public key to u-boot
> binary. Verified boot won't be available."
>                 fi
>         fi
>  }
> --
> 2.13.6
>
>

--f403043819f00a7507055c3958e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Sorry, there is a bad copy/paste into this patch, I j=
ust pushed a version 2.</div><div><br></div><div><span id=3D"m_265994483011=
9045434gmail-result_box" class=3D"m_2659944830119045434gmail-short_text" la=
ng=3D"en"><span>Still sorry for my mistake</span></span></div><div><br></di=
v><div>Thomas P.<br></div><br>On Mon, Oct 23, 2017 at 5:59 PM, Thomas Perro=
t <span dir=3D"ltr">&lt;<a href=3D"mailto:thomas.perrot@tupi.fr" target=3D"=
_blank">thomas.perrot@tupi.fr</a>&gt;</span> wrote:<br><div class=3D"gmail_=
extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Signed-off-by: Thomas Perrot &lt;<a href=3D"mailto:thomas.perrot=
@tupi.fr" target=3D"_blank">thomas.perrot@tupi.fr</a>&gt;<br>
---<br>
=C2=A0meta/classes/kernel-fitimage.<wbr>bbclass |=C2=A0 2 +-<br>
=C2=A0meta/classes/uboot-sign.bbcla<wbr>ss=C2=A0 =C2=A0 =C2=A0 | 21 +++++++=
++------------<br>
=C2=A02 files changed, 10 insertions(+), 13 deletions(-)<br>
<br>
diff --git a/meta/classes/kernel-fitimage<wbr>.bbclass b/meta/classes/kerne=
l-fitimage<wbr>.bbclass<br>
index abbc309b09..5ad439e82d 100644<br>
--- a/meta/classes/kernel-fitimage<wbr>.bbclass<br>
+++ b/meta/classes/kernel-fitimage<wbr>.bbclass<br>
@@ -31,7 +31,7 @@ python __anonymous () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# the fitImage:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if d.getVar(&#39;UBOOT_SIGN_ENABLE&#39;) =
=3D=3D &quot;1&quot;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uboot_pn =3D d.getVar(&#39;=
PREFERRED_PROVIDER_u<wbr>-boot&#39;) or &#39;u-boot&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVarFlag(&#39;do_assemble=
_f<wbr>itimage&#39;, &#39;depends&#39;, &#39; %s:do_deploy&#39; % uboot_pn)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVarFlag(&#39;do_assemble=
_f<wbr>itimage&#39;, &#39;depends&#39;, &#39; %s:do_deploy_dtb&#39; % uboot=
_pn)<br>
=C2=A0}<br>
<br>
=C2=A0# Options for the device tree compiler passed to mkimage &#39;-D&#39;=
 feature:<br>
diff --git a/meta/classes/uboot-sign.bbcl<wbr>ass b/meta/classes/uboot-sign=
.bbcl<wbr>ass<br>
index 8ee904e7df..86d531abc4 100644<br>
--- a/meta/classes/uboot-sign.bbcl<wbr>ass<br>
+++ b/meta/classes/uboot-sign.bbcl<wbr>ass<br>
@@ -47,16 +47,14 @@ do_deploy_dtb () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${DEPLOYDIR}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -f ${B}/${UBOOT_DTB_BINARY} ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install ${B}/${UBOO=
T_DTB_BINARY} ${DEPLOYDIR}/${UBOOT_DTB_IMAGE<wbr>}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${UBOOT_DTB_B=
INARY} ${UBOOT_DTB_SYMLINK}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${UBOOT_DTB_=
IMAGE} ${UBOOT_DTB_SYMLINK}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${UBOOT_DTB_=
IMAGE} ${UBOOT_DTB_BINARY}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install ${B}/${UBOO=
T_DTB_BINARY} ${DEPLOY_DIR_IMAGE}/${UBOOT_DT<wbr>B_IMAGE}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${DEPLOY_DIR=
_IMAGE}/${UBOOT_DT<wbr>B_IMAGE} ${DEPLOY_DIR_IMAGE}/${UBOOT_DT<wbr>B_SYMLIN=
K}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${DEPLOY_DIR=
_IMAGE}/${UBOOT_DT<wbr>B_IMAGE} ${DEPLOY_DIR_IMAGE}/${UBOOT_DT<wbr>B_BINARY=
}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -f ${B}/${UBOOT_NODTB_BINARY} ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install ${B}/${UBOO=
T_NODTB_BINARY} ${DEPLOYDIR}/${UBOOT_NODTB_IMA<wbr>GE}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${UBOOT_NODTB=
_BINARY} ${UBOOT_NODTB_SYMLINK}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${UBOOT_NODT=
B_IMAGE} ${UBOOT_NODTB_SYMLINK}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${UBOOT_NODT=
B_IMAGE} ${UBOOT_NODTB_BINARY}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install ${B}/${UBOO=
T_DTB_BINARY} ${DEPLOY_DIR_IMAGE}/${UBOOT_NO<wbr>DTB_IMAGE}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${DEPLOY_DIR=
_IMAGE}/${UBOOT_NO<wbr>DTB_IMAGE} ${DEPLOY_DIR_IMAGE}/${UBOOT_NO<wbr>DTB_SY=
MLINK}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${DEPLOY_DIR=
_IMAGE}/${UBOOT_NO<wbr>DTB_IMAGE} ${DEPLOY_DIR_IMAGE}/${UBOOT_NO<wbr>DTB_BI=
NARY}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
<br>
@@ -70,11 +68,10 @@ do_concat_dtb () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 oe_runmake EXT_DTB=3D${DEPLOYDIR}/${UBOOT_D<wbr>TB_IMAGE}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 install ${B}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 install ${B}/${UBOOT_BINARY} ${DEPLOY_DIR_IMAGE}/${UBOOT_IM<wbr>=
AGE}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif [ -e &quot;${D=
EPLOYDIR}/${UBOOT_NODTB_IM<wbr>AGE}&quot; -a -e &quot;${DEPLOYDIR}/${UBOOT_=
DTB_IMAG<wbr>E}&quot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0cd ${DEPLOYDIR}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0cat ${UBOOT_NODTB_IMAGE} ${UBOOT_DTB_IMAGE} | tee ${B}/${UBOOT_BI=
NARY} &gt; ${UBOOT_IMAGE}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif [ -e &quot;${D=
EPLOY_DIR_IMAGE}/${UBOOT_N<wbr>ODTB_IMAGE}&quot; -a -e &quot;${DEPLOY_DIR_I=
MAGE}/${UBOOT_D<wbr>TB_IMAGE}&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0cat ${DEPLOY_DIR_IMAGE}/${UBOOT_NO<wbr>DTB_IMAGE} ${DEPLOY_DIR_IM=
AGE}/${UBOOT_DT<wbr>B_IMAGE} | tee ${B}/${UBOOT_BINARY} &gt; ${UBOOT_IMAGE}=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bbwarn &quot;Failure while adding public key to u-boot binary. Ve=
rified boot won&#39;t be available.&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bbfatal &quot;Failure while adding public key to u-boot binary. V=
erified boot won&#39;t be available.&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
<span class=3D"m_2659944830119045434gmail-HOEnZb"><font color=3D"#888888">-=
-<br>
2.13.6<br>
<br>
</font></span></blockquote></div><br></div></div>

--f403043819f00a7507055c3958e9--
