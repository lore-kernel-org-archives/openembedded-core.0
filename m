Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5374478441
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Nov 2017 13:17:53 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id 1so3212401qtn.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Nov 2017 05:17:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=wxHyYKIeQgVYv6VCdPumVfO+aOhWvS3n8MakxjfqLu0=;
	b=acK5cSU93qYgjX8eSQG0OjiAxtmsf+2mrfUGByH6rnIp+T3640yL968rrVJlxTQhQQ
	TEk5qAoyM+sOGZQ7BTREJFmcTHxcijgGHkZYdwDlHqvbjJvlVu6sUR++4F0BbGJEOyWs
	Aw89ip2SycLkbJbXhub4MP+jVtAbRNQ5Y/PEFpy18whtVKG50ydeHfVraOjVkR7U0KaE
	jjORTjyLcc2Z7VTYO5vdUFnD9p4yQ1om/mz93caVNgIxcut5BY+oM4bvlqgzdNI72qGR
	RnhXxYSXybt5Y/5vZO1LuhziZShLxiF0tKoYvhJUnjoV42O9dWSvcWS75qn5n7QQd7HX
	6EnA==
X-Gm-Message-State: AJaThX6OPheh3+WFJbXYRvUWHrcMBuWdwR8cZpED/8tQJS1MFZbKVs6G
	vbnME7uXjOEQhBoYAImatkTxDA==
X-Google-Smtp-Source: AGs4zMYmSUpZBN92SnsXpaDVXCqIxLtOFv11zoyrsU91ULqUxZZlBcgtZFS1blw/1Z6FfV912imN0A==
X-Received: by 10.200.39.238 with SMTP id x43mr785588qtx.154.1510147074412;
	Wed, 08 Nov 2017 05:17:54 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id m5sm1824651qkh.90.2017.11.08.05.17.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 08 Nov 2017 05:17:53 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 08 Nov 2017 11:17:48 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed,  8 Nov 2017 11:17:16 -0200
Message-Id: <20171108131716.26248-5-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171108131716.26248-1-otavio@ossystems.com.br>
References: <20171108131716.26248-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v7 4/4] linux-firmware: Bump to bf04291 revision
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
X-List-Received-Date: Wed, 08 Nov 2017 13:17:53 -0000

This includes following changes:

bf04291 WHENCE: Add new qed firmware
d8fc990 WHENCE: Add new radeon firmware
7245319 WHENCE: Fix syntax error for iwlwifi-8265-31.ucode entry
18d71a8 Revert "ath10k: QCA988X hw2.0: update firmware to 10.2.4.70.63-2"
4ebfab3 ath10k: QCA6174 hw3.0: update board-2.bin
96a7402 ath10k: QCA6174 hw3.0: update firmware-6.bin to WLAN.RM.4.4.1-00051-QCARMSWP-1
59bf7e2 cxgb4: update firmware to revision 1.16.63.0

The MD5 checksum of WHENCE license file was due the changes above as
the firmware versions are listed there. It had no license term
changes.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2:
- add a note about checksum change of WHENCE file.

 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 020c8579f8..ddad491c15 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -116,7 +116,7 @@ LIC_FILES_CHKSUM = "\
     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-    file://WHENCE;md5=08f6d4371353cac5f6fc271d5407c63e \
+    file://WHENCE;md5=038edbc9e744171d8b6235e0224028ba \
 "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -178,7 +178,7 @@ NO_GENERIC_LICENSE[Firmware-xc5000] = "LICENCE.xc5000"
 NO_GENERIC_LICENSE[Firmware-xc5000c] = "LICENCE.xc5000c"
 NO_GENERIC_LICENSE[WHENCE] = "WHENCE"
 
-SRCREV = "a61ac5cf8374edbfe692d12f805a1b194f7fead2"
+SRCREV = "bf04291309d3169c0ad3b8db52564235bbd08e30"
 PE = "1"
 PV = "0.0+git${SRCPV}"
 
-- 
2.15.0


