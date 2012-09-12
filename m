Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TBn47-0004bp-4i
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 15:33:15 +0200
Received: by eaad12 with SMTP id d12so748969eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2012 06:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=4IAOSjyOU/l7Zzn5oAfF3vyjjXGtLn3hj8+2r6ZCyNI=;
	b=yOKvSuyZsQY0+y0xH8oQ4qStAtihdVQpRb27pECvRXKfzJ/Xg8oTW93lYNMC3n90Ky
	U/AJYGZBNh+vEDL7k4IvaFlu5uIAJkux8qu+TjhBNWE1nnQijfmslguTY+xUaOgnSP/8
	Q7W4NqgxfBXRvDTFafKUrhXQn7JJRcpz/mPp59r3/2Y3onIyOjWGqZqJb886hsfmhEkh
	lK7xbVlvt9uhg/a2R4Lk5/RCOdV88+FY+fI3FRKdi5vNuMqNqnWaP7RehfhmcWAMoFlD
	aaXqsrAzxtLz5rFPdZZlDGRlzyRUpADluwiNV3eJZp0T1K1VF/5AkFDrhL+t6lzp5OmC
	jiYQ==
Received: by 10.204.155.69 with SMTP id r5mr5837621bkw.49.1347456042842;
	Wed, 12 Sep 2012 06:20:42 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id he8sm11932195bkc.3.2012.09.12.06.20.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Sep 2012 06:20:41 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Sep 2012 15:19:55 +0200
Message-Id: <1347455995-24565-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH] cml1.bbclass: fix kernel menuconfig
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
X-List-Received-Date: Wed, 12 Sep 2012 13:33:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

At some host environments the menuconfig displayed wrong characters ang turned
unusable.

Similar suggested in [1]

[1] http://lists.linuxtogo.org/pipermail/openembedded-core/2012-August/027130.html

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/classes/cml1.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index 67f17ad..c773684 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -9,7 +9,7 @@ addtask configure after do_unpack do_patch before do_compile
 
 inherit terminal
 
-OE_TERMINAL_EXPORTS += "HOST_EXTRACFLAGS HOSTLDFLAGS HOST_LOADLIBES"
+OE_TERMINAL_EXPORTS += "HOST_EXTRACFLAGS HOST_LOADLIBES"
 HOST_EXTRACFLAGS = "${BUILD_CFLAGS} ${BUILD_LDFLAGS}"
 HOSTLDFLAGS = "${BUILD_LDFLAGS}"
 HOST_LOADLIBES = "-lncurses"
-- 
1.7.6.5



