Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E14F8C2BD05
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 09:07:30 +0000 (UTC)
Subject: Re: Rust reproducibility issue summary
To: openembedded-core@lists.openembedded.org
From: "Sundeep KOKKONDA" <sundeep.kokkonda@windriver.com>
X-Originating-Location: Hyderabad, Telangana, IN (49.205.251.137)
X-Originating-Platform: Windows Chrome 126
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 24 Jun 2024 02:07:28 -0700
References: <CANNYZj-3XSUJ5S+ewGE9owxtd4CmOps-D=5kU+MrRXoJN0pDpw@mail.gmail.com>
In-Reply-To: <CANNYZj-3XSUJ5S+ewGE9owxtd4CmOps-D=5kU+MrRXoJN0pDpw@mail.gmail.com>
Message-ID: <2056.1719220048661049006@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="8W1QUNe5hsjFSaprp5CF"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 09:07:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201070

--8W1QUNe5hsjFSaprp5CF
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 01:50 PM, Alexander Kanavin wrote:

>=20
> This is not the case. I just built rust (without sstate, from sources)
> in two different build directories on the same machine, and indeed

Thanks for sharing this... Unfortunately I couldn't see this happening duri=
ng my testing. If this is the case, the issue might be there in rust.

for me diff is not there...
> diff -uNr build-b/tmp/work/core2-64-poky-linux/rust/1.75.0/image/ build-c=
/tmp/work/core2-64-poky-linux/rust/1.75.0/image/
> diff build-b/tmp/work/core2-64-poky-linux/rust/1.75.0/image/usr/bin/rustd=
oc build-c/tmp/work/core2-64-poky-linux/rust/1.75.0/image/usr/bin/rustdoc
> diff -uNr build-b/tmp/deploy/deb/core2-64/ build-c/tmp/deploy/deb/core2-6=
4/

--8W1QUNe5hsjFSaprp5CF
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 01:50 PM, Alexander Kanavin wrote:<br />
<blockquote>This is not the case. I just built rust (without sstate, from s=
ources)<br />in two different build directories on the same machine, and in=
deed</blockquote>
Thanks for sharing this... Unfortunately I couldn't see this happening duri=
ng my testing. If this is the case, the issue might be there in rust.<br />=
<br />for me diff is not there...<br /><em>&gt; diff -uNr build-b/tmp/work/=
core2-64-poky-linux/rust/1.75.0/image/ build-c/tmp/work/core2-64-poky-linux=
/rust/1.75.0/image/<br />&gt; diff build-b/tmp/work/core2-64-poky-linux/rus=
t/1.75.0/image/usr/bin/rustdoc build-c/tmp/work/core2-64-poky-linux/rust/1.=
75.0/image/usr/bin/rustdoc</em><br /><em>&gt; diff -uNr build-b/tmp/deploy/=
deb/core2-64/ build-c/tmp/deploy/deb/core2-64/</em><br />

--8W1QUNe5hsjFSaprp5CF--

