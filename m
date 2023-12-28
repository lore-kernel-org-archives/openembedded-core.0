Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 964F2C3DA6E
	for <webhook@archiver.kernel.org>; Thu, 28 Dec 2023 09:28:07 +0000 (UTC)
Subject: Re: [PATCH V3] rust-cross-canadian: Fix file conflicts for arm and aarch64
To: openembedded-core@lists.openembedded.org
From: "Hemraj, Deepthi" <Deepthi.Hemraj@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (49.204.85.206)
X-Originating-Platform: Windows Chrome 120
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 28 Dec 2023 01:28:05 -0800
References: <92C1939A-88C7-4540-A81B-54B2D24EBF70@arm.com>
In-Reply-To: <92C1939A-88C7-4540-A81B-54B2D24EBF70@arm.com>
Message-ID: <16462.1703755685035718946@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="reE2PX9Q1xYVxYTzDHxH"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Dec 2023 09:28:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192976

--reE2PX9Q1xYVxYTzDHxH
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Ross,

>> if the environment scripts are both overwriting the same environment var=
iables?

The environment script variables are generated based on the architectures.
Please find the environment variables generated in the script file:
RUST_TARGET_PATH=3D"$OECORE_NATIVE_SYSROOT/usr/lib/aarch64-poky-linux/rustl=
ib"
RUST_TARGET_PATH=3D"$OECORE_NATIVE_SYSROOT/usr/lib/arm-pokymllib32-linux-gn=
ueabi/rustlib"
Please let me know if this was your query or did I misinterrupted it?

--reE2PX9Q1xYVxYTzDHxH
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Ross,</div>
<div>&nbsp;</div>
<div>&gt;&gt; if the environment scripts are both overwriting the same envi=
ronment variables?</div>
<div>&nbsp;</div>
<div>The environment script variables are generated based on the architectu=
res.</div>
<div>Please find the environment variables generated in the script file:</d=
iv>
<div>RUST_TARGET_PATH=3D"$OECORE_NATIVE_SYSROOT/usr/lib/aarch64-poky-linux/=
rustlib"</div>
<div>RUST_TARGET_PATH=3D"$OECORE_NATIVE_SYSROOT/usr/lib/arm-pokymllib32-lin=
ux-gnueabi/rustlib"</div>
<div>Please let me know if this was your query or did I misinterrupted it?<=
/div>
<div>&nbsp;</div>

--reE2PX9Q1xYVxYTzDHxH--

