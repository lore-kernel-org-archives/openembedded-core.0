Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4DAA971AC1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 11:31:39 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id e74so5675757wmg.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 03:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Mx/pY2YPYs5Jr7O8dTIzSr6SW41sciqhd4yeScOMgDM=;
	b=WSVpWERFKov/5jOVthPFiKXipP1y74WZhKKGRvE9qNdbFnTN/fXzsrTIfmaeXqcC8A
	4/cXOhBn4JV/qWJQI/aDr+uBRlSLwGaJ+sKu+CfUVzoxRuuU+V/TwXon1YnCuWOV9HnX
	12HbsLdPAWEzgEox5EdtrFXNc0HGsJ3AiVd+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Mx/pY2YPYs5Jr7O8dTIzSr6SW41sciqhd4yeScOMgDM=;
	b=WNSmbfkCLs0EYJbuWtlepN6do1TejCisvI8K0U73jGh/WFeKu4ALAmr7OndC2hB1Vx
	XNYTYVDU7ROvwahPs3QiL1Meb1UR1NnI6T42POFS8EsZ7tHwgh1eOwECciLbfmJAIyjl
	DPC3YxB12OzxTXx5MemghHbG41pYHNECMZfWx1yiqK8/OLKQK26ZFa1cEL2JFyNsaLnq
	pVEmKsS9oKNEZlmmCrOYolswvmQ7f3n67lvyR6SUXzoHC0PRRD7SKk9HJchwuj85T0bD
	T9l/7rVjB74rKzMbiMasT1xAfof69Qa7ANFMQpRZKAqMdfC4RDS2TIbB3eqXcYaelAwq
	JLwQ==
X-Gm-Message-State: AHQUAubOelXdZ1jtyEs0/fSHlGYie6AnNSYrjh/SMUX3A0Z06v9eHqUg
	mXUnWP22eoBDz1kfyhNiMjTYeFEt2Gg=
X-Google-Smtp-Source: AHgI3IazTIPG/xd6ByliDmYFyci3cPYt8iPdqNsPuH/6UEop0AOSzhjckA/RyRypS9uSNh2zfgZxuA==
X-Received: by 2002:a1c:9d94:: with SMTP id g142mr6405866wme.125.1550662299476;
	Wed, 20 Feb 2019 03:31:39 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l125sm10377824wml.18.2019.02.20.03.31.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Feb 2019 03:31:38 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Feb 2019 11:31:33 +0000
Message-Id: <20190220113136.25171-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190220113136.25171-1-richard.purdie@linuxfoundation.org>
References: <20190220113136.25171-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/5] python3-pbr: upgrade 5.1.1 -> 5.1.2
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
X-List-Received-Date: Wed, 20 Feb 2019 11:31:39 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3-pbr_5.1.1.bb | 5 -----
 meta/recipes-devtools/python/python3-pbr_5.1.2.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pbr_5.1.1.bb
 create mode 100644 meta/recipes-devtools/python/python3-pbr_5.1.2.bb

diff --git a/meta/recipes-devtools/python/python3-pbr_5.1.1.bb b/meta/recipes-devtools/python/python3-pbr_5.1.1.bb
deleted file mode 100644
index 95d3d2bd4f3..00000000000
--- a/meta/recipes-devtools/python/python3-pbr_5.1.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-inherit setuptools3
-require python-pbr.inc
-SRC_URI[md5sum] = "dbc94417a8ff0432d6244501a7f1bd49"
-SRC_URI[sha256sum] = "f59d71442f9ece3dffc17bc36575768e1ee9967756e6b6535f0ee1f0054c3d68"
-
diff --git a/meta/recipes-devtools/python/python3-pbr_5.1.2.bb b/meta/recipes-devtools/python/python3-pbr_5.1.2.bb
new file mode 100644
index 00000000000..7ba1d035352
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pbr_5.1.2.bb
@@ -0,0 +1,5 @@
+inherit setuptools3
+require python-pbr.inc
+SRC_URI[md5sum] = "bea55678345bd77b4ff5b2ebb729fd6d"
+SRC_URI[sha256sum] = "d717573351cfe09f49df61906cd272abaa759b3e91744396b804965ff7bff38b"
+
-- 
2.20.1


