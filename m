Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4404E77197
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 09:31:27 +0000 (UTC)
Subject: Re: [PATCH V2 3/3] rust: Upgrade 1.80.1->1.81.0
To: openembedded-core@lists.openembedded.org
From: "Varatharajan, Deepesh" <deepesh.varatharajan@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (49.204.85.206)
X-Originating-Platform: Windows Chrome 131
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 09 Jan 2025 01:31:25 -0800
References: <20250109092521.3921275-3-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20250109092521.3921275-3-Deepesh.Varatharajan@windriver.com>
Message-ID: <8177.1736415085999013174@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="auGNg7fYncmY7IbNK4RF"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jan 2025 09:31:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209619

--auGNg7fYncmY7IbNK4RF
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Tested for rust_1.81 update:

bitbake rust
bitbake cargo
bitbake nativesdk-rust
bitbake core-image-minimal
bitbake core-image-sato -c do_populate_sdk
bitbake core-image-sato -c testsdk
bitbake world
oe-selftest -r rust
oe-sefltest -r reproducible

oe-selftest results for all archs as below:
Target=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pass =C2=A0 =C2=A0 =C2=A0 skipped
x86_64 =C2=A0 =C2=A0 =C2=A0 18646 =C2=A0 =C2=A0 =C2=A0 =C2=A0 418
x86=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 18468 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 596
ARM64=C2=A0 =C2=A0 =C2=A0 18496 =C2=A0 =C2=A0 =C2=A0 =C2=A0 568
ARM =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A018451 =C2=A0 =C2=A0 =C2=A0 =C2=A0 613
ppc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 18418 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 646

--auGNg7fYncmY7IbNK4RF
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>Tested for rust_1.81 update:<br /><br /></div>
<div>bitbake rust<br />bitbake cargo<br />bitbake nativesdk-rust<br />bitba=
ke core-image-minimal<br />bitbake core-image-sato -c do_populate_sdk<br />=
bitbake core-image-sato -c testsdk&nbsp;<br />bitbake world<br />oe-selftes=
t -r rust<br />oe-sefltest -r reproducible<br /><br /></div>
<div>oe-selftest results for all archs as below:</div>
<div>Target&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;pass &nbsp; &nbsp; &nbsp; skip=
ped<br />x86_64 &nbsp; &nbsp; &nbsp; 18646 &nbsp; &nbsp; &nbsp; &nbsp; 418<=
br />x86&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 18468 &nbsp; &nbsp; &nbsp=
; &nbsp; 596<br />ARM64&nbsp; &nbsp; &nbsp; 18496 &nbsp; &nbsp; &nbsp; &nbs=
p; 568<br />ARM &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;18451 &nbsp; &nbsp; &nbsp=
; &nbsp; 613<br />ppc&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 18418 &nbsp;=
 &nbsp; &nbsp; &nbsp; 646</div>
</div>

--auGNg7fYncmY7IbNK4RF--

