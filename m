Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DABEC04A94
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 10:23:28 +0000 (UTC)
Subject: Re: [kirkstone][PATCH] Fix kirkstone dmidedecode smbios3_decode
To: openembedded-core@lists.openembedded.org
From: "Adrian Freihofer" <adrian.freihofer@gmail.com>
X-Originating-Location: CH (165.225.94.221)
X-Originating-Platform: Linux Firefox 116
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 16 Aug 2023 03:23:20 -0700
References: <CAOSpxdYypniH+ZsxoiD4twfQxAYo1CVsLSyu2Vxg9_-C-2Y0+w@mail.gmail.com>
In-Reply-To: <CAOSpxdYypniH+ZsxoiD4twfQxAYo1CVsLSyu2Vxg9_-C-2Y0+w@mail.gmail.com>
Message-ID: <29355.1692181400142333681@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="rt5HrEBUQuhcI2lc1g9v"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 10:23:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186124

--rt5HrEBUQuhcI2lc1g9v
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Looking at this patch set again, I just found a mistake: I forgot to add pa=
tch 5 to the SRC_URI. I will send a v2 as soon as possible. This one will h=
ave 2 improvements:

- Adding all patches to the SRC_URI.
- Renaming the patches to their original names to minimize differences and =
simplify review.

--rt5HrEBUQuhcI2lc1g9v
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Looking at this patch set again, I just found a mistake: I forgot to add pa=
tch 5 to the SRC_URI. I will send a v2 as soon as possible. This one will h=
ave 2 improvements:<br /><br />- Adding all patches to the SRC_URI.<br />- =
Renaming the patches to their original names to minimize differences and si=
mplify review.

--rt5HrEBUQuhcI2lc1g9v--

