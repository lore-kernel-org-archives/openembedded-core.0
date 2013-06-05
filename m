Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 00D126065C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 10:02:19 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id m6so4634795wiv.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jun 2013 03:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=dSMur0Anyzr1N0YKOUMHKuGhVoIWjTSWa1P6yeGNgTg=;
	b=eMIHz9V/4oeLTokHorPcoOFz+6yHQgVJfArYeWDvWUvsxDlpGiygoSXdZtxFxpBd0d
	JP3mG7PFb5yjf1Km6rTCxW48dLVfiOTP2P7DmWmtjb3nuBbds87kKc5mi+OhXY/jY9RP
	OL7YnrPjpbskmCLZ4HaKwGdPAnwQobxuHIZY0344+o2A9LZx3hjSgCD2ex2pJWdBe9U2
	KkMQHrcuMebWxTV5Pe5I9YDzI9wfjbWZoeMa7T6NtIyiTQHwvJHRyyy70ER9DNTDbo+a
	bHzEvwEjNdEJbBokio2D97KwYyStpvUb/PG6Wm4r4yhNnjfyCc4rwO0quZeTNsZev+n2
	b15Q==
X-Received: by 10.180.189.136 with SMTP id gi8mr5824340wic.11.1370426539724;
	Wed, 05 Jun 2013 03:02:19 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	ay7sm9188561wib.9.2013.06.05.03.02.18 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 05 Jun 2013 03:02:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Jun 2013 12:02:33 +0200
Message-Id: <1370426553-23428-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [PATCHv2] site: add alignment values for at-spi2-core
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Jun 2013 10:02:20 -0000

* x86 and x86_64 values were added in
  8c46ec2edc0197b32d32e0f27d5b60271338b600

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/site/arm-common   | 10 ++++++++++
 meta/site/x86_64-linux |  3 ++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/site/arm-common b/meta/site/arm-common
index cad8027..b1cf05d 100644
--- a/meta/site/arm-common
+++ b/meta/site/arm-common
@@ -185,3 +185,13 @@ jm_cv_func_working_readdir=yes
 
 # evolution-data-server
 ac_cv_libiconv_utf8=${ac_cv_libiconv_utf8=yes}
+
+# dbind, in at-spi2-core
+ac_cv_alignof_char=1
+ac_cv_alignof_dbind_pointer=4
+ac_cv_alignof_dbind_struct=1
+ac_cv_alignof_dbus_bool_t=4
+ac_cv_alignof_dbus_int16_t=2
+ac_cv_alignof_dbus_int32_t=4
+ac_cv_alignof_dbus_int64_t=8
+ac_cv_alignof_double=8
diff --git a/meta/site/x86_64-linux b/meta/site/x86_64-linux
index 78a3b85..2475d3d 100644
--- a/meta/site/x86_64-linux
+++ b/meta/site/x86_64-linux
@@ -125,7 +125,8 @@ ac_cv_func__restgpr_14_x=no
 # cvs
 cvs_cv_func_printf_ptr=${cvs_cv_func_printf_ptr=yes}
 
-# dbind
+# dbind, in at-spi2-core
+ac_cv_alignof_char=1
 ac_cv_alignof_dbind_pointer=8
 ac_cv_alignof_dbind_struct=1
 ac_cv_alignof_dbus_bool_t=4
-- 
1.8.2.1


