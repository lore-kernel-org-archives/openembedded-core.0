Return-Path: <fbberton@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0DF9C83F1A
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 12:44:23 +0000 (UTC)
Subject: How to backport linux-libc-headers change
To: openembedded-core@lists.openembedded.org
From: "Fabio Berton" <fbberton@gmail.com>
X-Originating-Location: Porto, PT (213.205.68.220)
X-Originating-Platform: Linux Firefox 141
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 24 Jul 2025 05:44:18 -0700
Message-ID: <bGok.1753361058903998397.LTYw@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="87rLdew22H9HvCQdU1mE"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 12:44:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220837

--87rLdew22H9HvCQdU1mE
Content-Type: text/plain; charset="utf-8"; markup=markdown
Content-Transfer-Encoding: quoted-printable

I've seen the following error related to kernel headers:
/
|/usr/include/linux/cn_proc.h:72:17: error: invalid conversion from
|'unsigned int' to 'proc_cn_event' [-fpermissive]
|    72 |         ev_type &=3D PROC_EVENT_ALL;
|      |                 ^
|      |                 unsigned int
\

which is fixed by this commit [1].

I'm using scarthgap, and the linux-libc-headers use the kernel version 6.6.=
 Looking at the kernel sources, branch linux-6.6.y contains the change [1].

What is the process to backport commit [1]? Add as a patch in linux-libc-he=
aders_6.6.bb recipe?

1 - https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit=
/include/uapi/linux/cn_proc.h?&id=3D9258d795978f398ecf2d222a8388cff81d37d34=
d

--87rLdew22H9HvCQdU1mE
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>I've seen the following error related to kernel headers:
/
|/usr/include/linux/cn_proc.h:72:17: error: invalid conversion from
|'unsigned int' to 'proc_cn_event' [-fpermissive]
|    72 |         ev_type &amp;=3D PROC_EVENT_ALL;
|      |                 ^
|      |                 unsigned int
</p>

<p>which is fixed by this commit [1].</p>

<p>I'm using scarthgap, and the linux-libc-headers use the kernel version 6=
.6. Looking at the kernel sources, branch linux-6.6.y contains the change [=
1].</p>

<p>What is the process to backport commit [1]? Add as a patch in linux-libc=
-headers_6.6.bb recipe?</p>

<p>1 - <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/stable/li=
nux.git/commit/include/uapi/linux/cn_proc.h?&amp;id=3D9258d795978f398ecf2d2=
22a8388cff81d37d34d" target=3D"_blank">https://git.kernel.org/pub/scm/linux=
/kernel/git/stable/linux.git/commit/include/uapi/linux/cn_proc.h?&amp;id=3D=
9258d795978f398ecf2d222a8388cff81d37d34d</a></p>

--87rLdew22H9HvCQdU1mE--

