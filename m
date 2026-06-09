Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0250CD8CAA
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 14:22:47 +0000 (UTC)
Subject: Re: [PATCH] llvm/rust: simplify llvm-config handling for target builds
To: openembedded-core@lists.openembedded.org
From: "Varatharajan, Deepesh" <deepesh.varatharajan@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (49.204.85.206)
X-Originating-Platform: Windows Chrome 148
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 09 Jun 2026 07:22:45 -0700
References: <20260609141916.2724362-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20260609141916.2724362-1-Deepesh.Varatharajan@windriver.com>
Message-ID: <20324.1781014965849398736@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="n7BLzHMjaLryHuzfHKQV"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 14:22:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238298

--n7BLzHMjaLryHuzfHKQV
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi All,

Tested the patch with the following builds and all completed successfully:

rust
clang
mesa
--with multilibs enabled

The changes correctly resolve llvm-config from the native sysroot, eliminat=
e the need for the previous llvm-config copy/symlink workarounds, and work =
correctly with multilib (lib64) configurations.

Regards,
Deepesh

--n7BLzHMjaLryHuzfHKQV
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi All,<br /><br />Tested the patch with the following builds and all =
completed successfully:<br /><br />rust<br />clang</div>
<div>mesa<br />&nbsp; &nbsp;--with multilibs enabled<br /><br />The changes=
 correctly resolve llvm-config from the native sysroot, eliminate the need =
for the previous llvm-config copy/symlink workarounds, and work correctly w=
ith multilib (lib64) configurations.<br /><br />Regards,<br />Deepesh</div>

--n7BLzHMjaLryHuzfHKQV--

