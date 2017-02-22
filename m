Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 909A673050
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 08:27:00 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id v77so980572wmv.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 00:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=d7b853AXfwR1YGHr4KBK7MDVMXtrtDQFhmrRNOibz+A=;
	b=GN9A8lVvLpg8JtRSc34KMDFWEnKZb/JOp8vPOvB1Vam4/vtJzxMyRHav8ep5zl0bnQ
	Rl3hA3qwd5p0WiDi1yeH6VVKhZM6P9ZjyVZ408Y2B8yWQ999wqkmnZkxAlN5iHXULXKS
	c8dIf9u2piuUpfiexcEnPHzeHI1/pjULGPdW5QzE/bO5dIShgjDLUVrTW8Kx2q3Q7Sct
	oPWzWHtX/jOjPjUnYS/GqdDPywPsvv3A37TLnRr9hJGrB/ZiRxS1z928zEw/oLX+MYgv
	AX1EA4ARtjlTp8VDcTRgBccJ7XruwQUfFRyyygGMYbqQLaH9/ry6v5apnBw9ugcAsY15
	C7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=d7b853AXfwR1YGHr4KBK7MDVMXtrtDQFhmrRNOibz+A=;
	b=GTVriX5vxO2IwRc/TOs8zvu2OTYjxaCZ3ja2UPDvdDeA0aCDBmBd+OR0tNsI9sO1I7
	cWXLEjmV0GXOfrs6kg9aqh7SI7WEnr6KuVEwwb5twnfH4mTyimpWmLCDt5J/HyvJFvN+
	ueDCI/WrbGhrKacc/fgmkhO44Dy6+9kc51YUBv2Ar/f6HItTW3vPGSsB0BGzVoDAGGpN
	vDRLbSMYZWfUtzCDg+VunjBeuqD2+FjYPEnDNvA0qwFeymd4utXCptPOfLTw5iJvWMvO
	5a3jlKATf7o06jkeuMjycd4OVpeJzGQFPx5TS9AmxDhyxQ/KP88CWcgmWG5zqMBVR1Qf
	+m+g==
X-Gm-Message-State: AMke39lKbR4h/MJ+IWMd3WbLbj5HCnQJ006me5h7AgrSPGgdDieaA2FB7UBUJjPBpNnlVQ==
X-Received: by 10.28.65.196 with SMTP id o187mr1132644wma.37.1487752020836;
	Wed, 22 Feb 2017 00:27:00 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([117.136.38.175]) by smtp.gmail.com with ESMTPSA id
	i73sm1565818wmd.11.2017.02.22.00.26.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Feb 2017 00:27:00 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 09:26:49 +0100
Message-Id: <1487752009-17958-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] python-pexpect: BBCLASSEXTEND to native
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
X-List-Received-Date: Wed, 22 Feb 2017 08:27:00 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

Some developers might need it.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/recipes-devtools/python/python-pexpect_4.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-pexpect_4.2.1.bb b/meta/recipes-devtools/python/python-pexpect_4.2.1.bb
index 95a0790..1321797 100644
--- a/meta/recipes-devtools/python/python-pexpect_4.2.1.bb
+++ b/meta/recipes-devtools/python/python-pexpect_4.2.1.bb
@@ -25,4 +25,4 @@ RDEPENDS_${PN} = "\
     python-ptyprocess \
 "
 
-BBCLASSEXTEND = "nativesdk"
+BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


