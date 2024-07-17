Return-Path: <ohnatiuk@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8689C3DA42
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 09:59:33 +0000 (UTC)
Subject: Re: [PATCH v2] gcc: remove paths to sysroot from configargs.h and checksum-options for gcc-cross-canadian
To: openembedded-core@lists.openembedded.org
From: "Oleksandr Hnatiuk" <ohnatiuk@cisco.com>
X-Originating-Location: Bagshot, England, GB (64.103.40.21)
X-Originating-Platform: Windows Firefox 127
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 17 Jul 2024 02:59:29 -0700
References: <20240717095606.3572072-1-ohnatiuk@cisco.com>
In-Reply-To: <20240717095606.3572072-1-ohnatiuk@cisco.com>
Message-ID: <23423.1721210369118673744@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="cDXQ8klp4MVLQiZDfU8E"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 09:59:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202152

--cDXQ8klp4MVLQiZDfU8E
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

For some reason this created a new topic rather than post to existing one..=
.

I have refactored the code from my previous submission to move the code fro=
m all 3 places to functions.
For both functions: I have chosen sed code from gcc-cross.inc (replaces the=
 paths with "/host" rather than "/" as gcc-target did). This unification sh=
ouldn't affect the functionality, only what will be seen instead of sysroot=
 paths.
For remove_sysroot_paths_from_checksum_options: I saw that gcc-target.inc a=
nd gcc-cross.inc erase STAGING_DIR_TARGET and STAGING_DIR_HOST respectively=
. To preserve this behavior, I pass them as parameters and use ${1} in sed.

Since I am not that familiar with possible differences between regular shel=
l scripting and shell scripting inside of bitbake recipes, could you confir=
m that I parameterized the function correctly?

--cDXQ8klp4MVLQiZDfU8E
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>For some reason this created a new topic rather than post to existing =
one...</div>
<div>&nbsp;</div>
<div>
<div>I have refactored the code from my previous submission to move the cod=
e from all 3 places to functions.<br />For both functions: I have chosen se=
d code from gcc-cross.inc (replaces the paths with "/host" rather than "/" =
as gcc-target did). This unification shouldn't affect the functionality, on=
ly what will be seen instead of sysroot paths.<br />For remove_sysroot_path=
s_from_checksum_options: I saw that gcc-target.inc and gcc-cross.inc erase =
STAGING_DIR_TARGET and STAGING_DIR_HOST respectively. To preserve this beha=
vior, I pass them as parameters and use ${1} in sed.</div>
<div>&nbsp;</div>
<div>Since I am not that familiar with possible differences between regular=
 shell scripting and shell scripting inside of bitbake recipes, could you c=
onfirm that I parameterized the function correctly?</div>
<div>&nbsp;</div>
</div>

--cDXQ8klp4MVLQiZDfU8E--

