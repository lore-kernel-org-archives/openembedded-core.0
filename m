Return-Path: <joaohf@gmail.com>
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4C3DC6FAC7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jun 2014 01:28:11 +0000 (UTC)
Received: by mail-yk0-f173.google.com with SMTP id 142so5577027ykq.32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jun 2014 18:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=9zJi9Kv12TqUVZozuoTyoL9nUqzlMd7tSUMVUpchKWY=;
	b=iLcfRZIpfbA79RYZUU0STdDl+kgnZhHlJWBcDiEUv7untcZFwTcex1GpHAInmjuxuI
	kAelzihqEHW9YkyEpGP5Gd5obmYh8ZJq+lFI8nKCUT5ESXV50ranmUYXvsenlGqt7zxk
	WC4N7qMkp4hoOdeXXKwULEPtULGHjwtY3Hqi9WfXDVPjQWwFUPx+R4RFED8bPMsUMIQU
	8g+zz+8BH8C1ihQ9n8DNk42V+q4MH7vBnLDSARWx7H2XGP14H3SobRpwnzxbcGTjOHIv
	MaB3/6jwqjcvR16wffmdpwlCRJsYfFmPVKWjPfiIdqonI8eqW68k4cbgz4q/lUS2ciwt
	fCYA==
X-Received: by 10.236.165.199 with SMTP id e47mr68946124yhl.12.1401845292879; 
	Tue, 03 Jun 2014 18:28:12 -0700 (PDT)
Received: from localhost.localdomain ([201.53.220.23])
	by mx.google.com with ESMTPSA id u5sm1540089yhg.25.2014.06.03.18.28.11
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Jun 2014 18:28:12 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jun 2014 22:28:02 -0300
Message-Id: <1401845283-7941-2-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1401845283-7941-1-git-send-email-joaohf@gmail.com>
References: <1401845283-7941-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Cc: tom.zanussi@linux.intel.com
Subject: [PATCH 1/2] wic: default plugin type directory should be added only once
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
X-List-Received-Date: Wed, 04 Jun 2014 01:28:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix 'for' statement identention so plugin type directory will be
added only once in layers_dirs list.

No functional changes.

Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
---
 scripts/lib/mic/plugin.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/mic/plugin.py b/scripts/lib/mic/plugin.py
index bec33d6..dec0e5b 100644
--- a/scripts/lib/mic/plugin.py
+++ b/scripts/lib/mic/plugin.py
@@ -57,8 +57,8 @@ class PluginMgr(object):
             path = os.path.join(layer_path, SCRIPTS_PLUGIN_DIR, ptype)
             layer_dirs.append(path)
 
-            path = os.path.join(dl, ptype)
-            layer_dirs.append(path)
+        path = os.path.join(dl, ptype)
+        layer_dirs.append(path)
 
         return layer_dirs
 
-- 
1.9.1


