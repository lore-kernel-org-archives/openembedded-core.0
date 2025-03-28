Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 544B5C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 09:21:15 +0000 (UTC)
Subject: Re: [PATCH 0/3] Resolve YOCTO #14520 and YOCTO #15525
To: openembedded-core@lists.openembedded.org
From: "Weisser, Pascal.ext" <Pascal.Weisser.ext@karlstorz.com>
X-Originating-Location: US (136.226.162.111)
X-Originating-Platform: Linux Firefox 136
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 28 Mar 2025 02:21:06 -0700
References: <D8K50W97LGL8.1WRT66MJ5ZYV1@bootlin.com>
In-Reply-To: <D8K50W97LGL8.1WRT66MJ5ZYV1@bootlin.com>
Message-ID: <28798.1743153666896975321@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="RmU0imClQ1Y2zNokYTW0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 09:21:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213816

--RmU0imClQ1Y2zNokYTW0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

the problem arises because the dependency on virtual/kernel is added to the=
 initramfs-image image, too, leading to a circular dependency loop. In our =
setup the problem didn't occur because we're building the initramfs-image i=
n a different multi-configuration. That way the kernel depends on the initr=
amfs-image from a different multi-configuration and no circular dependency =
loop is created.

To fix the issue we'd need a way to add the dependency on virtual/kernel to=
 the do_write_qemuboot_conf task only only if we're not building an initram=
fs-image. But I have no idea at the moment how we could distinguish that ca=
se? Are there any ideas on that?

Best regards
Pascal

--RmU0imClQ1Y2zNokYTW0
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi,</div>
<div>&nbsp;</div>
<div>the problem arises because the dependency on virtual/kernel is added t=
o the initramfs-image image, too, leading to a circular dependency loop. In=
 our setup the problem didn't occur because we're building the initramfs-im=
age in a different multi-configuration. That way the kernel depends on the =
initramfs-image from a different multi-configuration and no circular depend=
ency loop is created.</div>
<div>&nbsp;</div>
<div>To fix the issue we'd need a way to add the dependency on virtual/kern=
el to the do_write_qemuboot_conf task only only if we're not building an in=
itramfs-image. But I have no idea at the moment how we could distinguish th=
at case? Are there any ideas on that?</div>
<div>&nbsp;</div>
<div>Best regards</div>
<div>Pascal</div>

--RmU0imClQ1Y2zNokYTW0--

