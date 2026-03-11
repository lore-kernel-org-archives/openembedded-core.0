Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08105FD0653
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 08:07:09 +0000 (UTC)
Subject: Re: [PATCH] rust: dynamically link with llvm for all rust variants
To: openembedded-core@lists.openembedded.org
From: "Varatharajan, Deepesh" <deepesh.varatharajan@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (49.204.85.206)
X-Originating-Platform: Windows Chrome 145
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 11 Mar 2026 01:07:05 -0700
References: <20260310181354.2396448-1-alex.kanavin@gmail.com>
In-Reply-To: <20260310181354.2396448-1-alex.kanavin@gmail.com>
Message-ID: <131089.1773216425426295510@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="d2tSoV366Kt2MFUmYnI0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 08:07:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232840

--d2tSoV366Kt2MFUmYnI0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

This change need tweaks in rust.py and rust recipe to support multilib buil=
ds.
Without tweaks rust selftest and rust multilib builds will fail.

Required changes can be found here :
https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Ddeepesh/=
sunil-rust-issue&id=3D44ce23e12e411ef9a1724e79c2b6ac6d5f0ddedc

Regards,
Deepesh

--d2tSoV366Kt2MFUmYnI0
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Alex,<br /><br /></div>
<div>This change need tweaks in rust.py and rust recipe to support multilib=
 builds.<br />Without tweaks rust selftest and rust multilib builds will fa=
il.<br /><br />Required changes can be found here :<br />https://git.openem=
bedded.org/openembedded-core-contrib/commit/?h=3Ddeepesh/sunil-rust-issue&a=
mp;id=3D44ce23e12e411ef9a1724e79c2b6ac6d5f0ddedc<br /><br />Regards,<br />D=
eepesh</div>

--d2tSoV366Kt2MFUmYnI0--

