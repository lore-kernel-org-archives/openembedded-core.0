Return-Path: <anton.antonov@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1339BC3ABC9
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 15:07:36 +0000 (UTC)
Subject: Re: [PATCH 2/2] cargo.bbclass: allow to avoid appending PACKAGECONFIG_CONFARGS
To: openembedded-core@lists.openembedded.org
From: "Anton Antonov" <anton.antonov@arm.com>
X-Originating-Location: Cambridge, England, GB (217.140.106.13)
X-Originating-Platform: Mac Firefox 138
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 16 May 2025 08:07:26 -0700
References: <CANNYZj-0xoyMB9dujwM8O547Bx8OF+gTz_+rrE-brWG+F8Tjxg@mail.gmail.com>
In-Reply-To: <CANNYZj-0xoyMB9dujwM8O547Bx8OF+gTz_+rrE-brWG+F8Tjxg@mail.gmail.com>
Message-ID: <13420.1747408046210278509@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="swdx1xWbdIJl1V5HX8a3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 15:07:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216755

--swdx1xWbdIJl1V5HX8a3
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

This change also breaks recipes where cargo is used as the top build system=
 but PACKAGECONFIG_CONFARGS should not be included into cargo parameters. S=
ee, for example:
https://git.yoctoproject.org/meta-security/tree/meta-parsec/recipes-parsec/=
parsec-service/parsec-service_1.4.1.bb

What is the reason for this change? If a recipe needs to use PACKAGECONFIG =
for cargo parameters then the recipe can update CARGO_BUILD_FLAGS according=
ly.
With this change I don't have an option to not include =C2=A0PACKAGECONFIG_=
CONFARGS into parameters. Can it be reverted?

Anton

--swdx1xWbdIJl1V5HX8a3
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hello,<br /><br />&nbsp;&nbsp; This change also breaks recipes where c=
argo is used as the top build system but PACKAGECONFIG_CONFARGS should not =
be included into cargo parameters. See, for example:<br /><a href=3D"https:=
//git.yoctoproject.org/meta-security/tree/meta-parsec/recipes-parsec/parsec=
-service/parsec-service_1.4.1.bb" target=3D"_blank" rel=3D"noopener">https:=
//git.yoctoproject.org/meta-security/tree/meta-parsec/recipes-parsec/parsec=
-service/parsec-service_1.4.1.bb</a><br /><br />&nbsp; What is the reason f=
or this change? If a recipe needs to use PACKAGECONFIG for cargo parameters=
 then the recipe can update CARGO_BUILD_FLAGS accordingly.<br />With this c=
hange I don't have an option to not include &nbsp;PACKAGECONFIG_CONFARGS in=
to parameters. Can it be reverted?<br /><br /><br />Anton</div>

--swdx1xWbdIJl1V5HX8a3--

