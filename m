Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RCDzb-00062B-9g
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 19:13:51 +0200
Received: by mail-yx0-f175.google.com with SMTP id 17so3905500yxj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2011 10:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=rgoj/1eZQZYwHGKhyAHKdjd0dG8R838qtI4kcAglfUs=;
	b=rs1GayyqhpaXW0OALo72uk4A26sitqK9tWMk0N/BLETc8yVOfFbCXwPr0KpjlF6Txj
	ECaSTHrQa+RP64TEqPspiZNAVY3sUoznq9pDgg1gFd2+0p7aq1Igb88+pQCFPhMhgmhI
	+6tqHT+9KWMeyaDbPxRs9OzTpkaSyoIknrLiw=
Received: by 10.223.88.71 with SMTP id z7mr11933358fal.26.1318007293743;
	Fri, 07 Oct 2011 10:08:13 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x22sm13632548faa.5.2011.10.07.10.08.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Oct 2011 10:08:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2011 19:05:15 +0200
Message-Id: <5dc2d5832fa0d2fe0d675183e409413e41576365.1318007055.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
References: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318007055.git.Martin.Jansa@gmail.com>
References: <cover.1318007055.git.Martin.Jansa@gmail.com>
Subject: [PATCHv3 20/31] xorg-driver-common.inc: use virtual/xserver instead of older virtual/xserver-xf86
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
X-List-Received-Date: Fri, 07 Oct 2011 17:13:51 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-driver/xorg-driver-common.inc             |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
index 801d8d3..da3a90b 100644
--- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
@@ -7,7 +7,7 @@ LICENSE = "MIT-X"
 PE = "1"
 INC_PR = "r15"
 
-DEPENDS = "virtual/xserver-xf86 xproto randrproto util-macros"
+DEPENDS = "virtual/xserver xproto randrproto util-macros"
 
 SRC_URI = "${XORG_MIRROR}/individual/driver/${BPN}-${PV}.tar.bz2"
 
-- 
1.7.7



