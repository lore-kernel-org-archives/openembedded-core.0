Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E18D4C074FD
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:12 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.8644.1698848703198982738
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=O9iTDHcs;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=IKqIWkkx;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.31, mailfrom: 0101018b8b460c67-542ba3de-7150-4320-bc87-45a951e2a0ae-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TNbZtD2RSfZpKFXOnPegP44pSS4bEwvDCm57i+2SJ64=;
	b=O9iTDHcsT7ExmXiHqnXVo6Jqd3MflQebZb3NIhuritm3Cj0FsF7taB/aLefeETkw
	vrjcmgQ0EJB5bNJ/vkcd0Paack3vr/UMonLZjhrCq4i29qEXwMdLLrOme00HLaUGNPq
	urXrqMO+v+GQQ/74gdl4368njIE6W3QguL0R95P8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TNbZtD2RSfZpKFXOnPegP44pSS4bEwvDCm57i+2SJ64=;
	b=IKqIWkkx1ieioqI0y3/NwZfHfQaeiR84NO5dLmv5fOGo46dliOsqjW+zRYuEyLzt
	wiuuZyt2LIhcgh9FMkWkCM3HeQkovp79x9xlVhxGERt48f6+fwx2bEve70Tv2o5ECiU
	td2TPxOHCZcTkd8rsMiRIMFV+60ARx0aM2WHCfPc=
Content-Type: multipart/mixed; boundary="===============8315815374535468152=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-tools: upgrading to 1.3.268.0 SUCCEEDED
Message-ID: <0101018b8b460c67-542ba3de-7150-4320-bc87-45a951e2a0ae-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190007

--===============8315815374535468152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *spirv-tools* to *1.3.268.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-spirv-tools-upgrade-1.3.261.1-1.3.268.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 4ece8ce402c9f89d57012e7a5aed77863616d7b8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 13:05:13 +0000
Subject: [PATCH] spirv-tools: upgrade 1.3.261.1 -> 1.3.268.0

---
 .../spir/{spirv-tools_1.3.261.1.bb => spirv-tools_1.3.268.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-tools_1.3.261.1.bb => spirv-tools_1.3.268.0.bb} (96%)

diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.261.1.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.268.0.bb
similarity index 96%
rename from meta/recipes-graphics/spir/spirv-tools_1.3.261.1.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.3.268.0.bb
index 6904288299..3cf5b28088 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.3.261.1.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.3.268.0.bb
@@ -7,7 +7,7 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "e553b884c7c9febaa4e52334f683641fb5f196a0"
+SRCREV = "360d469b9eac54d6c6e20f609f9ec35e3a5380ad"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
-- 
2.39.2


--===============8315815374535468152==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-tools-upgrade-1.3.261.1-1.3.268.0.patch"

RnJvbSA0ZWNlOGNlNDAyYzlmODlkNTcwMTJlN2E1YWVkNzc4NjM2MTZkN2I4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAxMzowNToxMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNw
aXJ2LXRvb2xzOiB1cGdyYWRlIDEuMy4yNjEuMSAtPiAxLjMuMjY4LjAKCi0tLQogLi4uL3NwaXIv
e3NwaXJ2LXRvb2xzXzEuMy4yNjEuMS5iYiA9PiBzcGlydi10b29sc18xLjMuMjY4LjAuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIve3NwaXJ2LXRvb2xzXzEuMy4yNjEuMS5iYiA9
PiBzcGlydi10b29sc18xLjMuMjY4LjAuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtdG9vbHNfMS4zLjI2MS4xLmJiIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3NwaXIvc3BpcnYtdG9vbHNfMS4zLjI2OC4wLmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LXRvb2xzXzEu
My4yNjEuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtdG9v
bHNfMS4zLjI2OC4wLmJiCmluZGV4IDY5MDQyODgyOTkuLjNjZjViMjgwODggMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LXRvb2xzXzEuMy4yNjEuMS5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi10b29sc18xLjMuMjY4LjAuYmIKQEAg
LTcsNyArNyw3IEBAIFNFQ1RJT04gPSAiZ3JhcGhpY3MiCiBMSUNFTlNFICA9ICJBcGFjaGUtMi4w
IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9M2I4M2VmOTYzODdmMTQ2
NTVmYzg1NGRkYzNjNmJkNTciCiAKLVNSQ1JFViA9ICJlNTUzYjg4NGM3YzlmZWJhYTRlNTIzMzRm
NjgzNjQxZmI1ZjE5NmEwIgorU1JDUkVWID0gIjM2MGQ0NjliOWVhYzU0ZDZjNmUyMGY2MDlmOWVj
MzVlM2E1MzgwYWQiCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1NQ
SVJWLVRvb2xzLmdpdDticmFuY2g9bWFpbjtwcm90b2NvbD1odHRwcyIKIFBFID0gIjEiCiAjIFRo
ZXNlIHJlY2lwZXMgbmVlZCB0byBiZSB1cGRhdGVkIGluIGxvY2tzdGVwIHdpdGggZWFjaCBvdGhl
cjoKLS0gCjIuMzkuMgoK

--===============8315815374535468152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/spirv-tools: PKGV changed from 1.3.261.1 [default] to 1.3.268.0 [default]
packages/core2-64-poky-linux/spirv-tools: PV changed from "1.3.261.1" to "1.3.268.0"
packages/core2-64-poky-linux/spirv-tools/spirv-tools-dbg: PKGSIZE changed from 314352200 to 317455984 (+1%)
packages/core2-64-poky-linux/spirv-tools/spirv-tools-dbg: PKGV changed from 1.3.261.1 [default] to 1.3.268.0 [default]
packages/core2-64-poky-linux/spirv-tools/spirv-tools-dbg: PV changed from "1.3.261.1" to "1.3.268.0"
packages/core2-64-poky-linux/spirv-tools/spirv-tools-dev: PKGSIZE changed from 174558 to 170071 (-3%)
packages/core2-64-poky-linux/spirv-tools/spirv-tools-dev: PKGV changed from 1.3.261.1 [default] to 1.3.268.0 [default]
packages/core2-64-poky-linux/spirv-tools/spirv-tools-dev: PV changed from "1.3.261.1" to "1.3.268.0"
packages/core2-64-poky-linux/spirv-tools/spirv-tools-doc: PKGV changed from 1.3.261.1 [default] to 1.3.268.0 [default]
packages/core2-64-poky-linux/spirv-tools/spirv-tools-doc: PV changed from "1.3.261.1" to "1.3.268.0"
packages/core2-64-poky-linux/spirv-tools/spirv-tools-lesspipe: PKGV changed from 1.3.261.1 [default] to 1.3.268.0 [default]
packages/core2-64-poky-linux/spirv-tools/spirv-tools-lesspipe: PV changed from "1.3.261.1" to "1.3.268.0"
packages/core2-64-poky-linux/spirv-tools/spirv-tools-locale: PKGV changed from 1.3.261.1 [default] to 1.3.268.0 [default]
packages/core2-64-poky-linux/spirv-tools/spirv-tools-locale: PV changed from "1.3.261.1" to "1.3.268.0"
packages/core2-64-poky-linux/spirv-tools/spirv-tools-src: PKGSIZE changed from 5692210 to 5693876 (+0%)
packages/core2-64-poky-linux/spirv-tools/spirv-tools-src: FILELIST: directory renamed /usr/src/debug/spirv-tools/1_1.3.261.1-r0/tools/val -> /usr/src/debug/spirv-tools/1_1.3.268.0-r0/tools/val, directory renamed /usr/src/debug/spirv-tools/1_1.3.261.1-r0/tools/cfg -> /usr/src/debug/spirv-tools/1_1.3.268.0-r0/tools/cfg, directory renamed /usr/src/debug/spirv-tools/1_1.3.261.1-r0/tools/as -> /usr/src/debug/spirv-tools/1_1.3.268.0-r0/tools/as, directory renamed /usr/src/debug/spirv-tools/1_1.3.261.1-r0 -> /usr/src/debug/spirv-tools/1_1.3.268.0-r0, directory renamed /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/util -> /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/util, directory renamed /usr/src/debug/spirv-tools/1_1.3.261.1-r0/include/spirv-tools -> /usr/src/debug/spirv-tools/1_1.3.268.0-r0/include/spirv-tools, directory renamed /usr/src/debug/spirv-tools/1_1.3.261.1-r0/tools -> /usr/src/debug/spirv-tools/1_1.3.268.0-r0/tools, directory renamed /usr/src/debug/spirv-tools/1_1.3.261
 .1-r0/tools/util -> /usr/src/debug/spirv-tools/1_1.3.268.0-r0/tools/util, directory renamed /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/link -> /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/link, directory renamed /usr/src/debug/spirv-tools/1_1.3.261.1-r0/tools/reduce -> /usr/src/debug/spirv-tools/1_1.3.268.0-r0/tools/reduce, directory renamed /usr/src/debug/spirv-tools/1_1.3.261.1-r0/tools/lint -> /usr/src/debug/spirv-tools/1_1.3.268.0-r0/tools/lint, directory renamed /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source -> /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source, directory renamed /usr/src/debug/spirv-tools/1_1.3.261.1-r0/tools/link -> /usr/src/debug/spirv-tools/1_1.3.268.0-r0/tools/link, directory renamed /usr/src/debug/spirv-tools/1_1.3.261.1-r0/tools/dis -> /usr/src/debug/spirv-tools/1_1.3.268.0-r0/tools/dis, directory renamed /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/lint -> /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/lint, directory renamed /usr/src/de
 bug/spirv-tools/1_1.3.261.1-r0/source/reduce -> /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/reduce, directory renamed /usr/src/debug/spirv-tools/1_1.3.261.1-r0/tools/objdump -> /usr/src/debug/spirv-tools/1_1.3.268.0-r0/tools/objdump, directory renamed /usr/src/debug/spirv-tools/1_1.3.261.1-r0/tools/opt -> /usr/src/debug/spirv-tools/1_1.3.268.0-r0/tools/opt, directory renamed /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/val -> /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/val, directory renamed /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/diff -> /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/diff, removed "/usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/reflect.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/convert_to_sampled_image_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/instruction_list.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/eliminate_dead_functions_util.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/rep
 lace_invalid_opc.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/local_access_chain_convert_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/remove_duplicates_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/iterator.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/inst_bindless_check_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/fix_func_call_arguments.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/combine_access_chains.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/copy_prop_arrays.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/private_to_local_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/instrument_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/loop_unroller.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/fold_spec_constant_op_and_composite_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/copy_prop_arrays.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source
 /opt/loop_fission.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/loop_fusion.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/wrap_opkill.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/aggressive_dead_code_elim_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/pass_manager.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/build_module.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/register_pressure.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/value_number_table.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/reduce_load_size.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/graphics_robust_access_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/ir_builder.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/folding_rules.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/cfg_cleanup_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/unify_const_pass.cpp /usr/src/debug/spirv-too
 ls/1_1.3.261.1-r0/source/opt/inline_exhaustive_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/fix_storage_class.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/loop_peeling.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/def_use_manager.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/ccp_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/mem_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/def_use_manager.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/types.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/inst_bindless_check_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/desc_sroa.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/eliminate_dead_members_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/loop_dependence_helpers.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/strip_debug_info_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/convert_to_h
 alf_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/local_access_chain_convert_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/reduce_load_size.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/merge_return_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/analyze_live_input_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/inline_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/set_spec_constant_default_value_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/upgrade_memory_model.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/instruction_list.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/pass_manager.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/ir_context.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/dominator_tree.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/freeze_spec_constant_value_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/loop_descrip
 tor.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/const_folding_rules.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/loop_dependence.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/analyze_live_input_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/control_dependence.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/replace_desc_array_access_using_var_index.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/remove_duplicates_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/fold_spec_constant_op_and_composite_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/types.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/unify_const_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/block_merge_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/inst_debug_printf_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/dataflow.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/fold.h /u
 sr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/register_pressure.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/eliminate_dead_output_stores_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/interp_fixup_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/replace_invalid_opc.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/inline_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/local_redundancy_elimination.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/loop_peeling.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/loop_unswitch_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/function.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/ir_loader.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/merge_return_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/strip_debug_info_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/eliminate_dead_output_stores_pass.h /usr/src/debug/spi
 rv-tools/1_1.3.261.1-r0/source/opt/strength_reduction_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/inline_opaque_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/loop_utils.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/propagator.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/simplification_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/scalar_replacement_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/scalar_analysis_nodes.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/eliminate_dead_functions_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/workaround1209.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/constants.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/vector_dce.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/convert_to_half_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/compact_ids_pass.h
  /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/loop_fusion_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/block_merge_util.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/redundancy_elimination.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/struct_cfg_analysis.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/debug_info_manager.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/licm_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/local_single_block_elim_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/inline_exhaustive_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/local_single_store_elim_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/freeze_spec_constant_value_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/interface_var_sroa.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/strength_reduction_pass.cpp /usr
 /src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/upgrade_memory_model.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/ccp_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/cfg_cleanup_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/mem_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/eliminate_dead_functions_util.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/local_single_block_elim_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/local_single_store_elim_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/decoration_manager.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/liveness.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/combine_access_chains.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/dead_variable_elimination.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/instruction.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/code_sink.cpp /usr/src/debug/spirv-tools/1
 _1.3.261.1-r0/source/opt/constants.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/remove_dontinline_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/eliminate_dead_members_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/dead_branch_elim_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/block_merge_util.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/dead_insert_elim_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/feature_manager.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/feature_manager.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/graphics_robust_access_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/inline_opaque_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/inst_debug_printf_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/code_sink.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/inst_buff_addr_check_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r
 0/source/opt/optimizer.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/liveness.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/module.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/control_dependence.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/compact_ids_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/loop_fusion_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/scalar_replacement_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/trim_capabilities_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/remove_unused_interface_variables_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/debug_info_manager.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/remove_unused_interface_variables_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/trim_capabilities_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/loop_utils.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/
 opt/propagator.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/ssa_rewrite_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/desc_sroa.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/eliminate_dead_constant_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/ir_context.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/spread_volatile_semantics.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/interface_var_sroa.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/fix_storage_class.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/loop_fission.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/cfg.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/log.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/loop_fusion.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/wrap_opkill.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/function.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/type_manager
 .h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/eliminate_dead_io_components_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/dominator_tree.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/relax_float_ops_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/basic_block.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/module.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/set_spec_constant_default_value_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/spread_volatile_semantics.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/dead_insert_elim_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/decoration_manager.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/dead_branch_elim_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/instruction.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/folding_rules.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/struct_cfg_analysis.cpp /usr/src/d
 ebug/spirv-tools/1_1.3.261.1-r0/source/opt/loop_unswitch_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/desc_sroa_util.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/null_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/private_to_local_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/remove_dontinline_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/desc_sroa_util.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/licm_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/instrument_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/composite.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/dominator_analysis.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/local_redundancy_elimination.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/scalar_analysis_simplification.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/loop_unroller.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/sourc
 e/opt/flatten_decoration_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/if_conversion.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/fold.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/eliminate_dead_functions_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/composite.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/flatten_decoration_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/basic_block.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/fix_func_call_arguments.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/loop_dependence.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/loop_descriptor.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/tree_iterator.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/redundancy_elimination.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/simplification_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/eliminate_dead_io_components
 _pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/build_module.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/eliminate_dead_constant_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/empty_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/vector_dce.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/cfg.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/scalar_analysis.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/type_manager.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/dead_variable_elimination.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/amd_ext_to_khr.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/aggressive_dead_code_elim_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/strip_nonsemantic_info_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/workaround1209.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/convert_to_sampled_image_pass.h /usr/src/debug
 /spirv-tools/1_1.3.261.1-r0/source/opt/block_merge_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/amd_ext_to_khr.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/relax_float_ops_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/value_number_table.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/interp_fixup_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/ir_loader.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/dataflow.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/strip_nonsemantic_info_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/const_folding_rules.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/if_conversion.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/dominator_analysis.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/ssa_rewrite_pass.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/inst_buff_addr_check_pass.cpp /usr/src/debug/spirv-tools/1_1.3.261.1-r0/sourc
 e/opt/replace_desc_array_access_using_var_index.h /usr/src/debug/spirv-tools/1_1.3.261.1-r0/source/opt/scalar_analysis.h", added "/usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/reflect.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/convert_to_sampled_image_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/instruction_list.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/eliminate_dead_functions_util.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/replace_invalid_opc.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/local_access_chain_convert_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/remove_duplicates_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/iterator.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/inst_bindless_check_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/fix_func_call_arguments.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/combine_access_chains.h /usr/src/debug/spi
 rv-tools/1_1.3.268.0-r0/source/opt/copy_prop_arrays.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/private_to_local_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/instrument_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/loop_unroller.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/fold_spec_constant_op_and_composite_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/copy_prop_arrays.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/loop_fission.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/loop_fusion.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/wrap_opkill.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/aggressive_dead_code_elim_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/pass_manager.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/build_module.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/register_pressure.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/sourc
 e/opt/value_number_table.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/reduce_load_size.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/graphics_robust_access_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/ir_builder.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/folding_rules.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/cfg_cleanup_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/unify_const_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/inline_exhaustive_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/fix_storage_class.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/loop_peeling.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/def_use_manager.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/ccp_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/mem_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/def_use_manager.cpp /usr/src/debug/spirv-tools/
 1_1.3.268.0-r0/source/opt/types.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/inst_bindless_check_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/desc_sroa.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/eliminate_dead_members_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/loop_dependence_helpers.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/strip_debug_info_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/convert_to_half_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/local_access_chain_convert_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/reduce_load_size.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/merge_return_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/analyze_live_input_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/inline_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/set_spec_constant_default_value_pass.cpp /usr/src/debug/
 spirv-tools/1_1.3.268.0-r0/source/opt/switch_descriptorset_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/upgrade_memory_model.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/instruction_list.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/pass_manager.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/ir_context.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/dominator_tree.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/freeze_spec_constant_value_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/loop_descriptor.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/const_folding_rules.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/loop_dependence.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/analyze_live_input_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/control_dependence.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/replace_desc_array_access_using_var_index.cpp /usr/src/
 debug/spirv-tools/1_1.3.268.0-r0/source/opt/remove_duplicates_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/fold_spec_constant_op_and_composite_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/types.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/unify_const_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/block_merge_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/switch_descriptorset_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/inst_debug_printf_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/dataflow.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/fold.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/register_pressure.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/eliminate_dead_output_stores_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/interp_fixup_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/replace_invalid_opc.cpp /usr/src/debug/spirv-tools
 /1_1.3.268.0-r0/source/opt/inline_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/local_redundancy_elimination.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/loop_peeling.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/loop_unswitch_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/function.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/ir_loader.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/merge_return_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/strip_debug_info_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/eliminate_dead_output_stores_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/strength_reduction_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/inline_opaque_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/loop_utils.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/propagator.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/simplification_pas
 s.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/scalar_replacement_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/scalar_analysis_nodes.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/eliminate_dead_functions_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/workaround1209.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/constants.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/invocation_interlock_placement_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/vector_dce.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/convert_to_half_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/compact_ids_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/loop_fusion_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/block_merge_util.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0
 -r0/source/opt/redundancy_elimination.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/struct_cfg_analysis.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/debug_info_manager.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/licm_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/local_single_block_elim_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/inline_exhaustive_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/local_single_store_elim_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/freeze_spec_constant_value_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/interface_var_sroa.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/strength_reduction_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/upgrade_memory_model.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/ccp_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/cfg_cleanup_pass.h /usr/src/debug/spirv-tools/1_1.3.268.
 0-r0/source/opt/mem_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/eliminate_dead_functions_util.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/local_single_block_elim_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/local_single_store_elim_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/invocation_interlock_placement_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/decoration_manager.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/liveness.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/combine_access_chains.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/dead_variable_elimination.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/instruction.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/code_sink.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/constants.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/remove_dontinline_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-
 r0/source/opt/eliminate_dead_members_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/dead_branch_elim_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/block_merge_util.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/dead_insert_elim_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/feature_manager.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/feature_manager.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/graphics_robust_access_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/inline_opaque_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/inst_debug_printf_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/code_sink.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/inst_buff_addr_check_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/optimizer.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/liveness.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/module.cpp
  /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/control_dependence.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/compact_ids_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/loop_fusion_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/scalar_replacement_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/trim_capabilities_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/remove_unused_interface_variables_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/debug_info_manager.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/remove_unused_interface_variables_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/trim_capabilities_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/loop_utils.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/propagator.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/ssa_rewrite_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/desc_sro
 a.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/eliminate_dead_constant_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/ir_context.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/spread_volatile_semantics.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/interface_var_sroa.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/fix_storage_class.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/loop_fission.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/cfg.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/log.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/loop_fusion.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/wrap_opkill.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/function.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/type_manager.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/eliminate_dead_io_components_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/dominator
 _tree.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/relax_float_ops_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/basic_block.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/module.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/set_spec_constant_default_value_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/spread_volatile_semantics.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/dead_insert_elim_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/decoration_manager.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/dead_branch_elim_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/instruction.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/folding_rules.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/struct_cfg_analysis.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/loop_unswitch_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/desc_sroa_util.h /usr/src/debug/spirv
 -tools/1_1.3.268.0-r0/source/opt/null_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/private_to_local_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/remove_dontinline_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/desc_sroa_util.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/licm_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/instrument_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/composite.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/dominator_analysis.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/local_redundancy_elimination.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/scalar_analysis_simplification.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/loop_unroller.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/flatten_decoration_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/if_conversion.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/
 opt/fold.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/eliminate_dead_functions_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/composite.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/flatten_decoration_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/basic_block.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/fix_func_call_arguments.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/loop_dependence.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/loop_descriptor.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/tree_iterator.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/redundancy_elimination.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/simplification_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/eliminate_dead_io_components_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/build_module.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/eliminate_dead_constant
 _pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/empty_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/vector_dce.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/cfg.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/scalar_analysis.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/type_manager.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/dead_variable_elimination.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/amd_ext_to_khr.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/aggressive_dead_code_elim_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/strip_nonsemantic_info_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/workaround1209.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/convert_to_sampled_image_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/block_merge_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/amd_ext_to_khr.cpp /usr/src/debug/spirv-t
 ools/1_1.3.268.0-r0/source/opt/relax_float_ops_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/value_number_table.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/interp_fixup_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/ir_loader.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/dataflow.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/strip_nonsemantic_info_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/const_folding_rules.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/if_conversion.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/dominator_analysis.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/ssa_rewrite_pass.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/inst_buff_addr_check_pass.cpp /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/replace_desc_array_access_using_var_index.h /usr/src/debug/spirv-tools/1_1.3.268.0-r0/source/opt/scalar_analysis.h"
packages/core2-64-poky-linux/spirv-tools/spirv-tools-src: PKGV changed from 1.3.261.1 [default] to 1.3.268.0 [default]
packages/core2-64-poky-linux/spirv-tools/spirv-tools-src: PV changed from "1.3.261.1" to "1.3.268.0"
packages/core2-64-poky-linux/spirv-tools/spirv-tools-staticdev: PKGV changed from 1.3.261.1 [default] to 1.3.268.0 [default]
packages/core2-64-poky-linux/spirv-tools/spirv-tools-staticdev: PV changed from "1.3.261.1" to "1.3.268.0"
packages/core2-64-poky-linux/spirv-tools/spirv-tools: PKGSIZE changed from 7947344 to 7996496 (+1%)
packages/core2-64-poky-linux/spirv-tools/spirv-tools: PKGV changed from 1.3.261.1 [default] to 1.3.268.0 [default]
packages/core2-64-poky-linux/spirv-tools/spirv-tools: PV changed from "1.3.261.1" to "1.3.268.0"

--===============8315815374535468152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (0 cached, 911 parsed). 1843 targets, 67 skipped, 0 masked, 0 errors.
Removing 2 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 2 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-29fc9cd55577415b6660e566541b4d7683f3fb5f"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:29fc9cd55577415b6660e566541b4d7683f3fb5f"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 43 Local 30 Mirrors 0 Missed 13 Current 389 (69% match, 96% complete)
Removing 2 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 400 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.261.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 407 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.261.1.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-headers-1_1.3.261.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-headers-1_1.3.261.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 943 of 1263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.268.0.bb:do_recipe_qa)
NOTE: Running task 1136 of 1263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe spirv-headers-1_1.3.261.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.3.268.0-r0: task do_recipe_qa: Started
NOTE: recipe spirv-headers-1_1.3.261.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.3.268.0-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 429 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.261.1.bb:do_packagedata_setscene)
NOTE: Running task 1137 of 1263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.268.0.bb:do_fetch)
NOTE: recipe spirv-headers-1_1.3.261.1-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.3.268.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe spirv-tools-1_1.3.268.0-r0: task do_fetch: Succeeded
NOTE: Running task 1221 of 1263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.268.0.bb:do_unpack)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/spirv-headers/1.3.261.1/temp/log.do_packagedata_setscene.2306781
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.261.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 430 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.261.1.bb:do_package_setscene)
NOTE: recipe spirv-tools-1_1.3.268.0-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.261.1-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1222 of 1263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe spirv-headers-1_1.3.261.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 432 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.261.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.261.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.3.261.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1239 of 1263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.261.1.bb:do_packagedata)
NOTE: Running task 1241 of 1263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.268.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.268.0-r0: task do_unpack: Succeeded
NOTE: Running task 1243 of 1263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.268.0.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.261.1-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-1_1.3.268.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.268.0-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.261.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1245 of 1263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.268.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-tools-1_1.3.268.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.268.0-r0: task do_patch: Succeeded
NOTE: Running task 1246 of 1263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.268.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1247 of 1263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.268.0.bb:do_generate_toolchain_file)
NOTE: Running task 1248 of 1263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.268.0.bb:do_populate_lic)
NOTE: recipe spirv-tools-1_1.3.268.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-tools-1_1.3.268.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe spirv-tools-1_1.3.268.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe spirv-tools-1_1.3.268.0-r0: task do_populate_lic: Started
NOTE: recipe spirv-tools-1_1.3.268.0-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1249 of 1263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe spirv-tools-1_1.3.268.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-1_1.3.268.0-r0: task do_populate_lic: Succeeded
NOTE: recipe spirv-tools-1_1.3.268.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1250 of 1263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.268.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.268.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3f47b5ed9eb8441973c4ab548f6730c1607013d772c0621215c8eb30a3b8334f
NOTE: recipe spirv-tools-1_1.3.268.0-r0: task do_configure: Succeeded
NOTE: Running task 1254 of 1263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.268.0.bb:do_compile)
NOTE: recipe spirv-tools-1_1.3.268.0-r0: task do_compile: Started
NOTE: recipe spirv-tools-1_1.3.268.0-r0: task do_compile: Succeeded
NOTE: Running task 1255 of 1263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.268.0.bb:do_install)
NOTE: recipe spirv-tools-1_1.3.268.0-r0: task do_install: Started
NOTE: recipe spirv-tools-1_1.3.268.0-r0: task do_install: Succeeded
NOTE: Running task 1256 of 1263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.268.0.bb:do_package)
NOTE: Running task 1257 of 1263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.268.0.bb:do_populate_sysroot)
NOTE: recipe spirv-tools-1_1.3.268.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.268.0-r0: task do_package: Started
NOTE: recipe spirv-tools-1_1.3.268.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.268.0-r0: task do_package: Succeeded
NOTE: Running task 1258 of 1263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.268.0.bb:do_packagedata)
NOTE: recipe spirv-tools-1_1.3.268.0-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-1_1.3.268.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1259 of 1263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.268.0.bb:do_create_spdx)
NOTE: Running task 1260 of 1263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.268.0.bb:do_package_write_rpm)
NOTE: Running task 1261 of 1263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.268.0.bb:do_package_qa)
NOTE: recipe spirv-tools-1_1.3.268.0-r0: task do_create_spdx: Started
NOTE: recipe spirv-tools-1_1.3.268.0-r0: task do_package_write_rpm: Started
NOTE: recipe spirv-tools-1_1.3.268.0-r0: task do_package_qa: Started
NOTE: recipe spirv-tools-1_1.3.268.0-r0: task do_package_qa: Succeeded
NOTE: recipe spirv-tools-1_1.3.268.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1262 of 1263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.268.0.bb:do_create_runtime_spdx)
NOTE: recipe spirv-tools-1_1.3.268.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe spirv-tools-1_1.3.268.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe spirv-tools-1_1.3.268.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1263 of 1263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.268.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1263 tasks of which 1239 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: spirv-headers-1_1.3.261.1-r0 do_packagedata_setscene: QA Issue: Package version for package spirv-headers-src went backwards which would break package feeds (from 1:1.3.268.0-r0 to 1:1.3.261.1-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.261.1-r0 do_packagedata_setscene: QA Issue: Package version for package spirv-headers-dbg went backwards which would break package feeds (from 1:1.3.268.0-r0 to 1:1.3.261.1-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.261.1-r0 do_packagedata_setscene: QA Issue: Package version for package spirv-headers-staticdev went backwards which would break package feeds (from 1:1.3.268.0-r0 to 1:1.3.261.1-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.261.1-r0 do_packagedata_setscene: QA Issue: Package version for package spirv-headers-dev went backwards which would break package feeds (from 1:1.3.268.0-r0 to 1:1.3.261.1-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.261.1-r0 do_packagedata_setscene: QA Issue: Package version for package spirv-headers-doc went backwards which would break package feeds (from 1:1.3.268.0-r0 to 1:1.3.261.1-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.261.1-r0 do_packagedata_setscene: QA Issue: Package version for package spirv-headers-locale went backwards which would break package feeds (from 1:1.3.268.0-r0 to 1:1.3.261.1-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.261.1-r0 do_packagedata_setscene: QA Issue: Package version for package spirv-headers went backwards which would break package feeds (from 1:1.3.268.0-r0 to 1:1.3.261.1-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.261.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8315815374535468152==--

