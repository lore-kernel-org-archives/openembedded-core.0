Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0728C369D5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 16:55:10 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] cdrtools-native: fix booting EFI ISO live failed
To: openembedded-core@lists.openembedded.org
From: "hongxu" <hongxu.jia@eng.windriver.com>
X-Originating-Location: US (147.11.105.171)
X-Originating-Platform: Linux Firefox 136
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 28 Apr 2025 09:55:08 -0700
References: <AE38D3E5-5632-4C2C-ABBD-D213983EBD63@arm.com>
In-Reply-To: <AE38D3E5-5632-4C2C-ABBD-D213983EBD63@arm.com>
Message-ID: <25979.1745859308517888166@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="wrXz42IkVjTdo4xH5LYV"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 16:55:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215621

--wrXz42IkVjTdo4xH5LYV
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

I will update to Inactive-Upstream. in v3

About schilytools, it could not be built from cdrtools recipe directly,=C2=
=A0 the reason is schilytools using a bootstrap 'smake' binary for compilin=
g
which is created in the psmake/ directory from source [1].=C2=A0 We need to=
 create the recipe schilytools from scratch.

Due to cdrtools have license problem[2], we only have cdrtools-native suppo=
rt in Yocto. For schilytools - the fork of cdrtools, I think we should only=
 support schilytools-native also

[1] https://codeberg.org/schilytools/schilytools/commit/a72089c473804268301=
18d318d59a65e9e1b2aff
[2] https://lwn.net/Articles/195167/

Hi Ross,

For libisoburn[3], it is not alive since 2023

[3] https://files.libburnia-project.org/

Hi RP,

What is your suggestions, is it necessary to use schilytools or libisoburn =
to instead of cdrtools in oe-core. It beyond the scope of this bug fix patc=
h

//Hongxu

--wrXz42IkVjTdo4xH5LYV
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Alex,</div>
<div>&nbsp;</div>
<div>I will update to Inactive-Upstream. in v3</div>
<div>&nbsp;</div>
<div>About schilytools, it could not be built from cdrtools recipe directly=
,&nbsp; the reason is schilytools using a bootstrap 'smake' binary for comp=
iling</div>
<div>which is created in the psmake/ directory from source [1].&nbsp; We ne=
ed to create the recipe schilytools from scratch.</div>
<div>&nbsp;</div>
<div>Due to cdrtools have license problem[2], we only have cdrtools-native =
support in Yocto. For schilytools - the fork of cdrtools, I think we should=
 only support schilytools-native also</div>
<div>&nbsp;</div>
<div>[1] <a href=3D"https://codeberg.org/schilytools/schilytools/commit/a72=
089c47380426830118d318d59a65e9e1b2aff" target=3D"_blank" rel=3D"noopener">h=
ttps://codeberg.org/schilytools/schilytools/commit/a72089c47380426830118d31=
8d59a65e9e1b2aff</a></div>
<div>[2] <a href=3D"https://lwn.net/Articles/195167/" target=3D"_blank" rel=
=3D"noopener">https://lwn.net/Articles/195167/</a></div>
<div>&nbsp;</div>
<div>Hi Ross,</div>
<div>&nbsp;</div>
<div>For libisoburn[3], it is not alive since 2023</div>
<div>&nbsp;</div>
<div>[3] <a href=3D"https://files.libburnia-project.org/" target=3D"_blank"=
 rel=3D"noopener">https://files.libburnia-project.org/</a></div>
<div>&nbsp;</div>
<div>Hi RP,</div>
<div>&nbsp;</div>
<div>What is your suggestions, is it necessary to use schilytools or libiso=
burn to instead of cdrtools in oe-core. <span data-slate-fragment=3D"JTVCJT=
dCJTIydHlwZSUyMiUzQSUyMnBhcmFncmFwaCUyMiUyQyUyMmNoaWxkcmVuJTIyJTNBJTVCJTdCJ=
TIyaWQlMjIlM0ElMjJqTDVSajBtZDVvJTIyJTJDJTIycGFyYUlkeCUyMiUzQTAlMkMlMjJzcmMl=
MjIlM0ElMjJJdCUyMGJleW9uZCUyMHRoaXMlMjBidWclMjBmaXglMjBwYXRjaCUyMiUyQyUyMmR=
zdCUyMiUzQSUyMiVFNSVBRSU4MyVFOCVCNiU4NSVFNSU4NyVCQSVFNCVCQSU4NiVFOCVCRiU5OS=
VFNCVCOCVBQWJ1ZyVFNCVCRiVBRSVFNSVBNCU4RCVFOCVBMSVBNSVFNCVCOCU4MSUyMiUyQyUyM=
m1ldGFkYXRhJTIyJTNBJTIyJTIyJTJDJTIybWF0Y2hlcyUyMiUzQW51bGwlMkMlMjJtZXRhRGF0=
YSUyMiUzQSU1QiU1RCUyQyUyMnRleHQlMjIlM0ElMjJJdCUyMGJleW9uZCUyMHRoZSUyMHNjb3B=
lJTIwb2YlMjB0aGlzJTIwYnVnJTIwZml4JTIwcGF0Y2glMjIlN0QlNUQlN0QlNUQ=3D" style=
=3D"white-space: pre;">It beyond the scope of this bug fix patch</span></di=
v>
<div>&nbsp;</div>
<div>//Hongxu</div>

--wrXz42IkVjTdo4xH5LYV--

