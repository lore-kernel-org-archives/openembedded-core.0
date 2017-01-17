Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5D9CA71A92
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2017 15:54:41 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id r126so206717947wmr.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2017 07:54:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AmFas3vOU5tq4ZSi2EGCHif3WQ/vR3nYIb6rrC9lq58=;
	b=mxEm20hczq0Av3c8VEYbx79tkS2ShwiC4MB7LPS6XU8p3BHmdjjgk8FCVrMfpGNyiY
	jOoQm0ucvaGdfRC0JYRrCIaO5v4NuglPgGco2/v811O/XJdQiYLPBEMV2WD+5yhIhyan
	ORD80lEa2iJ9BhCOvIrDjf1s9OpYuAdQkAFHMcWarXrNyK9NANLDGU9MBF73rYODSojL
	Qh1pqSbOYxz0BFWCaqIDVuun1sCPrl8grwVM4mI/ZHNxEGnv3PmJuXScAGM1ksMiuFhQ
	JPfK0UdrRiKWfICGbOCSiGyGaj2bDJntTirIFrkyQ+ioiOMfW6l1OeziuBwV2m1nhzCl
	z48g==
X-Gm-Message-State: AIkVDXIFfDhT/PNaVBi/puJR5p6aXCBarv0AX3RqX2Sya9Xb5KNjYSSTPfkCoTjgzh4gUw==
X-Received: by 10.28.191.139 with SMTP id o11mr18302641wmi.97.1484668481465;
	Tue, 17 Jan 2017 07:54:41 -0800 (PST)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	k11sm37853025wmb.18.2017.01.17.07.54.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Jan 2017 07:54:40 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2017 15:54:39 +0000
Message-Id: <20170117155439.23098-1-git@andred.net>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] time: BBCLASSEXTEND to native and nativesdk
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
X-List-Received-Date: Tue, 17 Jan 2017 15:54:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

Some recipe might use time, e.g.
  http://git.yoctoproject.org/cgit/cgit.cgi/meta-swupd/tree/classes/swupd-image.bbclass?id=531a8e636ca891c34f2596eb7f6365a11d4b29a7#n481
Time is a bash built-in, or a separate utility (typically
in /usr/bin/), but not everybody uses bash, or has
GNU time installed by default.

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/recipes-extended/time/time.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/time/time.inc b/meta/recipes-extended/time/time.inc
index 85862177b7..6b20d7c520 100644
--- a/meta/recipes-extended/time/time.inc
+++ b/meta/recipes-extended/time/time.inc
@@ -10,3 +10,5 @@ inherit texinfo update-alternatives
 
 ALTERNATIVE_${PN} = "time"
 ALTERNATIVE_PRIORITY = "100"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


