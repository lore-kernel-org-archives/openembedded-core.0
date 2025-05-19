Return-Path: <ohnatiuk@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8F3DC2D0CD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 10:24:22 +0000 (UTC)
Subject: Re: [PATCH] package: disable renamed dependency error if allarch is overridden
To: openembedded-core@lists.openembedded.org
From: "Oleksandr Hnatiuk" <ohnatiuk@cisco.com>
X-Originating-Location: London, England, GB (64.103.40.20)
X-Originating-Platform: Linux Firefox 137
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 19 May 2025 03:24:18 -0700
References: <23322.1747649580665167105@lists.openembedded.org>
In-Reply-To: <23322.1747649580665167105@lists.openembedded.org>
Message-ID: <23322.1747650258056298980@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="gjkPYW6Ys1jugzLVWohW"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 10:24:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216831

--gjkPYW6Ys1jugzLVWohW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Also, consider this

* packagegroup.bbclass inherits allarch.bbclass - except when PACKAGE_ARCH =
is set before inheriting packagegroup
* in order to do so, a nativesdk packagegroup must inherit nativesdk first
* there is a native-last QA check which strongly suggests inheriting native=
sdk last
* nativesdk is inherited last via inherit_defer in nativesdk-packagegroup-s=
dk-host

I see all of this as either very misleading at best or a mistake at worst.

--gjkPYW6Ys1jugzLVWohW
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Also, consider this</div>
<ul>
<li>packagegroup.bbclass inherits allarch.bbclass - except when PACKAGE_ARC=
H is set before inheriting packagegroup</li>
<li>in order to do so, a nativesdk packagegroup must inherit nativesdk firs=
t</li>
<li>there is a native-last QA check which strongly suggests inheriting nati=
vesdk last</li>
<li>nativesdk is inherited last via inherit_defer in nativesdk-packagegroup=
-sdk-host</li>
</ul>
<div>I see all of this as either very misleading at best or a mistake at wo=
rst.</div>

--gjkPYW6Ys1jugzLVWohW--

