Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B9DC46467
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 07:00:15 +0000 (UTC)
Subject: Re: [PATCH v2] rust: Merge all rustc-source patches into rust-source.inc
To: openembedded-core@lists.openembedded.org
From: "Kokkonda, Sundeep" <sundeep.kokkonda@windriver.com>
X-Originating-Location: Belgaum, Karnataka, IN (103.197.112.48)
X-Originating-Platform: Windows Chrome 108
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 15 Jan 2023 23:00:15 -0800
References: <20230107094839.26387-1-alex.kiernan@gmail.com>
In-Reply-To: <20230107094839.26387-1-alex.kiernan@gmail.com>
Message-ID: <6921.1673852415201846579@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="1of9VsOW90rsoqnjg4HL"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 07:00:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175960

--1of9VsOW90rsoqnjg4HL
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Alex,

This patch fixed the https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14=
975 ( 'bitbake core-image-full-cmdline' built without any issues.)

But, I tried a ' hello world ' program in booted image (bitbake core-image-=
minimal by adding ' cargo ' to IMAGE_INSTALL:append) and getting below erro=
r.

root@qemux86-64:~/# cargo new hello
root@qemux86-64:~/# cd hello
root@qemux86-64:~/hello# cargo run
Compiling hello v0.1.0 (/home/root/hello)
error: linker `x86_64-poky-linux-gcc` not found
|
=3D note: No such file or directory (os error 2)

error: could not compile `hello` due to previous error

--1of9VsOW90rsoqnjg4HL
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Alex,<br /><br />This patch fixed the&nbsp;<a style=3D"background-col=
or: #ffffff; white-space: pre-wrap;" href=3D"https://bugzilla.yoctoproject.=
org/show_bug.cgi?id=3D14975" target=3D"_blank" rel=3D"noopener">https://bug=
zilla.yoctoproject.org/show_bug.cgi?id=3D14975</a>&nbsp;(<span style=3D"col=
or: #000000; font-family: monospace; font-size: small; white-space: pre-wra=
p;">'bitbake core-image-full-cmdline' built without any issues.)<br /></spa=
n><br />But, I tried a '<em>hello world</em>' program in booted image (bitb=
ake core-image-minimal by adding '<em>cargo</em>' to IMAGE_INSTALL:append) =
and getting below error.<br /><br />
<div><em>root@qemux86-64:~/# cargo new hello</em></div>
<div><em>root@qemux86-64:~/# cd hello</em></div>
<div><em>root@qemux86-64:~/hello# cargo run</em></div>
<div><em>&nbsp; &nbsp;Compiling hello v0.1.0 (/home/root/hello)</em></div>
<div><em>error: linker `x86_64-poky-linux-gcc` not found</em></div>
<div><em>&nbsp; |</em></div>
<div><em>&nbsp; =3D note: No such file or directory (os error 2)</em></div>
<div>&nbsp;</div>
<div><em>error: could not compile `hello` due to previous error<br /></em><=
/div>

--1of9VsOW90rsoqnjg4HL--

