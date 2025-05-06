Return-Path: <sathishkumar.d.cbe@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 770D2C3ABBF
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 11:38:44 +0000 (UTC)
Subject: Re: systemd build failure with gcc 15 / tpm2 / aarch64: gcs required
To: openembedded-core@lists.openembedded.org
From: "Sathishkumar D" <sathishkumar.d.cbe@gmail.com>
X-Originating-Location: Coimbatore, Tamil Nadu, IN (103.224.35.26)
X-Originating-Platform: Linux Chrome 136
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 06 May 2025 04:38:37 -0700
References: <0a4bac6d-292f-4278-ac5b-348a160a319c@windriver.com>
In-Reply-To: <0a4bac6d-292f-4278-ac5b-348a160a319c@windriver.com>
Message-ID: <23053.1746531517602060473@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="PziwLxGmZMU6BBwt2wVd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 11:38:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216040

--PziwLxGmZMU6BBwt2wVd
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I am also facing the same build issue. I tried to understand the issue. Fro=
m build system for both openssl and systemd, -mbranch-protection=3Dstandard=
 enabled. In fact the support this flag added long back, https://github.com=
/openembedded/openembedded-core/commit/8905639d1cdc5ce809cc5ecd9672f5e86bf8=
a579 ( https://github.com/openembedded/openembedded-core/commit/8905639d1cd=
c5ce809cc5ecd9672f5e86bf8a579 ) and tpm2 introduces additional dependencies=
 for systemd as in commit https://git.yoctoproject.org/meta-security/commit=
/meta-tpm/recipes-core/systemd/systemd_%25.bbappend?id=3D6eb3098e57881895e6=
2fc811f714c2aa4ecfcf8f.

So something issue with gcc-15? or what makes openssl to loose gcs?

Regards,
Sathishkumar D

--PziwLxGmZMU6BBwt2wVd
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi all,</div>
<div>&nbsp;</div>
<div>I am also facing the same build issue. I tried to understand the issue=
. From build system for both openssl and systemd, <span style=3D"font-famil=
y: monospace;"><span style=3D"color: #18b218; background-color: #ffffff;">-=
mbranch-protection=3Dstandard</span></span>&nbsp; &nbsp;enabled. In fact th=
e support this flag added long back, <a href=3D"https://github.com/openembe=
dded/openembedded-core/commit/8905639d1cdc5ce809cc5ecd9672f5e86bf8a579" tar=
get=3D"_blank" rel=3D"noopener">https://github.com/openembedded/openembedde=
d-core/commit/8905639d1cdc5ce809cc5ecd9672f5e86bf8a579 </a>and tpm2 introdu=
ces additional dependencies for systemd as in commit <a href=3D"https://git=
.yoctoproject.org/meta-security/commit/meta-tpm/recipes-core/systemd/system=
d_%25.bbappend?id=3D6eb3098e57881895e62fc811f714c2aa4ecfcf8f" target=3D"_bl=
ank" rel=3D"noopener">https://git.yoctoproject.org/meta-security/commit/met=
a-tpm/recipes-core/systemd/systemd_%25.bbappend?id=3D6eb3098e57881895e62fc8=
11f714c2aa4ecfcf8f</a>.&nbsp;</div>
<div>&nbsp;</div>
<div>So something issue with gcc-15? or what makes openssl to loose gcs?</d=
iv>
<div>&nbsp;</div>
<div>Regards,<br />Sathishkumar D</div>
<div>&nbsp;</div>

--PziwLxGmZMU6BBwt2wVd--

