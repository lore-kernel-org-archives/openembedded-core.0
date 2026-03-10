Return-Path: <vpuar@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E438FD2D9C
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 14:02:08 +0000 (UTC)
Subject: Re: [PATCH] linux-firmware: upgrade 20260221 -> 20260309
To: openembedded-core@lists.openembedded.org
From: "Vivek Puar" <vpuar@qti.qualcomm.com>
X-Originating-Location: Hyderabad, Telangana, IN (163.116.219.39)
X-Originating-Platform: Windows Chrome 145
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 10 Mar 2026 07:02:01 -0700
References: <20260310074128.3451158-1-vpuar@qti.qualcomm.com> <t2imob3rqfil3vkl2pfsrulvas4vbfq2a33zd7vgjpx2ne5hvt@26nynfjviqet>
In-Reply-To: <t2imob3rqfil3vkl2pfsrulvas4vbfq2a33zd7vgjpx2ne5hvt@26nynfjviqet>
Message-ID: <86833.1773151321541739870@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="bitohEqrkt9xSH8buquu"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 14:02:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232786

--bitohEqrkt9xSH8buquu
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 07:01 PM, Dmitry Baryshkov wrote:

>=20
> Please keep this sorted

Sure will update.

>=20
>=20
>> +FILES:${PN}-lt8713sx =3D "${nonarch_base_libdir}/firmware/lt8713sx_fw.b=
in*"
>=20
>=20
> Please keep this sorted

Sure.

>=20
>=20
>> -FILES:${PN}-qcom-kaanapali-audio =3D
>> "${nonarch_base_libdir}/firmware/qcom/kaanapali/adsp*.*"
>> +FILES:${PN}-qcom-kaanapali-audio =3D
>> "${nonarch_base_libdir}/firmware/qcom/kaanapali/adsp*.*
>> ${nonarch_base_libdir}/firmware/qcom/kaanapali/Kaanapali-MTP-tplg.bin*"
>=20
> One per line. Also this brings the licence change.

Will update

>=20
>=20
>> +LICENSE:${PN}-ish-lnlm-lenovo-thinkpad-x9-14 =3D "Firmware-lenovo"
>> +FILES:${PN}-ish-lnlm-lenovo-thinkpad-x9-14 =3D "\
>=20
> This will make ish-lnlm-53c4ffad depend on your new packages. Just push
> those files into ${PN}-ish-lnlm-53c4ffad.

Sure, will add those files into package ${PN}-ish-lnlm-53c4ffad

Regards,
Vivek

--bitohEqrkt9xSH8buquu
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Tue, Mar 10, 2026 at 07:01 PM, Dmitry Baryshkov wrote:</div>
<div>
<blockquote>Please keep this sorted</blockquote>
Sure will update.<br />
<blockquote>
<blockquote>+FILES:${PN}-lt8713sx =3D "${nonarch_base_libdir}/firmware/lt87=
13sx_fw.bin*"</blockquote>
Please keep this sorted</blockquote>
Sure.<br />
<blockquote>
<blockquote>-FILES:${PN}-qcom-kaanapali-audio =3D "${nonarch_base_libdir}/f=
irmware/qcom/kaanapali/adsp*.*"<br />+FILES:${PN}-qcom-kaanapali-audio =3D =
"${nonarch_base_libdir}/firmware/qcom/kaanapali/adsp*.* ${nonarch_base_libd=
ir}/firmware/qcom/kaanapali/Kaanapali-MTP-tplg.bin*"</blockquote>
One per line. Also this brings the licence change.</blockquote>
Will update<br />
<blockquote>
<blockquote>+LICENSE:${PN}-ish-lnlm-lenovo-thinkpad-x9-14 =3D "Firmware-len=
ovo"<br />+FILES:${PN}-ish-lnlm-lenovo-thinkpad-x9-14 =3D "\</blockquote>
This will make ish-lnlm-53c4ffad depend on your new packages. Just push<br =
/>those files into ${PN}-ish-lnlm-53c4ffad.</blockquote>
Sure, will add those files into package ${PN}-ish-lnlm-53c4ffad</div>
<div>&nbsp;</div>
<div>Regards,</div>
<div>Vivek</div>

--bitohEqrkt9xSH8buquu--

