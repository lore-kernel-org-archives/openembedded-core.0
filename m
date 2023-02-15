Return-Path: <jrey@linux.ibm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFBA4C636D4
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 22:14:23 +0000 (UTC)
Subject: Re: Can create-spdx handle multiple components per recipe
To: openembedded-core@lists.openembedded.org
From: "Joseph Reynolds" <jrey@linux.ibm.com>
X-Originating-Location: Wappingers Falls, New York, US (129.41.86.2)
X-Originating-Platform: Mac Firefox 109
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 15 Feb 2023 14:14:21 -0800
References: <CAJdd5GbfXCF=sEx8Y8g3DF0=TurNipemT9b2A1iXdOOg2xsA4g@mail.gmail.com>
In-Reply-To: <CAJdd5GbfXCF=sEx8Y8g3DF0=TurNipemT9b2A1iXdOOg2xsA4g@mail.gmail.com>
Message-ID: <30063.1676499261660321328@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="8AjH6OtLrUtF83fu0O5z"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 22:14:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177219

--8AjH6OtLrUtF83fu0O5z
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Thanks for confirming.=C2=A0 I wouldn't expect OE to be able to have any kn=
owledge of "sneaky" downloads of additional packages.

I have an idea to enhance create-spdx.bbclass so sneaky recipes can fess-up=
 and tell create-spdx about any additional packages they downloaded.=C2=A0=
=C2=A0 If you could implement something like the following, it would help m=
e.=C2=A0 If not, I'll just have to combine the OE-produced SBOM with my own=
 custom-produced SBOMs.=C2=A0 The idea is:

Idea: Enhance create-spdx.bbclass so a recipe can add multiple additional S=
BOM entries.=C2=A0 For example, if recipeX is sneaky and downloads componen=
tY without bitbake or OE knowing about it, then the recipe will have some w=
ay to tell create-spdx that it downloaded componentY at versionZ and also g=
ive its license information.

If I had this, then I think we could enhance our webui-vue recipe to use th=
is to report all the NPM packages.

--8AjH6OtLrUtF83fu0O5z
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Thanks for confirming.&nbsp; I wouldn't expect OE to be able to have any kn=
owledge of "sneaky" downloads of additional packages.<br /><br />I have an =
idea to enhance create-spdx.bbclass so sneaky recipes can fess-up and tell =
create-spdx about any additional packages they downloaded.&nbsp;&nbsp; If y=
ou could implement something like the following, it would help me.&nbsp; If=
 not, I'll just have to combine the OE-produced SBOM with my own custom-pro=
duced SBOMs.&nbsp; The idea is:<br /><br />Idea: Enhance create-spdx.bbclas=
s so a recipe can add multiple additional SBOM entries.&nbsp; For example, =
if recipeX is sneaky and downloads componentY without bitbake or OE knowing=
 about it, then the recipe will have some way to tell create-spdx that it d=
ownloaded componentY at versionZ and also give its license information.<br =
/><br />If I had this, then I think we could enhance our webui-vue recipe t=
o use this to report all the NPM packages.

--8AjH6OtLrUtF83fu0O5z--

