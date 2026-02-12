Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2406EEE36AC
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 16:59:16 +0000 (UTC)
Subject: Re: [PATCH V2] gdb: Upgrade 16.3 -> 17.1
To: openembedded-core@lists.openembedded.org
From: "Dora, Sunil Kumar" <SunilKumar.Dora@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (106.51.223.154)
X-Originating-Platform: Windows Chrome 144
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 12 Feb 2026 08:59:10 -0800
References: <20251223094411.2919323-1-sundeep.kokkonda@windriver.com> <DF6BX97B9AVC.XYGAZDNN5E39@bootlin.com> <359949.1767207042798785049@lists.openembedded.org>
In-Reply-To: <359949.1767207042798785049@lists.openembedded.org>
Message-ID: <1270865.1770915550613871197@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="rXrEYjDZqcCvTqF9UGwY"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 16:59:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231050

--rXrEYjDZqcCvTqF9UGwY
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Update:

I have confirmed with the musl maintainers that musl currently does not sup=
port arbitrary/custom baud rates (e.g. via BOTHER/termios2). If such suppor=
t is added in the future, it would likely be exposed through cfsetospeed(),=
 but at present it is not implemented.

https://www.openwall.com/lists/musl/2026/02/12/1

Based on this, I will prepare and send a fix upstream to GDB to handle this=
 correctly on musl systems. After that, we can proceed with upgrading GDB f=
rom 16.3 to 17.1. (https://sourceware.org/bugzilla/show_bug.cgi?id=3D33747)

Thanks,
Sunil Dora

--rXrEYjDZqcCvTqF9UGwY
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Update:<br /><br />
<p data-start=3D"184" data-end=3D"447">I have confirmed with the musl maint=
ainers that musl currently does not support arbitrary/custom baud rates (e.=
g. via BOTHER/termios2). If such support is added in the future, it would l=
ikely be exposed through cfsetospeed(), but at present it is not implemente=
d.<br /><br />https://www.openwall.com/lists/musl/2026/02/12/1</p>
<p data-start=3D"449" data-end=3D"616">Based on this, I will prepare and se=
nd a fix upstream to GDB to handle this correctly on musl systems. After th=
at, we can proceed with upgrading GDB from 16.3 to 17.1. (https://sourcewar=
e.org/bugzilla/show_bug.cgi?id=3D33747)<br /><br />Thanks,<br />Sunil Dora<=
/p>
</div>

--rXrEYjDZqcCvTqF9UGwY--

