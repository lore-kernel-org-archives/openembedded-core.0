Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
	[209.85.216.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6792B60609
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 18:53:24 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id dw13so2663638pjb.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 10:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=paRQhs/+vjB/HNVJV+iDyzeQADBvXyVtmPR1jQ2pjrI=;
	b=RqoWnSiZZj1lcyPTJdOBMiEUuEtCUDLfdsPAro20U4RxC3Bo+2CS/TYiyWG7Uz7Luc
	ws/nTHN4xhU77nkqkqv+CRUT+RTyc+xT0qYaHqfIP5fVusXlt0OV1ReDd+wWOMbYMdiE
	n7C0fqjvbM5yt3PMH92yaFYl8CG81tHE8X1FiaMSncK9+B/ZpShdAA4jLjBunzsM7RRY
	RPFKLjmbhF1RSCqLLuY7RC8EMlHDGQCsclj9GnE3kptSLoOvNz/9hqjch75P32OsQO1o
	qSIR8hiuQREhJid7LD2NTL2U1XIixjbahdmZOe15UkLvdL3oNmdWzx1EbsPccPdPsYWy
	BYng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=paRQhs/+vjB/HNVJV+iDyzeQADBvXyVtmPR1jQ2pjrI=;
	b=JgWhYP/MCvFNdXKBlidWPlazqYd5iB/uUiDR1z5iqAA2VcxL9Q3jd00+98CBzIddsl
	I3CIwh/ZQc2R+V/rRFHVMWzoHmvpcxgWAZYYIkgbmEGmLz5zY0k5q4vkKqOhnN4nIMuq
	7MdUmjZzhpvbe3s7mEmoIueQJUz6XCjl+BbJNQkBcxa2v/kqn8bIY9z8R2cpJpFZej6c
	zjSBAUlKCQoPZj83geiMlmVc9MFR44xb1TNsSrMHgKgivTYlZPDvwh0wM0kg1j3UmDj3
	3WBGilNXJSfiK1TFr2OfTXvR+N6GtcEEhIaSk4QvL3IXIHeD7Ea9SWBJHsZvQI3b+dHa
	HyqA==
X-Gm-Message-State: APjAAAVt23JTMZRzAjvB1aA0OTMdQq4jz6/DZtEA+00hwnRlyKlnVNY8
	0RrQM9qfpWzQB4esbbnI4+hAjoE6Rps=
X-Google-Smtp-Source: APXvYqyG1+WXto8lhmqOXr6BQwEnzCY2WiHHfTlQ6c/NFFRnzYRSrbOcIovZh0YuWsJRofGlDDq8zg==
X-Received: by 2002:a17:902:8a8e:: with SMTP id
	p14mr10049000plo.28.1583002405062; 
	Sat, 29 Feb 2020 10:53:25 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1634])
	by smtp.gmail.com with ESMTPSA id
	k24sm11974564pgm.61.2020.02.29.10.53.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 29 Feb 2020 10:53:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Feb 2020 10:53:36 -0800
Message-Id: <20200229185336.3904938-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH] tcmode-default: Add wildcard to GLIBCVERSION
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
X-List-Received-Date: Sat, 29 Feb 2020 18:53:26 -0000
Content-Transfer-Encoding: 8bit

glibc version has moved on to 2.31.x

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index fce2662c1f..ab4333144b 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -20,7 +20,7 @@ GCCVERSION ?= "10.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.34%"
 GDBVERSION ?= "9.%"
-GLIBCVERSION ?= "2.31"
+GLIBCVERSION ?= "2.31%"
 LINUXLIBCVERSION ?= "5.4%"
 QEMUVERSION ?= "4.2%"
 GOVERSION ?= "1.14%"
-- 
2.25.1


