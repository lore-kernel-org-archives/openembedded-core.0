Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94090C54756
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 06:30:37 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.17465.1747895436855121886
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 23:30:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout10.t-online.de (Postfix) with SMTP id 9EE0BF91
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 08:30:34 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.171.126]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uHzRo-1AxjZh0; Thu, 22 May 2025 08:30:32 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] boost: add process library
Date: Thu, 22 May 2025 08:30:21 +0200
Message-ID: <20250522063021.261537-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1747895432-03FFD5E8-0D304A6F/0/0 CLEAN NORMAL
X-TOI-MSGID: 23c6af63-142b-455c-ad7d-5690dd8efa0b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 06:30:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217062

This fixes an error seen with current wesnoth:
| ../build/tmp/work/corei7-64-poky-linux/wesnoth/1.19.12/recipe-sysroot-n=
ative/usr/bin/x86_64-poky-linux/../../libexec/x86_64-poky-linux/gcc/x86_6=
4-poky-linux/15.1.0/ld: src/libwesnoth-common.a(filesystem.cpp.o): in fun=
ction `boost::process::v2::environment::detail::is_executable(boost::file=
system::path const&, boost::system::error_code&)':
| /usr/include/boost/process/v2/detail/environment_posix.hpp:81:(.text._Z=
N5boost7process2v211environment15find_executableINS2_12current_viewEEENS_=
10filesystem4pathES6_OT_[_ZN5boost7process2v211environment15find_executab=
leINS2_12current_viewEEENS_10filesystem4pathES6_OT_]+0x24c): undefined re=
ference to `boost::process::v2::environment::detail::has_x_access(char co=
nst*)'
| collect2: error: ld returned 1 exit status
| ninja: build stopped: subcommand failed.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-support/boost/boost.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/=
boost/boost.inc
index ee490cee0a..64a57ddfb2 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -32,6 +32,7 @@ BOOST_LIBS =3D "\
 	json \
 	log \
 	math \
+	process \
 	program_options \
 	random \
 	regex \
--=20
2.49.0


