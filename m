Return-Path: <scerveau@connected-labs.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8B1DD6BBCB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 14:23:31 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id hi2so6175621wib.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 07:23:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=Z0sHif4UCgOZrbL/aUz69H5sbMezksmeOQl1g8i4ZeM=;
	b=Vrh9MZc8TJtZewvfRRi5qw92AO+0LoEc3bQ+1/f9qeiUHVtLIM5sKjeueSb99B+vdz
	Oyfe/Nsf2gltLq8jmt/U+vLAnutxiNKBss7BjiVvu48Mw/RisdneOl5pbQNNhbBfujhR
	IOL/JsOz9eW7UzSVpthKjXJvB8WRwS7ntGdfPf3nQJEYsorsmkOW0L63ZF/tcTMHJ/9w
	FK4Oohkpwny+vJ0G80XMAU3FUxX7Q4AQQrc+vtUGt93PctsovyLhK9pFlPnK2JPIQzzV
	YjvYpNkHe3jbp9b8RjaHjcOIfHsKitdcOtASUiJyDYPid6H4yNFe1EdRP1vNWf/KfC53
	SnBQ==
X-Gm-Message-State: ALoCoQnb82lWHCwn1VMBDarjgCid2ZWAww2F7fcLqUc/yjYjxJOKiVrUtL/xv6sRZ9P/tPwQeaeS
X-Received: by 10.180.82.166 with SMTP id j6mr29294386wiy.71.1404138211476;
	Mon, 30 Jun 2014 07:23:31 -0700 (PDT)
Received: from maupiti.mpl.mstarsemi.fr
	(connected-labs-gw1.ter2.neodc.mpl.cust.as8218.eu. [94.103.137.126])
	by mx.google.com with ESMTPSA id i4sm31930499wib.21.2014.06.30.07.23.30
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 30 Jun 2014 07:23:30 -0700 (PDT)
From: =?UTF-8?q?St=C3=A9phane=20Cerveau?= <scerveau@connected-labs.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jun 2014 16:23:15 +0200
Message-Id: <1404138195-14158-1-git-send-email-scerveau@connected-labs.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [dora][PATCH] vala: should not depend on gtk+
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Jun 2014 14:23:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Stéphane Cerveau <scerveau@connected-labs.com>
---
 meta/recipes-devtools/vala/vala.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
index a8927d7..a9e5a57 100644
--- a/meta/recipes-devtools/vala/vala.inc
+++ b/meta/recipes-devtools/vala/vala.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "Vala is a C#-like language dedicated to ease GObject programming. \
 Vala compiles to plain C and has no runtime environment nor penalities whatsoever."
 SECTION = "devel"
-DEPENDS = "glib-2.0 dbus gtk+"
+DEPENDS = "glib-2.0 dbus"
 BBCLASSEXTEND = "native"
 DEPENDS_virtclass-native = "bison-native glib-2.0-native dbus-native"
 HOMEPAGE = "http://vala-project.org"
-- 
1.7.9.5


