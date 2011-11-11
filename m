Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ROu7O-0005YU-MQ
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2011 17:38:18 +0100
Received: by mail-bw0-f47.google.com with SMTP id zs2so3543817bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2011 08:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=NbRu76ctS44B35qm+dDnpOa8vWOu0Nm6OvhhhsS9xQo=;
	b=EDaN52zal5FbwcbMdqpixQxWbkDnIXhbaUXn0qM3/0Q4ktUlEUTYBkWq49B2oRbtDc
	a07EwwouZP2Y5+EtKswg5aVgIeDHHDILoizxH3s7izn/eYntRaT3mUFktB30XV5Zc3AC
	O5N3mEUpFQsL8do6u7z5UBlmARHfGEboXd1c4=
Received: by 10.204.9.216 with SMTP id m24mr8883891bkm.98.1321029123038;
	Fri, 11 Nov 2011 08:32:03 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id dq2sm11127842bkb.11.2011.11.11.08.32.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Nov 2011 08:32:02 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Nov 2011 17:28:57 +0100
Message-Id: <04522634aafbc6858f11d35e7ca28f88a9f4a838.1321028799.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc1
In-Reply-To: <d99edd412e58edeb79c64112f7eb6ba522342bf9.1321028799.git.Martin.Jansa@gmail.com>
References: <d99edd412e58edeb79c64112f7eb6ba522342bf9.1321028799.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1321028799.git.Martin.Jansa@gmail.com>
References: <cover.1321028799.git.Martin.Jansa@gmail.com>
Subject: [PATCH][oe-core 21/22] util-linux: bump PR after u-a changes
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
X-List-Received-Date: Fri, 11 Nov 2011 16:42:04 -0000

* it's in separate commit because original PR change was eaten by later commit
  util-linux: split mcookie into a package

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/util-linux/util-linux_2.19.1.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.19.1.bb b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
index e2fb727..b65e761 100644
--- a/meta/recipes-core/util-linux/util-linux_2.19.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.19"
-PR = "r10"
+PR = "r11"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
-- 
1.7.8.rc1



