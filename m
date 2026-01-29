Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C736D6B092
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 16:34:50 +0000 (UTC)
Subject: Re: [PATCH v5 0/2] improve_kernel_cve_report: Add a bbclass support
To: openembedded-core@lists.openembedded.org
From: "vboudevin" <valentin.boudevin@gmail.com>
X-Originating-Location: Laval, Quebec, CA (208.88.110.46)
X-Originating-Platform: Linux Firefox 146
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 29 Jan 2026 08:34:45 -0800
References: <188AFD4FCC1313A8.2683732@lists.openembedded.org> <20260128163827.386933-1-valentin.boudevin@gmail.com> <PA3PR07MB10721FE43E226CB23A078A1C18A9EA@PA3PR07MB10721.eurprd07.prod.outlook.com>
In-Reply-To: <PA3PR07MB10721FE43E226CB23A078A1C18A9EA@PA3PR07MB10721.eurprd07.prod.outlook.com>
Message-ID: <1014278.1769704485995392702@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="DF1Fi0eCvGzduxRQwX1J"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 16:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230139

--DF1Fi0eCvGzduxRQwX1J
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Daniel,

I made some tests with the new vex class. I may be wrong, but it doesn't se=
em like an issue linked with improve_kernel_cve_report bbclass.

I tried to clean the build, remove "inherit improve_kernel_cve_report", and=
 keep "INHERIT=C2=A0+=3D "vex""=C2=A0. But, the cve-summary file is still e=
mpty after the rebuild.

If I change back to "cve-check" (still without improve_kernel_cve_report cl=
ass) cve-summary seems correct and not empty.

It looks more like a vex class issue. Also, VEX does not seem to recreate a=
 new .json file at every build, which is strange.

--DF1Fi0eCvGzduxRQwX1J
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hello Daniel, <br /><br />I made some tests with the new vex class. I =
may be wrong, but it doesn't seem like an issue linked with improve_kernel_=
cve_report bbclass.<br /><br />I tried to clean the build, remove "inherit =
improve_kernel_cve_report", and keep "INHERIT&nbsp;+=3D "vex""&nbsp;. But, =
the cve-summary file is still empty after the rebuild. <br /><br />If I cha=
nge back to "cve-check" (still without improve_kernel_cve_report class) cve=
-summary seems correct and not empty.<br /><br />
<div>It looks more like a vex class issue. Also, VEX does not seem to recre=
ate a new .json file at every build, which is strange.</div>
</div>

--DF1Fi0eCvGzduxRQwX1J--

