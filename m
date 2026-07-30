Return-Path: <john.ripple@keysight.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C3C5C55162
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 17:04:02 +0000 (UTC)
Subject: NPM recipe license upgrade
To: openembedded-core@lists.openembedded.org
From: "John Ripple" <john.ripple@keysight.com>
X-Originating-Location: Colorado Springs, Colorado, US (192.25.7.195)
X-Originating-Platform: Windows Firefox 152
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 30 Jul 2026 10:04:02 -0700
Message-ID: <FtYb.1785431042033346907.8M2E@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="W6hgIYml0osO3btWSBXU"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 17:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242369

--W6hgIYml0osO3btWSBXU
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,
I have a recipe that builds an npm project using the git and npmsw fetchers=
. The git fetcher pulls the project's source code and the npmsw fetcher is =
used to get all the npm dependencies.

>=20
> SRC_URI =3D "git://... \
> npmsw://... "
>=20

Whenever I change the npm project in the git repo and update the npm-shrink=
wrap.json file I then need to update all the licenses for the individual co=
mponents in the shrinkwrap file. I've tried using devtool add/upgrade but n=
either option seems to cover the case with a git repo being the source of a=
n npm project.

I also noticed when I did use the npm and npmsw fetchers on another recipe =
with devtool add it often misidentified the dependencies' license types. Fo=
r example, I was seeing most npm dependencies with MIT licenses were miside=
ntified as X11 licenses. Since the license types for every npm dependency a=
re listed in the npm-shrinkwrap.json file, is there any way to use the npm-=
shrinkwrap.json file with devtool when updating licenses?
What is the preferred way to automate updating licenses of these types of r=
ecipes?

It's also worth noting I have been using Thomas Perrot's patches in the bit=
bake mailing list for the npm fetcher on Wrynose. https://lists.openembedde=
d.org/g/bitbake-devel/topic/119833197#msg19846

Thanks,
John

--W6hgIYml0osO3btWSBXU
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi,</div>
<div>I have a recipe that builds an npm project using the git and npmsw fet=
chers. The git fetcher pulls the project's source code and the npmsw fetche=
r is used to get all the npm dependencies.&nbsp;</div>
<blockquote>
<div>SRC_URI =3D "git://... \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;n=
pmsw://... "</div>
</blockquote>
<div>Whenever I change the npm project in the git repo and update the npm-s=
hrinkwrap.json file I then need to update all the licenses for the individu=
al components in the shrinkwrap file. I've tried using devtool add/upgrade =
but neither option seems to cover the case with a git repo being the source=
 of an npm project.</div>
<div>&nbsp;</div>
<div>I also noticed when I did use the npm and npmsw fetchers on another re=
cipe with devtool add it often misidentified the dependencies' license type=
s. For example, I was seeing most npm dependencies with MIT licenses were m=
isidentified as X11 licenses. Since the license types for every npm depende=
ncy are listed in the npm-shrinkwrap.json file, is there any way to use the=
 npm-shrinkwrap.json file with devtool when updating licenses?</div>
<div>What is the preferred way to automate updating licenses of these types=
 of recipes?</div>
<div>&nbsp;</div>
<div>It's also worth noting I have been using Thomas Perrot's patches in th=
e bitbake mailing list for the npm fetcher on Wrynose. <a href=3D"https://l=
ists.openembedded.org/g/bitbake-devel/topic/119833197#msg19846" target=3D"_=
blank" rel=3D"noopener">https://lists.openembedded.org/g/bitbake-devel/topi=
c/119833197#msg19846</a></div>
<div>&nbsp;</div>
<div>Thanks,</div>
<div>John</div>

--W6hgIYml0osO3btWSBXU--

