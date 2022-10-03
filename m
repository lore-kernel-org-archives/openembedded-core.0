Return-Path: <mathieu.dubois-briand@hyprua.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C06AEC433F5
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 11:29:49 +0000 (UTC)
Subject: Re: [dunfell][PATCH] bind: Fix CVEs 2022-2795, 2022-38177, 2022-38178
To: openembedded-core@lists.openembedded.org
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@hyprua.org>
X-Originating-Location: FR (82.65.0.186)
X-Originating-Platform: Linux Firefox 104
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 03 Oct 2022 04:29:44 -0700
References: <20221003112812.866-1-mbriand@witekio.com>
In-Reply-To: <20221003112812.866-1-mbriand@witekio.com>
Message-ID: <27374.1664796584592040677@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="MgN1VNihllNgZGTt3iG8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Oct 2022 11:29:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171361

--MgN1VNihllNgZGTt3iG8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

This PR intend to fix 3 CVEs:

- https://nvd.nist.gov/vuln/detail/CVE-2022-2795
- https://nvd.nist.gov/vuln/detail/CVE-2022-38177
- https://nvd.nist.gov/vuln/detail/CVE-2022-38178

All fix patches were cherry-picked from bind v9_16_33. The first patch can =
be
merged without conflict and the second one with a minor (curly braces) conf=
lict.

The third one (CVE-2022-38178) is a bit trickier as one of the code section
corrected by the patch does not exist in bind 9.11.37:
- https://gitlab.isc.org/isc-projects/bind9/-/blob/v9_11_37/lib/dns/openssl=
eddsa_link.c#L327
- https://gitlab.isc.org/isc-projects/bind9/-/commit/1af23378ebb11da2eb0f41=
2e4563d6c4165fbd3d

Basically, on 9.11.37 `siglen` is not verified to be different of 0, becaus=
e the
value is always set, so I believe this is OK. However, as I did modify the
patch, I'm not sure if there is some best practice or extra documentation t=
hat I
need to apply here.

Best regards,
Mathieu

--MgN1VNihllNgZGTt3iG8
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,<br /><br />This PR intend to fix 3 CVEs:<br /><br />- https://nvd.nist.=
gov/vuln/detail/CVE-2022-2795<br />- https://nvd.nist.gov/vuln/detail/CVE-2=
022-38177<br />- https://nvd.nist.gov/vuln/detail/CVE-2022-38178<br /><br /=
>All fix patches were cherry-picked from bind v9_16_33. The first patch can=
 be<br />merged without conflict and the second one with a minor (curly bra=
ces) conflict.<br /><br />The third one (CVE-2022-38178) is a bit trickier =
as one of the code section<br />corrected by the patch does not exist in bi=
nd 9.11.37:<br />- https://gitlab.isc.org/isc-projects/bind9/-/blob/v9_11_3=
7/lib/dns/openssleddsa_link.c#L327<br />- https://gitlab.isc.org/isc-projec=
ts/bind9/-/commit/1af23378ebb11da2eb0f412e4563d6c4165fbd3d<br /><br />Basic=
ally, on 9.11.37 `siglen` is not verified to be different of 0, because the=
<br />value is always set, so I believe this is OK. However, as I did modif=
y the<br />patch, I'm not sure if there is some best practice or extra docu=
mentation that I<br />need to apply here.<br /><br />Best regards,<br />Mat=
hieu

--MgN1VNihllNgZGTt3iG8--

