Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 553ADD41D49
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 14:29:13 +0000 (UTC)
Subject: Re: [PATCH 0/3] Add HOMEPAGE variable to several recipes.
To: openembedded-core@lists.openembedded.org
From: "Weisser, Pascal.ext" <Pascal.Weisser.ext@karlstorz.com>
X-Originating-Location: Frankfurt am Main, Hesse, DE (136.226.162.106)
X-Originating-Platform: Linux Firefox 145
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 11 Dec 2025 06:29:03 -0800
References: <20251209132208.402718-1-pascal.weisser.ext@karlstorz.com> <9bc6fecf-3234-4b46-8bad-84d93a5e030f@cherry.de> <952C109B-6A6C-4388-B937-6200BFE718E1@arm.com>
In-Reply-To: <952C109B-6A6C-4388-B937-6200BFE718E1@arm.com>
Message-ID: <120671.1765463343248308488@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="1LQMxPcmCTUcRctj9nzK"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 14:29:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227536

--1LQMxPcmCTUcRctj9nzK
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

There are several reasons for this change:

First, according to the recipe style guide, HOMEPAGE is a required variable=
 and should be contained in all recipes:

https://docs.yoctoproject.org/dev/contributor-guide/recipe-style-guide.html=
#required-variables

Second, the recipe linter oelint-adv also wants HOMEPAGE to be set.

Third, the HOMEPAGE is included in the SBOM if it is set. It would be great=
, if every component would contain the HOMEPAGE to be consistent.

I checked what other recipes are doing when they just provide local files. =
The recipes mini-x-session or python3-dtschema-wrapper also set HOMEPAGE to=
 "https://yoctoproject.org", so I thought that would be the accepted way to=
 have a HOMEPAGE for recipes that only provide local files.

Best regards
Pascal

--1LQMxPcmCTUcRctj9nzK
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>There are several reasons for this change:</div>
<div>&nbsp;</div>
<div>First, according to the recipe style guide, HOMEPAGE is a required var=
iable and should be contained in all recipes:</div>
<div>&nbsp;</div>
<div><a href=3D"https://docs.yoctoproject.org/dev/contributor-guide/recipe-=
style-guide.html#required-variables" target=3D"_blank" rel=3D"noopener">htt=
ps://docs.yoctoproject.org/dev/contributor-guide/recipe-style-guide.html#re=
quired-variables</a></div>
<div>&nbsp;</div>
<div>Second, the recipe linter oelint-adv also wants HOMEPAGE to be set.</d=
iv>
<div>&nbsp;</div>
<div>Third, the HOMEPAGE is included in the SBOM if it is set. It would be =
great, if every component would contain the HOMEPAGE to be consistent.</div=
>
<div>&nbsp;</div>
<div>I checked what other recipes are doing when they just provide local fi=
les. The recipes mini-x-session or python3-dtschema-wrapper also set HOMEPA=
GE to "https://yoctoproject.org", so I thought that would be the accepted w=
ay to have a HOMEPAGE for recipes that only provide local files.</div>
<div>&nbsp;</div>
<div>Best regards</div>
<div>Pascal</div>

--1LQMxPcmCTUcRctj9nzK--

