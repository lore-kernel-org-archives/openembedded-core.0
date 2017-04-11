Return-Path: <ian.arkver.dev@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id B1A8177BE9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 13:25:50 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id o81so219663wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 06:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=wfDcE696ptwI8DWBdJd3Phy7vPgF+lEmZnAU7dfE4cw=;
	b=VLfHpMcQZN5N2HVlUpwzRmcllW31hwojg4sLqjjZI5gIxGsPM2znE+3Ie62d5u09zR
	/+aqjIGg0lLRej+DDzXYVn3B9mY9giSCsLdyrk08/ABjHYxfnZRLI0gogj85VCBDEC1y
	qBGp3790PLRprEwHpfwKG/iL6ShDcDkwGvE1pOrKiUNAEboKwp8Xv335WYjX2PdIP24q
	1unbroobV+uNN/IYkyolWDwmn6SCYWb8pa8tTWsaIxoYa70NoNW83gZoMyXVSqNI+kAr
	QeT1LD9gCmX7+e99OHwmpHqV2aDixki9VmrHuo+zu7fQ6u2SIzZG9bteIB6H/JGBqf+G
	w6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=wfDcE696ptwI8DWBdJd3Phy7vPgF+lEmZnAU7dfE4cw=;
	b=dPs/jj2Pe07v8aYaZsUGQZ/iBXqeHulz6+qvEyq818Y3Va4E/LNpqU+WWXpRiQDfgx
	nJWEBC3l2l17XP/DN/O16TXcm+SVHtiwP13BdZRDc3ZdpdaPJebbthOjBdNsQW6L46KB
	xnegHtodFHTjxoyhDkZbzNx5Xy8ZXTgxrcuERgqLqL9WjgY9vs8bipMXeWqzMYryYpRf
	VQe5wEAQ7NHfNQJ9LRv4QgxAEpV1CmCvjgwuo5iBL9hpRmAjRPC+mAU1RFfHmb+Df0dO
	SqYqIuk0w/w3NIgoAdeJzpLulR4KZwG6v7DQO0Wh5RnJiZtJS1m5YyQDZpswA35Lg4yf
	TshQ==
X-Gm-Message-State: AN3rC/5vsw+ZrAdL7JmHXOTmDv20/cHINJCstr+I2bJPvS1HAZDSzSFo
	Xb+YYe3sQB4GNbB+
X-Received: by 10.28.57.138 with SMTP id g132mr5128008wma.92.1491917151093;
	Tue, 11 Apr 2017 06:25:51 -0700 (PDT)
Received: from devmjo0.home (host86-154-139-143.range86-154.btcentralplus.com.
	[86.154.139.143]) by smtp.gmail.com with ESMTPSA id
	y190sm2490494wmy.15.2017.04.11.06.25.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Apr 2017 06:25:50 -0700 (PDT)
From: "Ian.Arkver" <ian.arkver.dev@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Apr 2017 14:25:39 +0100
Message-Id: <92a9dfaf31a7cda2e31d6ad659c24dfbced3bd6f.1491842639.git.ian.arkver.dev@gmail.com>
X-Mailer: git-send-email 2.12.1
Subject: [PATCH] package_manager.py: Add a name for the generated dnf repo.
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
X-List-Received-Date: Tue, 11 Apr 2017 13:25:55 -0000

This adds repo_name as the name, which is the same as the
repo ID and hence a bit pointless, but it stops dnf from
complaining that the repo doesn't have a configured name.

Signed-off-by: Ian.Arkver <ian.arkver.dev@gmail.com>
---
 meta/lib/oe/package_manager.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 23bf51f168..5a189cff97 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -555,7 +555,7 @@ class RpmPM(PackageManager):
                 repo_uris = [uri + "/" + arch for arch in feed_archs.split()]
             else:
                 repo_uris = [uri]
-            open(oe.path.join(self.target_rootfs, "etc", "yum.repos.d", repo_name + ".repo"), 'w').write("[%s]\nbaseurl=%s\n" % (repo_name, " ".join(repo_uris)))
+            open(oe.path.join(self.target_rootfs, "etc", "yum.repos.d", repo_name + ".repo"), 'w').write("[%s]\nname=%s\nbaseurl=%s\n" % (repo_name, repo_name, " ".join(repo_uris)))
 
     def _prepare_pkg_transaction(self):
         os.environ['D'] = self.target_rootfs
-- 
2.12.1


