Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SuQvu-0004c0-L9
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 18:29:02 +0200
Received: by bkcik5 with SMTP id ik5so1013206bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 09:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=RqKCMw84OAXqMsNIPgFMXwzfOFr1cNhWs2NRXw791iU=;
	b=sJ/oPYvZhd6x70AkFKlLiN1gt/1JjdBl2F9hriX+U6Gu4r2S1QctwGepnvXe8D6SBm
	S9ZykMt9177RSG1RO2r/7OUb0rSwAPAjMuabh6G8WQhKeTnKc/iXXq+H2IIqW/Y0Axt+
	L98yMQg58hmgR/5iYUNy2Guzt1Cmc0eRaTGa86vPhkDb3L4qQb4xInjgIqH7Sa87XTGa
	1KeIKGv9vVx9Y+q1yQPNmC0Vvgkech9cWAJjpBke1+ebrYqEZ+mMd4U0uXoYqwgfYty+
	o2yQppLUhnd67T+vGwNXcwXNW935NXEPdLMToR222jCZxgtvvkYSu/8jysSL+H7XpfA2
	eNAA==
Received: by 10.204.136.195 with SMTP id s3mr14376613bkt.6.1343319451831;
	Thu, 26 Jul 2012 09:17:31 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id hs2sm14911586bkc.1.2012.07.26.09.17.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jul 2012 09:17:31 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jul 2012 18:17:02 +0200
Message-Id: <1343319422-13039-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [PATCH v2] gtk-doc.bbclass: unbreak dependency-chain for native recipes
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
X-List-Received-Date: Thu, 26 Jul 2012 16:29:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

see [1] & [2] for discussion of this patch

[1] http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/026606.html
[2] http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/026611.html

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/classes/gtk-doc.bbclass |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta/classes/gtk-doc.bbclass b/meta/classes/gtk-doc.bbclass
index 8a312f5..59063b0 100644
--- a/meta/classes/gtk-doc.bbclass
+++ b/meta/classes/gtk-doc.bbclass
@@ -7,7 +7,6 @@
 # packages up any existing documentation (so from tarball builds).
 
 DEPENDS_append = " gtk-doc-stub-native"
-DEPENDS_virtclass-native_append = " gtk-doc-stub-native"
 
 EXTRA_OECONF_append = "\
   --disable-gtk-doc \
-- 
1.7.6.5



