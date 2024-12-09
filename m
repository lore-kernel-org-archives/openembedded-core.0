Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14D41E77191
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 23:57:16 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.116557.1733788625887413240
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 15:57:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=h61QZDJ1;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733788626; x=1765324626;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ttHJJ8MBKPCvBIBOvFOZ7/JTRcHlnTYGpgDaLWljI4k=;
  b=h61QZDJ1wbTQ8iBkWUjMuKdFm2pO/zbpuGbc4BbGMaeCl/H/I3uo1AeG
   dNl8y5/hVcQi/be7RSP85CabzhO/oWA+g6M6ZGGu4HAqXpTWJgCjKUZAb
   OlXcje7kux9cEtrDDkKnKAMLminBCZxPTbzAHJhxq5atsxHtVxvFjueV+
   g0PZ4O1wKM65zWA9XfOVSC2t5u8FEdhcFTFi3ginLlpjuJk0O8/Vd5HT4
   Dj9Zc2ws54fM6lC6nKo4VI24n93IXzzEYYN2BIHK6h+krom1FtosM98bZ
   CGviMfFa5468nFukY7hM5IUHvAbjxaSOt5yoBrC7tK05+1Uoo/x/ias3v
   g==;
X-CSE-ConnectionGUID: KVhiDsZtQa+mFCyXWjNo1g==
X-CSE-MsgGUID: HAxgqny4R9+pge7xB2lGFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="182326966"
X-IronPort-AV: E=Sophos;i="6.12,220,1728918000"; 
   d="scan'208";a="182326966"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 08:57:04 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1ACF1233E8
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:01 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E5929D5060
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6DF89E8DB
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:00 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0A78C1A000B;
	Tue, 10 Dec 2024 07:56:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 02/20] bash-completion: upgrade 2.14.0 -> 2.15.0
Date: Tue, 10 Dec 2024 07:56:34 +0800
Message-Id: <1733788612-20933-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
References: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28848.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28848.003
X-TMASE-Result: 10--3.650000-10.000000
X-TMASE-MatchedRID: Sudfee3ORQqjz0nOeth/yUIIxwDaU5mrTJDl9FKHbrljdFKCcTb+8eqO
	SOOdRR5aQ86elAHF3hY3YWmYqPc7+Jg3EScxi1qSSZJFFtJz2zeUq+GQ/zyJdNo0yL6X0tV/pnL
	ONWaMsuyvwKjYfQnJombvZ2nobp94uzjwFBVWwlg5ZRbFNAl0j0Ee5VjFzwNb9JS8E9+ux32/L7
	aAmwqFB+LBL42MffXo6q73Zcfo6Jocw9PDuZt00T9B1SHosSXQN5dqZcIK7Vgg9R3V8qg5xL8FH
	rw7frlupJ0OYMrT0ynns06CttoOpbNdVHptfHl6nVTWWiNp+v8CgPWSZHDoZpsoi2XrUn/JmTDw
	p0zM3zoqtq5d3cxkNZLja8gsEi300ypcNcIeRZEvMPmyNUnq0QM0Wu+GSin12HaPFVbu2ubt70C
	knn/yzUl8MPOcTeEtprrJqOeCzN8KUt5ytvIm17+PpLSxIpmIU/JCITmuhS7oZbNFHtbIdPl43i
	PWIJMPxwTT797Vag8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 23:57:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208498

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* _comp_abspath:** handle ".."
* _comp_compgen_filedir,_comp_compgen_filedir_xspec:** don’t suggest . nor .. nor */. nor */.. unless the user input is .. or */..
* associate unzip and friends with *.vsix
* curl:** Complete "%", "-" for --trace[-ascii]
* curl:** Complete files for --json, --write-out
* curl:** Complete stdin "-" in file locations
* fprintd-*:** new completions
* iftop:** -G, -s, -L, and -o arg (non-)completions
* ip:** complete ip ntable show
* java:** enable .java filename completion for java command
* kata-runtime:** add 3rd party fallback completion loader
* nerdctl:** add 3rd party fallback completion loader
* ngrok:** add 3rd party fallback completion loader
* openssl:** Stop having subcommands hardcoded
* python,pyvenv:** versioned 3.13 executable support
* set:** more featureful completion
* slabtop:** new completion
* sops:** add 3rd party fallback completion loader
* tar:** use long option compression options
* todoist:** add 3rd party fallback completion loader
* uv:** add 3rd party fallback completion loader
* uvx:** add 3rd party fallback completion loader
* wine:** complete with '*.bat' and '*.cmd'
* xv:** associate with *.webp and *.pnm
* xxd:** add -n, -o, and -R arg (non-)completions
* _comp_compgen:** use 'compgen -V array_name' in 'bash &gt;= 5.3'
* _comp_expand_glob:** set LC_COLLATE for the sorting order
* _comp_expand_glob:** work around GLOBSORT in Bash 5.3
* compatdir:** use _comp_expand_glob for the correct order
* curl:** Complete all and category for --help
* dpkg:** Add missing short option -R
* rsync,ssh:** do not overescape spaces in remote filenames
* source files using absolute paths for absolute BASH_SOURCE
* tar:** Complete added files with long opts
* update-alternatives:** fix the "--help" parsing

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{bash-completion_2.14.0.bb => bash-completion_2.15.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/bash-completion/{bash-completion_2.14.0.bb => bash-completion_2.15.0.bb} (92%)

diff --git a/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb b/meta/recipes-support/bash-completion/bash-completion_2.15.0.bb
similarity index 92%
rename from meta/recipes-support/bash-completion/bash-completion_2.14.0.bb
rename to meta/recipes-support/bash-completion/bash-completion_2.15.0.bb
index 06c81beaa0..709443c067 100644
--- a/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb
+++ b/meta/recipes-support/bash-completion/bash-completion_2.15.0.bb
@@ -14,7 +14,7 @@ SECTION = "console/utils"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "5c7494f968280832d6adb5aa19f745a56f1a79df311e59338c5efa6f7285e168"
+SRC_URI[sha256sum] = "976a62ee6226970283cda85ecb9c7a4a88f62574c0a6f9e856126976decf1a06"
 GITHUB_BASE_URI = "https://github.com/scop/bash-completion/releases"
 
 PARALLEL_MAKE = ""
-- 
2.34.1


