Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 684C4744A3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 20:40:42 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id o184so7327762qkd.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 13:40:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=BhI/ptDeNl6jSVD+pYOg8UZgja2Yknsxh+jhGo3LC5M=;
	b=IZ+V25YFvaqXChNT+s87BZNnKF8IX59oTvDMFFIBMWU/b2bHGxzo961mUtWmqJoGpx
	2prmNV7UcCzfkL/acOBLoV1l1QQWlJX3rsucVq8AYQOt2ch9SuA03PcyNlpZpc7V+T+t
	gSD5Nb9aEKk53+EpsodXvBM84EymixNNcvMd+aL365c/4HnDfD1L+XofjOmVtFPyR8Ip
	QYFl22pECVrhcEzC9z/p9CKczhIhq9Hd4xtcTvEjnm8ONng7MhWqPTH4gNEhaSPrAFW7
	ikDhkSBUT5fjlmcd9qYZCzeAOysW5DS9N7ZCnAm9xvILVVMXYxpfW9kyDgbsbDLZq9lS
	ijTw==
X-Gm-Message-State: ALQs6tAXqaPHeee4S0FxLyrcNIbMp7cgOeGPTMfv2M8ojjb8ssN/ingF
	7T7nzg+93ZtljO2Pwzqj29ai5A==
X-Google-Smtp-Source: AIpwx49zwHG73BpcTUd9iMdhEXQzF9bnHdK+/AJL3Da2SWAZLq1lA2SVCxHV1QlzSfv3mUmhhYRm1w==
X-Received: by 10.55.154.79 with SMTP id c76mr12941357qke.347.1522356043740;
	Thu, 29 Mar 2018 13:40:43 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	h22sm4902512qkj.53.2018.03.29.13.40.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 29 Mar 2018 13:40:42 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Thu, 29 Mar 2018 17:40:36 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Mar 2018 17:40:35 -0300
Message-Id: <20180329204035.1576-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.3
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] go: Upgrade 1.10 -> 1.10.1
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
X-List-Received-Date: Thu, 29 Mar 2018 20:40:43 -0000

This is a minor release that fixes many important issues found since
1.10 release.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-devtools/go/go-1.10.inc | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/go/go-1.10.inc b/meta/recipes-devtools/go/go-1.10.inc
index 08d1ba6551e..1d5958a68c1 100644
--- a/meta/recipes-devtools/go/go-1.10.inc
+++ b/meta/recipes-devtools/go/go-1.10.inc
@@ -1,6 +1,8 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.10"
+GO_MINOR = ".1"
+PV .= "${GO_MINOR}"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
@@ -18,5 +20,6 @@ SRC_URI += "\
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
 
-SRC_URI[main.md5sum] = "07cbb9d0091b846c6aea40bf5bc0cea7"
-SRC_URI[main.sha256sum] = "f3de49289405fda5fd1483a8fe6bd2fa5469e005fd567df64485c4fa000c7f24"
+SRC_URI[main.md5sum] = "d55e8b2c6272ab1abf5e4e6cdaaca680"
+SRC_URI[main.sha256sum] = "589449ff6c3ccbff1d391d4e7ab5bb5d5643a5a41a04c99315e55c16bbf73ddc"
+
-- 
2.16.3


