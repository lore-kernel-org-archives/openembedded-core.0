Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9740FC43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 16:37:07 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49516.1782923821481009939
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 09:37:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=FFYHrbEC;
 spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout05.t-online.de (Postfix) with SMTP id 71D63AAE
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Jul 2026 18:36:59 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.163.76]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wexvj-0fCJIh0; Wed, 1 Jul 2026 18:36:55 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][Patch 3/3] systemd-systemctl-native: dont install systemd-sysv-install.SKELETON
Date: Wed,  1 Jul 2026 18:36:40 +0200
Message-ID: <20260701163640.1285581-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701163640.1285581-1-f_l_k@t-online.de>
References: <20260701163640.1285581-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1782923815-3D7F9B74-6CE375E9/0/0 CLEAN NORMAL
X-TOI-MSGID: 10600802-3830-4f28-b38e-a15cecf8ccde
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1782923819; i=f_l_k@t-online.de;
	bh=EbPNVnUrpp7NiFrthcC+u/YDYqkUGPWSHMFPQhnsTgU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=FFYHrbECWLiNSxjmFiOlTjdFzEFqakWhINaGg6A9bPCHvPQ5CUZYs6Yt2HkHNbkyD
	 cF9lVxhr/93Pv4l0yNuUNjuDDYrjFSy0tGInuurOeUM/LVg/kcONoR4q3mlVwzQ56v
	 vQ1LMdkvYc7Z80PCgUmPgZVfIIp6cSvKePuGrBNIZIgKB+MtrLMoCyok/dDUMe8gnO
	 KG5Hs/6IGSardnTaA74Rrzxfw7EMMbzMACEk5vYbv4n21EDjFDNPZsEVIuM9BOrO8r
	 jLEIf74Fib2Q7nAeFJKIMDhVr7Tdb4iuaLBQqXeZDoToqfqpBPh8GwD8r23bOKIXdb
	 ypemKFM1QynqQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 16:37:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239997

systemd-sysv-install.SKELETON is not available in the systemd source anym=
ore, thus build fails:
ERROR: systemd-systemctl-native-261-r0 do_install: Execution of '/home/fl=
k/bitbake/bitbake-builds/oe/build/tmp/work/x86_64-linux/systemd-systemctl=
-native/261/temp/run.do_install.1285221' failed with exit code 1
ERROR: Logfile of failure stored in: /home/flk/bitbake/bitbake-builds/oe/=
build/tmp/work/x86_64-linux/systemd-systemctl-native/261/temp/log.do_inst=
all.1285221
Log data follows:
| DEBUG: Executing shell function do_install
| Installing systemctl to /home/flk/bitbake/bitbake-builds/oe/build/tmp/w=
ork/x86_64-linux/systemd-systemctl-native/261/image/home/flk/bitbake/bitb=
ake-builds/oe/build/tmp/work/x86_64-linux/systemd-systemctl-native/261/re=
cipe-sysroot-native/usr/bin
| install: cannot stat '/home/flk/bitbake/bitbake-builds/oe/build/tmp/wor=
k/x86_64-linux/systemd-systemctl-native/261/sources/systemd-systemctl-261=
/src/systemctl/systemd-sysv-install.SKELETON': No such file or directory

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-core/systemd/systemd-systemctl-native_261.bb | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl-native_261.bb b/=
meta/recipes-core/systemd/systemd-systemctl-native_261.bb
index 2d1ecee49a..a37b5c6aad 100644
--- a/meta/recipes-core/systemd/systemd-systemctl-native_261.bb
+++ b/meta/recipes-core/systemd/systemd-systemctl-native_261.bb
@@ -27,11 +27,3 @@ EXTRA_OEMESON +=3D "-Dpcre2=3Ddisabled -Dp11kit=3Ddisa=
bled -Dopenssl=3Ddisabled"
 # More details are here https://github.com/systemd/systemd/issues/35897#=
issuecomment-2665405887
 EXTRA_OEMESON +=3D "--sysconfdir ${sysconfdir_native}"
=20
-do_install:append() {
-	# Install systemd-sysv-install in /usr/bin rather than /usr/lib/systemd
-	# (where it is normally installed) so systemctl can find it in $PATH.
-	# It is expected that the use of systemd-sysv-install will be removed
-	# with version 259 of systemd and then this, and everything that was
-	# added along with it, should be reverted.
-	install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}$=
{bindir}/systemd-sysv-install
-}
--=20
2.54.0


