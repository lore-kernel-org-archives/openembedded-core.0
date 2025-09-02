Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1629BCA0FFE
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 15:20:29 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.80254.1756826424936657110
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 08:20:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=sfxE1uoV;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: a-christidis@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 582FKIOW2614798;
	Tue, 2 Sep 2025 10:20:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756826418;
	bh=1XEHhg5lf0ng2JqRTd0BFl+2h2AMfIs5gFnwRCGWUn0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=sfxE1uoVBztiKRfse2sjc6XRcxaW7BXLsDZEEr8ibp9jm97BzuQ0LKRNTsnNiRydW
	 aTWCRyKXg5GNduqQolCn76da+/pGmZ7gNYbnnqNIr23C9nF/0oK8w7oyv/tEPC1WuB
	 l0tasIfmSG1qvqE3jZReDiVF+Z2KR3Xz8FCMZX0E=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 582FKIoK2922842
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 2 Sep 2025 10:20:18 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 2
 Sep 2025 10:20:18 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.2.2562.20; Tue, 2 Sep
 2025 10:20:18 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 2 Sep 2025 10:20:18 -0500
Received: from [128.247.81.112] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 582FKHjP087787;
	Tue, 2 Sep 2025 10:20:18 -0500
Message-ID: <9316e8d2-0ee9-49b6-b645-1c7db8a21df9@ti.com>
Date: Tue, 2 Sep 2025 10:20:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [OE-core] [master][PATCH] libsdl2: Add tests
 package and ptest support
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: <openembedded-core@lists.openembedded.org>,
        <mathieu.dubois-briand@bootlin.com>, <alex@linutronix.de>
References: <20250827222051.367093-1-a-christidis@ti.com>
 <CANNYZj9E1JB2tdWMUL_fz_rjyACSyw9pDAsJDQH4eJtEUC3c5Q@mail.gmail.com>
Content-Language: en-US
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <CANNYZj9E1JB2tdWMUL_fz_rjyACSyw9pDAsJDQH4eJtEUC3c5Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot01.ext.ti.com id 582FKIOW2614798
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 15:20:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222735

Dear Alexander,

Firstly, let me apologize for the late reply I have been out of office.

On 8/28/25 7:51 AM, Alexander Kanavin wrote:
> On Thu, 28 Aug 2025 at 00:=E2=80=8A21, Antonios Christidis via=20
> lists.=E2=80=8Aopenembedded.=E2=80=8Aorg=20
> <a-christidis=3Dti.=E2=80=8Acom@=E2=80=8Alists.=E2=80=8Aopenembedded.=E2=
=80=8Aorg> wrote: >=20
> +test_array=3D("testdraw2" "testgeometry" "testsprite2" "testgles2"=20
> "testoffscreen") > + > +test_path=3D"/usr/bin/sdl2_tests/"
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> Report=C2=A0Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!tDdkczhAu0BQayjEE=
53DlJ0ytQAfSnNSsAwaZZ6yMwLiJIuXLljNpENyKyUvPwWHY4FZNPKxMRcNExZlXWUX0mmQrE=
BfjWJom99n7qlVvJ7-UcRwcWlWG7GV1ds$>=20
>
> ZjQcmQRYFpfptBannerEnd
> On Thu, 28 Aug 2025 at 00:21, Antonios Christidis via
> lists.openembedded.org <a-christidis=3Dti.com@lists.openembedded.org>
> wrote:
> > +test_array=3D("testdraw2" "testgeometry" "testsprite2" "testgles2" "=
testoffscreen")
> > +
> > +test_path=3D"/usr/bin/sdl2_tests/"
>
> I know this somewhat contradicts what I said before, but now I think
> we should just keep this simple and install these under
> /usr/lib/libsdl2/ptest/tests, and package them in $PN-ptest. Putting
> something executable in a sub-directory under /usr/bin is very
> non-standard.

I understand your point about keeping things simple and installing the=20
tests under |/usr/lib/libsdl2/ptest/tests|, but I have some concerns=20
about merging the packages.

I believe it's beneficial to keep the |$PN-tests| and |$PN-ptest|=20
packages separate. The tests can run without the need for ptest tools,=20
and by keeping them separate, we avoid creating a needless dependency.=20
Merging the two, can lead to users making a false assumption that the=20
tests need some sort of tooling provided by ptest to run.

Moreover, having the tests in a separate package allows users to easily=20
include them in their filesystem without having to rebuild the entire=20
package with |DISTRO_FEATURES| including |ptest|. This is particularly=20
important since rebuilding with |ptest| enabled in my experience can=20
cause a significant increase in build time, as it often triggers the=20
rebuild of basic package dependencies.


I do agree with the placement of tests being non-standard, do you have=20
any suggestions on elsewhere to place them ? Aside from=20
|/usr/lib/libsdl2/ptest/tests| .

> Also run-ptest should not hardcode the list of tests, and just run
> everything in a directory.
>
> > @@ -48,6 +50,7 @@ EXTRA_OECMAKE =3D "-DSDL_OSS=3DOFF -DSDL_ESD=3DOFF =
-DSDL_ARTS=3DOFF \
> >                   -DSDL_X11_XRANDR=3DOFF \
> >                   -DSDL_X11_XSCRNSAVER=3DOFF \
> >                   -DSDL_X11_XSHAPE=3DOFF \
> > +                -DSDL_TESTS=3DON \
>
> This should stay as PACKAGECONFIG, and be enabled subject to ptest in
> DISTRO_FEATURES.

Looking over other packages that have ptest support, they often=20
automatically build tests without the need for setting PACKAGECONFIGS.

> Alex
>
Kind Regards,
Antonios


