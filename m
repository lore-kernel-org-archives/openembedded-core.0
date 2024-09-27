Return-Path: <atharvanandanwar@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85337CF648C
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 23:04:00 +0000 (UTC)
Subject: Re: [kirkstone 09/15] buildhistory: Fix intermittent package file list creation
To: openembedded-core@lists.openembedded.org
From: atharvanandanwar@outlook.com
X-Originating-Location: Sioux Falls, South Dakota, US (208.53.195.56)
X-Originating-Platform: Linux Firefox 130
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 27 Sep 2024 16:03:58 -0700
References: <6817b012763fc32cdcffe30163a304da3ed59ae1.1726971209.git.steve@sakoman.com>
In-Reply-To: <6817b012763fc32cdcffe30163a304da3ed59ae1.1726971209.git.steve@sakoman.com>
Message-ID: <1702.1727478238338845322@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0nA0YZI002T33ULWCEph"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 23:04:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205042

--0nA0YZI002T33ULWCEph
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

This patch has introduced an issue while building recipes without any files=
 installed or packaged. Prime example for this is meta-toolchain [1]. As, p=
reviously the error was hidden in the for loop - an explicit failure is cau=
sing an issue while building meta-toolchain et al. I believe the fix is eit=
her to `inherit nopackages` for meta-toolchain like recipes or modify the p=
reviously submitted patch to not hard-fail.

1: https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/me=
ta/meta-toolchain.bb

Thanks,
--Atharva

--0nA0YZI002T33ULWCEph
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>Hello,</div>
<div>&nbsp;</div>
<div>This patch has introduced an issue while building recipes without any =
files installed or packaged. Prime example for this is meta-toolchain [1]. =
As, previously the error was hidden in the for loop - an explicit failure i=
s causing an issue while building meta-toolchain et al. I believe the fix i=
s either to `inherit nopackages` for meta-toolchain like recipes or modify =
the previously submitted patch to not hard-fail.</div>
<div>&nbsp;</div>
<div>1: <a href=3D"https://git.openembedded.org/openembedded-core/tree/meta=
/recipes-core/meta/meta-toolchain.bb" target=3D"_blank" rel=3D"noopener">ht=
tps://git.openembedded.org/openembedded-core/tree/meta/recipes-core/meta/me=
ta-toolchain.bb</a></div>
<div>&nbsp;</div>
<div>Thanks,</div>
<div>--Atharva</div>
</div>

--0nA0YZI002T33ULWCEph--

