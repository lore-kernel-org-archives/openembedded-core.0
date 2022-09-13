Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D5DC6FA82
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 09:43:18 +0000 (UTC)
Subject: Re: [kirkstone] binutils: stable 2.38 branch updates
To: openembedded-core@lists.openembedded.org
From: "Sundeep KOKKONDA" <sundeep.kokkonda@gmail.com>
X-Originating-Location: Hyderabad, Telangana, IN (183.83.147.35)
X-Originating-Platform: Windows Chrome 105
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 13 Sep 2022 02:43:16 -0700
References: 
 <CAMKF1sqUOiZSP0+NV9LOZ+B4v6tZ_qKmA81XrKTsKqYRtcskig@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqUOiZSP0+NV9LOZ+B4v6tZ_qKmA81XrKTsKqYRtcskig@mail.gmail.com>
Message-ID: <28994.1663062196921833526@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="id14iiiuzgWjZjAGNNSD"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 09:43:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170563

--id14iiiuzgWjZjAGNNSD
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I am planning to take the gcc, glibc & binutils updates to Kirkstone. I fou=
nd only the glibc-2.35 branch is having a few updates (given below).

f8ad66a4ca nscd: Fix netlink cache invalidation if epoll is used [BZ #29415=
]
9e960717e1 Apply asm redirections in wchar.h before first use
577c2fc7f3 elf: Call __libc_early_init for reused namespaces (bug 29528)
83f1d9851e NEWS: Add entry for bug 28846
cbd8685e82 socket: Check lengths before advancing pointer in CMSG_NXTHDR
4bafc4001d alpha: Fix generic brk system call emulation in __brk_call (bug =
29490)
37fd2ac665 stdlib: Fixup mbstowcs NULL __dst handling. [BZ #29279]
a1ec4157bc stdlib: Remove attr_write from mbstows if dst is NULL [BZ: 29265=
]
813a8d0171 Update syscall lists for Linux 5.19
e200127c6c riscv: Update rv64 libm test ulps
8c172a6cb0 dlfcn: Pass caller pointer to static dlopen implementation (bug =
29446)

The binutils-2.38 has no new commits. And, gcc-11.x also not have any new r=
elease after 11.3.

In master branch gcc_12.2, glibc_2.36 & binutils_2.39 versions are used. Ki=
rkstone will continue to use the old versions?

Thanks,
Sundeep K.

--id14iiiuzgWjZjAGNNSD
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hello,</div>
<div>&nbsp;</div>
<div>I am planning to take the gcc, glibc &amp; binutils updates to Kirksto=
ne. I found only the glibc-2.35 branch is having a few updates (given below=
).</div>
<div>&nbsp;</div>
<div><em>f8ad66a4ca nscd: Fix netlink cache invalidation if epoll is used [=
BZ #29415]</em></div>
<div><em>9e960717e1 Apply asm redirections in wchar.h before first use</em>=
</div>
<div><em>577c2fc7f3 elf: Call __libc_early_init for reused namespaces (bug =
29528)</em></div>
<div><em>83f1d9851e NEWS: Add entry for bug 28846</em></div>
<div><em>cbd8685e82 socket: Check lengths before advancing pointer in CMSG_=
NXTHDR</em></div>
<div><em>4bafc4001d alpha: Fix generic brk system call emulation in __brk_c=
all (bug 29490)</em></div>
<div><em>37fd2ac665 stdlib: Fixup mbstowcs NULL __dst handling. [BZ #29279]=
</em></div>
<div><em>a1ec4157bc stdlib: Remove attr_write from mbstows if dst is NULL [=
BZ: 29265]</em></div>
<div><em>813a8d0171 Update syscall lists for Linux 5.19</em></div>
<div><em>e200127c6c riscv: Update rv64 libm test ulps</em></div>
<div><em>8c172a6cb0 dlfcn: Pass caller pointer to static dlopen implementat=
ion (bug 29446)</em></div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>The binutils-2.38 has no new commits. And, gcc-11.x also not have any =
new release after 11.3.</div>
<div>&nbsp;</div>
<div>In <em>master</em> branch gcc_12.2, glibc_2.36 &amp; binutils_2.39 ver=
sions are used. Kirkstone will continue to use the old versions?<br /><br /=
><br /><br />Thanks,<br />Sundeep K.</div>

--id14iiiuzgWjZjAGNNSD--

