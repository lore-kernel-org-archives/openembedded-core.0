Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2873D75FB5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 23:40:44 +0000 (UTC)
Received: by widjy10 with SMTP id jy10so28291158wid.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 16:40:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=MiMCScHbbU32RuMyQwaUaFBA75LB2FB7GOy64NvskpQ=;
	b=P9QbYLZ4Jdqtz9CShywYSL7LwbErKEiiBMi9lflOk0R7T1cbCrFCeuiol6xK95hS9w
	NPxn2JiK49mk0Ib+Miu8wKs+OT58o929HDG4rcaQafvRiPn/AuS42ZfFLZLNU1FqJZ2l
	yMBmZpOP3G9PkJzPbpI7O96Au7/eooD3/iSX4RFGePfErS3wXLZZEsqQapomqg17Cbih
	dlD9X6buByPa9WPTo5t9N+0Q0bRFxGMmY28ILMpgjo4dWhH8upRRIFdq1ye1bbxU7bc0
	JNT6h2ONJXK31FY6aar8YEo6TOB+aXMv0j8VqINYSO0ucAfi5L2nbR3h2I9LiiJ8TvuV
	ksMw==
X-Gm-Message-State: ALoCoQkDrEdKVVkUvLvM4YoL22yw+7kspK3QE2V84thqULRMV17D5k31GmNxnwMGlM2roCEkp+Rb
X-Received: by 10.194.78.14 with SMTP id x14mr24536235wjw.48.1437090044094;
	Thu, 16 Jul 2015 16:40:44 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	lu5sm15494930wjb.9.2015.07.16.16.40.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Jul 2015 16:40:43 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jul 2015 00:35:01 +0100
Message-Id: <1437089702-23970-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/2] neard: remove overridden do_install
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
X-List-Received-Date: Thu, 16 Jul 2015 23:40:47 -0000

Overriding libexecdir was required when neard did funky things in the Makefile,
but it doesn't anymore.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/neard/neard.inc | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-connectivity/neard/neard.inc b/meta/recipes-connectivity/neard/neard.inc
index 4042a69..6ab185c 100644
--- a/meta/recipes-connectivity/neard/neard.inc
+++ b/meta/recipes-connectivity/neard/neard.inc
@@ -17,10 +17,6 @@ PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd
 
 EXTRA_OECONF += "--enable-tools"
 
-do_install() {
-	oe_runmake DESTDIR=${D} libexecdir=${libexecdir} install
-}
-
 # This would copy neard start-stop shell and test scripts
 do_install_append() {
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
-- 
2.1.4


