Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A2DEE7FF4
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 07:25:48 +0000 (UTC)
Subject: Re: [mickledore][PATCH] binutils: Fix CVE-2023-39128
To: openembedded-core@lists.openembedded.org
From: "Siddharth" <sdoshi@mvista.com>
X-Originating-Location: Ahmedabad, Gujarat, IN (157.32.70.97)
X-Originating-Platform: Linux Chrome 116
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 11 Sep 2023 00:25:43 -0700
References: <20230908124109.70317-1-sanjanasanju1608@gmail.com>
In-Reply-To: <20230908124109.70317-1-sanjanasanju1608@gmail.com>
Message-ID: <28187.1694417143207079753@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="kJRXEwSNX259MKMuizvh"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Sep 2023 07:25:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187478

--kJRXEwSNX259MKMuizvh
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Sanjana,

Thank-you for this patch.

But, i feel this is not the right way to patch this vulnerability. No doubt=
s the patch is released for binutils-gdb, but that is because the sources a=
re merged.

However, in our systems, the command gdb comes from gdb package and not fro=
m bintuils-gdb.

Additional confirmation can also be obtained from bintuils configuration wh=
ere we are disabling gdb from bintuils.

So even after patching the vulnerability will exists as it not patched in g=
db and where it is patched, the gdb is diasbled.

--kJRXEwSNX259MKMuizvh
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>Hi Sanjana,<br /><br />Thank-you for this patch.</p>
<p>But, i feel this is not the right way to patch this vulnerability. No do=
ubts the patch is released for binutils-gdb, but that is because the source=
s are merged.</p>
<p>However, in our systems, the command gdb comes from gdb package and not =
from bintuils-gdb.</p>
<p>Additional confirmation can also be obtained from bintuils configuration=
 where we are disabling gdb from bintuils.<br /><br />So even after patchin=
g the vulnerability will exists as it not patched in gdb and where it is pa=
tched, the gdb is diasbled.</p>

--kJRXEwSNX259MKMuizvh--

