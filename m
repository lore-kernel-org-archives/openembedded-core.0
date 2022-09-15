Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30571C6FD1A
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:18:43 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web12.10532.1663251514247626913
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Byss6Uxn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 01010183418400cb-1d269782-9d93-4690-b883-31c3284ea16d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1663251513;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Ady0/BU8/LSzzozGCY0VoL7Ir9fknA0A3gcpPExmpWQ=;
	b=Byss6UxnPN4iuox210av4rMjRliKCowH1BslnO7rYYp/7VVxm7GRWVeHbpc9JoTg
	/4eJeP4JdYywpXcL+wQmF+dcTzt0lsg4x/o6BThKm3/n3mgtiv3oqBREHqS2erA/WAU
	g0cww+1mKme8v6mgVYVZ7lvLJErbG/cQ41zRDrgs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1663251513;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Ady0/BU8/LSzzozGCY0VoL7Ir9fknA0A3gcpPExmpWQ=;
	b=j3l566GObSlJS6PDSdj8nHJEpTqoTfS4iYKqg2Qg44RvdhUOV73BFe3kD87arOUt
	iGVeH7oJBoR/4MjjCwnrA7Bajc4pTseb0fSI58HWLV4exw2JQ3+cjDzEsZ3LO1kpt1f
	zldSKiK8v3MFq/6vwF3/e3LugIr1zTdJetBdcd3g=
Content-Type: multipart/mixed; boundary="===============3308546307907130486=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-tools: upgrading to 1.3.224.1 SUCCEEDED
Message-ID: 
 <01010183418400cb-1d269782-9d93-4690-b883-31c3284ea16d-000000@us-west-2.amazonses.com>
Date: Thu, 15 Sep 2022 14:18:33 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 14:18:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170749

--===============3308546307907130486==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *spirv-tools* to *1.3.224.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-spirv-tools-upgrade-1.3.216.0-1.3.224.1.patch
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
--===============3308546307907130486==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/spirv-tools: PV changed from "1.3.216.0" to "1.3.224.1"
packages/core2-32-poky-linux/spirv-tools: PKGV changed from 1.3.216.0 [default] to 1.3.224.1 [default]
packages/core2-32-poky-linux/spirv-tools: SRC_URI changed from "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=master;protocol=https file://0001-Remove-default-copy-constructor-in-header.-4879.patch" to "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=master;protocol=https"
packages/core2-32-poky-linux/spirv-tools/spirv-tools-dbg: PV changed from "1.3.216.0" to "1.3.224.1"
packages/core2-32-poky-linux/spirv-tools/spirv-tools-dbg: PKGV changed from 1.3.216.0 [default] to 1.3.224.1 [default]
packages/core2-32-poky-linux/spirv-tools/spirv-tools-dbg: PKGSIZE changed from 263901976 to 262217280 (-1%)
packages/core2-32-poky-linux/spirv-tools/spirv-tools-dev: PV changed from "1.3.216.0" to "1.3.224.1"
packages/core2-32-poky-linux/spirv-tools/spirv-tools-dev: PKGV changed from 1.3.216.0 [default] to 1.3.224.1 [default]
packages/core2-32-poky-linux/spirv-tools/spirv-tools-doc: PV changed from "1.3.216.0" to "1.3.224.1"
packages/core2-32-poky-linux/spirv-tools/spirv-tools-doc: PKGV changed from 1.3.216.0 [default] to 1.3.224.1 [default]
packages/core2-32-poky-linux/spirv-tools/spirv-tools-lesspipe: PV changed from "1.3.216.0" to "1.3.224.1"
packages/core2-32-poky-linux/spirv-tools/spirv-tools-lesspipe: PKGV changed from 1.3.216.0 [default] to 1.3.224.1 [default]
packages/core2-32-poky-linux/spirv-tools/spirv-tools-locale: PV changed from "1.3.216.0" to "1.3.224.1"
packages/core2-32-poky-linux/spirv-tools/spirv-tools-locale: PKGV changed from 1.3.216.0 [default] to 1.3.224.1 [default]
packages/core2-32-poky-linux/spirv-tools/spirv-tools-src: PV changed from "1.3.216.0" to "1.3.224.1"
packages/core2-32-poky-linux/spirv-tools/spirv-tools-src: PKGV changed from 1.3.216.0 [default] to 1.3.224.1 [default]
packages/core2-32-poky-linux/spirv-tools/spirv-tools-src: PKGSIZE changed from 5301094 to 5345067 (+1%)
packages/core2-32-poky-linux/spirv-tools/spirv-tools-src: FILELIST: directory renamed /usr/src/debug/spirv-tools/1_1.3.216.0-r0/include/spirv-tools -> /usr/src/debug/spirv-tools/1_1.3.224.1-r0/include/spirv-tools, directory renamed /usr/src/debug/spirv-tools/1_1.3.216.0-r0/tools/reduce -> /usr/src/debug/spirv-tools/1_1.3.224.1-r0/tools/reduce, directory renamed /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/opt -> /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/opt, directory renamed /usr/src/debug/spirv-tools/1_1.3.216.0-r0/tools -> /usr/src/debug/spirv-tools/1_1.3.224.1-r0/tools, directory renamed /usr/src/debug/spirv-tools/1_1.3.216.0-r0/tools/dis -> /usr/src/debug/spirv-tools/1_1.3.224.1-r0/tools/dis, directory renamed /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/lint -> /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/lint, directory renamed /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/diff -> /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/diff, directory renamed /u
 sr/src/debug/spirv-tools/1_1.3.216.0-r0/tools/util -> /usr/src/debug/spirv-tools/1_1.3.224.1-r0/tools/util, directory renamed /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source -> /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source, directory renamed /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/reduce -> /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/reduce, directory renamed /usr/src/debug/spirv-tools/1_1.3.216.0-r0 -> /usr/src/debug/spirv-tools/1_1.3.224.1-r0, directory renamed /usr/src/debug/spirv-tools/1_1.3.216.0-r0/tools/cfg -> /usr/src/debug/spirv-tools/1_1.3.224.1-r0/tools/cfg, directory renamed /usr/src/debug/spirv-tools/1_1.3.216.0-r0/tools/lint -> /usr/src/debug/spirv-tools/1_1.3.224.1-r0/tools/lint, directory renamed /usr/src/debug/spirv-tools/1_1.3.216.0-r0/tools/val -> /usr/src/debug/spirv-tools/1_1.3.224.1-r0/tools/val, directory renamed /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/link -> /usr/src/debug/spirv-tools/1_1.3.224.1-r0/tools/link, directory renamed /u
 sr/src/debug/spirv-tools/1_1.3.216.0-r0/tools/as -> /usr/src/debug/spirv-tools/1_1.3.224.1-r0/tools/as, directory renamed /usr/src/debug/spirv-tools/1_1.3.216.0-r0/tools/link -> /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/link, directory renamed /usr/src/debug/spirv-tools/1_1.3.216.0-r0/tools/opt -> /usr/src/debug/spirv-tools/1_1.3.224.1-r0/tools/opt, removed "/usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_atomics.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_type.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_bitwise.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_decorations.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_memory_semantics.h /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_arithmetics.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/util/bit_vector.h /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_extensions.cpp /usr/src/debug/spirv-tools/1_
 1.3.216.0-r0/source/val/construct.h /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_interfaces.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_cfg.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_literals.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/util/parse_number.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_non_uniform.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_debug.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_scopes.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_instruction.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/util/ilist.h /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/util/string_utils.h /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_memory.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/util/bit_vector.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_id.cpp /usr/src/debug/spirv-tool
 s/1_1.3.216.0-r0/source/val/validate_composites.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_misc.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/util/hex_float.h /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/util/pooled_linked_list.h /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/util/ilist_node.h /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/util/string_utils.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_layout.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validation_state.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/function.h /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/util/timer.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/util/bitutils.h /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_small_type_uses.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_mode_setting.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_scopes.h /usr/src/debug/spirv-to
 ols/1_1.3.216.0-r0/source/val/validate_derivatives.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_memory_semantics.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/construct.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/instruction.h /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_conversion.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/util/parse_number.h /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/instruction.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_logicals.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_constants.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate.h /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/util/make_unique.h /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_capability.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_adjacency.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/basic_block.cpp /usr/
 src/debug/spirv-tools/1_1.3.216.0-r0/source/val/basic_block.h /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/util/timer.h /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_image.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/util/hash_combine.h /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/decoration.h /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/function.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_barriers.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validation_state.h /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_builtins.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_annotation.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_function.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_primitives.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/util/small_vector.h /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate.cpp /usr/src/debug
 /spirv-tools/1_1.3.216.0-r0/source/val/validate_execution_limitations.cpp", added "/usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/util/parse_number.h /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_instruction.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_barriers.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_cfg.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_builtins.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/instruction.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/function.h /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_layout.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/util/string_utils.h /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_image.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/util/hex_float.h /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_capability.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/util/ili
 st.h /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/util/bit_vector.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_logicals.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/util/ilist_node.h /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_execution_limitations.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/util/bit_vector.h /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/construct.h /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_id.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_misc.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/util/bitutils.h /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_arithmetics.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_type.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_scopes.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/util/parse_number.c
 pp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_literals.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_debug.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/function.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/util/timer.h /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/basic_block.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/util/string_utils.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/util/small_vector.h /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_function.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/util/timer.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/util/hash_combine.h /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validation_state.h /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_memory.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_ray_query.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/decoration.h /usr/src/debug/
 spirv-tools/1_1.3.224.1-r0/source/util/make_unique.h /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate.h /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_bitwise.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_memory_semantics.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/basic_block.h /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_constants.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_mode_setting.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_small_type_uses.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_decorations.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/construct.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_atomics.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_adjacency.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_conversion.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/sourc
 e/val/validate_extensions.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_composites.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_annotation.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_interfaces.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/instruction.h /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_non_uniform.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validation_state.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_memory_semantics.h /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_derivatives.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_primitives.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_scopes.h"
packages/core2-32-poky-linux/spirv-tools/spirv-tools-staticdev: PV changed from "1.3.216.0" to "1.3.224.1"
packages/core2-32-poky-linux/spirv-tools/spirv-tools-staticdev: PKGV changed from 1.3.216.0 [default] to 1.3.224.1 [default]
packages/core2-32-poky-linux/spirv-tools/spirv-tools: PV changed from "1.3.216.0" to "1.3.224.1"
packages/core2-32-poky-linux/spirv-tools/spirv-tools: PKGV changed from 1.3.216.0 [default] to 1.3.224.1 [default]
packages/core2-32-poky-linux/spirv-tools/spirv-tools: PKGSIZE changed from 7245030 to 7384294 (+2%)

--===============3308546307907130486==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1663 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (884 cached, 1 parsed). 1661 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-7f4b2a0cc8f0448f7e5b4f9a520ac1069f65e229"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7f4b2a0cc8f0448f7e5b4f9a520ac1069f65e229"
workspace            = "master:6a27236fed8e7c27974c2313366bdbfd8edfa927"

Initialising tasks...done.
Sstate summary: Wanted 24 Local 11 Mirrors 0 Missed 13 Current 242 (45% match, 95% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 753 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_fetch)
NOTE: Running task 783 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_fetch)
NOTE: Running task 972 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_fetch: Succeeded
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_fetch: Succeeded
NOTE: Running task 999 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_unpack)
NOTE: Running task 1000 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_unpack)
NOTE: Running task 1001 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_unpack: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_unpack: Succeeded
NOTE: Running task 1002 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_patch: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_unpack: Succeeded
NOTE: Running task 1003 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_patch: Succeeded
NOTE: Running task 1004 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_generate_toolchain_file)
NOTE: Running task 1005 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_patch: Succeeded
NOTE: Running task 1006 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1007 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_generate_toolchain_file)
NOTE: Running task 1008 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1009 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_populate_lic: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1010 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_populate_lic unihash changed to 7d9da868cf429c1b1d02d35f2439d24908d0478a97cadd40d15756b1ded65044
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_configure: Succeeded
NOTE: Running task 1011 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1012 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_compile: Succeeded
NOTE: Running task 1013 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to c3c2a2502f0c01863129693fb8df3aff62917c09cdbe1a9ac099d9842d61e258
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_install: Succeeded
NOTE: Running task 1015 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_populate_sysroot)
NOTE: Running task 1016 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_package)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1017 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1018 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_package: Succeeded
NOTE: Running task 1019 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_packagedata)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_configure: Succeeded
NOTE: Running task 1020 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_packagedata: Failed
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_compile: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1020 tasks of which 996 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-src went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-dbg went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-staticdev went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-dev went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-doc went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-locale went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/spirv-headers/1_1.3.216.0-r0/temp/log.do_packagedata.1787539
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_packagedata) failed with exit code '1'

--===============3308546307907130486==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1661 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-7f4b2a0cc8f0448f7e5b4f9a520ac1069f65e229"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7f4b2a0cc8f0448f7e5b4f9a520ac1069f65e229"
workspace            = "master:6a27236fed8e7c27974c2313366bdbfd8edfa927"

Initialising tasks...done.
Sstate summary: Wanted 23 Local 10 Mirrors 0 Missed 13 Current 243 (43% match, 95% complete)
Removing 2 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 753 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_fetch)
NOTE: Running task 783 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_fetch)
NOTE: Running task 976 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_fetch: Succeeded
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_fetch: Succeeded
NOTE: Running task 999 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_unpack)
NOTE: Running task 1000 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_unpack)
NOTE: Running task 1001 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_unpack: Succeeded
NOTE: Running task 1002 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_patch: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_unpack: Succeeded
NOTE: Running task 1003 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_patch: Succeeded
NOTE: Running task 1004 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_generate_toolchain_file)
NOTE: Running task 1005 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_patch: Succeeded
NOTE: Running task 1006 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1007 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_generate_toolchain_file)
NOTE: Running task 1008 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_populate_lic)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1009 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_populate_lic: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1010 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_populate_lic unihash changed to 7d9da868cf429c1b1d02d35f2439d24908d0478a97cadd40d15756b1ded65044
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_configure: Succeeded
NOTE: Running task 1011 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_compile: Started
NOTE: Running task 1012 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_compile: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: Running task 1013 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_install)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to d98d5a14ebcf50970289c9564cc48d11da39a512ff81f72d3c143b582d6c0bf0
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_install: Succeeded
NOTE: Running task 1015 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_populate_sysroot)
NOTE: Running task 1016 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_package)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1017 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1018 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_package: Succeeded
NOTE: Running task 1019 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_packagedata)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_configure: Succeeded
NOTE: Running task 1020 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_packagedata: Failed
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_compile: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1020 tasks of which 996 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-src went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-dbg went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-staticdev went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-dev went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-doc went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-locale went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/spirv-headers/1_1.3.216.0-r0/temp/log.do_packagedata.1790876
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_packagedata) failed with exit code '1'

--===============3308546307907130486==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-tools-upgrade-1.3.216.0-1.3.224.1.patch"

RnJvbSBlY2YyNGZkOWVkMjJiOWQ0YWQ4MGUwZTM1N2I2MjNmNTk4YTU0MGE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgU2VwIDIwMjIgMTI6MTc6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cGlydi10b29sczogdXBncmFkZSAxLjMuMjE2LjAgLT4gMS4zLjIyNC4xCgotLS0KIC4uLnVsdC1j
b3B5LWNvbnN0cnVjdG9yLWluLWhlYWRlci4tNDg3OS5wYXRjaCB8IDM0IC0tLS0tLS0tLS0tLS0t
LS0tLS0KIC4uLl8xLjMuMjE2LjAuYmIgPT4gc3BpcnYtdG9vbHNfMS4zLjIyNC4xLmJifSB8ICA2
ICsrLS0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzOCBkZWxldGlvbnMoLSkK
IGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi10b29s
cy8wMDAxLVJlbW92ZS1kZWZhdWx0LWNvcHktY29uc3RydWN0b3ItaW4taGVhZGVyLi00ODc5LnBh
dGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIve3NwaXJ2LXRvb2xzXzEuMy4y
MTYuMC5iYiA9PiBzcGlydi10b29sc18xLjMuMjI0LjEuYmJ9ICg4OCUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtdG9vbHMvMDAwMS1SZW1vdmUtZGVmYXVs
dC1jb3B5LWNvbnN0cnVjdG9yLWluLWhlYWRlci4tNDg3OS5wYXRjaCBiL21ldGEvcmVjaXBlcy1n
cmFwaGljcy9zcGlyL3NwaXJ2LXRvb2xzLzAwMDEtUmVtb3ZlLWRlZmF1bHQtY29weS1jb25zdHJ1
Y3Rvci1pbi1oZWFkZXIuLTQ4NzkucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDA0NGMzNjZhNzUuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIv
c3BpcnYtdG9vbHMvMDAwMS1SZW1vdmUtZGVmYXVsdC1jb3B5LWNvbnN0cnVjdG9yLWluLWhlYWRl
ci4tNDg3OS5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDM0ICswLDAgQEAKLUZyb20gYTkwY2Nj
MjQwNTAxYmYzMzYyYjIzZjY3NzcxZjY1YjdkZWMyY2NmOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKLUZyb206IEphbWllIE1hZGlsbCA8am1hZGlsbEBjaHJvbWl1bS5vcmc+Ci1EYXRlOiBGcmks
IDI5IEp1bCAyMDIyIDE0OjI2OjM3IC0wNDAwCi1TdWJqZWN0OiBbUEFUQ0hdIFJlbW92ZSBkZWZh
dWx0IGNvcHkgY29uc3RydWN0b3IgaW4gaGVhZGVyLiAoIzQ4NzkpCi0KLUEgcmVjZW50IGxpYmMr
KyByb2xsIGluIENocm9tZSB3YXJuZWQgb2YgYSBkZXByZWNhdGVkIGNvcHkuIFdlJ3JlCi1zdGls
bCBsb29raW5nIGlmIHRoaXMgaXMgYSBidWcgaW4gbGliYysrIG9yIGEgdmFsaWQgd2FybmluZywg
YnV0Ci1yZW1vdmluZyB0aGUgcmVkdW5kYW50IGxpbmUgaXMgYSBzYWZlIHdvcmthcm91bmQgb3Ig
Zml4IGluIGVpdGhlcgotY2FzZS4KLQotU2VlIGRpc2N1c3Npb24gaW4gaHR0cHM6Ly9jcnJldi5j
b20vYy8zNzkxNzcxCi0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vZ2l0aHVi
LmNvbS9LaHJvbm9zR3JvdXAvU1BJUlYtVG9vbHMvcHVsbC80ODc5XQotU2lnbmVkLW9mZi1ieTog
S2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KLS0tLQotIHNvdXJjZS9vcHQvbWVyZ2VfcmV0
dXJuX3Bhc3MuaCB8IDIgLS0KLSAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKLQotZGlm
ZiAtLWdpdCBhL3NvdXJjZS9vcHQvbWVyZ2VfcmV0dXJuX3Bhc3MuaCBiL3NvdXJjZS9vcHQvbWVy
Z2VfcmV0dXJuX3Bhc3MuaAotaW5kZXggYTM1Y2YyNjkuLmQxNWRiMmY2IDEwMDY0NAotLS0tIGEv
c291cmNlL29wdC9tZXJnZV9yZXR1cm5fcGFzcy5oCi0rKysgYi9zb3VyY2Uvb3B0L21lcmdlX3Jl
dHVybl9wYXNzLmgKLUBAIC0xMTgsOCArMTE4LDYgQEAgY2xhc3MgTWVyZ2VSZXR1cm5QYXNzIDog
cHVibGljIE1lbVBhc3MgewotICAgICBTdHJ1Y3R1cmVkQ29udHJvbFN0YXRlKEluc3RydWN0aW9u
KiBicmVha19tZXJnZSwgSW5zdHJ1Y3Rpb24qIG1lcmdlKQotICAgICAgICAgOiBicmVha19tZXJn
ZV8oYnJlYWtfbWVyZ2UpLCBjdXJyZW50X21lcmdlXyhtZXJnZSkge30KLSAKLS0gICAgU3RydWN0
dXJlZENvbnRyb2xTdGF0ZShjb25zdCBTdHJ1Y3R1cmVkQ29udHJvbFN0YXRlJikgPSBkZWZhdWx0
OwotLQotICAgICBib29sIEluQnJlYWthYmxlKCkgY29uc3QgeyByZXR1cm4gYnJlYWtfbWVyZ2Vf
OyB9Ci0gICAgIGJvb2wgSW5TdHJ1Y3R1cmVkRmxvdygpIGNvbnN0IHsgcmV0dXJuIEN1cnJlbnRN
ZXJnZUlkKCkgIT0gMDsgfQotIAotLS0gCi0yLjM3LjIKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtdG9vbHNfMS4zLjIxNi4wLmJiIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3NwaXIvc3BpcnYtdG9vbHNfMS4zLjIyNC4xLmJiCnNpbWlsYXJpdHkgaW5kZXgg
ODglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LXRvb2xzXzEu
My4yMTYuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtdG9v
bHNfMS4zLjIyNC4xLmJiCmluZGV4IGZjMTA3NGQ4YjguLmNmZWEyOGE2ZWYgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LXRvb2xzXzEuMy4yMTYuMC5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi10b29sc18xLjMuMjI0LjEuYmIKQEAg
LTcsMTAgKzcsOCBAQCBTRUNUSU9OID0gImdyYXBoaWNzIgogTElDRU5TRSAgPSAiQXBhY2hlLTIu
MCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTNiODNlZjk2Mzg3ZjE0
NjU1ZmM4NTRkZGMzYzZiZDU3IgogCi1TUkNSRVYgPSAiYzk0NTAxMzUyZDU0NWU4NGM4MjFjZTAz
MTM5OWU3NmQxYWYzMmQxOCIKLVNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9zR3Jv
dXAvU1BJUlYtVG9vbHMuZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMgXAotICAgICAg
ICAgICBmaWxlOi8vMDAwMS1SZW1vdmUtZGVmYXVsdC1jb3B5LWNvbnN0cnVjdG9yLWluLWhlYWRl
ci4tNDg3OS5wYXRjaCBcCi0gICAgICAgICAgIgorU1JDUkVWID0gIjVlNjFlYTIwOTgyMjAwNTll
ODk1MjNmMWY0N2IwYmNkOGMzM2I4OWEiCitTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vS2hy
b25vc0dyb3VwL1NQSVJWLVRvb2xzLmdpdDticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIgog
UEUgPSAiMSIKIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gInNkay0oP1A8cHZlcj5cZCso
XC5cZCspKykiCiBTID0gIiR7V09SS0RJUn0vZ2l0IgotLSAKMi4zMS4xCgo=

--===============3308546307907130486==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1661 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-7f4b2a0cc8f0448f7e5b4f9a520ac1069f65e229"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7f4b2a0cc8f0448f7e5b4f9a520ac1069f65e229"
workspace            = "master:6a27236fed8e7c27974c2313366bdbfd8edfa927"

Initialising tasks...done.
Sstate summary: Wanted 27 Local 14 Mirrors 0 Missed 13 Current 239 (51% match, 95% complete)
Removing 2 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 753 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_fetch)
NOTE: Running task 783 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_fetch)
NOTE: Running task 974 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_fetch: Succeeded
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_fetch: Succeeded
NOTE: Running task 999 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_unpack)
NOTE: Running task 1000 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_unpack)
NOTE: Running task 1001 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_unpack: Succeeded
NOTE: Running task 1002 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_patch: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_unpack: Succeeded
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_patch: Succeeded
NOTE: Running task 1003 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_patch)
NOTE: Running task 1004 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_generate_toolchain_file)
NOTE: Running task 1005 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_patch: Succeeded
NOTE: Running task 1006 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1007 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_generate_toolchain_file)
NOTE: Running task 1008 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1009 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_populate_lic: Started
NOTE: Running task 1010 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_populate_lic unihash changed to 7d9da868cf429c1b1d02d35f2439d24908d0478a97cadd40d15756b1ded65044
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_configure: Succeeded
NOTE: Running task 1011 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1012 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_compile: Succeeded
NOTE: Running task 1013 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 37aaf5f2a2c75c4a5dda7d2b975ac097acd69dc106711c820f21ede2b5cba8c2
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_install: Succeeded
NOTE: Running task 1015 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_populate_sysroot)
NOTE: Running task 1016 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_package)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1017 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1018 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_package: Succeeded
NOTE: Running task 1019 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_packagedata)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_configure: Succeeded
NOTE: Running task 1020 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_packagedata: Failed
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_compile: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1020 tasks of which 996 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-src went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-dbg went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-staticdev went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-dev went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-doc went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-locale went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/spirv-headers/1_1.3.216.0-r0/temp/log.do_packagedata.1794271
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_packagedata) failed with exit code '1'

--===============3308546307907130486==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1661 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-7f4b2a0cc8f0448f7e5b4f9a520ac1069f65e229"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7f4b2a0cc8f0448f7e5b4f9a520ac1069f65e229"
workspace            = "master:6a27236fed8e7c27974c2313366bdbfd8edfa927"

Initialising tasks...done.
Sstate summary: Wanted 25 Local 12 Mirrors 0 Missed 13 Current 241 (48% match, 95% complete)
Removing 2 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 753 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_fetch)
NOTE: Running task 783 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_fetch)
NOTE: Running task 978 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_fetch: Succeeded
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_fetch: Succeeded
NOTE: Running task 999 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_unpack)
NOTE: Running task 1000 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_unpack)
NOTE: Running task 1001 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_unpack: Succeeded
NOTE: Running task 1002 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_patch: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_unpack: Succeeded
NOTE: Running task 1003 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_patch: Succeeded
NOTE: Running task 1004 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_generate_toolchain_file)
NOTE: Running task 1005 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_patch: Succeeded
NOTE: Running task 1006 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1007 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_generate_toolchain_file)
NOTE: Running task 1008 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_populate_lic: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1009 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 1010 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_populate_lic unihash changed to 7d9da868cf429c1b1d02d35f2439d24908d0478a97cadd40d15756b1ded65044
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_configure: Succeeded
NOTE: Running task 1011 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_compile: Succeeded
NOTE: Running task 1012 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_install)
NOTE: Running task 1013 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to ec25511add6dcce912d80f36cadc3e30b56f0a9efcc0d2577f3090654f1daf58
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_install: Succeeded
NOTE: Running task 1015 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_populate_sysroot)
NOTE: Running task 1016 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_package)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1017 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1018 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_package: Succeeded
NOTE: Running task 1019 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_packagedata)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_configure: Succeeded
NOTE: Running task 1020 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_packagedata: Failed
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_compile: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1020 tasks of which 996 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-src went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-dbg went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-staticdev went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-dev went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-doc went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-locale went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/spirv-headers/1_1.3.216.0-r0/temp/log.do_packagedata.1797673
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_packagedata) failed with exit code '1'

--===============3308546307907130486==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1662 targets, 49 skipped, 0 masked, 0 errors.
Removing 7 recipes from the core2-32 sysroot...done.
Removing 31 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-7f4b2a0cc8f0448f7e5b4f9a520ac1069f65e229"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7f4b2a0cc8f0448f7e5b4f9a520ac1069f65e229"
workspace            = "master:6a27236fed8e7c27974c2313366bdbfd8edfa927"

Initialising tasks...done.
Sstate summary: Wanted 136 Local 123 Mirrors 0 Missed 13 Current 126 (90% match, 95% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 127 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_write_rpm_setscene)
NOTE: Running task 562 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_fetch)
NOTE: Running task 569 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_fetch)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_fetch: Started
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_fetch: Succeeded
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_fetch: Succeeded
NOTE: Running task 597 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_unpack)
NOTE: Running task 598 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_unpack)
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 147 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 148 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 149 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 150 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 151 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 152 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 153 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 154 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 155 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_unpack: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 599 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: Running task 608 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 609 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_unpack: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 168 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 170 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 172 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_packagedata_setscene)
NOTE: Running task 626 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 627 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libcap-2.65-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_patch: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: Running task 628 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_patch: Succeeded
NOTE: recipe libcap-2.65-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 632 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_generate_toolchain_file)
NOTE: Running task 633 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 640 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 180 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_patch: Succeeded
NOTE: Running task 645 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 646 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_generate_toolchain_file)
NOTE: Running task 647 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_populate_lic)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 648 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_populate_lic: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 183 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 185 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 188 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 190 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 192 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 653 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_populate_lic unihash changed to 7d9da868cf429c1b1d02d35f2439d24908d0478a97cadd40d15756b1ded65044
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 201 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 203 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 686 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 215 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 217 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 220 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 227 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 229 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 233 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 235 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 237 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 238 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 711 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 241 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 242 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 243 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 244 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 245 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 37f0cea51a37bcf9803a9cc53e5f8267b79969d6ff757d0b1da180c1e7a446bc
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 254 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 257 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 258 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 881 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 997 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_configure)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_configure: Succeeded
NOTE: Running task 998 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_compile: Succeeded
NOTE: Running task 999 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_install)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_install: Succeeded
NOTE: Running task 1000 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_populate_sysroot)
NOTE: Running task 1001 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_package)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1002 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1003 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_package: Succeeded
NOTE: Running task 1004 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_packagedata)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_configure: Succeeded
NOTE: Running task 1005 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_compile)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_packagedata: Failed
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1005 tasks of which 975 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-src went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-dbg went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-staticdev went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-dev went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-doc went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-locale went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/spirv-headers/1_1.3.216.0-r0/temp/log.do_packagedata.1803871
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_packagedata) failed with exit code '1'

--===============3308546307907130486==--

