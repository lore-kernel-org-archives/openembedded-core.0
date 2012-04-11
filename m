Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SHoFE-0004pi-SE
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 05:29:21 +0200
Received: by mail-yx0-f175.google.com with SMTP id m3so291427yen.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 20:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=JQv/MHcVtrTXZXpMibWf/TE22irJTH8hIx3G9Uc1i4o=;
	b=ki0ojQKDtTe4003bNtwFVN3rUD5AgN2ps4TmJnHV3q7cWBZ3nwry23tFO5aUDHtZIZ
	Y6tx8s9PFG3dxh9M9ZtRFXk4WySDEz2tWG4+7/6qpL8GZ8EvgmcEBFaSnJs0u9bZMH8B
	qaDY4LSEOS2iB6IOsE7dmjYNqHDmF7rYqi/HSNa6qBZ0wOZOteUBn0jyLKJxQScz9fGF
	QbEz93OscfOHUcNy06iFkSZ0NycwouDBZ6xwvyh0b2hyEdr5L/QDhcNS8UYNV9oSX+FG
	G+RukXSGLFzEv41Dbhd0NvrvQalwvih2G0mEi+Sr+kPTLAu3bDw5DNZElyxVm/oHsWnG
	YfTw==
Received: by 10.236.136.33 with SMTP id v21mr11900273yhi.17.1334114404524;
	Tue, 10 Apr 2012 20:20:04 -0700 (PDT)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id r62sm5091146yhb.14.2012.04.10.20.20.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Apr 2012 20:20:03 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Apr 2012 03:19:51 +0000
Message-Id: <8268f5fbc018200d52efc4e84e29c3f5757694c9.1334114318.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1334114318.git.otavio@ossystems.com.br>
References: <cover.1334114318.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1334114318.git.otavio@ossystems.com.br>
References: <cover.1334114318.git.otavio@ossystems.com.br>
Subject: [PATCH 2/3] distrodata.bbclass: fix comment typo
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
X-List-Received-Date: Wed, 11 Apr 2012 03:29:21 -0000

Fixes:

  - xf86-intput-synaptics-12.6.9.tar.gz
  + xf86-input-synaptics-12.6.9.tar.gz

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/distrodata.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index aba4bd7..4b2dee5 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -237,7 +237,7 @@ python do_checkpkg() {
 	such as:
 		gnome-common-2.20.0.tar.gz (most common format)
 		gtk+-2.90.1.tar.gz
-		xf86-intput-synaptics-12.6.9.tar.gz
+		xf86-input-synaptics-12.6.9.tar.gz
 		dri2proto-2.3.tar.gz
 		blktool_4.orig.tar.gz
 		libid3tag-0.15.1b.tar.gz
-- 
1.7.2.5



