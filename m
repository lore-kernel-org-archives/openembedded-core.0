Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 905777D1E0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 23:04:41 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id t17so1077697wrw.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 16:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=v3VkS3CC6QBN65uhO4lYlUfSh7YlizueNjVwtGiZf2o=;
	b=EcUDVTX1WE5d7FnCnUWWMJdV4cqSfDs+FKK1qYl3tPsOehBLlFjFNlVef7WWbTiRsY
	V3fhP15SoDk3nooH6f4aooq3tQzPzECVpzb34lBHYhqc+2LuixeRSDwjrUiWwikizFLs
	03lvi03+1Ch8TAyW0AdGerKIJMgrunSPZvG80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=v3VkS3CC6QBN65uhO4lYlUfSh7YlizueNjVwtGiZf2o=;
	b=tM1aPuMSokSdoIctO2auqae0643PTYsY+3p9AvLrBiwGfYMB44a6ayUkYtf8IqK0UI
	qk7t1gd5+/fgqDc7V/OUnVaXzlZ8sqTuS8FTdOdL82n1jxYg60Td5nLCeaTIiz8kmk0A
	r2ZDS4stb7cUYlycL2p8XcIxbZNHBIo50zwt8dLkINZPtZj9YbNYIuRacE711f/yGQFr
	+PmBhh3D2AS2RWHl+GJJbNqr5pL5EK/EbeUMevctMFxOtUVdURw7u+BwzBmq/l4pwOsT
	jbuUXMvNR3Syrt8gOWCJRdgEcpHdhMij5gTMe/5oXVcBzZ7LhcK2DDP8VEqTnFgvQhJ1
	Nw9w==
X-Gm-Message-State: APjAAAVVAZyajdOMq2MFBoQsf4QHcTKtX4IcgXnWeBe1+hQK7MS0lv+S
	lHz0ZzJZl6rnQc0dY1VRq5Jb8TyN5IEG5w==
X-Google-Smtp-Source: APXvYqzl0v0IK/fC5tdNTi3KdM7cOCBREHqHITI7j9rjIwENsXGJD5sF12Es+MC0Bd1nk23Lyuz9CA==
X-Received: by 2002:adf:f90c:: with SMTP id b12mr4502559wrr.63.1554159881953; 
	Mon, 01 Apr 2019 16:04:41 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q4sm14731307wrx.25.2019.04.01.16.04.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Apr 2019 16:04:41 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Apr 2019 00:04:40 +0100
Message-Id: <20190401230440.16582-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] layer.conf: Update to warrior release name series
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
X-List-Received-Date: Mon, 01 Apr 2019 23:04:41 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-selftest/conf/layer.conf | 2 +-
 meta-skeleton/conf/layer.conf | 2 +-
 meta/conf/layer.conf          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-selftest/conf/layer.conf b/meta-selftest/conf/layer.conf
index 0626b2a3ea4..080350a56dc 100644
--- a/meta-selftest/conf/layer.conf
+++ b/meta-selftest/conf/layer.conf
@@ -9,4 +9,4 @@ BBFILE_COLLECTIONS += "selftest"
 BBFILE_PATTERN_selftest = "^${LAYERDIR}/"
 BBFILE_PRIORITY_selftest = "5"
 
-LAYERSERIES_COMPAT_selftest = "thud"
+LAYERSERIES_COMPAT_selftest = "warrior"
diff --git a/meta-skeleton/conf/layer.conf b/meta-skeleton/conf/layer.conf
index 13bda7b5706..7d4ffb46ed5 100644
--- a/meta-skeleton/conf/layer.conf
+++ b/meta-skeleton/conf/layer.conf
@@ -14,4 +14,4 @@ LAYERVERSION_skeleton = "1"
 
 LAYERDEPENDS_skeleton = "core"
 
-LAYERSERIES_COMPAT_skeleton = "thud"
+LAYERSERIES_COMPAT_skeleton = "warrior"
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 12e39566517..9d63b5b24d0 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -7,12 +7,12 @@ BBFILE_COLLECTIONS += "core"
 BBFILE_PATTERN_core = "^${LAYERDIR}/"
 BBFILE_PRIORITY_core = "5"
 
-LAYERSERIES_CORENAMES = "thud"
+LAYERSERIES_CORENAMES = "warrior"
 
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
 LAYERVERSION_core = "11"
-LAYERSERIES_COMPAT_core = "thud"
+LAYERSERIES_COMPAT_core = "warrior"
 
 BBLAYERS_LAYERINDEX_NAME_core = "openembedded-core"
 
-- 
2.20.1


