Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F20C02180
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 11:43:10 +0000 (UTC)
Subject: Re: [PATCH 1/2] rust: fix for rust multilib sdk configuration
To: openembedded-core@lists.openembedded.org
From: "Sadineni, Harish" <Harish.Sadineni@windriver.com>
X-Originating-Location: Hyderabad, Telangana, IN (223.182.44.27)
X-Originating-Platform: Windows Chrome 131
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 16 Jan 2025 03:43:09 -0800
References: <20250116113843.1817918-1-Harish.Sadineni@windriver.com>
In-Reply-To: <20250116113843.1817918-1-Harish.Sadineni@windriver.com>
Message-ID: <1047.1737027789601448465@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="kTEW6YWOywITeLffOuqb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 11:43:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209944

--kTEW6YWOywITeLffOuqb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Did testing for following architectures x86, x86_64, arm, aarch64, ppc usin=
g following commands:
bitbake core-image-sato
bitbake core-image-sato -c populate_Sdk
bitbake core-image-sato -c testsdk

Multilib Testing was conducted for x86_64 and aarch64 using the following c=
ommands:
bitbake core-image-sato
bitbake core-image-sato -c populate_Sdk
bitbake core-image-sato -c testsdk
Additionally, Multilib testing was also performed with lib32-core-image-sat=
o using same set of commands.

Thanks,
Harish

--kTEW6YWOywITeLffOuqb
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div><span data-teams=3D"true">Did testing for following architectures x86,=
 x86_64, arm, aarch64, ppc using following commands:&nbsp;<br />bitbake cor=
e-image-sato&nbsp;<br />bitbake core-image-sato -c populate_Sdk<br />bitbak=
e core-image-sato -c testsdk<br /><br />Multilib Testing was conducted for =
x86_64 and aarch64 using the following commands:<br />bitbake core-image-sa=
to<br />bitbake core-image-sato -c populate_Sdk<br />bitbake core-image-sat=
o -c testsdk<br />Additionally, Multilib testing was also performed with li=
b32-core-image-sato using same set of commands.</span><br /><br />Thanks,<b=
r />Harish</div>

--kTEW6YWOywITeLffOuqb--

