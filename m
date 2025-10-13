Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA8FCCCD185
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 05:32:26 +0000 (UTC)
Subject: Re: [kirkstone][PATCH] 1/2] systemd: backport fix for handle USE_NLS from master
To: openembedded-core@lists.openembedded.org
From: "Ashish Mishra" <emailaddress.ashish@gmail.com>
X-Originating-Location: IN (1.7.20.122)
X-Originating-Platform: Windows Chrome 141
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 12 Oct 2025 22:32:20 -0700
References: <3495.1759728792995913135@lists.openembedded.org>
In-Reply-To: <3495.1759728792995913135@lists.openembedded.org>
Message-ID: <6802.1760333540954833228@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="EjKJIGYC6cKHe5vLuU30"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 05:32:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224755

--EjKJIGYC6cKHe5vLuU30
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Gyorgy Sarvari,

Good morning.

Would request to please consider this patch for merge.
If you have any feedback / suggestion, please feel free to share.
I will work accordingly.

Thanks,
Ashish

--EjKJIGYC6cKHe5vLuU30
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-size: 16px; font-style: normal; font-variant-ligature=
s: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: nor=
mal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none;=
 widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space:=
 normal; text-decoration-thickness: initial; text-decoration-style: initial=
; text-decoration-color: initial; font-family: system-ui, Roboto, Arial, sa=
ns-serif; background-color: #ffffff;">Hi Gyorgy Sarvari,&nbsp;</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-size: 16px; font-style: normal; font-variant-ligature=
s: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: nor=
mal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none;=
 widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space:=
 normal; text-decoration-thickness: initial; text-decoration-style: initial=
; text-decoration-color: initial; font-family: system-ui, Roboto, Arial, sa=
ns-serif; background-color: #ffffff;">&nbsp;</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-size: 16px; font-style: normal; font-variant-ligature=
s: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: nor=
mal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none;=
 widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space:=
 normal; text-decoration-thickness: initial; text-decoration-style: initial=
; text-decoration-color: initial; font-family: system-ui, Roboto, Arial, sa=
ns-serif; background-color: #ffffff;">Good morning.</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-size: 16px; font-style: normal; font-variant-ligature=
s: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: nor=
mal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none;=
 widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space:=
 normal; text-decoration-thickness: initial; text-decoration-style: initial=
; text-decoration-color: initial; font-family: system-ui, Roboto, Arial, sa=
ns-serif; background-color: #ffffff;"><br style=3D"box-sizing: border-box; =
overflow-wrap: break-word !important;" />Would request to please consider t=
his patch for merge.<br style=3D"box-sizing: border-box; overflow-wrap: bre=
ak-word !important;" />If you have any feedback / suggestion, please feel f=
ree to share.<br style=3D"box-sizing: border-box; overflow-wrap: break-word=
 !important;" />I will work accordingly.</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-size: 16px; font-style: normal; font-variant-ligature=
s: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: nor=
mal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none;=
 widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space:=
 normal; text-decoration-thickness: initial; text-decoration-style: initial=
; text-decoration-color: initial; font-family: system-ui, Roboto, Arial, sa=
ns-serif; background-color: #ffffff;">&nbsp;</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-size: 16px; font-style: normal; font-variant-ligature=
s: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: nor=
mal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none;=
 widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space:=
 normal; text-decoration-thickness: initial; text-decoration-style: initial=
; text-decoration-color: initial; font-family: system-ui, Roboto, Arial, sa=
ns-serif; background-color: #ffffff;">Thanks,<br style=3D"box-sizing: borde=
r-box; overflow-wrap: break-word !important;" />Ashish&nbsp;</div>
</div>

--EjKJIGYC6cKHe5vLuU30--

