Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6326CD37B0
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 06:54:41 +0000 (UTC)
Subject: Re: [openembedded/openembedded-core] openssh: Move sshdgenkeys.service to sshd.socket (af38a39)
To: openembedded-core@lists.openembedded.org
From: "Pawan Badganchi" <badganchipv@gmail.com>
X-Originating-Location: US (136.226.232.96)
X-Originating-Platform: Linux Chrome 116
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 17 Sep 2023 23:54:38 -0700
References: <CAO5Uq5TsXmkBsmBgyDJEaUszCncjuFbhjYWJUX_L1BBycyyxLA@mail.gmail.com>
In-Reply-To: <CAO5Uq5TsXmkBsmBgyDJEaUszCncjuFbhjYWJUX_L1BBycyyxLA@mail.gmail.com>
Message-ID: <31570.1695020078376931640@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Ywcqr1snLimvFokdvONM"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 06:54:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187819

--Ywcqr1snLimvFokdvONM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

by removing the dependency, restarting the sshd service or starting it manu=
ally will it generates keys?

recipes-core/openssh/files/sshd@.service
@@ -1,14 +1,12 @@
[Unit]
Description=3DOpenSSH Per-Connection Daemon
- Wants=3Dsshdgenkeys.service

--Ywcqr1snLimvFokdvONM
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p style=3D"margin-bottom: 0px; padding: 0px; color: #172b4d; font-family: =
-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, 'Fir=
a Sans', 'Droid Sans', 'Helvetica Neue', sans-serif;">by removing the depen=
dency, restarting the sshd service or starting it manually will it generate=
s keys?</p>
<div class=3D"preformatted panel" style=3D"margin: 9px 0px; padding: 0px; b=
order-color: #c1c7d0; background: #f4f5f7; font-size: 12px; line-height: 1.=
33333; font-family: monospace; border-radius: 3px; color: #172b4d;">
<div class=3D"preformattedContent panelContent" style=3D"margin: 0px; paddi=
ng: 9px 12px;">
<pre style=3D"margin-bottom: 0px; padding: 0px; max-height: 30em; overflow-=
wrap: normal; word-break: normal;"> recipes-core/openssh/files/sshd@.servic=
e
 @@ -1,14 +1,12 @@
 [Unit]
 Description=3DOpenSSH Per-Connection Daemon
- Wants=3Dsshdgenkeys.service</pre>
</div>
</div>

--Ywcqr1snLimvFokdvONM--

