Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C2D9C02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 22:32:29 +0000 (UTC)
Subject: Re: [scarthgap 00/15] Patch review
To: openembedded-core@lists.openembedded.org
From: "Adrian Freihofer" <adrian.freihofer@siemens.com>
X-Originating-Location: Uster, Zurich, CH (212.51.147.190)
X-Originating-Platform: Linux Firefox 134
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 13 Jan 2025 14:32:24 -0800
References: <cover.1736801113.git.steve@sakoman.com>
In-Reply-To: <cover.1736801113.git.steve@sakoman.com>
Message-ID: <27315.1736807544501527525@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="8AjNNmjOle0WaMOsF119"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 22:32:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209765

--8AjNNmjOle0WaMOsF119
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Steve

Would it be possible to cherry-pick also these poky commits:

a3c51794144 oe-selftest: devtool ide-sdk use modify debug-build
92a4abac54a devtool: ide-sdk recommend DEBUG_BUILD
71acb3b781d devtool: ide-sdk sort cmake preset
1f7eb26c947 devtool: modify support debug-builds

respectively these OE-core commits:

fc17808799d2b667afbe4ea9837b66af70d47007
b886c26bf893878ba8eb6bee80dd0507e5cb0d2d
65950eb601c6c8aac0e4bc8683e544305346229d
a3c5179414410ba8ccf40c7ec168ffbbf73a9096

These patches fix some bugs. They also restore compatibility with the lates=
t version 2.8.0 of https://marketplace.visualstudio.com/items/yocto-project=
.yocto-bitbake/changelog. Without these patches, the user has to configure =
the bitbake.disableDevtoolDebugBuild setting, which is not intuitive at all=
.

Thank you anyway.
Adrian

--8AjNNmjOle0WaMOsF119
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Steve</div>
<div>&nbsp;</div>
<div>Would it be possible to cherry-pick also these poky commits:</div>
<div>&nbsp;</div>
<div>a3c51794144 oe-selftest: devtool ide-sdk use modify debug-build<br />9=
2a4abac54a devtool: ide-sdk recommend DEBUG_BUILD<br />71acb3b781d devtool:=
 ide-sdk sort cmake preset<br />1f7eb26c947 devtool: modify support debug-b=
uilds</div>
<div>&nbsp;</div>
<div>respectively these OE-core commits:</div>
<div>&nbsp;</div>
<div>fc17808799d2b667afbe4ea9837b66af70d47007<br />b886c26bf893878ba8eb6bee=
80dd0507e5cb0d2d<br />65950eb601c6c8aac0e4bc8683e544305346229d<br />a3c5179=
414410ba8ccf40c7ec168ffbbf73a9096</div>
<div>&nbsp;</div>
<div>These patches fix some bugs. They also restore compatibility with the =
latest version 2.8.0 of https://marketplace.visualstudio.com/items/yocto-pr=
oject.yocto-bitbake/changelog. Without these patches, the user has to confi=
gure the bitbake.disableDevtoolDebugBuild setting, which is not intuitive a=
t all.</div>
<div>&nbsp;</div>
<div>Thank you anyway.</div>
<div>Adrian</div>
<div>&nbsp;</div>

--8AjNNmjOle0WaMOsF119--

