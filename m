Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 775E660221
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 19:19:22 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id c23so1324583plz.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 11:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hned8lXcB7Mu6qy5JAhm6zNvXxZZG0ZRr5D3mzW88IE=;
	b=pufWoFwiBrUOn5/XIN0or0nFOMK6Dq/TGdaEQblvBCZXwdbbe8QVuj5N1XsAcxaqGR
	DC/exUaEdkYqJDEsnhfeQiRKehLYiq22IGIUH7UpFh+SVOMP2AVpjgFh7WExnhlM8cYQ
	EMQeiN7ckONc7IQA9grY665hg57gg2m6p+83QzyVuHpHP5o35LsFHb+tfnupwm17G1cD
	4R3v4qdEZzqebzL+ra5JMT/2tLge3NSHpUDWA4ftMgidsQm0SkYZMcxGAO7ckYrSXV5z
	ZfxGmkbXfKGe9nWsUEnXBm6mgQIotoIFCTyYapV3hQxhgst/BfTGCkkKMMThpczWUlv9
	gb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hned8lXcB7Mu6qy5JAhm6zNvXxZZG0ZRr5D3mzW88IE=;
	b=kuNp/re/2sYnqm+VOb4piNUtB7d3iwriHdmnja9BT2iRhmtQEdTVqTeZpydQDPKDLi
	CY8h9RB9eNDWOjc707F9PGwelumdcJsj7uN/VYYVL3r1ZdrD5yWUTOF/0yeo2oRnVS0E
	Uxt+7jrD3k8FJsidhV9tNKQdhc0JeepB31Rd2bqWKzaiimY9Sf2HKmnQNWKFq2/4P17g
	f2JuUd1QD6+C+T53nzYuen5XvHMYv4ZY1IcpEnVqHAcJlHnh1Z0G47zEbg++Pivt+3m2
	eZUHhjeOsvJHh2s9c5jFTV6gLaVJLgzqYznA6Bl+ctlQrYt0rPvCFmsGweDe6/3wAOJj
	8C1A==
X-Gm-Message-State: APjAAAWdAo70AyKcNsFy4HsoGzHNQ+Ey8XXDWAuBiGTW6fhDhcL1Dl08
	oZFN1ybWT5Gb9cVJYDgC5WQDfAnA2mc=
X-Google-Smtp-Source: APXvYqzOl0rHgBnSHh5HuoiGQh6mvOm5k1dMRs11Gg9hKkP0ZpKX1ZPUtgupdSObJRqoVfk8gxDMpA==
X-Received: by 2002:a17:902:d692:: with SMTP id
	v18mr10046942ply.9.1581535162959; 
	Wed, 12 Feb 2020 11:19:22 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c740])
	by smtp.gmail.com with ESMTPSA id v8sm3699pfn.172.2020.02.12.11.19.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 12 Feb 2020 11:19:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Feb 2020 11:19:27 -0800
Message-Id: <20200212191927.2708197-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH V2] dnf, libdnf: Ignore if PACKAGE_CLASSES does not have rpm
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
X-List-Received-Date: Wed, 12 Feb 2020 19:19:23 -0000
Content-Transfer-Encoding: 8bit

dnf does not work with opkg or dpkg/apt anyway

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Use PNBLACKLIST instead of anon python

 meta/recipes-devtools/dnf/dnf_4.2.2.bb        | 2 ++
 meta/recipes-devtools/libdnf/libdnf_0.28.1.bb | 1 +
 2 files changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/dnf/dnf_4.2.2.bb b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
index f38167f1ad..220f1aabbd 100644
--- a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
@@ -84,3 +84,5 @@ SYSTEMD_SERVICE_${PN} = "dnf-makecache.service dnf-makecache.timer \
                          dnf-automatic-notifyonly.service dnf-automatic-notifyonly.timer \
 "
 SYSTEMD_AUTO_ENABLE ?= "disable"
+
+PNBLACKLIST[dnf] ?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'does not build correctly without package_rpm in PACKAGE_CLASSES', d)}"
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
index 882c435b32..49afa04812 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
@@ -26,4 +26,5 @@ EXTRA_OECMAKE_append_class-native = " -DWITH_GIR=OFF"
 EXTRA_OECMAKE_append_class-nativesdk = " -DWITH_GIR=OFF"
 
 BBCLASSEXTEND = "native nativesdk"
+PNBLACKLIST[libdnf] ?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'does not build correctly without package_rpm in PACKAGE_CLASSES', d)}"
 
-- 
2.25.0


