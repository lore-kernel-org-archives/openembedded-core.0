Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RitGJ-00087E-Ip
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 20:46:08 +0100
Received: by mail-gy0-f175.google.com with SMTP id r17so368633ghr.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2012 11:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=f2uCBGdaxf1C6r3uJYJZ+9RaDJ1XwyfakzTp+LvdEsU=;
	b=SNITGqcQqJW0w9K7H8nx8SCYvoy3uzCzBtTaJYaRXCnUjya0HxdSdwzbT646nksh6A
	rwfp5pRTWnzo+Yj3EVBk32cr8JM2hesdMaxiReLoClT4Lhe9yY/bvdCxuIVkfyYyaiiY
	5ag/cPNHwcZcgZ4HS8/wWrSjJkO3VnHHrm2v4=
Received: by 10.236.116.164 with SMTP id g24mr3675317yhh.48.1325792326631;
	Thu, 05 Jan 2012 11:38:46 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id n5sm83398402yhk.1.2012.01.05.11.38.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jan 2012 11:38:45 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2012 19:38:00 +0000
Message-Id: <6d7ee007b25cc878d07163fcc6be964781f68ca6.1325792209.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1325792209.git.otavio@ossystems.com.br>
References: <cover.1325792209.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1325792209.git.otavio@ossystems.com.br>
References: <cover.1325792209.git.otavio@ossystems.com.br>
Subject: [PATCH 10/10] udev: drop depmod handling code as it ought to be done in kernel postinst
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
X-List-Received-Date: Thu, 05 Jan 2012 19:46:08 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-core/udev/udev_164.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/udev/udev_164.bb b/meta/recipes-core/udev/udev_164.bb
index c89eab4..6d71f4d 100644
--- a/meta/recipes-core/udev/udev_164.bb
+++ b/meta/recipes-core/udev/udev_164.bb
@@ -1,6 +1,6 @@
 include udev.inc
 
-PR = "r9"
+PR = "r10"
 
 SRC_URI += "file://udev-166-v4l1-1.patch"
 
-- 
1.7.2.5



