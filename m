Return-Path: <sreejith.ravi087@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FFCEC2BD09
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 13:02:12 +0000 (UTC)
Subject: Re: [PATCH] package.bbclass: Fix broken dev package dependency.
To: openembedded-core@lists.openembedded.org
From: "Sreejith Ravi" <sreejith.ravi087@gmail.com>
X-Originating-Location: Richmond, England, GB (90.216.150.195)
X-Originating-Platform: Windows Chrome 126
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 24 Jun 2024 06:02:02 -0700
References: <CANNYZj8LT7JyO1731na1c0a8+_rfoCSjwyr=QfMC4124QAT2kw@mail.gmail.com>
In-Reply-To: <CANNYZj8LT7JyO1731na1c0a8+_rfoCSjwyr=QfMC4124QAT2kw@mail.gmail.com>
Message-ID: <2056.1719234122993514513@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="m4CiDRCdwNPSo0uID1uq"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 13:02:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201084

--m4CiDRCdwNPSo0uID1uq
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

We should be able to install the dev IPK and resolve its corresponding depe=
ndency chain. As I mentioned earlier, enabling recommended packages and ins=
talling them increases hard disk usage and installation time when installin=
g a lot of unnecessary recommended packages.

Yocto handles the dev dependency chain by parsing the 'Requires' field from=
 the .pc file in the package_do_pkgconfig function. However, there is one m=
ore field, 'Requires.private', which also needs to be considered when creat=
ing the dependency chain for the dev IPKs. With this, the dev IPK has the p=
roper dependencies listed and there is no need to install the recommended p=
ackages.

--m4CiDRCdwNPSo0uID1uq
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

We should be able to install the dev IPK and resolve its corresponding depe=
ndency chain. As I mentioned earlier, enabling recommended packages and ins=
talling them increases hard disk usage and installation time when installin=
g a lot of unnecessary recommended packages.<br /><br />Yocto handles the d=
ev dependency chain by parsing the 'Requires' field from the .pc file in th=
e package_do_pkgconfig function. However, there is one more field, 'Require=
s.private', which also needs to be considered when creating the dependency =
chain for the dev IPKs. With this, the dev IPK has the proper dependencies =
listed and there is no need to install the recommended packages.

--m4CiDRCdwNPSo0uID1uq--

