Return-Path: <andrey.popov@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E77B3C4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 14:26:51 +0000 (UTC)
Subject: Re: [PATCH v3] image-live: Add support for building EFI-bootable ISO images for non-x86-based archs
To: openembedded-core@lists.openembedded.org
From: "Andrey Popov" <andrey.popov@yadro.com>
X-Originating-Location: Tula, Tula Oblast, RU (95.139.190.114)
X-Originating-Platform: Linux Chrome 113
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 04 Dec 2023 06:26:47 -0800
References: <CANNYZj9DFQqUwJ4_QXc3o8wZEDLHBZvHxzqdH6qFt8J1eNQZ6A@mail.gmail.com>
In-Reply-To: <CANNYZj9DFQqUwJ4_QXc3o8wZEDLHBZvHxzqdH6qFt8J1eNQZ6A@mail.gmail.com>
Message-ID: <5225.1701700007967307743@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="QU935ThbG3ldIfYUGD2D"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 14:26:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191740

--QU935ThbG3ldIfYUGD2D
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello, Alex!

With this patch applied, targets that request image-live and do not define =
pcbios feature should not depend on syslinux anymore.
However, this patch requires an external tool (or, at least, isoparser pyth=
on package to be imported inside the class) to determine the efi.img offset=
 and size inside ISO image.
Regarding the snippet in question, it can be safely omitted since it was re=
quired for isohybrid to work for targets that define efi feature but do not=
 define pcbios one, and because this patch replaces invocation of this tool=
 with custom method for creating EFI-bootable MBR in aforementioned case.

Best regards, Andrey.

--QU935ThbG3ldIfYUGD2D
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello, Alex!<br /><br />With this patch applied, targets that request image=
-live and do not define pcbios feature should not depend on syslinux anymor=
e.<br />However, this patch requires an external tool (or, at least, isopar=
ser python package to be imported inside the class) to determine the efi.im=
g offset and size inside ISO image.<br />Regarding the snippet in question,=
 it can be safely omitted since it was required for isohybrid to work for t=
argets that define efi feature but do not define pcbios one, and because th=
is patch replaces invocation of this tool with custom method for creating E=
FI-bootable MBR in aforementioned case.<br /><br />Best regards, Andrey.

--QU935ThbG3ldIfYUGD2D--

