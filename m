Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE0DC433FE
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 15:06:57 +0000 (UTC)
Received: from mail3.bemta32.sdw.messagelabs.com
 (mail3.bemta32.sdw.messagelabs.com [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web09.52515.1638803216327926497
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 07:06:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=go7HJ0ek;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638803214; i=@fujitsu.com;
	bh=zOTi4z1hL9tB3bEnBhDV3m5OLKLbsNAd2mfnMiWk+Yw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=go7HJ0ektdLvzX0I1pDOhtkH1PEq2nlSTLl0HV2UEQ72Pn8cyvmZPZWcdf8/HCGQB
	 C7hVrAejkWfSmFolfAk5k/90etLcfVcxTlF7axjAthcIg2WxeMa84K+iDmbjJl+c5u
	 nKwhhTz5NQuOYQssHeZ0nKWhRdd2T8nQXCT9ZO8W/3bQwq1Vj5IEc5Tj7cs9MNlocN
	 9//un3gHFPbsd2VsuVtqQe13rPDRz1Xnb+hMctIhKSYu2+pIY2+WgRvwMTFdSiKENj
	 saHQV/HJqGGD4cd+Q+JJbZt9Vtw08knZm908CE7n4t0ETCwrCfI3uBz8Db8sBJd/Ju
	 z68R/Zk0pEllQ==
Received: from [100.115.1.47] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.ess.symcld.net id 9E/EC-28795-E072EA16;
 Mon, 06 Dec 2021 15:06:54 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGIsWRWlGSWpSXmKPExsViZ8MxRZdPfV2
  iwZMHrBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bCCysZCx7LVvxuamNsYPwh2cXIxSEkMJ1J
  YuuFjawQzm5GiY0HrjN2MXJysAnoSpx7vJa9i5GDQ0RAT+LqP1GQsLCApcSPU/PBSlgEVCQWr
  /zBBGLzCrhLHOw7xAZiSwgoSEx5+J4ZIi4ocXLmExYQm1lAVaL7yFMmCFteonnrbGaQ8RICih
  Kzp8tDtFZIvD58iXkCI+8sJN2zkHTPQtK9gJF5FaNVUlFmekZJbmJmjq6hgYGuoaGprrGuoaW
  lXmKVbqJeaqlueWpxia6hXmJ5sV5qcbFecWVuck6KXl5qySZGYOClFDMf38E4pe+n3iFGSQ4m
  JVFeD7F1iUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkePerAOUEi1LTUyvSMnOAUQCTluDgURLh3
  aAElOYtLkjMLc5Mh0idYkzmuLJqySJmjjdrQeRbMNl27y6QbAeTMxccXM3MMQtM3m8/BCQfgM
  nmScu3Mwux5OXnpUqJ8x5VBRotADI6ozQPbjEs+i8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52B
  UEua9BTKFJzOvBO6+V0CnMwGdHtO/GuT0kkSElFQD08EarZ4lDMcPs7Nyff8Y5md9Ri3/dR7L
  8un3DueH8pqWf73EMFU6rM0woHL6m6K4ru5HixSO6X/tEBW7punpHvzz7cKTnzPlHvZxds34d
  EPD3LS1ksNkY+W6NbM0ZNewpkgETXwl9bb9V8rvt98vl7F07Wjc/PJO3iY+r3utAVdMo45380
  nFLZv0epaCDnclT9YujYhtPZPWHXtT494z4XJTZsqh1Gm2V5jTEhW6fa07Pi67m7727eUMxe6
  DL+IetVdGBglsPGG3SkzEdO28xYf+fUmxFjb0TfF/H1P7SWjz7IyJXMa2KxdvZL2nezTGbL5b
  VLfER1aLJxUtIee+PO6WCN7AfqB048xQvR+flFiKMxINtZiLihMBxviO7HkDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-585.messagelabs.com!1638803213!31015!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6621 invoked from network); 6 Dec 2021 15:06:54 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-7.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Dec 2021 15:06:54 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1B6F6rI9011101
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 6 Dec 2021 15:06:53 GMT
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 6 Dec 2021 15:06:52 +0000
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] mesa: upgrade 21.3.0 -> 21.3.1
Date: Tue, 7 Dec 2021 08:06:42 +0800
Message-ID: <1638835602-3908-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 15:06:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159237

Changelog from 21.3.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Bug fixes:
GPU Crash in Yuzu 6600xt 5.15
[spirv-fuzz] lower_trivial_continues_block: Assertion '!first_instr || instr_is_continue(first_instr)' failed.
[RADV] Crash in Metro Exodus in Caspain chapter and Sam=E2=80=99s Story
NIR validation failed after nir_copy_prop
lima: Corrupted Android-12 UI on Allwinner A64
RADV/ACO: Rendering glitches in Forza Horizon 5 windshields
dEQP-GLES31.*imulextended* compiling fp64 glsl 4.00 shader

Changes:
ir3/ra: Consider reg file size when swapping killed sources
ir3/lower_pcopy: Fix shr.b illegal copy lowering
ir3/lower_pcopy: Fix bug with =E2=80=9Cillegal=E2=80=9D copies and swaps
docs: update sha256sum for 21.3.0
.pick_status.json: Update to 1ba231fb75be5bffd806cbd09ac285d1f8f15e3d
ci: temporarily disable lima CI
broadcom/compiler: don=E2=80=99t allow RF writes from signals after thrend
broadcom/compiler: fix scoreboard locking checks
broadcom/compiler: don=E2=80=99t move ldvary earlier if current instruction has ldunif
glsl/nir: Don=E2=80=99t build soft float64 when it cannot be used
intel/nir: also allow unknown format for getting the size of a storage image
iris: Make a helper function for cross-batch dependency flushing
iris: Check for cross-batch flushing whenever a buffer is newly written.
iris: Tidy code in iris_use_pinned_bo a bit
anv: don=E2=80=99t try to close fd =3D -1
intel/fs: fix shader call lowering pass
util/u_trace: refcount payloads
android: define cpp_rtti=3Dfalse because libLLVM is built w/o RTTI (v2)
zink: block suballocator caching for swapchain/dmabuf images
zink: set suballocator bo size to aligned allocation size
zink: stop using VK_IMAGE_LAYOUT_PREINITIALIZED for dmabuf
zink: always set matching resource export type for dmabuf creation
zink: fix memory availability reporting
zink: fail context creation more gracefully
nir: Fix read depth for predecessors
glx/dri3: fix glXQueryContext does not return GLX_RENDER_TYPE value
aco/spill: use spills_entry instead of spills_exit to kill linear VGPRs
spirv: run nir_copy_prop before nir_rematerialize_derefs_in_use_blocks_impl
nir/dce: fix DCE of loops with a halt or return instruction in the pre-header
aco: don=E2=80=99t create DPP instructions with SGPR operands
android.mk: Add missing variables to the make target
radv: disable HTILE for D32S8 format and mipmaps on GFX10
radv: fix emitting VBO when vertex input dynamic state is used
radv: add a workaround to fix a segfault with Metro Exodus (Linux native)
radv: fix resetting the entire vertex input dynamic state
svga: fix bitwise/logical and mixup
lima: disasm: use last argument as a filename

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta/recipes-graphics/mesa/mesa.inc                           | 2 +-
 meta/recipes-graphics/mesa/{mesa_21.3.0.bb =3D> mesa_21.3.1.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa_21.3.0.bb =3D> mesa_21.3.1.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index ed60d98250..e99ec6961b 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -21,7 +21,7 @@ SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
            "
 
-SRC_URI[sha256sum] =3D "a2753c09deef0ba14d35ae8a2ceff3fe5cd13698928c7bb62c2ec8736eb09ce1"
+SRC_URI[sha256sum] =3D "2b0dc2540cb192525741d00f706dbc4586349185dafc65729c7fda0800cc474d"
 
 UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(=3FP<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_21.3.0.bb b/meta/recipes-graphics/mesa/mesa_21.3.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_21.3.0.bb
rename to meta/recipes-graphics/mesa/mesa_21.3.1.bb
-- 
2.25.1


