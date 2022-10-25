Return-Path: <christian.thiessen@airbus.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C222DC04A95
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 08:31:17 +0000 (UTC)
Subject: Re: license manifest files effectively disappear when do_rootfs is not rerun
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?Q2hyaXN0aWFuIFRoaWXDn2Vu?= <christian.thiessen@airbus.com>
X-Originating-Location: Düsseldorf, North Rhine-Westphalia, DE (163.116.173.57)
X-Originating-Platform: Windows Chrome 106
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 25 Oct 2022 01:31:12 -0700
References: <7c4f253f-4c49-9aef-4be1-6a9cbaebd62f@theobroma-systems.com>
In-Reply-To: <7c4f253f-4c49-9aef-4be1-6a9cbaebd62f@theobroma-systems.com>
Message-ID: <31059.1666686672174810512@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Oct 2022 08:31:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172122

I don't feel familiar enough with the inner workings of oe-core to decide w=
hat a good (robust, maintainable) solution would be, but I've created a bug=
 report with some suggestions:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14946

