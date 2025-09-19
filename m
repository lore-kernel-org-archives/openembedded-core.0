Return-Path: <vpuar@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C07F6CAC592
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 16:05:09 +0000 (UTC)
Subject: Re: [PATCH] linux-firmware: upgrade 20250808 -> 20250917
To: openembedded-core@lists.openembedded.org
From: "Vivek Puar" <vpuar@qti.qualcomm.com>
X-Originating-Location: Hyderabad, Telangana, IN (163.116.219.41)
X-Originating-Platform: Windows Chrome 140
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 19 Sep 2025 09:05:07 -0700
References: <jh32d44prsovi74bsjejr5vznxtf24jvisnbemnjthhe777lyd@gtzqezswvsvg>
In-Reply-To: <jh32d44prsovi74bsjejr5vznxtf24jvisnbemnjthhe777lyd@gtzqezswvsvg>
Message-ID: <15485.1758297907005760023@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="rIv4jjWY2fyyCTxHYarR"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 16:05:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223759

--rIv4jjWY2fyyCTxHYarR
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 12:52 AM, Dmitry Baryshkov wrote:

>=20
> This means that the licence for the package also needs to be updated to
> include Linaro licence.

Sure will update both the packages to include Linaro license.

>=20
>=20
>> FILES:${PN}-qcom-sa8775p-compute =3D
>> "${nonarch_base_libdir}/firmware/qcom/sa8775p/cdsp*.*"
>> FILES:${PN}-qcom-sa8775p-generalpurpose =3D
>> "${nonarch_base_libdir}/firmware/qcom/sa8775p/gpdsp*.*"
>> FILES:${PN}-qcom-sa8775p-qupv3fw =3D
>> "${nonarch_base_libdir}/firmware/qcom/sa8775p/qupv3fw.elf*"
>=20
> Several notes. You missed the following file, please package it
> correctly (${PN}-qcom-sm8350-adreno):
>=20
> ./usr/lib/firmware/qcom/sm8350/a660_zap.mbn

Yes missed it, will pack the file in the package.

--rIv4jjWY2fyyCTxHYarR
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Fri, Sep 19, 2025 at 12:52 AM, Dmitry Baryshkov wrote:</div>
<div>
<blockquote>This means that the licence for the package also needs to be up=
dated to<br />include Linaro licence.</blockquote>
Sure will update both the packages to include Linaro license.<br />
<blockquote>
<blockquote>FILES:${PN}-qcom-sa8775p-compute =3D "${nonarch_base_libdir}/fi=
rmware/qcom/sa8775p/cdsp*.*"<br />FILES:${PN}-qcom-sa8775p-generalpurpose =
=3D "${nonarch_base_libdir}/firmware/qcom/sa8775p/gpdsp*.*"<br />FILES:${PN=
}-qcom-sa8775p-qupv3fw =3D "${nonarch_base_libdir}/firmware/qcom/sa8775p/qu=
pv3fw.elf*"</blockquote>
Several notes. You missed the following file, please package it<br />correc=
tly (${PN}-qcom-sm8350-adreno):<br /><br />./usr/lib/firmware/qcom/sm8350/a=
660_zap.mbn</blockquote>
Yes missed it, will pack the file in the package.</div>

--rIv4jjWY2fyyCTxHYarR--

