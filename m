Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1R3RHq-0003JG-Cx
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Sep 2011 13:36:22 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so437242fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2011 04:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=J/ewANZBBKr96DYBx9k8HwvS4njYvvBbtxJbQdgsin8=;
	b=Y1Gu7J9cN1KgmQAlVhblvlEy1qUCOTarPS3ze+AF/WCbxPizTR04YCvo40nFwobRy6
	4pZXGTpu8AyGYA8YByVSrMyYVz1vzhSweR684i0SfgR8a25mh5+2oU4NEwI8b+ZcS1Vx
	W4ajHXj7r6c60UPaeBz/1UOBXLlNX1h4fHjcU=
Received: by 10.223.56.216 with SMTP id z24mr3999980fag.4.1315913475496;
	Tue, 13 Sep 2011 04:31:15 -0700 (PDT)
Received: from localhost.localdomain (ip-95-223-249-66.unitymediagroup.de.
	[95.223.249.66])
	by mx.google.com with ESMTPS id r3sm99206fam.26.2011.09.13.04.31.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Sep 2011 04:31:14 -0700 (PDT)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Sep 2011 13:30:33 +0200
Message-Id: <1315913433-32608-2-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1315913433-32608-1-git-send-email-s.stirtzel@googlemail.com>
References: <1315913433-32608-1-git-send-email-s.stirtzel@googlemail.com>
Subject: [PATCH 2/2] data.py: fixed message domain errors
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
X-List-Received-Date: Tue, 13 Sep 2011 11:36:22 -0000

The dynamic message domain was introduced by Richard Purdie with the following patch:
http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=a6c48298b17e6a5844b3638b422fe226e3b67b89

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 meta/lib/oe/data.py |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/lib/oe/data.py b/meta/lib/oe/data.py
index 4b4d03e..af900be 100644
--- a/meta/lib/oe/data.py
+++ b/meta/lib/oe/data.py
@@ -15,4 +15,4 @@ def typed_value(key, d):
     try:
         return oe.maketype.create(d.getVar(key, True) or '', var_type, **flags)
     except (TypeError, ValueError), exc:
-        bb.msg.fatal(bb.msg.domain.Data, "%s: %s" % (key, str(exc)))
+        bb.msg.fatal("Data", "%s: %s" % (key, str(exc)))
-- 
1.7.4.1



