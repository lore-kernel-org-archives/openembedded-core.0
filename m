Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 013C56CF34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 14:00:05 +0000 (UTC)
Received: by mail-la0-f53.google.com with SMTP id eo20so1157840lab.26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 07:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=lOAT6EJzFh4LxwQO3RzOMqRSW15a0ggJxryAPOUCbpI=;
	b=K/ETtT9TCHxgUQcHmjDzSsOeGkWwRtPmGAx3oK+G6KnghIr1gmEI4IImY5G183QE++
	djl8dRFnSBlcSc7kh/4+T8EDtccYt+8rIm0oDqLDvfRv7zVY+/gqoLErHt0vdcg3io2U
	A5NHGaByUBJ8j0wTVzpFZFAif7bwaPmEtXzF+3XuOnI1/EA0bMi3ahPv75X26tsPTgUB
	8OEueARRlOIuxfvUogMhcMURMJNoFEmdnjc/A/bt+TT2fhx9xNL/U0kDmTHL5jJenjuj
	dG4do3GGrJHEMAz4mavDlciCfti3xRGa+C4h7x2wQpfDYz+ugvNB9kuDq3LBWd1EuSgg
	A96A==
X-Received: by 10.112.168.3 with SMTP id zs3mr7583234lbb.2.1382018407225;
	Thu, 17 Oct 2013 07:00:07 -0700 (PDT)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id i3sm74805106laf.4.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Oct 2013 07:00:06 -0700 (PDT)
Received: by nysan (Postfix, from userid 1000)
	id 0CF7E400F24; Thu, 17 Oct 2013 15:59:57 +0200 (CEST)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Oct 2013 15:59:39 +0200
Message-Id: <1382018386-25389-5-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1382018386-25389-1-git-send-email-david.nystrom@enea.com>
References: <1382018386-25389-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCH 04/11] attr: Add nativesdk in BBCLASSEXTEND
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
X-List-Received-Date: Thu, 17 Oct 2013 14:00:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 meta/recipes-support/attr/attr_2.4.46.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/attr/attr_2.4.46.bb b/meta/recipes-support/attr/attr_2.4.46.bb
index a76ebae..c8aef3f 100644
--- a/meta/recipes-support/attr/attr_2.4.46.bb
+++ b/meta/recipes-support/attr/attr_2.4.46.bb
@@ -4,3 +4,5 @@ PR = "r4"
 
 SRC_URI[md5sum] = "db557c17fdfa4f785333ecda08654010"
 SRC_URI[sha256sum] = "dcd69bdca7ff166bc45141eddbcf21967999a6b66b0544be12a1cc2fd6340e1f"
+
+BBCLASSEXTEND = "native nativesdk"
\ No newline at end of file
-- 
1.8.3.2


