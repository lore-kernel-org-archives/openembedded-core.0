Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 011FC7D735
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:11:34 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id m3so1827990wrv.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+dB1dlYscQjhsAYOuCVXPLo7IQpT07Qu3Lj0QblzC40=;
	b=ldA3TWPpKjhyuWstT2y/T33STtl24KyFgfhMcfp9xbfoIYqkO+fYh/en/j21H9pS0N
	uXbNRSXcOnD1uNqMdaGhBkKxCF0i5iMtn1LbGvA/MZ755ANVEPaFYJS4wjdCLNSs/qQB
	DyUkOb2qGTPLKNrqQ8HMXDLrcNbymiIu1RQL7TSmcewZlunGtr6uJsU1vi0F/7fabxIG
	DePcYIGRCl4VRN/QvG3zXOCTRZwHxGj6GZxQq6wyBh5IQD2FiTr+R5k6t1IXd/8Q7C3S
	UocRITvPxRmorICZzGOmc+nfus6an4Fe6Ixykjr8Qg/F/40A5lC/N6Vk6W8MssekW5th
	OCZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+dB1dlYscQjhsAYOuCVXPLo7IQpT07Qu3Lj0QblzC40=;
	b=P9LsGXah4J3N5/P6/FxPXW/T/jRWgwlc9T/dveVuQxNCQG72mpYsb9sYvU7lPAeFJa
	/WGVrsQrTQZdkGCnMXLo5m0pC5a/pefTXCGOxPQCOW60FWVltes/0TlTcLk6at71IxXm
	JmU4Njufe1esMWbZFsNyYIPUPPr7vlHdgUN51LKyFBmKuRdeLWSZEZ9ID+u8WqxiufZE
	KExECKvjbPoLxBhPDWWe8oK8xhY0FJfCo7B74AuRSUnOj5Mr4uceXtYz+6tt/Irxbfd1
	M6LKtIMTlT7atEzh5NgI0ahQ6eyqVBUcca6p8Q69kJjlmWmr/FtETYvFEE72oKs1dmUJ
	jJVw==
X-Gm-Message-State: APjAAAX79E97p8PR4DMqUylRBANTphs5cMUANu+74VAs4L/1oRnTdadH
	EKtqaijg4rzMw9URaiFL1s1oBI3B
X-Google-Smtp-Source: APXvYqweLpbKJbmbbDu5C1cxuJmwJB36m9LOHCLR7m50DzoVHZ4bjBzH4Mg/b7K7lKF6o3B/X4b8zA==
X-Received: by 2002:adf:e850:: with SMTP id d16mr31830442wrn.269.1558361495487;
	Mon, 20 May 2019 07:11:35 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	v5sm36242015wra.83.2019.05.20.07.11.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 07:11:34 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:10:46 +0200
Message-Id: <20190520141125.10805-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520141125.10805-1-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
Subject: [PATCH 03/42] libmodulemd: upgrade 2.2.3 -> 2.4.0
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
X-List-Received-Date: Mon, 20 May 2019 14:11:35 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/libmodulemd/libmodulemd_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
index 40715c06ee2..d7f486868b8 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
@@ -7,14 +7,14 @@ SRC_URI = "git://github.com/fedora-modularity/libmodulemd;protocol=https \
            file://0002-modulemd-v1-meson.build-do-not-generate-gir-or-gtkdo.patch \
            "
 
-PV = "2.2.3"
-SRCREV = "4c75c6f8b39ee57aebe8fd36ef84808e893048c0"
+PV = "2.4.0"
+SRCREV = "d0a3eda45e083e8fe8b329a2310a53abdbf1e4d6"
 
 S = "${WORKDIR}/git"
 
 inherit meson gobject-introspection
 
-EXTRA_OEMESON = "-Ddeveloper_build=false -Dbuild_api_v1=true -Dbuild_api_v2=false"
+EXTRA_OEMESON = "-Ddeveloper_build=false -Dbuild_api_v1=true -Dbuild_api_v2=true"
 
 DEPENDS += "glib-2.0 libyaml glib-2.0-native"
 
-- 
2.17.1


