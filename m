Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 301AA77CF6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2018 15:26:00 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id t5-v6so8065190ioa.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jun 2018 08:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=2+4zUrVfWQY2g5lv0v5AWXM8SFeT90l/Fc4W1FtbTQw=;
	b=re7GuOSB94I7bKgR67nhbrdZM6vTDy69Duz8F7P8AWCPmC6YsZZQpLEBH17YV9CpIM
	WF1OC43J0T+3ERl6qV7KFtHp+3Aas20jFysuN/1eGHTArbTJuNBHzqba5tEbimAwG9To
	fQObL0mtyF5Ey0Ugm8xRnV8WQTL9MBwtDA8FOk7DcvOPV5F/uqpRjlapbT+Fri8wx3ys
	6I2fwAB/+D3u9nqbhImm5Lg0f/VtjBz+Ty0R0y7DmlPX+BgSBCEhxqY9/Zk53YLhcRKc
	Mra+KIY6EXZZ3QKrs8lydBDd2afLzjGLt51ADY1UJN3sextMvfERzjFIVX9fwKfx/bND
	MK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2+4zUrVfWQY2g5lv0v5AWXM8SFeT90l/Fc4W1FtbTQw=;
	b=nmsojxOLcxWCJhtbUJxu/KOAzi+2jIAbzgwsaitZVcYVwimkc5w9uu8dsXbZh/tz//
	42xNV6THkdkmTKUC08ARYA1OyZk3G3FL3oDhWfNt72ZvuWnaKZEhbv3AwrltrFRnp+2k
	HC/FDVPqhIzcPkzXbkLL3Y7GU0XI+E06wnM5+To1hs0Uwd9NjgrkrTSpRCIbTNi186K0
	0tJB+luMHiCx3UKMCR6vm4k0jXZvluvQXiV09N93vAKABpHFOB+wBqmFSue59RN64Upd
	vyLrpVUFYXtqT4BXvGW8uogdlR5eDMKnW0PDGXulunUn9jAV/Ysx4W97Hm8c5yRHstww
	9pBg==
X-Gm-Message-State: APt69E0VkG1vzo8amCUHMh0Ka1e3f0NPBfvpV3SwtjrQsvAsY7DVyJ/E
	lVOC/ygTSqy/pQqeF93rFEvHreC6
X-Google-Smtp-Source: ADUXVKKzEIKfZJI1qudo5jhtL9dAfwxgIOSL2xHVJb0QrqKaNJ8x9VCL50cth6FD5cWRo758SKBM3w==
X-Received: by 2002:a6b:5f13:: with SMTP id
	t19-v6mr3746160iob.242.1528298761803; 
	Wed, 06 Jun 2018 08:26:01 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	80-v6sm1973253itk.12.2018.06.06.08.26.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 06 Jun 2018 08:26:01 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Martin Kelly <mkelly@xevo.com>
Date: Wed,  6 Jun 2018 10:24:44 -0500
Message-Id: <20180606152444.21911-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH] icecc-toolchain: Remove environment setup
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
X-List-Received-Date: Wed, 06 Jun 2018 15:26:01 -0000

The handling of the environment setup was moved to the post-relocate
script handler, and so is no longer necessary in the setup script

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../icecc-toolchain/icecc-toolchain/icecc-setup.sh           | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-setup.sh b/meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-setup.sh
index 04808265781..25250b7c0e2 100644
--- a/meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-setup.sh
+++ b/meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-setup.sh
@@ -20,11 +20,6 @@
 # SOFTWARE.
 #
 
-# Setup environment
-for env_setup_script in `ls $1/environment-setup-*`; do
-	. $env_setup_script
-done
-
 # ICECC_PATH will have been found icecc-env.sh
 if [ -z "$ICECC_PATH" ]; then
     exit 0
-- 
2.17.0


