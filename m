Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 31AAC600E3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jan 2017 01:55:35 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id i88so24873022pfk.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jan 2017 17:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=lgchiwtqiWS1axWrbQUNJjAxu1SdWHAw42ZyQcX3E+w=;
	b=Fi26jrM0q9rklXNAk2NYN3InrAxKFU6DLVGPtoyN8C21sOwg2DBbqwtk97qby2eRAc
	n0al3uoWs0Z0LHzLZsT5DMOOZ0fixH7CWx3prtG+UTex4TV6FSda75bMsZ5MpQWWwo7D
	pkCNGFrPi4sDz/3FJzYRmR0eKR1ZemBTi9lqqhCm7Hes52ZJ9+JWBbSczcF85yCA8OoG
	BmizBjABGRktIWIY20n3p0ssGQyaHdSUbZJqD1ZAp5pRfhYB6qZEFpZO72nPFBHl5eej
	ZwOh0Gh6WKfc2F9PVyYqITZLADhfUfKGhzYlS322PpzYmYo6qZnuaGd4tT8gsQkMWn16
	3vZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lgchiwtqiWS1axWrbQUNJjAxu1SdWHAw42ZyQcX3E+w=;
	b=uR2Wq7Ci40Z8whDoatb8+lk99whDc+9rO6eS8IHbztkTgUnjchnzpzRL6lfyvCQZ9h
	ShTIrUjEBdgfu3hBX/NPh6mwEnIliAuthEhqzJFaKGQK5Tf214P0Xzjhp7hso9UlpYrq
	PXel0U5qYbSbyf8IaZa55yIX9tRrCvj8rbey4tdD0lTprOC+Hh/c/bU5Pw93kxnG1m1B
	xHJvvCZBrijUBjeTyve70mXiq/sjkTVCr8/sUhykJvyJZgkRxdEvQJpOtGgeSpJ9yeiE
	UgFxrbz5nlSzrtAVsOUXf00Y3wSZoUGAf9lYBK9Q1hXzM8RtQNZwKaazTbdPiNoXgEdK
	iTbg==
X-Gm-Message-State: AIkVDXJOSnFPodhYUjTNdP4wZy+PKh3N616Ql+H9IqL2yOCBC1EVH1EPN/gMTsRgyOPXWw==
X-Received: by 10.84.168.129 with SMTP id f1mr132323353plb.42.1483408536370;
	Mon, 02 Jan 2017 17:55:36 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	z62sm135072937pfz.19.2017.01.02.17.55.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Jan 2017 17:55:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2017 17:55:28 -0800
Message-Id: <20170103015528.29635-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] musl: Upgrade to 1.1.16+ on master
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
X-List-Received-Date: Tue, 03 Jan 2017 01:55:37 -0000

summary of changes

http://git.musl-libc.org/cgit/musl/commit/?id=8fe1f2d79b275b7f7fb0d41c99e379357df63cd9

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index b0c6098133..e9b9fef601 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,9 +3,9 @@
 
 require musl.inc
 
-SRCREV = "54991729fd1e3d3a0cb71884d758d86afe6da9e0"
+SRCREV = "769f53598e781ffc89191520f3f8a93cb58db91f"
 
-PV = "1.1.15+git${SRCPV}"
+PV = "1.1.16+git${SRCPV}"
 
 # mirror is at git://github.com/kraj/musl.git
 
-- 
2.11.0


