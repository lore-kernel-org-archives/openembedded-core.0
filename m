Return-Path: <pedro.silva.ferreira@criticaltechworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39705C282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 14:26:43 +0000 (UTC)
Subject: Re: [PATCH] buildhistory.bbclass: restore BUILDHISTORY_PRESERVE files
To: openembedded-core@lists.openembedded.org
From: "Pedro Ferreira" <pedro.silva.ferreira@criticaltechworks.com>
X-Originating-Location: Rinchoa, Lisbon, PT (78.137.195.161)
X-Originating-Platform: Windows Chrome 133
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 06 Mar 2025 06:26:34 -0800
References: <16166.1737643041567770551@lists.openembedded.org>
In-Reply-To: <16166.1737643041567770551@lists.openembedded.org>
Message-ID: <359.1741271194425273451@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="km4QFVaSB40MpmPtfsQQ"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 14:26:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212392

--km4QFVaSB40MpmPtfsQQ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Simple scenario to test it:

*Pre-conditions:*
INHERIT +=3D "buildhistory"
BUILDHISTORY_RESET =3D "1"
BUILDHISTORY_PRESERVE:append =3D " files-in-package.txt"

*Run:*
bitbake -c cleansstate base-passwd && bitbake base-passwd
*Check:*
cat PATH_TO_BUILD_dir/buildhistory/packages/core2-64-poky-linux/base-passwd=
/base-passwd-dbg/files-in-package.txt
(File exists and content ok)
*Run:*
rm -rf tmp && bitbake base-passwd (it will use sstate cache)
*Check:*
cat PATH_TO_BUILD_dir/buildhistory/packages/core2-64-poky-linux/base-passwd=
/base-passwd-dbg/files-in-package.txt
(File wont exist)

Cheers,
Pedro

--km4QFVaSB40MpmPtfsQQ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Simple scenario to test it:</div>
<div>&nbsp;</div>
<div>
<div>
<div><strong>Pre-conditions:</strong></div>
<div>INHERIT +=3D "buildhistory"<br />BUILDHISTORY_RESET =3D "1"<br />BUILD=
HISTORY_PRESERVE:append =3D " files-in-package.txt"</div>
<div><br /><strong>Run:</strong><br /><span data-teams=3D"true">bitbake -c =
cleansstate base-passwd &amp;&amp; bitbake base-passwd</span><br /><strong>=
Check:</strong><br />cat PATH_TO_BUILD_dir/buildhistory/packages/core2-64-p=
oky-linux/base-passwd/base-passwd-dbg/files-in-package.txt<br /><em>(File e=
xists and content ok)</em><br /><strong>Run:</strong><br />rm -rf tmp &amp;=
&amp; bitbake base-passwd (it will use sstate cache)<br /><strong>Check:</s=
trong><br />cat PATH_TO_BUILD_dir/buildhistory/packages/core2-64-poky-linux=
/base-passwd/base-passwd-dbg/files-in-package.txt<br /><em>(File wont exist=
)</em></div>
<div>&nbsp;</div>
<div>Cheers,<br />Pedro</div>
</div>
</div>

--km4QFVaSB40MpmPtfsQQ--

