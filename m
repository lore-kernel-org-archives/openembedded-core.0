Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0546074834
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 01:49:36 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id 59-v6so9070593plc.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2018 18:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=dT7kSiR15sHGaHIbU3OeCozGqw9GozDiFe5+l7W5DP8=;
	b=hATtQHMGp3hkIOXh2wXUJ5jJHegxYwYjz7x5vqZk0IBZeGJw2voh0pyo7LpS39ojFc
	vX8XH018wfoiBCLFt2PJEdATe+NtZN/9nfJ9TuMWWGldY9sIvOwfl1Ozt91w7FIidiGZ
	Jk07RdBaEVniIEa5oVeJPFdMjXSKfqAxZPd/4D5tux/XpA5LyZid3KLN3DhClv4isaKu
	sZvPqJ8a38JdhEg5bNeob4Opk0cJP0uPXrw2KW/ZGPXPCcrOMviJjaFSCzbQepvJRfr7
	Yxxym/rSmK2QVA7F+e49ZfzLco0Rx8Kg8dlib1yfQqBlTsgqEYcqDIMGhJV/QPlhxk6X
	MCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dT7kSiR15sHGaHIbU3OeCozGqw9GozDiFe5+l7W5DP8=;
	b=JkXngGAQjVdTio6jUang+DVXP5BsLzbyseVmYG5c+DeBT0hgjdNPaaovTYgFNi4NdS
	G02UA5f39XXB3JOWbp/4UgD+QWDxkrKfycwCoth69nZf0kM1ElAPE4VYR6N/enWHKd5W
	n9FFGqjQv38BsN8VFKKFSAq5h3UEGUdbg82Mp25mK64Wlcn/Sh2zzdvN/Kn/pTqoI/+Z
	uhtdzeTDdwL6M9cNN6iX73ei9OPRymLRA7plMcMC5AVcSCDkqR22p19GmqFGH+XKNcDd
	VOhBnmSvgVB8R18kCuqEKSOBwai9jVaJy47h/obvojJ5oVidNA+cA7mnGoACRDlwJpv8
	9Fvw==
X-Gm-Message-State: AElRT7G0fKeaFoY3bOx3yTzlzkBMmqCrsgL0bwGXbrNjTOa6viw9RVkU
	Fy1glTGhVatpLzShg6DFwQQs3A==
X-Google-Smtp-Source: AIpwx4+m2uqLK22OEDMd/IcqqQeIk/JE75/iWn+vV51uaRUEmixI/QFvPiZijCESA9neTE0E6l5jew==
X-Received: by 10.99.167.6 with SMTP id d6mr10400515pgf.287.1522806577237;
	Tue, 03 Apr 2018 18:49:37 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:a4f3:7c10:9123:63ea])
	by smtp.gmail.com with ESMTPSA id
	d8sm7485877pfh.177.2018.04.03.18.49.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Apr 2018 18:49:36 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Tue,  3 Apr 2018 18:49:13 -0700
Message-Id: <530798a9d0328835f58d581c9f65234dd446da30.1522806183.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1522806183.git.akuster808@gmail.com>
References: <cover.1522806183.git.akuster808@gmail.com>
Subject: [PATCH 14/21] util-macros: update to 1.19.2
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
X-List-Received-Date: Wed, 04 Apr 2018 01:49:36 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../xorg-util/{util-macros_1.19.1.bb => util-macros_1.19.2.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-util/{util-macros_1.19.1.bb => util-macros_1.19.2.bb} (75%)

diff --git a/meta/recipes-graphics/xorg-util/util-macros_1.19.1.bb b/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb
similarity index 75%
rename from meta/recipes-graphics/xorg-util/util-macros_1.19.1.bb
rename to meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb
index b39d787..2680599 100644
--- a/meta/recipes-graphics/xorg-util/util-macros_1.19.1.bb
+++ b/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1970511fddd439b07a6ba789d28ff662"
 
 PE = "1"
 
-SRC_URI[md5sum] = "3f8a8e6100556f7f28e469809805dee8"
-SRC_URI[sha256sum] = "472ad0e41d1e0abf5ecafd29460bf1b8d47e53d4b7d3abf1f66d02dc576547b8"
+SRC_URI[md5sum] = "5059b328fac086b733ffac6607164c41"
+SRC_URI[sha256sum] = "9225c45c3de60faf971979a55a5536f3562baa4b6f02246c23e98ac0c09a75b7"
 
 # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
 RDEPENDS_${PN}-dev = ""
-- 
2.7.4


