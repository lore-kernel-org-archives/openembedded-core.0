Return-Path: <vpuar@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CC69C88E66
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 12:13:36 +0000 (UTC)
Subject: Re: [PATCH v2] linux-firmware: upgrade 20260810 -> 20260910
To: openembedded-core@lists.openembedded.org
From: "Vivek Puar" <vpuar@qti.qualcomm.com>
X-Originating-Location: Hyderabad, Telangana, IN (163.116.219.55)
X-Originating-Platform: Windows Chrome 152
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 14 Sep 2026 05:13:29 -0700
References: <20260911112650.1374309-1-vpuar@qti.qualcomm.com> <DLD6Q706IGI1.1216VVUDNXW29@bootlin.com>
In-Reply-To: <DLD6Q706IGI1.1216VVUDNXW29@bootlin.com>
Message-ID: <614003.1789388009709101770@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="pwLNFWQfWlNFOui4sC94"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 12:13:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245777

--pwLNFWQfWlNFOui4sC94
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 01:42 PM, Mathieu Dubois-Briand wrote:

>=20
> Hi,
>=20
> Thanks for the new version, but it looks like QA is failing:
>=20
> ERROR: linux-firmware-1_20260910-r0 do_package: QA Issue: linux-firmware:
> Files/directories were installed but not shipped in any package:
> /lib/firmware/qcom/sdm845/SHIFT
> /lib/firmware/qcom/sdm845/SHIFT/axolotl
> /lib/firmware/qcom/sdm845/SHIFT/axolotl/a630_zap.mbn
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/4655
>=20
> Can you have a look at the issue?
>=20
> Thanks,
> Mathieu

Hi Mathieu,

Will check and send v3 to fix this issue.

Regards,
Vivek

--pwLNFWQfWlNFOui4sC94
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Sat, Sep 12, 2026 at 01:42 PM, Mathieu Dubois-Briand wrote:</div>
<div>
<blockquote>Hi,<br /><br />Thanks for the new version, but it looks like QA=
 is failing:<br /><br />ERROR: linux-firmware-1_20260910-r0 do_package: QA =
Issue: linux-firmware: Files/directories were installed but not shipped in =
any package:<br />/lib/firmware/qcom/sdm845/SHIFT<br />/lib/firmware/qcom/s=
dm845/SHIFT/axolotl<br />/lib/firmware/qcom/sdm845/SHIFT/axolotl/a630_zap.m=
bn<br /><br /><a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/bu=
ilders/4/builds/4655" target=3D"_blank" rel=3D"noopener">https://autobuilde=
r.yoctoproject.org/valkyrie/#/builders/4/builds/4655</a><br /><br />Can you=
 have a look at the issue?<br /><br />Thanks,<br />Mathieu</blockquote>
Hi Mathieu,&nbsp;<br /><br />Will check and send v3 to fix this issue.</div=
>
<div>&nbsp;</div>
<div>Regards,</div>
<div>Vivek</div>

--pwLNFWQfWlNFOui4sC94--

