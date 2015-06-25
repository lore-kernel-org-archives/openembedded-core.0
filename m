Return-Path: <vomegaz@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 84398757CE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 11:24:13 +0000 (UTC)
Received: by wiga1 with SMTP id a1so161349819wig.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 04:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BlNPhFFbh3WtS3bApxO7MdqgOLXGn2PM7fRhrgZk1CM=;
	b=mKX6yFadp7LvPrWxjBlLDDelIruy40abg1PJ50RBJIM+YvzT+NtrlaBah9RJHLBoFl
	bnP3IxWM51vMU1Iy4HnZS1X4EcS5gxVSbo3kByVo89sB9vLDmwnt7RP1CZjLOxl/SdqF
	/8sHBCd06k0E128S4pVPPlyTOw38P97zCk2OTREeCNn1RM1u68soLSSg62qvdb1p5/mX
	lQzvQSAorgYBOeYpBMrHlN0qOsnEce8aA83W28671FgLJMvsboVvWhxMJbQzNVvhWKg6
	LnHjRkVrbqkv0Cq2vtzp0wsZ746d5HgPtldmXzEl8pteL2kd0YqSo7F+f4qPrUFqPWJy
	YEwA==
X-Received: by 10.180.187.232 with SMTP id fv8mr4959259wic.28.1435231454940;
	Thu, 25 Jun 2015 04:24:14 -0700 (PDT)
Received: from X220.tupi.fr ([37.163.120.64])
	by mx.google.com with ESMTPSA id b5sm7113324wic.3.2015.06.25.04.24.13
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Jun 2015 04:24:14 -0700 (PDT)
Sender: Thomas PERROT <vomegaz@gmail.com>
From: Thomas Perrot <thomas.perrot@tupi.fr>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jun 2015 13:24:04 +0200
Message-Id: <1435231444-30705-2-git-send-email-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1435231444-30705-1-git-send-email-thomas.perrot@tupi.fr>
References: <1435231444-30705-1-git-send-email-thomas.perrot@tupi.fr>
Subject: [PATCH 2/2] Set S to fix QA warning on volatile-binds.
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
X-List-Received-Date: Thu, 25 Jun 2015 11:24:15 -0000

Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
---
 meta/recipes-core/volatile-binds/volatile-binds.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/volatile-binds/volatile-binds.bb b/meta/recipes-core/volatile-binds/volatile-binds.bb
index 694ba1e..c5d7b5b 100644
--- a/meta/recipes-core/volatile-binds/volatile-binds.bb
+++ b/meta/recipes-core/volatile-binds/volatile-binds.bb
@@ -9,6 +9,8 @@ SRC_URI = "\
     file://volatile-binds.service.in \
 "
 
+S = "${WORKDIR}/${PN}-${PV}"
+
 inherit allarch systemd distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "systemd"
-- 
1.7.10.4


