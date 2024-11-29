Return-Path: <egyszeregy@freemail.hu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9C16D6EC18
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 21:53:27 +0000 (UTC)
Subject: [scarthgap] bitbake extremely slow down during "Initialising tasks" #bitbake #scarthgap
To: openembedded-core@lists.openembedded.org
From: "Livius" <egyszeregy@freemail.hu>
X-Originating-Location: =?UTF-8?B?U3R1dHRnYXJ0LCBCYWRlbi1Xw7xydHRlbWJlcmcsIERF?= (194.39.218.23)
X-Originating-Platform: Windows Chrome 131
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 29 Nov 2024 13:53:26 -0800
Message-ID: <NoMt.1732917206925568699.BcUZ@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 21:53:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208033

Hi,

I use scarthgap release for several ARM boards eg.: AMD ZynqMP and NXP i.MX=
. I use Ubuntu 22.04 with the latest updates but after an Ubuntu update and=
 reboot, from one day to the other bitbake slowed down extremely. "Initiali=
sing tasks" operates in slowly then after it only 4-5 tasks willing to star=
t and work in parallel even though there was worked in 20 parallel tasks mo=
de before (according my CPU cores).

Does anyone have any ideas what could be causing this slow down issue and w=
hat I should do/debug to find the root cause of it? If i use Ubuntu 20.04 t=
his issue never comes up with my scarthgap projects.

