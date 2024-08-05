Return-Path: <jahnavijha14@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C98BC3DA4A
	for <webhook@archiver.kernel.org>; Mon,  5 Aug 2024 07:07:45 +0000 (UTC)
Subject: Systemd Upgradation from 250.5v to 256v in Yocto Kirkstone
To: openembedded-core@lists.openembedded.org
From: jahnavijha14@gmail.com
X-Originating-Location: Bengaluru, Karnataka, IN (121.241.186.82)
X-Originating-Platform: Linux Chrome 126
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 05 Aug 2024 00:07:35 -0700
Message-ID: <B3Uv.1722841655976313720.1Alc@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="kQFOHIsmQtAZzcxJGFVg"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Aug 2024 07:07:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202984

--kQFOHIsmQtAZzcxJGFVg
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I am trying to upgrade systemd package to 256v. I have systemd 256 version =
recipe files in my custom layer. But while building ( bitbake systemd) it t=
ends to always take the previous version of systemd that is 250.5. I get a =
warning like this:
---------------------------------------------------------------------------=
------------------------------------------------------
NOTE: Resolving any missing task queue dependencies
WARNING: preferred version 256.% of systemd not available (for item udev)
WARNING: versions of systemd available: 1:250.5
WARNING: preferred version 256.% of systemd not available (for item systemd=
)
WARNING: versions of systemd available: 1:250.5

---------------------------------------------------------------------------=
-----------------------------------------------------------

What could be the issue that it isn't taking the latest 256 version bb file=
 during build?

--kQFOHIsmQtAZzcxJGFVg
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi,</div>
<div>&nbsp;</div>
<div>I am trying to upgrade systemd package to 256v. I have systemd 256 ver=
sion recipe files in my custom layer. But while building ( bitbake systemd)=
 it tends to always take the previous version of systemd that is 250.5. I g=
et a warning like this:</div>
<div>----------------------------------------------------------------------=
-----------------------------------------------------------</div>
<div>NOTE: Resolving any missing task queue dependencies<br />WARNING: pref=
erred version 256.% of systemd not available (for item udev)<br />WARNING: =
versions of systemd available: 1:250.5<br />WARNING: preferred version 256.=
% of systemd not available (for item systemd)<br />WARNING: versions of sys=
temd available: 1:250.5</div>
<div>&nbsp;</div>
<div>----------------------------------------------------------------------=
----------------------------------------------------------------</div>
<div>&nbsp;</div>
<div>What could be the issue that it isn't taking the latest 256 version bb=
 file during build?</div>

--kQFOHIsmQtAZzcxJGFVg--

