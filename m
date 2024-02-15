Return-Path: <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD2D1C4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 08:31:15 +0000 (UTC)
Subject: Re: [PATCH v3 2/2] oe-init-build-env: generate .vscode from template
To: openembedded-core@lists.openembedded.org
From: "Enguerrand de Ribaucourt" <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Originating-Location: FR (80.15.101.118)
X-Originating-Platform: Linux Firefox 122
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 15 Feb 2024 00:31:14 -0800
References: <20240214173914.136799-3-adrian.freihofer@siemens.com>
In-Reply-To: <20240214173914.136799-3-adrian.freihofer@siemens.com>
Message-ID: <29120.1707985874540656814@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 08:31:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195505

Hello Adrian,

I recommend to keep expliciting other vscode-bitbake parameters. In additio=
n to the default config, the user may have overridden the configuration in =
their global setting. In which case, the unspecified settings in your templ=
ate will take that value and probably break.

```
    "bitbake.pathToBitbakeFolder": "${workspaceFolder}/bitbake",
    "bitbake.pathToEnvScript": "${workspaceFolder}/oe-init-build-env",
    "bitbake.pathToBuildFolder": "${workspaceFolder}/build",
    "bitbake.commandWrapper": "",
    "bitbake.workingDirectory": "${workspaceFolder}",
```

Thanks for this new feature which is a great way to share the VSCode config=
s!

