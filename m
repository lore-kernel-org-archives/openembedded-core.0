Received: from mail-gh0-f172.google.com ([209.85.160.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tyrzw-00087E-5n
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 23:43:49 +0100
Received: by mail-gh0-f172.google.com with SMTP id z22so149209ghb.31
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 14:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=4AthRLiv6h5l5pvXxnoWhRQxXmwnaRga8KywoM5MGE8=;
	b=IbOcPg0WQd292CDzsM8ePxi9Yu9Fcy1RsMnIHALSMyT4LeR950SjGpBPtR3lxDh/fr
	qvYv2TDbJ6b4RtS0ZmU/bUcbyBHlPhW2rV4SudN+ksz4veYKVVc6X3mXSh6jDs7Du/SJ
	wkVc9LH7ieytp6vz1MyO8MMW+vZv2Bv4oxzAPBzZoQxP6Xzx6ApeBDLH+aYcoLxhdPCn
	8c5MJ5tfhKpli5hYKNWjLHaN5upwjzbRuET63vhvQ76BpCPqdcCXf33kTcDYx/kV0R0a
	DSEa5U0ORIW27AkaO+1KqDfSyWsljsAVas2PnV+WZZg62aMnzr5tYgdKy+z/AUeJr7RJ
	Ap+g==
X-Received: by 10.236.103.70 with SMTP id e46mr8160728yhg.12.1359152893017;
	Fri, 25 Jan 2013 14:28:13 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.35.66.48])
	by mx.google.com with ESMTPS id h4sm2336383yhi.18.2013.01.25.14.28.11
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 14:28:12 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Jan 2013 20:32:21 -0200
Message-Id: <1359153142-13425-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1359153142-13425-1-git-send-email-otavio@ossystems.com.br>
References: <1359153142-13425-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/2] mesa: Add virtual/dri provides
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Jan 2013 22:43:49 -0000

This allow for use DRI alternative implementations as done in some ARM
SoCs.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-graphics/mesa/mesa-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index 1ff08fb..d93835c 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -11,12 +11,12 @@ BUGTRACKER = "https://bugs.freedesktop.org"
 SECTION = "x11"
 LICENSE = "MIT"
 
-INC_PR = "r9"
+INC_PR = "r10"
 PE = "2"
 
 DEPENDS = "expat makedepend-native flex-native bison-native"
 
-PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl"
+PROVIDES = "virtual/dri virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl"
 
 # for mesa-dri and mesa-xlib
 FILESEXTRAPATHS_append := "${THISDIR}/mesa:"
-- 
1.8.1



