Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 84DBB6079E
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Sep 2018 08:01:09 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id f4-v6so1158303pgq.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Sep 2018 01:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=0cjP+Kg6hIOpxHq18O8YjWww+L4moWSZNxgjRd7tPms=;
	b=FYgTme7QzmhYRy+J244IrKIRS4oxwIN3oqWtPjuPXTYaqikn33qnj+HsDD7lXyKZzw
	MbqQTchDEyINbPSuHbP0BHmHJd7k5K5Y8krpJOdKcZsnw4QeNzci3W6KhJ4omAfA2sSq
	xBTxm5l4MgigAH1NJ1Vs2xpYWvx/jnBkDCl5QUa+s/IZHN91eEhqfkldu+enHOv0nDs2
	8PHcruRX2esP3DW6yxKceG9lgw7mJKndYknwTKRYosHFf0JBxpcijY3VRSTd4VrHQnUp
	kAy+LQBVG3sgXWLxlL0REAn3rVTdo9KgrF2kx88hR6Fd4dclq7T6nhp61M88VSBEkKA1
	fvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0cjP+Kg6hIOpxHq18O8YjWww+L4moWSZNxgjRd7tPms=;
	b=nts2IuNLk9/S1OjY/gyRZQCLFAaXwDJzBF6hUArA3yad4AScMOplQPJ+Ti0RDMrmrG
	Mo3hoSlh7T+MOZGywiBAE/16B6y/JU7W4e3lJ1e+kvl6aTbCA0XIZReGP5NDikIUFx4C
	cUZWryyGaZyes+tBWnvfxH9vPL5qD50A6q6/+0OWpmGo1enWo5HnZSIsN+EqHQXfe6t6
	39RZSXoLurqsjs+6W9DRJeYUQccqKgLQcy8jWrw1vgHemORWJqXvbycx06RdzLOZgdrX
	QK4FthBUSxt0NpRDVLDV6EwqKMszdSekZxV1IeOuzyCq5oLxEt8j8d7LaxDliel6UPlC
	d7sQ==
X-Gm-Message-State: APzg51BeQtdDz0dAu+t8GTihYSNvauNWxtDC+E3nRybt7v5pnUT5JyFe
	4uLpt+QKrpOTlo1nR6AgmTnq5A1q
X-Google-Smtp-Source: ANB0VdYMEniCwL92DgmSjVAfJY4d1tDqM0wQa5gO8azJQz9ljQUXCf0XpFzG/ZQnOVm2fXUtWN6Jpw==
X-Received: by 2002:a62:cac5:: with SMTP id
	y66-v6mr19632083pfk.187.1535788870196; 
	Sat, 01 Sep 2018 01:01:10 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f180])
	by smtp.gmail.com with ESMTPSA id
	i65-v6sm34514409pfk.43.2018.09.01.01.01.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Sep 2018 01:01:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Sep 2018 01:01:01 -0700
Message-Id: <20180901080101.45051-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH] packagegroup-core-x11-sato: Make weak include for gst-examples
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
X-List-Received-Date: Sat, 01 Sep 2018 08:01:09 -0000

gstreamer is not _yet_ ported to risc-v

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-sato/packagegroups/packagegroup-core-x11-sato.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
index 2707a2192e..2d7feb8788 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
@@ -42,13 +42,16 @@ FILEMANAGER ?= "pcmanfm"
 WEB ?= ""
 #WEB = "epiphany"
 
+GSTEXAMPLES ?= "gst-examples"
+GSTEXAMPLES_riscv64 = ""
+
 SUMMARY_${PN}-apps = "Sato desktop - applications"
 RDEPENDS_${PN}-apps = "\
     l3afpad \
-    gst-examples \
     matchbox-terminal \
     sato-screenshot \
     ${FILEMANAGER} \
+    ${GSTEXAMPLES} \
     ${WEB} \
     "
 
-- 
2.18.0


