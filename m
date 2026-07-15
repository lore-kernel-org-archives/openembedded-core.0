Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE0AC44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 13:25:24 +0000 (UTC)
Subject: Re: [scarthgap] [PATCH 8/8] cups: Fix CVE-2026-41079
To: openembedded-core@lists.openembedded.org
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.83)
X-Originating-Platform: Windows Edge 150
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 15 Jul 2026 06:25:24 -0700
References: <20260623113037.28968-1-adongare@cisco.com> <20260623113037.28968-8-adongare@cisco.com> <DJL0OIF53N7U.2AAPEB2LOEEDT@smile.fr>
In-Reply-To: <DJL0OIF53N7U.2AAPEB2LOEEDT@smile.fr>
Message-ID: <717783.1784121924206297098@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Qz2e2GxkvmqosUaED1Vm"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 13:25:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240954

--Qz2e2GxkvmqosUaED1Vm
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Thanks Yoann.
Yes, I will send a cleaned v2.

The wrynose fixes for CVE-2026-27447 and CVE-2026-41079 are now merged, so =
wrynose is covered.

For scarthgap v2, I will split the series as requested:
- one series for the remaining CUPS CVEs
- a separate series for CVE-2026-27447 and CVE-2026-41079

I will also clean the CVE-2026-41079 patch so it only adds CVE-2026-41079.p=
atch and updates cups.inc. The unrelated changes to earlier CVE patch files=
 will be moved into the proper commits or dropped.

Thanks,
Anil Dongare

--Qz2e2GxkvmqosUaED1Vm
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Thanks Yoann. <br />Yes, I will send a cleaned v2.<br /><br />The wryn=
ose fixes for CVE-2026-27447 and CVE-2026-41079 are now merged, so wrynose =
is covered.<br /><br />For scarthgap v2, I will split the series as request=
ed:<br />- one series for the remaining CUPS CVEs<br />- a separate series =
for CVE-2026-27447 and CVE-2026-41079<br /><br />I will also clean the CVE-=
2026-41079 patch so it only adds CVE-2026-41079.patch and updates cups.inc.=
 The unrelated changes to earlier CVE patch files will be moved into the pr=
oper commits or dropped.<br /><br /><span style=3D"color: #333333; font-fam=
ily: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberat=
ion Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe=
 UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-=
variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; let=
ter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-=
transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; white-space: normal; background-color: #ffffff; text-decoration-thickne=
ss: initial; text-decoration-style: initial; text-decoration-color: initial=
; display: inline !important; float: none;">Thanks,</span><br style=3D"box-=
sizing: border-box; overflow-wrap: break-word !important; color: #333333; f=
ont-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', '=
Liberation Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji',=
 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal=
; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 4=
00; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px=
; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-w=
idth: 0px; white-space: normal; background-color: #ffffff; text-decoration-=
thickness: initial; text-decoration-style: initial; text-decoration-color: =
initial;" /><span style=3D"color: #333333; font-family: system-ui, 'Segoe U=
I', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-s=
erif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color=
 Emoji'; font-size: 16px; font-style: normal; font-variant-ligatures: norma=
l; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orp=
hans: 2; text-align: start; text-indent: 0px; text-transform: none; widows:=
 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal;=
 background-color: #ffffff; text-decoration-thickness: initial; text-decora=
tion-style: initial; text-decoration-color: initial; display: inline !impor=
tant; float: none;">Anil Dongare</span></div>

--Qz2e2GxkvmqosUaED1Vm--

