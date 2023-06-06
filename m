Return-Path: <sundeep.kokkonda@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3483CC7EE24
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 09:47:40 +0000 (UTC)
Subject: Re: [PATCH v14] Rust Oe-Selftest implementation
To: openembedded-core@lists.openembedded.org
From: sundeep.kokkonda@eng.windriver.com
X-Originating-Location: Hyderabad, Telangana, IN (49.205.255.62)
X-Originating-Platform: Windows Chrome 114
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 06 Jun 2023 02:47:31 -0700
References: <32fea4adeae13df4a98727293e9aa82b0f65b87d.camel@linuxfoundation.org>
In-Reply-To: <32fea4adeae13df4a98727293e9aa82b0f65b87d.camel@linuxfoundation.org>
Message-ID: <17458.1686044851774043729@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Ebabefgi4XkPDKRDd9UG"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 09:47:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182418

--Ebabefgi4XkPDKRDd9UG
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Richard,

Thank you for review, testing and confirming that oe-selftest is passed. We=
've worked on the regressions caused with the patch and fixed the issue.
The rust builds (bitbake rust/nativesdk-rust) were not part of our regular =
oe-selftest so we've not tested those earlier. From now we will make these =
tests are=C2=A0 part of our regular testing.

With latest sources there are a few new test case failures observed and we =
are working on it.
Also, we see there is a rust 1.70.0 upgrade patch in mailing list. We will =
send the V15 after rebasing to it.

Thank you,
Sundeep K.

--Ebabefgi4XkPDKRDd9UG
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hello Richard,</div>
<div>&nbsp;</div>
<div>Thank you for review, testing and confirming that oe-selftest is passe=
d. We've worked on the regressions caused with the patch and fixed the issu=
e.</div>
<div>The rust builds (bitbake rust/nativesdk-rust) were not part of our reg=
ular oe-selftest so we've not tested those earlier. From now we will make t=
hese tests are&nbsp; part of our regular testing.</div>
<div>&nbsp;</div>
<div>With latest sources there are a few new test case failures observed an=
d we are working on it.</div>
<div>Also, we see there is a rust 1.70.0 upgrade patch in mailing list. We =
will send the V15 after rebasing to it.</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>Thank you,</div>
<div>Sundeep K.&nbsp;</div>

--Ebabefgi4XkPDKRDd9UG--

