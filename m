Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4644C53219
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 05:24:11 +0000 (UTC)
Subject: Re: Patchtest results for [PATCH v4 2/3] rust: refactor source handling into a shared work-shared recipe
To: openembedded-core@lists.openembedded.org
From: "Varatharajan, Deepesh" <deepesh.varatharajan@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (49.204.85.206)
X-Originating-Platform: Windows Chrome 150
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 28 Jul 2026 22:24:06 -0700
References: <20260729044714.1239545-2-Deepesh.Varatharajan@windriver.com> <0101019fac408a82-c94804a1-7a76-40ef-81a7-e1ed115efe31-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019fac408a82-c94804a1-7a76-40ef-81a7-e1ed115efe31-000000@us-west-2.amazonses.com>
Message-ID: <1113502.1785302646234495399@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="1rHWm71zJLLJc1jthh1i"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 05:24:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242233

--1rHWm71zJLLJc1jthh1i
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 10:32 AM, Patchtest wrote:

>=20
> FAIL: test src uri left files: Patches not removed from tree. Remove them
> and amend the submitted mbox
> (test_metadata.TestMetadata.test_src_uri_left_files)

Hi All,

his is a false positive. The patch files are not orphaned they are still re=
ferenced via SRC_URI in rust-source.inc,
which is now required by the new rust-source_1.96.1.bb recipe.

The consumer recipes (rust, cargo, libstd-rs) include common-source.inc whi=
ch clears their SRC_URI since they
no longer fetch/unpack/patch themselves rust-source_1.96.1.bb handles that =
centrally.

Regards,
Deepesh

--1rHWm71zJLLJc1jthh1i
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Wed, Jul 29, 2026 at 10:32 AM, Patchtest wrote:</div>
<div>
<blockquote>FAIL: test src uri left files: Patches not removed from tree. R=
emove them and amend the submitted mbox (test_metadata.TestMetadata.test_sr=
c_uri_left_files)</blockquote>
Hi All,<br /><br />his is a false positive. The patch files are not orphane=
d they are still referenced via SRC_URI in rust-source.inc, <br />which is =
now required by the new rust-source_1.96.1.bb recipe.<br /><br />The consum=
er recipes (rust, cargo, libstd-rs) include common-source.inc which clears =
their SRC_URI since they<br />no longer fetch/unpack/patch themselves rust-=
source_1.96.1.bb handles that centrally.</div>
<div>&nbsp;</div>
<div>Regards,<br />Deepesh</div>

--1rHWm71zJLLJc1jthh1i--

