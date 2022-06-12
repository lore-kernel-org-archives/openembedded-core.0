Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 064A6C433EF
	for <webhook@archiver.kernel.org>; Sun, 12 Jun 2022 15:57:50 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web12.17025.1655049466207334317
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jun 2022 08:57:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: redrectangle.org,
 ip: 217.70.178.232, mailfrom: robert.joslyn@redrectangle.org)
Received: from smtpclient.apple (unknown [50.34.64.238])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by mail.gandi.net (Postfix) with ESMTPSA id 11657200004;
	Sun, 12 Jun 2022 15:57:42 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: Re: [OE-core] OE-core CVE metrics for kirkstone on Sun 12 Jun 2022
 03:00:01 AM HST
From: Robert Joslyn <robert.joslyn@redrectangle.org>
In-Reply-To: <20220612130255.06F2D96054A@nuc.router0800d9.com>
Date: Sun, 12 Jun 2022 08:57:40 -0700
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 yocto-security@lists.yoctoproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <4CDF2F5F-FCD7-4B8C-A9E7-1CB7AD7091CB@redrectangle.org>
References: <20220612130255.06F2D96054A@nuc.router0800d9.com>
To: Steve Sakoman <steve@sakoman.com>
X-Mailer: Apple Mail (2.3696.100.31)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jun 2022 15:57:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166825



> On Jun 12, 2022, at 6:02 AM, Steve Sakoman <steve@sakoman.com> wrote:
>=20
> Branch: kirkstone
>=20
> New this week: 5 CVEs
> CVE-2022-1664 (CVSS3: 9.8 CRITICAL): dpkg =
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-1664 *
> CVE-2022-1927 (CVSS3: 9.8 CRITICAL): vim =
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-1927 *
> CVE-2022-1942 (CVSS3: 7.8 HIGH): vim =
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-1942 *
> CVE-2022-26691 (CVSS3: 6.7 MEDIUM): cups =
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-26691 *
> CVE-2022-27778 (CVSS3: 8.1 HIGH): curl:curl-native =
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-27778 *

CVE-2022-27778 doesn=E2=80=99t apply to the curl versions in kirkstone =
or dunfell (master already has the fixed version). It looks like the NVD =
doesn=E2=80=99t quite have the right version ranges based on what the =
curl developers have published. I=E2=80=99ve sent an email to hopefully =
get the NVD updated.

Thanks,
Robert


