Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1RcMqG-0000fg-NP
	for openembedded-core@lists.openembedded.org;
	Sun, 18 Dec 2011 20:56:17 +0100
Received: by mail-iy0-f175.google.com with SMTP id h37so3846543iak.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2011 11:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=d6Cge7NhdznsbNqnWNHQcOw+Tp9SCcysZL5qvOBQEk4=;
	b=bf3Jg5D1h0BhlpZR+KUoeyxcsdRnDI/SjYckCAKHRmcruStrSNwKqUv49QqEUW01K9
	NEnCPvMeFfvpVpIee6cIvww1O+bdrQw17Fhp7TaZHCbSxXUMHZCHEMeIQ0Z643GI0F+z
	Pt97joHTihjyfUgaYqeo0EK0gtRmF2gC9cYPY=
Received: by 10.50.161.132 with SMTP id xs4mr15854891igb.61.1324237757031;
	Sun, 18 Dec 2011 11:49:17 -0800 (PST)
Received: from fangorn.rup.mentorg.com (nat-rup.mentorg.com. [139.181.168.34])
	by mx.google.com with ESMTPS id
	cv10sm10929303igc.0.2011.12.18.11.49.15 (version=SSLv3 cipher=OTHER);
	Sun, 18 Dec 2011 11:49:16 -0800 (PST)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Dec 2011 23:47:32 +0400
Message-Id: <1324237652-15618-5-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <1324237652-15618-1-git-send-email-dbaryshkov@gmail.com>
References: <1324237652-15618-1-git-send-email-dbaryshkov@gmail.com>
Subject: [PATCH 5/5] icecc.bbclass: also use icecc for kernel modules compilation
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
X-List-Received-Date: Sun, 18 Dec 2011 19:56:17 -0000

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/classes/icecc.bbclass |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 7e3676a..a14e02d 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -211,6 +211,10 @@ do_compile_prepend() {
     set_icecc_env
 }
 
+do_compile_kernelmodules_prepend() {
+    set_icecc_env
+}
+
 #do_install_prepend() {
 #    set_icecc_env
 #}
-- 
1.7.7.3



