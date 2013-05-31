Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id A7E5E6A581
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 15:09:17 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id hj6so790387wib.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 08:09:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=RPe9gN6ftsOEB4xPY7RhixMKkPe0hpGbNCbJw50rEgU=;
	b=QOH75fBbS7+UmIvYI9C+E6BbRwCw1cwQ3e1KzGbjJzt0JaW9/Zo5KQnvzQl/sfjNfV
	UYHMA5u+xMEWC+0hLzWkzREbZQ9xYh4YCuf0uStcuhaeKD3WK624P7J66LpmZVcznTC/
	McH/DnCjKG2vO4cdPF76ODaubpd4ox9L0Xgu6tY8sGDqvX2p0YhPnHsI6PeyDp07hNXb
	IFu9xIgbgThGTOrqXJMhABAbsC247LowxT+Nm5TvMfKHPFCIf5T8oDiZGe73HFz/4fX1
	xTF4lXRRWmEDGNQb6UJU8ORGsbeKSvhDHPZrSHnVfpcThg232ish6m5K0+vkjAiu1w+z
	SIVA==
X-Received: by 10.180.126.97 with SMTP id mx1mr3690721wib.57.1370012958436;
	Fri, 31 May 2013 08:09:18 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id fu14sm4546170wic.8.2013.05.31.08.09.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 May 2013 08:09:17 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2013 16:05:44 +0100
Message-Id: <8e8655aed267fd812b2ff8ed83047c92e59f1951.1370012689.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1370012689.git.ross.burton@intel.com>
References: <cover.1370012689.git.ross.burton@intel.com>
In-Reply-To: <cover.1370012689.git.ross.burton@intel.com>
References: <cover.1370012689.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmH50wK6fKxMpVHbycbAdUGugi9yjuvfbzjQpWYlmtQFdXJq9qwZgmAWJDNErREFauhvccu
Subject: [PATCH 08/11] gtk+3: register GSetting schemas
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
X-List-Received-Date: Fri, 31 May 2013 15:09:18 -0000

The schemas were not being registered, which resulted in a crash when using the
file chooser or colour picker widgets.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb b/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
index 9dff4a5..8f254fb 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
@@ -23,7 +23,7 @@ SRC_URI = "http://download.gnome.org/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz \
 SRC_URI[md5sum] = "8e878e18fc385f2b813419dc7b40a968"
 SRC_URI[sha256sum] = "1ca80c9c15a1df95d74cefb8c2afe4682ba272a4b489106f04877be2a7aff297"
 
-inherit autotools pkgconfig gtk-doc update-alternatives gtk-immodules-cache
+inherit autotools pkgconfig gtk-doc update-alternatives gtk-immodules-cache gsettings
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-- 
1.7.10.4


