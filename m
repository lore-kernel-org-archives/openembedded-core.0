Return-Path: <vpuar@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C16EF5877
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 05:22:03 +0000 (UTC)
Subject: Re: [PATCH] linux-firmware: upgrade 20260110 -> 20260221
To: openembedded-core@lists.openembedded.org
From: "Vivek Puar" <vpuar@qti.qualcomm.com>
X-Originating-Location: Chennai, Tamil Nadu, IN (163.116.214.46)
X-Originating-Platform: Windows Chrome 144
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 22 Feb 2026 21:21:59 -0800
References: <20260222212156.55731-1-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20260222212156.55731-1-dmitry.baryshkov@oss.qualcomm.com>
Message-ID: <1030996.1771824119017163262@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="v2EWPeeGZNnh0ptlyLaV"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 05:22:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231643

--v2EWPeeGZNnh0ptlyLaV
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 02:52 AM, Dmitry Baryshkov wrote:

>=20
> +FILES:${PN}-qcom-sm8750-audio =3D
> "${nonarch_base_libdir}/firmware/qcom/sm8750/adsp*.*
> ${nonarch_base_libdir}/firmware/qcom/sm8750/*tplg.bin.*"

There is a type, no "." after bin

>=20
> + ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-CRD-tplg.bin.zst=
*
> \
>=20

It will be, X1E80100-CRD-tplg.bin*?

>=20
> +LICENSE:${PN}-qcom-qcs6490-radxa-dragon-q6a-compute =3D "Firmware-qcom"
>=20

Will it have linaro license also?

Missing RDEPENDS for " qcom-qcs6490-radxa-dragon-q6a-compute"?

--v2EWPeeGZNnh0ptlyLaV
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Mon, Feb 23, 2026 at 02:52 AM, Dmitry Baryshkov wrote:</div>
<div>
<blockquote>+FILES:${PN}-qcom-sm8750-audio =3D "${nonarch_base_libdir}/firm=
ware/qcom/sm8750/adsp*.* ${nonarch_base_libdir}/firmware/qcom/sm8750/*tplg.=
bin.*"</blockquote>
There is a type, no "." after bin</div>
<div>&nbsp;</div>
<blockquote>
<div><span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Rob=
oto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, '=
Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'=
; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font=
-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2=
; text-align: start; text-indent: 0px; text-transform: none; widows: 2; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; back=
ground-color: #ffffff; text-decoration-thickness: initial; text-decoration-=
style: initial; text-decoration-color: initial; display: inline !important;=
 float: none;">+ ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-CRD=
-tplg.bin.zst* \</span></div>
</blockquote>
<div><span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Rob=
oto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, '=
Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'=
; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font=
-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2=
; text-align: start; text-indent: 0px; text-transform: none; widows: 2; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; back=
ground-color: #ffffff; text-decoration-thickness: initial; text-decoration-=
style: initial; text-decoration-color: initial; display: inline !important;=
 float: none;">It will be, X1E80100-CRD-tplg.bin*? </span></div>
<div>&nbsp;</div>
<blockquote>
<div><span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Rob=
oto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, '=
Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'=
; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font=
-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2=
; text-align: start; text-indent: 0px; text-transform: none; widows: 2; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; back=
ground-color: #ffffff; text-decoration-thickness: initial; text-decoration-=
style: initial; text-decoration-color: initial; display: inline !important;=
 float: none;"><span style=3D"color: #333333; font-family: system-ui, 'Sego=
e UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, san=
s-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Co=
lor Emoji'; font-size: 16px; font-style: normal; font-variant-ligatures: no=
rmal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: 2; text-align: start; text-indent: 0px; text-transform: none; wido=
ws: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-=
wrap; background-color: #ffffff; text-decoration-thickness: initial; text-d=
ecoration-style: initial; text-decoration-color: initial; display: inline !=
important; float: none;">+LICENSE:${PN}-qcom-qcs6490-radxa-dragon-q6a-compu=
te =3D "Firmware-qcom"</span></span></div>
</blockquote>
<div><span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Rob=
oto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, '=
Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'=
; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font=
-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2=
; text-align: start; text-indent: 0px; text-transform: none; widows: 2; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; back=
ground-color: #ffffff; text-decoration-thickness: initial; text-decoration-=
style: initial; text-decoration-color: initial; display: inline !important;=
 float: none;">Will it have linaro license also?<br /><br />Missing RDEPEND=
S for "<span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', R=
oboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif,=
 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoj=
i'; font-size: 16px; font-style: normal; font-variant-ligatures: normal; fo=
nt-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans:=
 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; w=
ord-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; ba=
ckground-color: #ffffff; text-decoration-thickness: initial; text-decoratio=
n-style: initial; text-decoration-color: initial; display: inline !importan=
t; float: none;">qcom-qcs6490-radxa-dragon-q6a-compute"?</span></span></div=
>
<div>&nbsp;</div>

--v2EWPeeGZNnh0ptlyLaV--

