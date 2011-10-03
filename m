Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAiiX-0005Ww-MD
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 15:38:01 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so5356887bke.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=5RPRDh7i3CNsTOZQ92hmewZsX5VH8S/+I9HBgum4AEw=;
	b=uk5pcjnpe5JUYkC7hXOzuU1tyR5GQ6uW9Ie5D2r+zEtFeG/zjYKMYaufYofjk9H4Q3
	HXJ5n4nStjAhTqojnVcHdTuWrhPlm6U8omTIB4fNTpnSTxKIHlIDQGCJf3vo5QBZEja+
	1f8PvtbFMQ13sZwR/nidTqcOgBIxxPacvBym0=
Received: by 10.204.144.207 with SMTP id a15mr9966857bkv.178.1317648751650;
	Mon, 03 Oct 2011 06:32:31 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z9sm13233350bkn.7.2011.10.03.06.32.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:32:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:28:57 +0200
Message-Id: <3ffacbd5138165278774387c51b4bd3bb625eaff.1317648041.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
References: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317648040.git.Martin.Jansa@gmail.com>
References: <cover.1317648040.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 26/30] glx-use-tls: add from meta-oe layer
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
X-List-Received-Date: Mon, 03 Oct 2011 13:44:15 -0000

* it's in .bbclass instead of .inc because it's used by mesa and
  xserver-xf86 recipes

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/glx-use-tls.bbclass |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)
 create mode 100644 meta/classes/glx-use-tls.bbclass

diff --git a/meta/classes/glx-use-tls.bbclass b/meta/classes/glx-use-tls.bbclass
new file mode 100644
index 0000000..7530872
--- /dev/null
+++ b/meta/classes/glx-use-tls.bbclass
@@ -0,0 +1,7 @@
+def get_tls_setting(bb, d):
+    # until we have no prober TLS support in uclibc disable it
+    if bb.data.getVar('TARGET_OS', d, 1).find('uclibc') >= 0 :
+        return ""
+    return "--enable-glx-tls"
+
+EXTRA_OECONF += "${@get_tls_setting(bb, d)}"
-- 
1.7.7



