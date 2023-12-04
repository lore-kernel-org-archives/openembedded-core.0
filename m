Return-Path: <andrey.popov@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88BB9C4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 13:33:51 +0000 (UTC)
Subject: Re: [PATCH v3] image-live: Add support for building EFI-bootable ISO images for non-x86-based archs
To: openembedded-core@lists.openembedded.org
From: "Andrey Popov" <andrey.popov@yadro.com>
X-Originating-Location: Tula, Tula Oblast, RU (95.139.190.114)
X-Originating-Platform: Linux Chrome 113
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 04 Dec 2023 05:33:49 -0800
References: <20231202190328142d6d70@mail.local>
In-Reply-To: <20231202190328142d6d70@mail.local>
Message-ID: <5225.1701696829557952852@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Vlumalk6ZbVshgkJjwZw"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 13:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191737

--Vlumalk6ZbVshgkJjwZw
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello, Alexandre!

Thank you for the feedback.
I think I can eliminate the xorriso/libisoburn dependency by replacing it w=
ith a python script that I've created which uses modified version of isopar=
ser python package.
However, I am not aware of the correct way to include this tool into openem=
bedded-core. If someone can suggest such a way (if it is a good idea after =
all), that would be greatly appreciated.

Best regards, Andrey.

--Vlumalk6ZbVshgkJjwZw
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello, Alexandre!<br /><br />Thank you for the feedback.<br />I think I can=
 eliminate the xorriso/libisoburn dependency by replacing it with a python =
script that I've created which uses modified version of isoparser python pa=
ckage.<br />However, I am not aware of the correct way to include this tool=
 into openembedded-core. If someone can suggest such a way (if it is a good=
 idea after all), that would be greatly appreciated.<br /><br />Best regard=
s, Andrey.

--Vlumalk6ZbVshgkJjwZw--

