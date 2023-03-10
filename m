Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27851C6FA99
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 15:42:30 +0000 (UTC)
Subject: base-files: any reason hosts contains localhost.localdomain
To: openembedded-core@lists.openembedded.org
From: "Jermain Horsman" <jermain.horsman@nedap.com>
X-Originating-Location: Enschede, Overijssel, NL (143.178.210.159)
X-Originating-Platform: Windows Firefox 110
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 10 Mar 2023 07:42:21 -0800
Message-ID: <SMrL.1678462941565102949.YwpL@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 15:42:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178340

Currently the hosts file (meta/recipes-core/base-files/base-files/hosts) co=
ntains the entry:
127.0.0.1	localhost.localdomain		localhost

This seems to be based on Debian, however it seems they've long since rever=
ted the entry to just "localhost".

https://salsa.debian.org/installer-team/netcfg/-/commit/3c15ee521b2b8f47b34=
ccc7f610523cd284f2221

I came across this issue as a call to java.net.InetAddress.getHostName() re=
turned localhost.localdomain which wasn't the expected value.

Because of this I was wondering what/if there is a reason we still have it =
included as it is?

Sincerely,

Jermain Horsman

