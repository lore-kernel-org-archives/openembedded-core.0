Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF57E7717D
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 16:12:05 +0000 (UTC)
Subject: Re: [PATCH 3/3] gcc-cross.inc: add var-SSTATE_ARCHS_TUNEPKG to vardeps of do_create_spdx
To: openembedded-core@lists.openembedded.org
From: "hongxu" <hongxu.jia@eng.windriver.com>
X-Originating-Location: US (147.11.105.171)
X-Originating-Platform: Linux Firefox 133
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 11 Dec 2024 08:11:56 -0800
References: <CAJdd5GYhoVu__SjPjBZ3PrcsrN+cQ2igewfPvGQvmKMh8p7kQA@mail.gmail.com>
In-Reply-To: <CAJdd5GYhoVu__SjPjBZ3PrcsrN+cQ2igewfPvGQvmKMh8p7kQA@mail.gmail.com>
Message-ID: <16948.1733933516721925987@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="UuHKN9mo9zcFOiZDP1g9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 16:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208594

--UuHKN9mo9zcFOiZDP1g9
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I think the condition is required, only if set linux-libc-headers to EXTRAD=
EPENDS, it makes sense to add vardep of do_create_spdx.
That's why adding the code along with adding linux-libc-headers to gcc-cros=
s's depends.
//Hongxu

--UuHKN9mo9zcFOiZDP1g9
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>I think the condition is required, only if set linux-libc-headers to E=
XTRADEPENDS, it makes sense to add vardep of do_create_spdx.</div>
<div>That's why adding the code along with adding linux-libc-headers to gcc=
-cross's depends.</div>
<div>//Hongxu</div>

--UuHKN9mo9zcFOiZDP1g9--

