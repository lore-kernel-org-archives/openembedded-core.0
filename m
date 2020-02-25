Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 98C51616C2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 18:54:14 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id m10so2832569wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 10:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=7+djn1XzUL0sYNLJuRc7OMLRTAsj1IpYRbSD1DL3L4Q=;
	b=FlQHNkQrq7qtq403b2C/RSeowy1kW3aPgwM3rVv5HjTT05vnAGOY9qqRrHcN3Z0dtS
	7g4RDnRhAbEwrAd/WpceF7x5WG82IbUc1CsIkpKxzs48NFnRqPwzVBQjq9REI2IRYD/B
	U3wZXBzRij66ztnlyGMYjKR6zQYUDUrjgXjdPimqkxOOTZtrcBV6w6nv9wVEemfYoWXo
	oBbEyTPRFn+gfQUKsLzZQ6PM5kleZZdw1ZVRJDqca6N/wg7ADg8H42qJplFZqmgU6r/K
	Y6iExAUvsc3GSxDRN5QLEqrzKvAUKOg8xq11xzgdFyjnfkPRYXCs5/9/ft9GuVgVrXbK
	KBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=7+djn1XzUL0sYNLJuRc7OMLRTAsj1IpYRbSD1DL3L4Q=;
	b=cL86TE6rFrJVH2OKTY2Y5Xc3xmpaWo5Rt/7+WxjZVVtZSQxBZKlrFHUxb4DW9+t5mr
	C+z8Q4AJ0cuW8sPGy4ueACxhgjkrFafU7Vbp+/61RadXKpqqh/8Qzudh1Q67CEKt8vMV
	nvibAIvN0PsQTbDZga5VZolY8OeZpPMIX25nYenDjlMNcDBYccaFPOL+FaGnkHDHHp2I
	YdxOobFkFX91GeUcbooCbuIlu2s8hMOO47Wjc39H2C2Kclp0gmTOhUmVsD/LctgjLEpg
	2UUJWVvGjfHwMnF5/2IkOBYEEGC7AYPrXsBLBmZOB6STxzGwihPStt4skvl9fI9uT4wy
	Zotw==
X-Gm-Message-State: APjAAAXBBxdA+fKsEbB6QvDTaPQjcmR4Idjue9lzY3FT0l7ixKP6ogpD
	Dt2Gc3gl4abxh13HrfPTgu3w6Y3i
X-Google-Smtp-Source: APXvYqxoXiKtVicALNbSwHKAfhn88KrGuKKuwzzXiHGjn/J5lsvgNy6c+CtRITYSoAXU/l+Pkpwtag==
X-Received: by 2002:a05:600c:10d2:: with SMTP id
	l18mr598695wmd.122.1582656855109; 
	Tue, 25 Feb 2020 10:54:15 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	g7sm25730756wrq.21.2020.02.25.10.54.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 10:54:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Feb 2020 19:53:34 +0100
Message-Id: <20200225185335.19326-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200225185335.19326-1-alex.kanavin@gmail.com>
References: <20200225185335.19326-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 11/12] acpica: upgrade 20191213 -> 20200214
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
X-List-Received-Date: Tue, 25 Feb 2020 18:54:15 -0000
Content-Transfer-Encoding: 8bit

License-Update: copyright years
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../acpica/{acpica_20191213.bb => acpica_20200214.bb}       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/acpica/{acpica_20191213.bb => acpica_20200214.bb} (88%)

diff --git a/meta/recipes-extended/acpica/acpica_20191213.bb b/meta/recipes-extended/acpica/acpica_20200214.bb
similarity index 88%
rename from meta/recipes-extended/acpica/acpica_20191213.bb
rename to meta/recipes-extended/acpica/acpica_20200214.bb
index 6b1412eafb..cfa9fec4fb 100644
--- a/meta/recipes-extended/acpica/acpica_20191213.bb
+++ b/meta/recipes-extended/acpica/acpica_20200214.bb
@@ -10,15 +10,15 @@ HOMEPAGE = "http://www.acpica.org/"
 SECTION = "console/tools"
 
 LICENSE = "Intel | BSD | GPLv2"
-LIC_FILES_CHKSUM = "file://source/compiler/aslcompile.c;beginline=7;endline=150;md5=b5690d9ef8d54b2b1e1cc98aad64cd87"
+LIC_FILES_CHKSUM = "file://source/compiler/aslcompile.c;beginline=7;endline=150;md5=6adbcb81e9ee6ae50c569b94fe12f7c5"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
 DEPENDS = "m4-native flex-native bison-native"
 
 SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
-SRC_URI[md5sum] = "0f0eb38e796fac24c2aa4d9b6adcd950"
-SRC_URI[sha256sum] = "304930df9836d3d4cdbf67a3ae6bd96dbc65f62602d869f571f4b6a12341e6c6"
+SRC_URI[md5sum] = "3505ba6170b77db1399eae0e2a959113"
+SRC_URI[sha256sum] = "e77ab9f8557ca104f6e8f49efaa8eead29f78ca11cadfc8989012469ecc0738e"
 UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
 
 S = "${WORKDIR}/acpica-unix-${PV}"
-- 
2.25.0


