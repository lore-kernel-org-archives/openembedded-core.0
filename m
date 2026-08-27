Return-Path: <jakub.szczudlo@nokia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90269C61DB9
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 11:05:34 +0000 (UTC)
Subject: Re: [wrynose][PATCH 1/3] expat: fix CVE-2026-50219
To: openembedded-core@lists.openembedded.org
From: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>
X-Originating-Location: Warsaw, Mazovia, PL (170.85.29.18)
X-Originating-Platform: Windows Firefox 140
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 04:05:31 -0700
References: <20260824152023.19501-1-jakub.szczudlo@nokia.com> <042a154cf3f65594e4d46156f4df835195b68f90.camel@pbarker.dev> <2789044.1787732076156082495@lists.openembedded.org> <a801b816ecbff66fc39732801eec691af21ce3ac.camel@pbarker.dev> <b8b848b9-81ec-4a9e-bb4c-d1e196eeb479@est.tech>
In-Reply-To: <b8b848b9-81ec-4a9e-bb4c-d1e196eeb479@est.tech>
Message-ID: <2326647.1787828731489290062@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="t8bjSnC2ArnMNUYSZsRR"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 11:05:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244476

--t8bjSnC2ArnMNUYSZsRR
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

some words also from me:
There is no deleting of functions in expat version from 2.6.4 to 2.8.3
Backwards compatibility should be intact.
There is a deprecation of one of hash function XML_SetHashSalt but it is st=
ill possible to be used
The biggest change that could potentially break some unsafe code is the fix=
 for CVE-2026-50219 it makes parser rejecting free/reset/re-entry when it i=
s already in used, so it is defending against possible memory corruption. A=
s it is a fix for security vulnerability I think we can take that risk.

I have also tested it using ptest from packages that use expat it in runtim=
e like python-xml or libxml-parser-perl and all tests passed.

Best regards,
Jakub Szczudlo

--t8bjSnC2ArnMNUYSZsRR
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi,<br /><br />some words also from me:<br />There is no deleting of f=
unctions in expat version from 2.6.4 to 2.8.3<br />Backwards compatibility =
should be intact.<br />There is a deprecation of one of hash function XML_S=
etHashSalt but it is still possible to be used<br />The biggest change that=
 could potentially break some unsafe code is the fix for CVE-2026-50219 it =
makes parser rejecting free/reset/re-entry when it is already in used, so i=
t is defending against possible memory corruption. As it is a fix for secur=
ity vulnerability I think we can take that risk.</div>
<div><br />I have also tested it using ptest from packages that use expat i=
t in runtime like python-xml or libxml-parser-perl and all tests passed.<br=
 /><br />Best regards,<br />Jakub Szczudlo</div>

--t8bjSnC2ArnMNUYSZsRR--

