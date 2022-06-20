Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF84C433EF
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 14:28:18 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.20701.1655735272592981702
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 07:27:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: redrectangle.org,
 ip: 217.70.183.199, mailfrom: robert.joslyn@redrectangle.org)
Received: from smtpclient.apple (unknown [50.34.64.238])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by mail.gandi.net (Postfix) with ESMTPSA id 5C667FF812;
	Mon, 20 Jun 2022 14:27:47 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: Re: [OE-core] OE-core CVE metrics for dunfell on Sun 19 Jun 2022
 02:30:01 AM HST
From: Robert Joslyn <robert.joslyn@redrectangle.org>
In-Reply-To: <20220619123357.C1442962583@nuc.router0800d9.com>
Date: Mon, 20 Jun 2022 07:27:45 -0700
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 yocto-security@lists.yoctoproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <8FC54CD7-3243-424C-AF67-4BB0BF53B5BB@redrectangle.org>
References: <20220619123357.C1442962583@nuc.router0800d9.com>
To: Steve Sakoman <steve@sakoman.com>
X-Mailer: Apple Mail (2.3696.100.31)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jun 2022 14:28:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167115



> On Jun 19, 2022, at 5:33 AM, Steve Sakoman <steve@sakoman.com> wrote:
>=20
> Branch: dunfell
>=20
> New this week: 3 CVEs
> CVE-2022-27779 (CVSS3: 5.3 MEDIUM): curl:curl-native =
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-27779 *
> CVE-2022-27780 (CVSS3: 7.5 HIGH): curl:curl-native =
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-27780 *
> CVE-2022-30115 (CVSS3: 4.3 MEDIUM): curl:curl-native =
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-30115 *
Same as last week, these three do not apply to the version in dunfell. =
I=E2=80=99ll email to get the NVD updated with the correct version =
ranges.

Thanks,
Robert


