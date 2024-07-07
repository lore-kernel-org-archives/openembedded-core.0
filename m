Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EABBC30653
	for <webhook@archiver.kernel.org>; Sun,  7 Jul 2024 06:24:09 +0000 (UTC)
Subject: Re: Rust reproducibility issue summary
To: openembedded-core@lists.openembedded.org
From: "Sundeep KOKKONDA" <sundeep.kokkonda@windriver.com>
X-Originating-Location: Hyderabad, Telangana, IN (49.205.253.192)
X-Originating-Platform: Windows Chrome 126
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 06 Jul 2024 23:24:04 -0700
References: <CANNYZj-Vr6UT9L1oh+3eRHGOxGGMmnfJD17=WuFZM5BRSgD2yA@mail.gmail.com>
In-Reply-To: <CANNYZj-Vr6UT9L1oh+3eRHGOxGGMmnfJD17=WuFZM5BRSgD2yA@mail.gmail.com>
Message-ID: <20061.1720333444108751513@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="x2ZueC06tE3km7m59ABq"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Jul 2024 06:24:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201616

--x2ZueC06tE3km7m59ABq
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 5, 2024 at 05:06 PM, Alexander Kanavin wrote:

>=20
> - what seems to be *not* reproducible is having two different build
> directories with significantly different names (e.g. build/ and
> build-rustreprolongdir/). I've seen this in build/ vs build-2/ as
> well, but e.g. build-2/ and build-3/ are reproducible.

Hello Alex,

This case reproduces the issue for me and I haven't checked such case earli=
er... I am able to reproduce the issue when the build directory names are d=
ifferent in size ( build & build-somelongpath-rustdoc-repro ).

Thanks,
Sundeep K.

--x2ZueC06tE3km7m59ABq
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 5, 2024 at 05:06 PM, Alexander Kanavin wrote:<br />
<blockquote>- what seems to be *not* reproducible is having two different b=
uild<br />directories with significantly different names (e.g. build/ and<b=
r />build-rustreprolongdir/). I've seen this in build/ vs build-2/ as<br />=
well, but e.g. build-2/ and build-3/ are reproducible.</blockquote>
Hello Alex,<br /><br />This case reproduces the issue for me and I haven't =
checked such case earlier... I am able to reproduce the issue when the buil=
d directory names are different in size (<em>build </em>&amp; <em>build-som=
elongpath-rustdoc-repro</em>).<br /><br /><br /><br />Thanks,<br />Sundeep =
K.

--x2ZueC06tE3km7m59ABq--

