Return-Path: <christian.thiessen@airbus.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9982ECDFA1
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 08:58:56 +0000 (UTC)
Subject: Re: license manifest files effectively disappear when do_rootfs is not rerun
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?Q2hyaXN0aWFuIFRoaWXDn2Vu?= <christian.thiessen@airbus.com>
X-Originating-Location: Düsseldorf, North Rhine-Westphalia, DE (163.116.173.55)
X-Originating-Platform: Windows Chrome 106
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 24 Oct 2022 01:58:46 -0700
References: <CANNYZj9UMf4FRYzLCN9M+rW-mpL0-JRxROq4zpNd7ABJe5E+Dw@mail.gmail.com>
In-Reply-To: <CANNYZj9UMf4FRYzLCN9M+rW-mpL0-JRxROq4zpNd7ABJe5E+Dw@mail.gmail.com>
Message-ID: <1878.1666601926722962715@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 08:58:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172079

I'm not deleting anything.
Steps to reproduce would be:
Build just about any image for any machine, as long as it uses the standard=
 classes like license_image.bbclass.
You'll get a build/tmp/deploy/licenses/${IMAGE}-${MACHINE} symlink pointing=
 to build/tmp/deploy/licenses/${IMAGE}-${MACHINE}-<datetime> containing all=
 the expected manifests.
Run the same build again. Bitbake will rerun do_populate_lic_deploy, but no=
t do_rootfs.
build/tmp/deploy/licenses/${IMAGE}-${MACHINE} now points to a new directory=
 that contains only image_license.manifest.

Christian

