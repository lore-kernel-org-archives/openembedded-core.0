Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D73BF33802
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 06:24:18 +0000 (UTC)
Subject: Re: [kirkstone][PATCH] grub: fix CVE-2025-54770
To: openembedded-core@lists.openembedded.org
From: "Hitendra Prajapati" <hprajapati@mvista.com>
X-Originating-Location: Vadodara, Gujarat, IN (152.59.0.115)
X-Originating-Platform: Linux Firefox 136
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 16 Mar 2026 23:24:11 -0700
References: <20260305121517.15675-1-hprajapati@mvista.com> <DH2N7SRYPRQ3.39K4ACZDXQF9@smile.fr>
In-Reply-To: <DH2N7SRYPRQ3.39K4ACZDXQF9@smile.fr>
Message-ID: <411950.1773728651584044067@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="BEGwGvDYAkIA30cVepNU"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 06:24:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233301

--BEGwGvDYAkIA30cVepNU
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi ,
Yes before this patches , code is vulnerable. see [1].

[1] https://security-tracker.debian.org/tracker/CVE-2025-54770

I just back port the solution from commit from Debian link given in [1].

please check it.

Regards,
Hitendra

--BEGwGvDYAkIA30cVepNU
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi ,</div>
<div>Yes before this patches , code is vulnerable. see [1].</div>
<div>&nbsp;</div>
<div>[1] <a href=3D"https://security-tracker.debian.org/tracker/CVE-2025-54=
770" target=3D"_blank" rel=3D"noopener">https://security-tracker.debian.org=
/tracker/CVE-2025-54770</a></div>
<div>&nbsp;</div>
<div>I just back port the solution from commit from Debian link given in [1=
].</div>
<div>&nbsp;</div>
<div>please check it.</div>
<div>&nbsp;</div>
<div>Regards,</div>
<div>Hitendra</div>

--BEGwGvDYAkIA30cVepNU--

