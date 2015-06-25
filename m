Return-Path: <vomegaz@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id A3C5375A06
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 18:01:20 +0000 (UTC)
Received: by wicnd19 with SMTP id nd19so171260465wic.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 11:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UlDj2JVVIkOLy30mAWOKgk1xO1sybZbXVqiINEEx6iU=;
	b=kxNKnQ7PI0HY9JoBpmal8UiJoZ0tSU4Xltya1lngohWljtSDSBJHe/Sa48UMd7eWTk
	T9rf5C5DJJyha5HFJBOiPOJiVRR8J65Bnv0Cwg5QL+T+t6xTB7nEj03V7yxiN5kt3kk0
	Th89UNEc1OZFgV5iRw4IvBYZD91WOybE8zA4hoRbnIUDnMnFF6hxyawjasi1J8r6Bq5G
	A80eZdzaJyhgMi216Bqo7VWKPb3kmfHYxM03eymMEVj/sIws5dBTvwwg+hBnoUByI7/w
	f3IazlLq4mE+mr556EvRYqEnnIjUlacg1MblFwdh6qyjv2oDQKZ+J19ptFPR2ePNhj0u
	mL1Q==
X-Received: by 10.194.171.129 with SMTP id au1mr35311695wjc.115.1435255281278; 
	Thu, 25 Jun 2015 11:01:21 -0700 (PDT)
Received: from X220.tupi.fr ([37.160.80.150])
	by mx.google.com with ESMTPSA id i6sm46880068wjf.29.2015.06.25.11.01.20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Jun 2015 11:01:20 -0700 (PDT)
Sender: Thomas PERROT <vomegaz@gmail.com>
From: Thomas Perrot <thomas.perrot@tupi.fr>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jun 2015 20:01:09 +0200
Message-Id: <1435255269-1761-2-git-send-email-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1435255269-1761-1-git-send-email-thomas.perrot@tupi.fr>
References: <1435255269-1761-1-git-send-email-thomas.perrot@tupi.fr>
Subject: [PATCH v2 2/2] Set S to prevent QA warning on volatile-binds and corrects the path to COPYING.MIT.
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
X-List-Received-Date: Thu, 25 Jun 2015 18:01:20 -0000

Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
---
 meta/recipes-core/volatile-binds/volatile-binds.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/volatile-binds/volatile-binds.bb b/meta/recipes-core/volatile-binds/volatile-binds.bb
index 694ba1e..fee7275 100644
--- a/meta/recipes-core/volatile-binds/volatile-binds.bb
+++ b/meta/recipes-core/volatile-binds/volatile-binds.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Volatile bind mount setup and configuration for read-only-rootfs"
 DESCRIPTION = "${SUMMARY}"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://../COPYING.MIT;md5=5750f3aa4ea2b00c2bf21b2b2a7b714d"
+LIC_FILES_CHKSUM = "file://COPYING.MIT;md5=5750f3aa4ea2b00c2bf21b2b2a7b714d"
 
 SRC_URI = "\
     file://mount-copybind \
@@ -9,6 +9,8 @@ SRC_URI = "\
     file://volatile-binds.service.in \
 "
 
+S = "${WORKDIR}"
+
 inherit allarch systemd distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "systemd"
-- 
1.7.10.4


