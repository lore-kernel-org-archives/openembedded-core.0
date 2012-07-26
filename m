Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SuPyr-0003Ua-US
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 17:28:01 +0200
Received: by bkcik5 with SMTP id ik5so983595bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 08:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=zmBWpu7ZoTBMezaafosuxMt86Njt3VPtsfRY6TE72ZM=;
	b=hsLj0OtcuSNkdRbbJUz5wa0/zxMzTZzPiitg2QiQ5ev7JPeGnT9MOvRySCpgam9x72
	JcY5dNj4QMp8NAlEIbwJikrvpC5hClrb1OyQkpvU4gL/EcovPgKXM/v8YEp9bsynIAeU
	Vwb+7vBtRR6YO11ApiRNxOyNcEh/70DAQKs7xVwvaCqMlkrNQ+7C9lCMn10r1/dppd6X
	6qH2F7ttnt9qzele/UD8u3297rdS7U0nPplawpwY0VgDy+wd38OCv2e2MjP7qLD+Sgvs
	ieH/29qrrP4JDbXT2oWEOjh+mfCgB8qdfgCVS5xULGQHyn1zdMk00nUdxsEggiP4X8NE
	ssDg==
Received: by 10.205.134.139 with SMTP id ic11mr14095039bkc.40.1343315791158;
	Thu, 26 Jul 2012 08:16:31 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id t23sm14802645bks.4.2012.07.26.08.16.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jul 2012 08:16:30 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jul 2012 17:16:01 +0200
Message-Id: <1343315761-6314-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [PATCH] gtk-doc.bbclass: unbreak dependency-chain for native recipes
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
X-List-Received-Date: Thu, 26 Jul 2012 15:28:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/classes/gtk-doc.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/gtk-doc.bbclass b/meta/classes/gtk-doc.bbclass
index 8a312f5..be10c75 100644
--- a/meta/classes/gtk-doc.bbclass
+++ b/meta/classes/gtk-doc.bbclass
@@ -7,7 +7,7 @@
 # packages up any existing documentation (so from tarball builds).
 
 DEPENDS_append = " gtk-doc-stub-native"
-DEPENDS_virtclass-native_append = " gtk-doc-stub-native"
+DEPENDS_append_virtclass-native = " gtk-doc-stub-native"
 
 EXTRA_OECONF_append = "\
   --disable-gtk-doc \
-- 
1.7.6.5



