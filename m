Return-Path: <egyszeregy@freemail.hu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D14C7C3DA63
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 15:09:02 +0000 (UTC)
Subject: Re: [scarthgap][master] license archiving is failed to tmp/deploy/licenses
To: openembedded-core@lists.openembedded.org
From: "Livius" <egyszeregy@freemail.hu>
X-Originating-Location: =?UTF-8?B?U3R1dHRnYXJ0LCBCYWRlbi1Xw7xydHRlbWJlcmcsIERF?= (194.39.218.17)
X-Originating-Platform: Windows Chrome 126
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 23 Jul 2024 08:09:01 -0700
References: <29dc1c80950b25530d55427c1cd97e5be4c0c6e0.camel@linuxfoundation.org>
In-Reply-To: <29dc1c80950b25530d55427c1cd97e5be4c0c6e0.camel@linuxfoundation.org>
Message-ID: <3152.1721747270931942084@lists.openembedded.org>
X-Old-Date: Tue, 23 Jul 2024 08:07:50 -0700
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 15:09:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202406
Message-ID: <20240723150901.bLb1bdHXR8Ndj6vnWmrFHxECsuKLwNS5rY8HKhbbP98@z>

https://github.com/openembedded/openembedded-core/blob/master/meta/classes-=
global/license.bbclass#L418
In line 418 if i use ${SSTATE_PKGARCH} in path of do_populate_lic[sstate-in=
putdirs], deploying of licenses can start to work but there will be many wa=
rnings and at end of it a fatal error will stop the bitbake building.
do_populate_lic[sstate-inputdirs] =3D "${LICSSTATEDIR}/${SSTATE_PKGARCH}"

Warnings:
...
do_rootfs: QA Issue: The license listed BSD-2-Clause was not in the license=
s collected for recipe util-linux [license-file-missing]
do_rootfs: QA Issue: The license listed BSD-3-Clause was not in the license=
s collected for recipe util-linux [license-file-missing]
do_rootfs: QA Issue: The license listed BSD-4-Clause was not in the license=
s collected for recipe util-linux [license-file-missing]
do_rootfs: QA Issue: The license listed MIT was not in the licenses collect=
ed for recipe util-linux [license-file-missing]
do_rootfs: QA Issue: The license listed MIT was not in the licenses collect=
ed for recipe volatile-binds [license-file-missing]
do_rootfs: QA Issue: The license listed BSD-3-Clause was not in the license=
s collected for recipe zip [license-file-missing]
do_rootfs: QA Issue: The license listed Zlib was not in the licenses collec=
ted for recipe zlib [license-file-missing]
...

Error:
do_rootfs: Couldn't find license information for dependency alsa-conf

As i see, alsa-conf is not exist in x86_64 licenses this is why it is faile=
d all the time.

