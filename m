Return-Path: <contact@schnwalter.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61B7CCCF9E0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 10:27:07 +0000 (UTC)
Subject: Re: [PATCH] core-image-weston: Add wayland as required feature.
To: openembedded-core@lists.openembedded.org
From: "Walter Werner SCHNEIDER" <contact@schnwalter.eu>
X-Originating-Location: Arad, Arad County, RO (86.125.201.101)
X-Originating-Platform: Linux Firefox 144
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 28 Oct 2025 03:27:01 -0700
References: <CANNYZj-JpmwPdMVUnbowCeDSKtBpWuOxN27yT74H2mHxn-9AKQ@mail.gmail.com>
In-Reply-To: <CANNYZj-JpmwPdMVUnbowCeDSKtBpWuOxN27yT74H2mHxn-9AKQ@mail.gmail.com>
Message-ID: <27789.1761647221371438769@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="zrLlgb282wIDyYRCGCrt"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 10:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225390

--zrLlgb282wIDyYRCGCrt
Content-Type: text/plain; charset="utf-8"; markup=markdown
Content-Transfer-Encoding: quoted-printable

I've provided a v2 version of the patch that includes the reasoning behind =
the change and a small note that won't be included in the patch regarding c=
ore-image-sato, which has a similar problem.

Both images can not be built without providing a distro, with REQUIRED_DIST=
RO_FEATURES and features_check, the build fails with a more clear error.

--zrLlgb282wIDyYRCGCrt
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>I've provided a v2 version of the patch that includes the reasoning behi=
nd the change and a small note that won't be included in the patch regardin=
g core-image-sato, which has a similar problem.</p>

<p>Both images can not be built without providing a distro, with REQUIRED_D=
ISTRO_FEATURES and features_check, the build fails with a more clear error.=
</p>

--zrLlgb282wIDyYRCGCrt--

