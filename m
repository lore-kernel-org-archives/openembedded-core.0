Return-Path: <andriy.danylovskyy@streamunlimited.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F09C07E9D
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 09:13:56 +0000 (UTC)
Subject: Re: [PATCH] classes/patch: move QUILT_PC for patching consistency
To: openembedded-core@lists.openembedded.org
From: "Andriy Danylovskyy" <andriy.danylovskyy@streamunlimited.com>
X-Originating-Location: Vienna, AT (91.114.0.140)
X-Originating-Platform: Linux Chrome 105
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 26 Sep 2022 02:13:52 -0700
References: <20220926090604.23397-1-andriy.danylovskyy@streamunlimited.com>
In-Reply-To: <20220926090604.23397-1-andriy.danylovskyy@streamunlimited.com>
Message-ID: <15447.1664183632584990375@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="2xfBLNp1qRWjmhePBZ0O"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Sep 2022 09:13:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171055

--2xfBLNp1qRWjmhePBZ0O
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I am aware of the "force-unpack + patch" scenario, discussed in https://lis=
ts.yoctoproject.org/g/yocto/topic/89948013#56602 ,
and this patch, sadly, doesn't fix that.
But it does fix another face of it, which IMO is even worse than a failing =
build - a false positive, where updates to a source are ignored,
and the package is "successfully" built from the previous version.

--2xfBLNp1qRWjmhePBZ0O
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>I am aware of the "force-unpack + patch" scenario, discussed in <a hre=
f=3D"https://lists.yoctoproject.org/g/yocto/topic/89948013#56602" target=3D=
"_blank" rel=3D"noopener">https://lists.yoctoproject.org/g/yocto/topic/8994=
8013#56602</a>,</div>
<div>and this patch, sadly, doesn't fix that.<br />But it does fix another =
face of it, which IMO is even worse than a failing build - a false positive=
, where updates to a source are ignored,<br />and the package is "successfu=
lly" built from the previous version.</div>

--2xfBLNp1qRWjmhePBZ0O--

