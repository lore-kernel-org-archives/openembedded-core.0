Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Qudiv-0004G0-UQ
	for openembedded-core@lists.openembedded.org;
	Sat, 20 Aug 2011 07:03:58 +0200
Received: by yxl11 with SMTP id 11so528966yxl.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 21:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=SVcu6dtk0N9dq+bwuj/e3kCuZhfql6aWiZUx5EdopC4=;
	b=AMPJVu7L4ltRWFEoEE45HLY1l6lC0aPckujcIeENQpBcuKQmV681Fg3AurMwKsKF2t
	9MO45kmiJt+Jpdq0YymHqdmVzfgvTyg8jHQKG6pboqDLuEWnd1mP91fQjRd7bgH+Lxbb
	M9mwylwbvSy/ktX9F1qbemBNLmQ6+2EOGP10w=
Received: by 10.236.77.131 with SMTP id d3mr743907yhe.63.1313816356330;
	Fri, 19 Aug 2011 21:59:16 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id f48sm4668774yhh.56.2011.08.19.21.59.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Aug 2011 21:59:15 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Sat, 20 Aug 2011 04:58:46 +0000
Message-Id: <8f97b70fe5c9cd105970130f1f0976bdb126851b.1313816148.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1313816148.git.otavio@ossystems.com.br>
References: <cover.1313816148.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1313816148.git.otavio@ossystems.com.br>
References: <cover.1313816148.git.otavio@ossystems.com.br>
Subject: [PATCH 8/8] scripts/combo-layer: fix configuration file handling
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 20 Aug 2011 05:03:58 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 scripts/combo-layer |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 07b3382..f8763ee 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -339,8 +339,8 @@ Action:
   update            get patches from component repos and apply them to the combo repo
   splitpatch [commit] generate commit patch and split per component, default commit is HEAD""")
 
-    parser.add_option("-c", "--conf", help = "specify the config file. default is conf/combolayer.conf",
-               action = "store", dest = "conffile", default = "combo-layer.conf")
+    parser.add_option("-c", "--conf", help = "specify the config file (conf/combo-layer.conf is the default).",
+               action = "store", dest = "conffile", default = "conf/combo-layer.conf")
 
     parser.add_option("-i", "--interactive", help = "interactive mode, user can edit the patch list and patches",
                action = "store_true", dest = "interactive", default = False)
-- 
1.7.2.5



