Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69194C636CC
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 11:00:26 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.5885.1675854024570735670
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Feb 2023 03:00:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=JUiGTlU+;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1675854025;
  x=1707390025;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=daJrvuDVUnfwWp3c8V/X5LBg4XJ0aY6xqox+Hf4SorQ=;
  b=JUiGTlU+P1NMYHbEAeYXSflPf1yNJ2nNzP7rtWT9yvrDHcc+zyAVsBSt
   B2jbulnN+HebpBPsBzWqUt2cKjYGmFL9lDDUMDNM5KrW2Cug/1UGbNbVq
   YWH+V2MAm2aQMG3OxbOtrrEIUDFw7Matxm5UbSPTurxeGPoLDk0wxQjBe
   kaEzUmAufRqviKrvz+Xmx+LWjiEOpVvnhYaKNKPdn7MrP2VwPxl7R1bHP
   VU4Ybifl7+L0/6lzCKC/OLb4jbSHyTuAoC21YP6DNDOHX2BHr6cTGyP1x
   bTFpuleb6wUz9aMdHMdmqyk7FJK39kwnRQ7sof8TlKWh3p9AGe6zur5l+
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Marius Kriegerowski <marius.kriegerowski@gmail.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: RE: [OE-core] [kirkstone][PATCH 1/2] bitbake: bitbake-diffsigs: Make
 PEP8 compliant
Thread-Topic: [OE-core] [kirkstone][PATCH 1/2] bitbake: bitbake-diffsigs: Make
 PEP8 compliant
Thread-Index: AQHZOtmpec0buhUWzkS+gm+cDl1EGq7E4hmA
Date: Wed, 8 Feb 2023 11:00:22 +0000
Message-ID: <777dd7c0c335480f82f31f1e1b36b751@axis.com>
References: <20230207095023.1115763-1-mikko.rapeli@linaro.org>
In-Reply-To: <20230207095023.1115763-1-mikko.rapeli@linaro.org>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 11:00:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176899

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Mikko Rapeli
> Sent: den 7 februari 2023 10:50
> To: openembedded-core@lists.openembedded.org
> Cc: Marius Kriegerowski <marius.kriegerowski@gmail.com>; Alexandre Bellon=
i <alexandre.belloni@bootlin.com>; Richard Purdie <richard.purdie@linuxfoun=
dation.org>; Mikko Rapeli <mikko.rapeli@linaro.org>
> Subject: [OE-core] [kirkstone][PATCH 1/2] bitbake: bitbake-diffsigs: Make=
 PEP8 compliant

This should be sent to the bitbake list. Also, when cherry-picking=20
Bitbake changes in the poky repository, you should remove the "bitbake:"=20
prefix from the subject line as it is added by combo-layer when it=20
imports the commits from the bitbake repository to the poky repository.

//Peter


