Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 067B371B15
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 19:54:37 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id 50so1540169uae.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2016 12:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=zJ0LmA8iXyqWHeJ2U2sIZYfaG3aYUDBqtPe0SOZAkFc=;
	b=TXO//NlKTv+PBvX7d2FUjAjQRluAK16+Fiq5voSwIRTDNk1O3Fq1lT1NX4hJ1Y/ndp
	jgTIGJJ47kF3oO44zKW0pkfh2WfQq4jpQa8WDsKFNArsXihDT/6oICa0ipe/YZuHwZtk
	ZUd1eSvvoxjAElt0cOzhh3Y9SGr6EQ0YkL/wNDpGWuSgbH56DWHeqMfaSHDc1/9YXvnh
	0LpTM46qI9L31/RDdr6EeF1ZHpNkwi+t5qRejdhUi3nngANzaJ+f/pcwhD7az06Wsi/D
	xWKQnBB2I9WgWpykzhd42C29AIysw/8zUy7Y/+bqb0VMyxFLj3vzwfYQ1GOk6S4ECs8M
	DsBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=zJ0LmA8iXyqWHeJ2U2sIZYfaG3aYUDBqtPe0SOZAkFc=;
	b=hhiWeCucQ/0smeGZViGFeQcrPB2/blu/K9GPGdGUovolHgNN9+cjfjX4oVa/JDOxkh
	zeiObrwqh+fmAMY4TK8l37fPpE8SgUNuMmCzLptGoTOoPwr0dFWLQr3/70s8QT+ORqmB
	JctbP/tyBr7s+9736zLklu5lQ5pWgKamVxv3jmEA5rF+jelgqtIFnJST8Xe53vuVXcGt
	9hHT5UFY+huvef5otmfP5hO74K9ms6Uf///6bUnbTY71A7hgpfUuWzTBMN3kOkGTDY6r
	wrc+vKmIpCgHYZDn2U6rWIQtrDxncYHb2WHtNOVdswhercuV7rAH18kszgH1Wo6GwBKQ
	Vhaw==
X-Gm-Message-State: ABUngvcurUvLGBo/oMGZiKUSlEvVlvaoxYKV2QQDEvMqSnXjYFKqvmebnYGrop+TzvkPNg==
X-Received: by 10.159.48.80 with SMTP id i16mr29406453uab.12.1478030078889;
	Tue, 01 Nov 2016 12:54:38 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([187.23.155.148])
	by smtp.gmail.com with ESMTPSA id q7sm8055913vke.20.2016.11.01.12.54.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Nov 2016 12:54:37 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2016 17:53:54 -0200
Message-Id: <1478030040-20670-2-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1478030040-20670-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1478030040-20670-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [PATCH 2/8] clutter-gtk-1.0: Update to version 1.8.2
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
X-List-Received-Date: Tue, 01 Nov 2016 19:54:38 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta/recipes-graphics/clutter/clutter-gtk-1.0_1.8.0.bb | 6 ------
 meta/recipes-graphics/clutter/clutter-gtk-1.0_1.8.2.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gtk-1.0_1.8.0.bb
 create mode 100644 meta/recipes-graphics/clutter/clutter-gtk-1.0_1.8.2.bb

diff --git a/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.8.0.bb b/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.8.0.bb
deleted file mode 100644
index 675365c..0000000
--- a/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.8.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require clutter-gtk-1.0.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
-
-SRC_URI[archive.md5sum] = "351cf9229cf941d36b441ede2236d742"
-SRC_URI[archive.sha256sum] = "742ef9d68ece36cbb1b2e1a4a6fbdad932f6645360be7e6de75abbb140dfbf1d"
diff --git a/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.8.2.bb b/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.8.2.bb
new file mode 100644
index 0000000..78050df
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.8.2.bb
@@ -0,0 +1,6 @@
+require clutter-gtk-1.0.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
+
+SRC_URI[archive.md5sum] = "6698207ee6e3d5a1c0ffc0a23444e12f"
+SRC_URI[archive.sha256sum] = "da27d486325490ad3f65d2abf9413aeb8b4a8f7b559e4b2f73567a5344a26b94"
-- 
2.1.4


