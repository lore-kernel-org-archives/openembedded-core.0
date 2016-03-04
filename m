Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id 83DE06FFFE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 04:18:27 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id r187so30319585oih.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2016 20:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ig6e8Zu2OOMqbLAw4OAjp5r3yVqg5aPkmcVZWAtktHQ=;
	b=q4npOyJJ4QdX/LvYyNiHcVCsFmraX+LS1olj87jZXsW2MZ1nhBtgpPfNGUuf9Erxn0
	uRtBo+++CI8QB9DYSNFZ7cod0DE4JmTaqA9s4wkDOsCYcq8NdWBjLJkx/yTJYFvVlob6
	2pYt9YLDoc77uoD0GLMFkAjh1z/ap4fmP0lJs9u900GyfG6ivYyTG0o1nEKU8Z4V5cg1
	mJpNzZnzMhMZaBaLh24PXqDVE6nhFwR0FGJK1LZsoPihVQRTTx5KJ3BeTnTXJMvpZaka
	slV90P2Xmv3kwMIASyAEk/ieua3VUv0l7lZpxuSfw+1j2r1Yyxq0RGqia4NX3qVMWXyM
	kYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ig6e8Zu2OOMqbLAw4OAjp5r3yVqg5aPkmcVZWAtktHQ=;
	b=Dfxx/2n9KUgn3PzElUMS4JcewLFbS3uSr+NasGaJe5K81QyM7oWGFRjVtIRTj4c1jM
	TibBZ4KsyxKD19TA5BotVI7z2r+4TC4dc9s/qgvvDcdlufQsgPIZ1raqCZakVP3jqtvU
	UXQf+oss8HJtiRmflMKdgTtct+VBkdHy6qiW6jJQYAhi1He+N0luT3hsK3knDI8Hl7VJ
	Fx/eljuOUz+52Kq/PE1B/u3m8XUc/mt4DRPJVYYnQ3zfyP2Vy3BfWKibA5Ar5N1DBWF3
	v1Oe+BfuKLcRYAqHEKPtMInB0QVpz0vFJkjXH2xHQd/h4yxKVxf6ri0kZqCE7gLgRuBK
	uKGw==
X-Gm-Message-State: AD7BkJK/imDNXteuJPcOb39LJR7wmgUH8dJTxcR6xli0f5CNL9E3a+fWmCUOnDylhFuY8A==
X-Received: by 10.202.75.140 with SMTP id y134mr4317935oia.116.1457065107876; 
	Thu, 03 Mar 2016 20:18:27 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	s65sm1288530oia.22.2016.03.03.20.18.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Mar 2016 20:18:26 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Mar 2016 20:18:21 -0800
Message-Id: <1457065101-1791-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] oe-setup-builddir: tidy up local.conf and bblayers.conf commentary
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
X-List-Received-Date: Fri, 04 Mar 2016 04:18:29 -0000

Remove obsolete reference to enabling parallel build via local.conf.

Unify wording used to explain that local.conf and bblayers.conf have
been created based on defaults.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 scripts/oe-setup-builddir | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index 2598ba8..93722e0 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -75,12 +75,11 @@ if [ -z "$OECORELOCALCONF" ]; then
     OECORELOCALCONF="$OEROOT/meta/conf/local.conf.sample"
 fi
 if [ ! -r "$BUILDDIR/conf/local.conf" ]; then
-cat <<EOM
+    cat <<EOM
 You had no conf/local.conf file. This configuration file has therefore been
-created for you with some default values. You may wish to edit it to use a 
-different MACHINE (target hardware) or enable parallel build options to take 
-advantage of multiple cores for example. See the file for more information as 
-common configuration options are commented.
+created for you with some default values. You may wish to edit it to, for
+example, select a different MACHINE (target hardware). See conf/local.conf
+for more information as common configuration options are commented.
 
 EOM
     cp -f $OECORELOCALCONF "$BUILDDIR/conf/local.conf"
@@ -92,9 +91,9 @@ if [ -z "$OECORELAYERCONF" ]; then
 fi
 if [ ! -r "$BUILDDIR/conf/bblayers.conf" ]; then
     cat <<EOM
-You had no conf/bblayers.conf file. The configuration file has been created for
-you with some default values. To add additional metadata layers into your
-configuration please add entries to this file.
+You had no conf/bblayers.conf file. This configuration file has therefore been
+created for you with some default values. To add additional metadata layers
+into your configuration please add entries to conf/bblayers.conf.
 
 EOM
 
-- 
1.9.1


