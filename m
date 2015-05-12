Return-Path: <mario.goulart@gmail.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 00B8D6013D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 14:58:23 +0000 (UTC)
Received: by qgeb100 with SMTP id b100so5439495qge.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 07:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=HIbsOdghV21bwoaboLiweIjQHYy38uT2M8N9iq4CNlA=;
	b=OQUCEJ6hxSG/JAXMWILo/GoCxfrY7J7BdmK+fwklu6nm0giEE3LSDJOEGV5RJIQxZZ
	/g0Qn12zK+AjtAH30TzDg5rd6iRPbRzzj7YF1G6ZTiSN9nu0dSTtNmxn1MXFrBeGiSEL
	KzIq5kpGV3nMr09RPviiyPugikBh3mRulCHzsN1akm+/A0OLJxWk1vQi52fDTNsUSNxw
	ZJVZuJaqDk9efLvXYel6g3ZSXeyfYDZBiuFdOKJY268d6rDRxR9WvqPeW3Loi4ALhJlD
	xh3WmV6MQHIOfHPtWh4AoIVWHdeNdhxAxZSB49HBfHGnFcEcyx/XspCSS6o5i3RJtfNX
	rSiQ==
X-Received: by 10.55.25.91 with SMTP id k88mr33648885qkh.57.1431442705024;
	Tue, 12 May 2015 07:58:25 -0700 (PDT)
Received: from mario.lab.ossystems.com.br ([177.100.224.72])
	by mx.google.com with ESMTPSA id x69sm13397055qha.8.2015.05.12.07.58.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 May 2015 07:58:24 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 May 2015 11:58:08 -0300
Message-Id: <1431442688-5860-1-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Organization: O.S. Systems Software LTDA.
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [PATCH] README: add "Contributing" section
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
X-List-Received-Date: Tue, 12 May 2015 14:58:24 -0000

Tips on how to submit patches.

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 README |   21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/README b/README
index 665c98f..bbd7234 100644
--- a/README
+++ b/README
@@ -13,3 +13,24 @@ which can be found at:
     http://yoctoproject.org/documentation
 
 
+Contributing
+------------
+
+To contribute to this layer you should submit the patches for
+review to the mailing list (openembedded-core@lists.openembedded.org).
+
+Please refer to:
+http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
+for some useful guidelines to be followed when submitting patches.
+
+Mailing list:
+
+    http://lists.openembedded.org/mailman/listinfo/openembedded-core
+
+Source code:
+
+    http://git.openembedded.org/openembedded-core/
+
+When sending patches, please use something like:
+
+    git send-email --to openembedded-core@lists.openembedded.org <patches>
-- 
1.7.10.4


