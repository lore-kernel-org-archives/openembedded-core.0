Return-Path: <thomas@hax.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A06C433EF
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 13:21:20 +0000 (UTC)
Subject: dvb.ko for Miraclebox mbultra broken
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?VGhvbWFzIFTDtnJuYmxvbQ==?= <thomas@hax.se>
X-Originating-Location: Uppsala, Uppsala County, SE (85.224.37.203)
X-Originating-Platform: Mac Firefox 96
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 24 Jan 2022 05:21:20 -0800
Message-ID: <YDnw.1643030480077058242.aXcT@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="d4UIuYE05XpTI72BdiWa"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jan 2022 13:21:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160877

--d4UIuYE05XpTI72BdiWa
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I'm the owner of two Miraclebox mbultra boxes on which I run OpenATV 6.4.

Both of them have one DVB-S2 and one DVB-T/DVB-T2 tuners installed.

Since many years the driver /lib/modules/3.14.2/extra/dvb.ko has issues wit=
h a few DVB-T2 channels in Sweden and I have had to replace file with an ol=
der one from an old openmb distro every time I upgrade to a newer OpenATV v=
ersion.

Would it be possible to have you bundle that older module instead of the br=
oken one you are distributing now? I can provide the module in case you hav=
e difficulty finding a working one.

The build date on the working module is: Feb 20 2014

The build date on the broken one you ship is: Aug 22 2014

Thanks,
Thomas

--d4UIuYE05XpTI72BdiWa
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I'm the owner of two Miraclebox mbultra boxes on which I run OpenATV 6.4.<b=
r /><br />Both of them have one DVB-S2 and one DVB-T/DVB-T2 tuners installe=
d.<br /><br />Since many years the driver /lib/modules/3.14.2/extra/dvb.ko =
has issues with a few DVB-T2 channels in Sweden and I have had to replace f=
ile with an older one from an old openmb distro every time I upgrade to a n=
ewer OpenATV version.<br /><br />Would it be possible to have you bundle th=
at older module instead of the broken one you are distributing now? I can p=
rovide the module in case you have difficulty finding a working one.<br /><=
br />The build date on the working module is: Feb 20 2014 <br /><br />The b=
uild date on the broken one you ship is: Aug 22 2014 <br /><br />Thanks,<br=
 />Thomas

--d4UIuYE05XpTI72BdiWa--

