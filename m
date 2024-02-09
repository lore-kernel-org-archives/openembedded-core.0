Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF540C4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 11:09:45 +0000 (UTC)
Subject: Re: [kirkstone][PATCH v2] shadow: backport patch to fix CVE-2023-29383
To: openembedded-core@lists.openembedded.org
From: "Pawan Badganchi" <badganchipv@gmail.com>
X-Originating-Location: US (136.226.233.98)
X-Originating-Platform: Linux Chrome 121
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 09 Feb 2024 03:09:45 -0800
References: <13917.1707390777082340913@lists.openembedded.org>
In-Reply-To: <13917.1707390777082340913@lists.openembedded.org>
Message-ID: <3891.1707476985725014543@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="PvkktXCllhQNJeCFamct"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 11:09:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195196

--PvkktXCllhQNJeCFamct
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,
The issue does not seems to fix, getting below warning. Could you please ch=
eck.

We are using this shadow library in our application.
When we compile our application we get below warning in log.do_prepare_reci=
pe_sysroot

"configuration error - unknown item 'SYSLOG_SU_ENAB' (notify administrator)=
"
"configuration error - unknown item 'SYSLOG_SG_ENAB' (notify administrator)=
"

above warning is observed though below CVE is already available in our code=
 kirkstone branch.

CVE-2023-29383 ( https://github.com/advisories/GHSA-p9w4-8hh8-crcx ).patch
0001-Overhaul-valid_field.patch.

--PvkktXCllhQNJeCFamct
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,<br />The issue does not seems to fix, getting below warning. Could you =
please check.<br /><br />
<p dir=3D"auto" style=3D"margin-bottom: 16px; color: #1f2328; font-family: =
-apple-system, BlinkMacSystemFont, 'Segoe UI', 'Noto Sans', Helvetica, Aria=
l, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji';">We are using this sh=
adow library in our application.<br />When we compile our application we ge=
t below warning in log.do_prepare_recipe_sysroot</p>
<p dir=3D"auto" style=3D"margin-bottom: 16px; color: #1f2328; font-family: =
-apple-system, BlinkMacSystemFont, 'Segoe UI', 'Noto Sans', Helvetica, Aria=
l, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji';">"configuration error=
 - unknown item 'SYSLOG_SU_ENAB' (notify administrator)"<br />"configuratio=
n error - unknown item 'SYSLOG_SG_ENAB' (notify administrator)"</p>
<p dir=3D"auto" style=3D"margin-bottom: 16px; color: #1f2328; font-family: =
-apple-system, BlinkMacSystemFont, 'Segoe UI', 'Noto Sans', Helvetica, Aria=
l, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji';">above warning is obs=
erved though below CVE is already available in our code kirkstone branch.</=
p>
<p dir=3D"auto" style=3D"color: #1f2328; font-family: -apple-system, BlinkM=
acSystemFont, 'Segoe UI', 'Noto Sans', Helvetica, Arial, sans-serif, 'Apple=
 Color Emoji', 'Segoe UI Emoji'; margin-bottom: 0px !important;"><a style=
=3D"color: var(--fgcolor-accent, var(--color-accent-fg)); text-decoration-l=
ine: underline; text-underline-offset: 0.2rem;" title=3D"CVE-2023-29383" hr=
ef=3D"https://github.com/advisories/GHSA-p9w4-8hh8-crcx" data-hovercard-typ=
e=3D"advisory" data-hovercard-url=3D"/advisories/GHSA-p9w4-8hh8-crcx/hoverc=
ard">CVE-2023-29383</a>.patch<br />0001-Overhaul-valid_field.patch.</p>

--PvkktXCllhQNJeCFamct--

