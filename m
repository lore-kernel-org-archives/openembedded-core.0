Return-Path: <sartre.l@email.ecagroup.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 702A5C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 12:21:52 +0000 (UTC)
Subject: Objcopy --add-gnu-debuglink call removes kernel module signature
To: openembedded-core@lists.openembedded.org
From: sartre.l@email.ecagroup.com
X-Originating-Location: FR (77.205.47.154)
X-Originating-Platform: Linux Chrome 101
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 09 Jun 2022 05:21:51 -0700
Message-ID: <G2T5.1654777311637536028.utTo@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="T4FKHU46ON6tx3qAmWkO"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jun 2022 12:21:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166776

--T4FKHU46ON6tx3qAmWkO
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I've noticed that on kirkstone branch, the call to objcopy --add-gnu-debugl=
ink, made by splitdebuginfo() function, on a signed kernel module is removi=
ng the signature.
An easy fix is to set=C2=A0=C2=A0INHIBIT_PACKAGE_DEBUG_SPLIT to "1" in the =
kernel recipe, this way kernel module signatures are not removed.
Maybe I can submitt this simple fix to meta-security layer.
But maybe it is better to handle it in oe-core as it was done in=C2=A0runst=
rip() function in=C2=A0lib/oe/package.py, there is already a=C2=A0is_kernel=
_module_signed() helper that detect if a kernel module is signed or not.
What do you think?

Regards
--
Leo

--T4FKHU46ON6tx3qAmWkO
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,<br /><br />I've noticed that on kirkstone branch, the call to objcop=
y --add-gnu-debuglink, made by splitdebuginfo() function, on a signed kerne=
l module is removing the signature.<br />An easy fix is to set&nbsp;&nbsp;I=
NHIBIT_PACKAGE_DEBUG_SPLIT to "1" in the kernel recipe, this way kernel mod=
ule signatures are not removed.<br />Maybe I can submitt this simple fix to=
 meta-security layer.<br />But maybe it is better to handle it in oe-core a=
s it was done in&nbsp;runstrip() function in&nbsp;lib/oe/package.py, there =
is already a&nbsp;is_kernel_module_signed() helper that detect if a kernel =
module is signed or not.<br />What do you think?<br /><br />Regards<br />--=
<br />Leo

--T4FKHU46ON6tx3qAmWkO--

